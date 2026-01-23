from beet import Context
from tools.logger import Logger
from tools.utility import Tags
from collections import deque
from itertools import chain
import json
import re


RE_FUNCTION = re.compile(r"function\s+((#?)([0-9a-z_./-]+?):([0-9a-z_./-]+))\b")
RE_ENCHANT_FUNCTION = re.compile(r'"function":\s+"(([0-9a-z_./-]+?):([0-9a-z_./-]+))\b"')
RE_MACRO_FUNCTION = re.compile(r'(?:"function"|(?<!")function):\s*"(()([0-9a-z_./-]+?):([0-9a-z_./-]+))\b"')

REPORT_KEY = "unreachable_functions.txt"


def run(ctx: Context):
    with ctx.inject(Logger).push("functions.unreachable") as logger:
        tags = ctx.inject(Tags)
        functions = set(ctx.data.functions)
        function_tags = set(ctx.data.function_tags)
        roots = set()
        for tag_id in ("minecraft:load", "minecraft:tick"):
            if tag_id in ctx.data.function_tags:
                roots |= tags.resolve_tag(tag_id, ctx.data.function_tags)
            else:
                logger.warn(f"Missing function tag: {tag_id}")
        for id, advancement in ctx.data.advancements.items():
            match advancement.data:
                case {"rewards": {"function": func_id}}:
                    roots.add(func_id)
        for id, enchant in ctx.data.enchantments.items():
            for line in json.dumps(enchant.data, indent=0).split("\n"):
                for match in RE_ENCHANT_FUNCTION.finditer(line):
                    roots.add(match.group(1))
        checked: set[str] = set()
        queue: deque[str] = deque(roots)
        reachable: set[str] = set()
        while queue:
            func_id = queue.popleft()
            checked.add(func_id)
            reachable.add(func_id)
            if func_id not in functions:
                logger.warn(f"Couldn't find function {func_id}; Skipping")
                continue
            function = ctx.data.functions[func_id]
            for line in function.lines:
                matches = chain(RE_FUNCTION.finditer(line), RE_MACRO_FUNCTION.finditer(line))
                for match in matches:
                    id: str = match.group(1)
                    is_tag = bool(match.group(2))
                    if is_tag:
                        if id[1:] not in function_tags:
                            logger.warn(f"Couldn't find tag {id}; Skipping")
                            continue
                        resolved = tags.resolve_tag(id[1:], ctx.data.function_tags)
                    else:
                        resolved = {id}
                    for i in resolved:
                        if i not in checked:
                            queue.append(i)
        unreachable = sorted(list(functions - reachable))
        write_unreachable_report(ctx, filter(ctx, unreachable), 5)


def write_unreachable_report(ctx: Context, unreachable: list[str], preview: int):
    with ctx.inject(Logger) as logger:
        cache = ctx.cache["functions"]
        report_path = cache.get_path(REPORT_KEY)
        if not unreachable:
            report_path.unlink(missing_ok=True)
            logger.info("Found no unreachable functions")
            return
        report_path.parent.mkdir(parents=True, exist_ok=True)
        report_path.write_text("\n".join(unreachable) + "\n", encoding="utf-8")

        for id in unreachable[:preview]:
            logger.warn(f"Unreachable function: {id}")
        length = len(unreachable)
        if length > preview:
            logger.warn(f"... and {length - preview} more. Full Report: {report_path}")


def filter(ctx: Context, unreachable: list[str]):
    filters = [re.compile(_) for _ in ctx.meta["unreachable"]]
    output = []
    for id in unreachable:
        for filter in filters:
            if filter.match(id):
                break
        else:
            output.append(id)
    return output