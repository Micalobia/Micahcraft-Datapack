import io
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable
from jinja2 import Environment, FileSystemLoader
from beet import Context, Texture, Atlas, Model, ItemModel
from PIL import Image
from tools.logger import Logger


@dataclass(frozen=True)
class Material:
    material: str
    item: str


@dataclass(frozen=True)
class Pattern:
    pattern: str
    template_item: str


@dataclass(frozen=True)
class Palette:
    color: str
    palette_path: str


@dataclass(frozen=True)
class Tool:
    tool_item: str
    tier: str
    tool_type: str
    item_state_template: str
    overrides: tuple[str, ...]


@dataclass(frozen=True)
class SliceLayer:
    tool_type: str
    model_parent: str
    row: int
    col: int
    mirror_x: bool = False
    dx: int = 0
    dy: int = 0


CONFIG_DIR = Path("config/trims")
SPRITESHEETS_DIR = Path("resources/assets/micahcraft/textures/estecka/spritesheets")
TEMPLATE_ROOT = Path("templates")


def _crop_tile(img: Image.Image, r: int, c: int, t: int = 16) -> Image.Image:
    left, top = c * t, r * t
    return img.crop((left, top, left + t, top + t))


def _read_csv_rows(path: Path) -> Iterable[list[str]]:
    for raw in path.read_text("utf-8").splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        parts = [_.strip() for _ in line.split(",")]
        while parts and parts[-1] == "":
            parts.pop()
        if parts:
            yield parts


def _require_file(logger: Logger, path: Path) -> bool:
    if path.is_file():
        return True
    logger.error(f"Missing required file: {path.as_posix()}")
    return False


def _png_bytes(img: Image.Image) -> bytes:
    buf = io.BytesIO()
    img.save(buf, format="PNG")
    return buf.getvalue()


class _Templates:
    def __init__(self):
        self._env = None

    def _get_env(self):
        if self._env is not None:
            return self._env

        env = Environment(
            loader=FileSystemLoader(str(TEMPLATE_ROOT)),
            autoescape=False,
            keep_trailing_newline=True,
        )

        def tojson(value):
            return json.dumps(value, ensure_ascii=False, separators=(",", ":"))

        env.filters["tojson"] = tojson
        self._env = env
        return env

    def render_json(self, template_relpath: str, **kwargs) -> dict:
        env = self._get_env()
        text = env.get_template(template_relpath).render(**kwargs)
        return json.loads(text)


_TEMPLATES = _Templates()


def read_materials() -> list[Material]:
    path = CONFIG_DIR / "materials.csv"
    out: list[Material] = []
    for parts in _read_csv_rows(path):
        if len(parts) < 2:
            raise ValueError(f"materials.csv line must be: material, item (got {parts})")
        out.append(Material(parts[0], parts[1]))
    return out


def read_patterns() -> list[Pattern]:
    path = CONFIG_DIR / "patterns.csv"
    out: list[Pattern] = []
    for parts in _read_csv_rows(path):
        if len(parts) < 2:
            raise ValueError(f"patterns.csv line must be: pattern, template_item (got {parts})")
        out.append(Pattern(parts[0], parts[1]))
    return out


def read_palettes() -> list[Palette]:
    path = CONFIG_DIR / "palettes.csv"
    out: list[Palette] = []
    for parts in _read_csv_rows(path):
        if len(parts) < 2:
            raise ValueError(f"palettes.csv line must be: color, palette_path (got {parts})")
        out.append(Palette(parts[0], parts[1]))
    return out


def read_tools() -> list[Tool]:
    path = CONFIG_DIR / "tools.csv"
    out: list[Tool] = []
    for parts in _read_csv_rows(path):
        if len(parts) < 4:
            raise ValueError(f"tools.csv line must be: tool_item, tier, tool_type, item_state_template, [overrides...] (got {parts})")
        tool_item, tier, tool_type, item_state_template = parts[:4]
        overrides = tuple(parts[4:]) if len(parts) > 4 else tuple()
        out.append(Tool(tool_item, tier, tool_type, item_state_template, overrides))
    return out


def read_slices() -> list[SliceLayer]:
    path = CONFIG_DIR / "slices.csv"
    out: list[SliceLayer] = []
    for parts in _read_csv_rows(path):
        if len(parts) < 4:
            raise ValueError(f"slices.csv line must be: tool_type, model_parent, row, col, [mirror_x], [dx], [dy] (got {parts})")
        tool_type, model_parent = parts[0], parts[1]
        row, col = int(parts[2]), int(parts[3])
        mirror_x = False
        dx = 0
        dy = 0
        if len(parts) >= 5:
            mirror_x = parts[4].lower() in ("1", "true", "yes", "y")
        if len(parts) >= 6:
            dx = int(parts[5])
        if len(parts) >= 7:
            dy = int(parts[6])
        out.append(SliceLayer(tool_type, model_parent, row, col, mirror_x, dx, dy))
    return out


def _group_layers(layers: list[SliceLayer]) -> dict[str, list[SliceLayer]]:
    grouped: dict[str, list[SliceLayer]] = {}
    for layer in layers:
        grouped.setdefault(layer.tool_type, []).append(layer)
    return grouped


def _validate_sheet(logger: Logger, img: Image.Image, *, tile: int = 16) -> tuple[int, int]:
    w, h = img.size
    if w % tile != 0 or h % tile != 0:
        logger.error(f"Spritesheet size {w}x{h} is not divisible by tile size {tile}.")
        raise ValueError("Invalid spritesheet dimensions")
    return w // tile, h // tile


def _compose_tool_texture(
    sheet: Image.Image,
    layers: list[SliceLayer],
    *,
    max_cols: int,
    max_rows: int,
    tile: int = 16,
) -> Image.Image:
    out_w = tile
    out_h = tile
    for layer in layers:
        out_w = max(out_w, layer.dx + tile)
        out_h = max(out_h, layer.dy + tile)

    out = Image.new("RGBA", (out_w, out_h), (0, 0, 0, 0))
    for layer in layers:
        if not (0 <= layer.col < max_cols and 0 <= layer.row < max_rows):
            raise ValueError(
                f"Slice out of bounds for tool_type={layer.tool_type}: (row={layer.row}, col={layer.col}) "
                f"not within (rows={max_rows}, cols={max_cols})"
            )
        part = _crop_tile(sheet, layer.row, layer.col, tile).convert("RGBA")
        if layer.mirror_x:
            part = part.transpose(Image.Transpose.FLIP_LEFT_RIGHT)
        out.alpha_composite(part, dest=(layer.dx, layer.dy))
    return out


def _build_atlas(permutations: dict[str, str], textures: list[str]) -> dict:
    return _TEMPLATES.render_json(
        "trims/atlas.json.j2",
        permutations=permutations,
        textures=textures,
    )


def _build_trim_model(*, model_parent: str, tool_type: str, pattern: str, color: str) -> dict:
    return _TEMPLATES.render_json(
        "trims/baked_model/trim_only.json.j2",
        model_parent=model_parent,
        tool_type=tool_type,
        pattern=pattern,
        color=color,
    )


def _build_composite(*, base_model: str, cases: list[dict]) -> dict:
    return _TEMPLATES.render_json(
        "trims/model_selector/composite.json.j2",
        base_model=base_model,
        cases=cases,
    )


def _build_trim_cases(
    *,
    trim_model: str,
    tier: str,
    materials: list[Material],
    patterns: list[Pattern],
) -> list[dict]:
    out: list[dict] = []
    for m in materials:
        material = m.material
        color = f"{material}_darker" if material == tier else material
        for p in patterns:
            out.append(
                {
                    "when": {"pattern": p.pattern, "material": material},
                    "model": {"type": "model", "model": f"trims/items/{trim_model}/{p.pattern}_{color}"},
                }
            )
    return out


def _render_item_state(template_name: str, **kwargs) -> dict:
    return _TEMPLATES.render_json(f"trims/item_state/{template_name}.json.j2", **kwargs)


def run(ctx: Context):
    with ctx.inject(Logger).push("trims") as logger:
        required = [
            CONFIG_DIR / "materials.csv",
            CONFIG_DIR / "patterns.csv",
            CONFIG_DIR / "palettes.csv",
            CONFIG_DIR / "tools.csv",
            CONFIG_DIR / "slices.csv",
        ]
        if not all(_require_file(logger, _) for _ in required):
            return
        if not SPRITESHEETS_DIR.is_dir():
            logger.error(f"Missing spritesheets directory: {SPRITESHEETS_DIR.as_posix()}")
            return
        if not TEMPLATE_ROOT.is_dir():
            logger.error(f"Missing templates directory: {TEMPLATE_ROOT.as_posix()}")
            return
        materials = read_materials()
        patterns = read_patterns()
        palettes = read_palettes()
        tools = read_tools()
        slices = read_slices()
        palette_keys = {p.color for p in palettes}
        material_keys = {m.material for m in materials}

        missing_palette = [m.material for m in materials if m.material not in palette_keys]
        if missing_palette:
            logger.warn(f"Palettes missing for these trim materials (will cause missing textures): {', '.join(sorted(missing_palette))}")

        for t in tools:
            if t.tier in material_keys:
                darker = f"{t.tier}_darker"
                if darker not in palette_keys:
                    logger.warn(f"Palette missing: {darker} (needed when trimming {t.tier} tools with {t.tier})")

            if t.item_state_template == "spear" and "_in_hand" not in t.overrides:
                logger.warn(f"Spear tool '{t.tool_item}' has item_state_template=spear but no _in_hand override; in-hand will match inventory.")

        layers_by_tool = _group_layers(slices)
        model_parent_by_tool: dict[str, str] = {}
        for layer in slices:
            model_parent_by_tool.setdefault(layer.tool_type, layer.model_parent)

        logger.info(
            f"{len(materials)} materials, {len(patterns)} patterns, {len(palettes)} palettes, " f"{len(tools)} tools, {len(slices)} slice layers"
        )

        textures_for_atlas: list[str] = []

        for pat in patterns:
            sheet_path = SPRITESHEETS_DIR / f"{pat.pattern}.png"
            if not sheet_path.is_file():
                logger.warn(f"Missing spritesheet for pattern '{pat.pattern}': {sheet_path.as_posix()} (skipping)")
                continue

            sheet = Image.open(sheet_path).convert("RGBA")
            max_cols, max_rows = _validate_sheet(logger, sheet)

            for tool_type, layers in layers_by_tool.items():
                out_img = _compose_tool_texture(sheet, layers, max_cols=max_cols, max_rows=max_rows)
                tex_id = f"minecraft:trims/items/{tool_type}/{pat.pattern}"
                ctx.assets[tex_id] = Texture(out_img)
                textures_for_atlas.append(f"trims/items/{tool_type}/{pat.pattern}")

        permutations = {p.color: p.palette_path for p in palettes}
        atlas = _build_atlas(permutations, textures_for_atlas)
        ctx.assets["minecraft:blocks"] = Atlas(atlas)

        for tool_type, layers in layers_by_tool.items():
            model_parent = model_parent_by_tool.get(tool_type, "generated")
            for pat in patterns:
                if f"trims/items/{tool_type}/{pat.pattern}" not in textures_for_atlas:
                    continue
                for pal in palettes:
                    model = _build_trim_model(
                        model_parent=model_parent,
                        tool_type=tool_type,
                        pattern=pat.pattern,
                        color=pal.color,
                    )
                    model_id = f"minecraft:trims/items/{tool_type}/{pat.pattern}_{pal.color}"
                    ctx.assets[model_id] = Model(model)

        def suffixes_for_tool(t: Tool) -> list[str]:
            suff = [""] + list(t.overrides)
            seen = set()
            out = []
            for s in suff:
                if s not in seen:
                    seen.add(s)
                    out.append(s)
            return out

        for t in tools:
            suffixes = suffixes_for_tool(t)
            composites: dict[str, dict] = {}
            for suf in suffixes:
                base_model = f"{t.tool_item}{suf}"
                trim_model = f"{t.tool_type}{suf}"
                cases = _build_trim_cases(
                    trim_model=trim_model,
                    tier=t.tier,
                    materials=materials,
                    patterns=patterns,
                )
                composites[suf] = _build_composite(base_model=base_model, cases=cases)
            tpl = t.item_state_template
            match tpl:
                case "handheld":
                    item_data = _render_item_state("handheld", composite=composites[""])
                case "bow":
                    item_data = _render_item_state(
                        "bow",
                        composite=composites[""],
                        composite_pulling_0=composites.get("_pulling_0", composites[""]),
                        composite_pulling_1=composites.get("_pulling_1", composites[""]),
                        composite_pulling_2=composites.get("_pulling_2", composites[""]),
                    )
                case "crossbow":
                    item_data = _render_item_state(
                        "crossbow",
                        composite=composites[""],
                        composite_pulling_0=composites.get("_pulling_0", composites[""]),
                        composite_pulling_1=composites.get("_pulling_1", composites[""]),
                        composite_pulling_2=composites.get("_pulling_2", composites[""]),
                        composite_arrow=composites.get("_arrow", composites[""]),
                        composite_firework=composites.get("_firework", composites[""]),
                    )
                case "spear":
                    item_data = _render_item_state(
                        "spear",
                        composite=composites[""],
                        composite_in_hand=composites.get("_in_hand", composites[""]),
                    )
                case _:
                    logger.warn(f"Unknown item_state_template '{tpl}' for tool '{t.tool_item}' (skipping)")
                    continue
            ctx.assets[f"minecraft:{t.tool_item}"] = ItemModel(item_data)
        logger.info("Generated textures, atlas, models, and item states.")
