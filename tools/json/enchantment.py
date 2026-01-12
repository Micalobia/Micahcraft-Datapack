from beet import Context, Enchantment, JsonFile
from copy import deepcopy
from typing import Any
from tools.logger import Logger

REPEAT_EFFECT_TYPE = "micahcraft:repeat"


def run(ctx: Context):
    with ctx.inject(Logger).push("json.enchantment") as logger:
        logger.info("Processing...")
        for id, enchant in ctx.data.enchantments.items():
            new_root, changed = _rewrite_repeat(enchant.data)
            if changed:
                enchant.data = new_root


def _rewrite_repeat(node: Any) -> tuple[Any, bool]:
    if isinstance(node, dict):
        t = node.get("type")
        if t == REPEAT_EFFECT_TYPE:
            count = int(node.get("count", 1))
            if count < 1:
                count = 1
            inner = node.get("effect")
            if not isinstance(inner, dict):
                return node, False
            inner_rewritten, _ = _rewrite_repeat(inner)

            return {"type": "minecraft:all_of", "effects": [deepcopy(inner_rewritten) for _ in range(count)]}, True
        changed_any = False
        out = dict(node)
        for k, v in node.items():
            obj, changed = _rewrite_repeat(v)
            if changed:
                out[k] = obj
                changed_any = True
        return out, changed_any
    if isinstance(node, list):
        changed_any = False
        out = list(node)
        for i, v in enumerate(node):
            obj, changed = _rewrite_repeat(v)
            if changed:
                out[i] = obj
                changed_any = True
        return out, changed_any
    return node, False
