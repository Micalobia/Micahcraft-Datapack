from beet import Context, Recipe, Advancement, NamespaceProxy
from typing import Any
from tools.logger import Logger


class Recipes:
    def __init__(self, ctx: Context):
        pass

    def stonecutter(self, ingredient: str | list[str], result: str, count: int = 1, components: dict[str, Any] | None = None) -> Recipe:
        r = {"id": result, "count": count}
        if components:
            r["components"] = components
        return Recipe({"type": "minecraft:stonecutting", "ingredient": ingredient, "result": r})

    def advancement(self, item: str, recipe: str) -> Advancement:
        return Advancement(
            {
                "parent": "minecraft:recipes/root",
                "criteria": {
                    "has_the_item": {
                        "trigger": "minecraft:inventory_changed",
                        "conditions": {"items": [{"items": item}]},
                    },
                    "has_the_recipe": {
                        "conditions": {"recipe": recipe},
                        "trigger": "minecraft:recipe_unlocked",
                    },
                },
                "requirements": [["has_the_item", "has_the_recipe"]],
            }
        )


class Tags:
    def __init__(self, ctx: Context):
        pass

    def resolve_tag(self, id: str, tag_container: NamespaceProxy) -> set[str]:
        return set(self._resolve_tag(id, tag_container, set()))

    def _resolve_tag(self, id: str, tag_container: NamespaceProxy, seen: set[str]) -> set[str]:
        if id in seen:
            raise Exception(f"Cyclic tag found! `{id}`")
        seen.add(id)
        tag = tag_container[id].data
        out: set[str] = set()

        for value in tag.get("values", []):
            if value.startswith("#"):
                out |= self._resolve_tag(value[1:], tag_container, seen)
            else:
                out.add(value)
        return out


def print_mecha(ctx: Context):
    with ctx.inject(Logger) as logger:
        logger.info("Starting mecha pipeline...")


def print_finished(ctx: Context):
    with ctx.inject(Logger) as logger:
        logger.info("Finished building!")
