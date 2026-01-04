from beet import Context, Recipe, Advancement


class Recipes:
    def __init__(self, ctx: Context):
        pass

    def stonecutter(self, ingredient: str | list[str], result: str, count: int = 1) -> Recipe:
        return Recipe({"type": "minecraft:stonecutting", "ingredient": ingredient, "result": {"id": result, "count": count}})

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
