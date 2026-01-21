import csv
import importlib
import types
from dataclasses import MISSING, dataclass, fields, is_dataclass
from pathlib import Path
from typing import Any, TypeVar, Union, get_args, get_origin, get_type_hints

from beet import Context
from tools.logger import Logger


T = TypeVar("T")


def read_dataclass_csv(path: Path, model: type[T]) -> list[T]:
    """Read a CSV into a list of dataclass instances."""
    if not is_dataclass(model):
        raise TypeError(f"{model!r} is not a dataclass type")

    model_fields = list(fields(model))

    field_types: dict[str, Any] | None = None
    if any(isinstance(field.type, str) for field in model_fields):
        field_types = get_type_hints(model)

    last_field = model_fields[-1]
    last_type = field_types.get(last_field.name, last_field.type) if field_types else last_field.type
    last_is_list, _ = _is_list(last_type)

    instances: list[T] = []
    reader = csv.reader(_iter_data_lines(path), skipinitialspace=True)

    for row in reader:
        row = [_.strip() for _ in row]
        if not row:
            continue
        values: dict[str, Any] = {}
        for index, field in enumerate(model_fields):
            field_type = field_types.get(field.name, field.type) if field_types else field.type
            if last_is_list and field is last_field:
                raw = row[index:] if len(row) > index else []
            else:
                raw = row[index] if index < len(row) else ""
            if raw == "" or raw == []:
                if field.default is not MISSING or field.default_factory is not MISSING:
                    continue
            values[field.name] = _coerce(raw, field_type)
        instances.append(model(**values))

    return instances


def beet_default(ctx: Context) -> None:
    """Beet plugin: load CSVs into ctx.meta."""
    with ctx.inject(Logger).push("csv") as logger:
        config = ctx.meta.get("csv", [])
        base_dir = getattr(ctx, "directory", Path.cwd())

        specs = _normalize_csv_specs(base_dir, config, logger)

        for spec in specs:
            path = base_dir / spec.file
            model = spec.model
            model_type = _import_symbol(model) if isinstance(model, str) else model

            key = spec.into or Path(spec.file).stem
            ctx.meta[key] = read_dataclass_csv(path, model_type)

        logger.info(f"Read {len(specs)} CSV files into ctx.meta")


_COMMENT_PREFIXES = ("#", "//")


@dataclass(frozen=True)
class _CsvSpec:
    file: str
    model: str
    into: str | None = None


def _normalize_csv_specs(base_dir: Path, config: Any, logger: Logger) -> list[_CsvSpec]:
    """Normalize ctx.meta['csv'] into a list of specs."""
    match config:
        case list():
            specs: list[_CsvSpec] = []
            for obj in config:
                match obj:
                    case _CsvSpec():
                        specs.append(obj)
                    case {"file": file, "model": model, **rest}:
                        into = rest.get("into")
                        specs.append(_CsvSpec(file, model, into))
                    case _:
                        logger.warn(f"Malformed ctx.meta['csv'] entry: {obj!r}")
            return specs
        case {"manifest": manifest}:
            manifest_path = base_dir / str(manifest)
            return read_dataclass_csv(manifest_path, _CsvSpec)
        case {"file": file, "model": model, **rest}:
            into = rest.get("into")
            return [_CsvSpec(file, model, into)]
        case _:
            raise TypeError(f"ctx.meta['csv'] must be a list or dict, not {type(config).__name__}")


def _iter_data_lines(path: Path):
    """Yield non-empty, non-comment lines from a file."""
    with path.open("r", encoding="utf-8", newline="") as file:
        for line in file:
            stripped = line.strip()
            if not stripped:
                continue
            if line.lstrip().startswith(_COMMENT_PREFIXES):
                continue
            yield line


def _import_symbol(spec: str) -> Any:
    """Import "module:QualName" or "module.QualName"."""
    module_name, sep, qualname = spec.partition(":")
    if not sep:
        module_name, _, qualname = spec.rpartition(".")
        if not module_name:
            raise ValueError(f"Bad model spec: {spec!r} (use 'module:ClassName')")
    obj: Any = importlib.import_module(module_name)
    for part in qualname.split("."):
        obj = getattr(obj, part)
    return obj


def _is_optional(type_hint: Any) -> tuple[bool, Any]:
    """Return (is_optional, inner_type)."""
    origin = get_origin(type_hint)
    if origin not in (Union, types.UnionType):
        return False, type_hint

    args = get_args(type_hint)
    if type(None) not in args:
        return False, type_hint

    inner = [arg for arg in args if arg is not type(None)]
    return (len(inner) == 1), (inner[0] if inner else str)


def _is_list(type_hint: Any) -> tuple[bool, Any]:
    """Return (is_list, element_type)."""
    origin = get_origin(type_hint)
    if origin is list:
        args = get_args(type_hint)
        return True, (args[0] if args else str)
    return False, type_hint


def _parse_bool(text: str) -> bool:
    """Parse common boolean strings."""
    value = text.strip().lower()
    if value in ("1", "true", "t", "yes", "y", "on"):
        return True
    if value in ("0", "false", "f", "no", "n", "off"):
        return False
    raise ValueError(f"Invalid bool: {text!r}")


def _coerce(raw: Any, type_hint: Any) -> Any:
    """Coerce raw CSV value(s) into the given type."""
    optional, inner_type = _is_optional(type_hint)
    if optional and (raw == "" or raw == []):
        return None
    type_hint = inner_type

    is_list, element_type = _is_list(type_hint)
    if is_list:
        parts: list[str] = []
        if isinstance(raw, list):
            for item in raw:
                for part in str(item).split(";"):
                    part = part.strip()
                    if part:
                        parts.append(part)
        else:
            for part in str(raw).split(";"):
                part = part.strip()
                if part:
                    parts.append(part)
        return [_coerce(part, element_type) for part in parts]

    text = str(raw).strip()
    if type_hint is str:
        return text
    if type_hint is int:
        return int(text)
    if type_hint is float:
        return float(text)
    if type_hint is bool:
        return _parse_bool(text)

    try:
        return type_hint(text)
    except Exception:
        return text
