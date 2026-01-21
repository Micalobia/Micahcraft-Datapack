import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from beet import Atlas, Context, ItemModel, Model, Texture
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
    overrides: list[str]


@dataclass(frozen=True)
class SliceLayer:
    tool_type: str
    model_parent: str
    row: int
    col: int
    mirror_x: bool = False
    dx: int = 0
    dy: int = 0


SPRITESHEETS_DIR = Path("resources/assets/micahcraft/textures/estecka/spritesheets")


def run(ctx: Context):
    with ctx.inject(Logger).push("trims") as logger:
        if not SPRITESHEETS_DIR.is_dir():
            logger.error(f"Missing spritesheets directory: {SPRITESHEETS_DIR.as_posix()}")
            return

        materials: list[Material] = ctx.meta["trims/materials"]
        patterns: list[Pattern] = ctx.meta["trims/patterns"]
        palettes: list[Palette] = ctx.meta["trims/palettes"]
        tools: list[Tool] = ctx.meta["trims/tools"]
        layers: list[SliceLayer] = ctx.meta["trims/slices"]

        palette_keys = {palette.color for palette in palettes}
        material_keys = {material_row.material for material_row in materials}

        missing_palettes = [material_row.material for material_row in materials if material_row.material not in palette_keys]
        if missing_palettes:
            logger.warn(f"Palettes missing for these trim materials (will cause missing textures): {', '.join(sorted(missing_palettes))}")

        for tool in tools:
            if tool.tier in material_keys:
                darker = f"{tool.tier}_darker"
                if darker not in palette_keys:
                    logger.warn(f"Palette missing: {darker} (needed when trimming {tool.tier} tools with {tool.tier})")

            if tool.item_state_template == "spear" and "_in_hand" not in tool.overrides:
                logger.warn(f"Spear tool '{tool.tool_item}' has item_state_template=spear but no _in_hand override; " "in-hand will match inventory.")

        layers_by_tool = _group_layers(layers)
        model_parent_by_tool: dict[str, str] = {}
        for layer in layers:
            model_parent_by_tool.setdefault(layer.tool_type, layer.model_parent)

        logger.info(
            f"{len(materials)} materials, {len(patterns)} patterns, {len(palettes)} palettes, " f"{len(tools)} tools, {len(layers)} slice layers"
        )

        textures_for_atlas: list[str] = []

        for pattern in patterns:
            sheet_path = SPRITESHEETS_DIR / f"{pattern.pattern}.png"
            if not sheet_path.is_file():
                logger.warn(f"Missing spritesheet for pattern '{pattern.pattern}': {sheet_path.as_posix()} (skipping)")
                continue

            sheet = Image.open(sheet_path).convert("RGBA")
            max_cols, max_rows = _validate_sheet(logger, sheet)

            for tool_type, tool_layers in layers_by_tool.items():
                out_img = _compose_tool_texture(sheet, tool_layers, max_cols=max_cols, max_rows=max_rows)
                tex_id = f"minecraft:trims/items/{tool_type}/{pattern.pattern}"
                ctx.assets[tex_id] = Texture(out_img)
                textures_for_atlas.append(f"trims/items/{tool_type}/{pattern.pattern}")

        permutations = {palette.color: palette.palette_path for palette in palettes}
        ctx.assets["minecraft:blocks"] = Atlas(_build_atlas(ctx, permutations, textures_for_atlas))

        for tool_type in layers_by_tool:
            model_parent = model_parent_by_tool.get(tool_type, "generated")
            for pattern in patterns:
                if f"trims/items/{tool_type}/{pattern.pattern}" not in textures_for_atlas:
                    continue
                for palette in palettes:
                    model_id = f"minecraft:trims/items/{tool_type}/{pattern.pattern}_{palette.color}"
                    ctx.assets[model_id] = Model(
                        _build_trim_model(
                            ctx,
                            model_parent=model_parent,
                            tool_type=tool_type,
                            pattern=pattern.pattern,
                            color=palette.color,
                        )
                    )

        for tool in tools:
            suffixes = _suffixes(tool)

            composites: dict[str, dict] = {}
            for suffix in suffixes:
                base_model = f"{tool.tool_item}{suffix}"
                trim_model = f"{tool.tool_type}{suffix}"
                composites[suffix] = _build_composite(
                    ctx,
                    base_model=base_model,
                    cases=_build_trim_cases(
                        trim_model=trim_model,
                        tier=tool.tier,
                        materials=materials,
                        patterns=patterns,
                    ),
                )

            template = tool.item_state_template
            match template:
                case "handheld":
                    item_data = _render_item_state(ctx, "handheld", composite=composites[""])
                case "bow":
                    item_data = _render_item_state(
                        ctx,
                        "bow",
                        composite=composites[""],
                        composite_pulling_0=composites.get("_pulling_0", composites[""]),
                        composite_pulling_1=composites.get("_pulling_1", composites[""]),
                        composite_pulling_2=composites.get("_pulling_2", composites[""]),
                    )
                case "crossbow":
                    item_data = _render_item_state(
                        ctx,
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
                        ctx,
                        "spear",
                        composite=composites[""],
                        composite_in_hand=composites.get("_in_hand", composites[""]),
                    )
                case _:
                    logger.warn(f"Unknown item_state_template '{template}' for tool '{tool.tool_item}' (skipping)")
                    continue

            ctx.assets[f"minecraft:{tool.tool_item}"] = ItemModel(item_data)

        logger.info("Generated textures, atlas, models, and item states.")


def _meta(ctx: Context, *keys: str) -> Any:
    for key in keys:
        if key in ctx.meta:
            return ctx.meta[key]
    raise KeyError(f"Missing ctx.meta key(s): {', '.join(keys)} (check your CSV spec 'into' keys).")


def _render_json(ctx: Context, template_relpath: str, **kwargs) -> dict:
    text = ctx.template.render(template_relpath, **kwargs)
    return json.loads(text)


def _crop_tile(img: Image.Image, row: int, col: int, tile: int = 16) -> Image.Image:
    left, top = col * tile, row * tile
    return img.crop((left, top, left + tile, top + tile))


def _group_layers(layers: list[SliceLayer]) -> dict[str, list[SliceLayer]]:
    grouped: dict[str, list[SliceLayer]] = {}
    for layer in layers:
        grouped.setdefault(layer.tool_type, []).append(layer)
    return grouped


def _validate_sheet(logger: Logger, img: Image.Image, *, tile: int = 16) -> tuple[int, int]:
    width, height = img.size
    if width % tile != 0 or height % tile != 0:
        logger.error(f"Spritesheet size {width}x{height} is not divisible by tile size {tile}.")
        raise ValueError("Invalid spritesheet dimensions")
    return width // tile, height // tile


def _compose_tool_texture(
    sheet: Image.Image,
    layers: list[SliceLayer],
    *,
    max_cols: int,
    max_rows: int,
    tile: int = 16,
) -> Image.Image:
    out_width = tile
    out_height = tile
    for layer in layers:
        out_width = max(out_width, layer.dx + tile)
        out_height = max(out_height, layer.dy + tile)

    out = Image.new("RGBA", (out_width, out_height), (0, 0, 0, 0))
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


def _suffixes(tool: Tool) -> list[str]:
    suffixes = [""] + list(tool.overrides)
    seen = set()
    out: list[str] = []
    for suffix in suffixes:
        if suffix in seen:
            continue
        seen.add(suffix)
        out.append(suffix)
    return out


def _build_atlas(ctx: Context, permutations: dict[str, str], textures: list[str]) -> dict:
    return _render_json(ctx, "trims/atlas.json.j2", permutations=permutations, textures=textures)


def _build_trim_model(
    ctx: Context,
    *,
    model_parent: str,
    tool_type: str,
    pattern: str,
    color: str,
) -> dict:
    return _render_json(
        ctx,
        "trims/baked_model/trim_only.json.j2",
        model_parent=model_parent,
        tool_type=tool_type,
        pattern=pattern,
        color=color,
    )


def _build_composite(ctx: Context, *, base_model: str, cases: list[dict]) -> dict:
    return _render_json(ctx, "trims/model_selector/composite.json.j2", base_model=base_model, cases=cases)


def _build_trim_cases(
    *,
    trim_model: str,
    tier: str,
    materials: list[Material],
    patterns: list[Pattern],
) -> list[dict]:
    cases: list[dict] = []
    for material_row in materials:
        material = material_row.material
        color = f"{material}_darker" if material == tier else material
        for pattern_row in patterns:
            cases.append(
                {
                    "when": {"pattern": pattern_row.pattern, "material": material},
                    "model": {"type": "model", "model": f"trims/items/{trim_model}/{pattern_row.pattern}_{color}"},
                }
            )
    return cases


def _render_item_state(ctx: Context, template_name: str, **kwargs) -> dict:
    return _render_json(ctx, f"trims/item_state/{template_name}.json.j2", **kwargs)
