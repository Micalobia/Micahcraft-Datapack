from beet import Context, BlockTag
from tools.meta.minecraft import MinecraftMeta
from copy import deepcopy
from typing import Any, Callable, Sequence
from tools.logger import Logger
from collections import defaultdict
from dataclasses import dataclass

REPEAT_EFFECT_TYPE = "micahcraft:repeat"
NOTE_EFFECT_TYPE = "micahcraft:play_note"


def beet_default(ctx: Context):
    with ctx.inject(Logger).push("json.enchantment") as logger:
        modified = 0
        for id, enchant in ctx.data.enchantments.items():
            enchant.data, changed = _rewrite_tree(
                ctx,
                enchant.data,
                [_handle_repeat, _handle_play_note],
            )
            if changed:
                modified += 1
        logger.info(f"{modified} enchants modified")


@dataclass(frozen=True)
class Splice:
    items: list[Any]


Recurse = Callable[[Any], tuple[Any, bool]]
Handler = Callable[[Context, dict[str, Any], Recurse], dict[str, Any] | Splice | None]


def _rewrite_tree(ctx: Context, root: Any, handlers: list[Handler]) -> tuple[Any, bool]:
    def recursive(node: Any) -> tuple[Any, bool]:
        if isinstance(node, dict):
            for handler in handlers:
                replacement = handler(ctx, node, recursive)
                if replacement is not None:
                    return replacement, True
            changed_any = False
            for k, v in list(node.items()):
                new_v, changed = recursive(v)
                if changed:
                    node[k] = new_v
                    changed_any = True
            return node, changed_any
        if isinstance(node, list):
            changed_any = False
            rebuilt: list[Any] | None = None
            for i, v in enumerate(node):
                new_v, changed = recursive(v)
                if not changed:
                    if rebuilt is not None:
                        rebuilt.append(v)
                    continue
                changed_any = True
                if rebuilt is None:
                    rebuilt = list(node[:i])
                if isinstance(new_v, Splice):
                    rebuilt.extend(new_v.items)
                else:
                    rebuilt.append(new_v)
            if rebuilt is not None:
                node[:] = rebuilt
            return node, changed_any
        return node, False

    return recursive(root)


def _handle_repeat(ctx: Context, node: dict[str, Any], rec) -> dict[str, Any] | None:
    if node.get("type") != REPEAT_EFFECT_TYPE:
        return None
    count = max(int(node.get("count", 1)), 1)
    inner = node.get("effect")
    if not isinstance(inner, dict):
        return None
    inner_rewritten, _ = rec(inner)
    return {
        "type": "minecraft:all_of",
        "effects": [deepcopy(inner_rewritten) for _ in range(count)],
    }


# Format
"""
{
    "effect": {
        "type": "micahcraft:play_note",
        "pitch": ..., // number provider
        "volume": ..., // number provider
        "offset": [x,y,z]
    }
}
"""


def _handle_play_note(ctx: Context, node: dict[str, Any], rec) -> Splice | None:
    def play_sound(_sound_id: str, pitch: Any, volume: Any):
        return {
            "type": "minecraft:play_sound",
            "sound": _sound_id,
            "pitch": pitch,
            "volume": volume,
        }

    def gen_requirements(_tag_id: str, x: float, y: float, z: float):
        _ret = {"type": "minecraft:location_check", "predicate": {"block": {"blocks": f"#{_tag_id}"}}}
        if x != 0:
            _ret["offsetX"] = x
        if y != 0:
            _ret["offsetY"] = y
        if z != 0:
            _ret["offsetZ"] = z
        return _ret

    match node:
        case {"effect": {"type": _type, "pitch": pitch, "volume": volume, "offset": offset}}:
            if _type != NOTE_EFFECT_TYPE:
                return None
            x, y, z = offset
            original_requirements = node.get("requirements")
            info = _generate_note_info(ctx)
            effects = [
                {
                    "effect": play_sound("minecraft:block.note_block.harp", pitch, volume),
                    "requirements": {
                        "type": "inverted",
                        "term": _merge_requirements(gen_requirements("micahcraft:note/any", x, y, z), original_requirements),
                    },
                }
            ]
            for tag_id, sound_id in info:
                sound = play_sound(sound_id, pitch, volume)
                requirements = _merge_requirements(gen_requirements(tag_id, x, y, z), original_requirements)
                assert requirements is not None
                effects.append({"effect": sound, "requirements": requirements})
            return Splice(effects)
        case _:
            return None


_cached_note_info: list[tuple[str, str]] | None = None


def _generate_note_info(ctx: Context) -> list[tuple[str, str]]:
    """Returns `list[(tag_id, sound_id)]`"""
    global _cached_note_info
    if _cached_note_info is not None:
        return _cached_note_info
    _cached_note_info = []
    with ctx.inject(Logger) as logger:
        any: set[str] = set()
        specific: defaultdict[str, set[str]] = defaultdict(set)
        minecraft_meta = ctx.inject(MinecraftMeta)
        info = minecraft_meta.block_information()
        for block_id, block_info in info.items():
            instrument = block_info.instrument
            if instrument == "minecraft:block.note_block.harp":
                continue
            specific[instrument].add(block_id)
            any.add(block_id)
        ctx.data["micahcraft:note/any"] = BlockTag({"replace": False, "values": sorted(any)})
        for sound_id, arr in specific.items():
            instrument = sound_id.split(".")[-1]
            identifier = f"micahcraft:note/{instrument}"
            ctx.data[identifier] = BlockTag({"replace": False, "values": sorted(arr)})
            _cached_note_info.append((identifier, sound_id))
        logger.info(f"{len(_cached_note_info)} note tags")
    return _cached_note_info


def _merge_requirements(left: dict[str, Any] | None, right: dict[str, Any] | None) -> dict[str, Any] | None:
    if left is None:
        return right
    if right is None:
        return left

    def terms(x: dict[str, Any]) -> list[dict[str, Any]]:
        match x:
            case {"type": condition, "terms": terms}:
                if (condition == "minecraft:all_of" or condition == "all_of") and isinstance(terms, list):
                    return list(terms)
        return [x]

    return {"type": "minecraft:all_of", "terms": [*terms(left), *terms(right)]}
