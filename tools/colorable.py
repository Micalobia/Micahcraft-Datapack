from beet import Context, Recipe
from tools.utility import Recipes
from tools.logger import Logger
from dataclasses import dataclass


def run(ctx: Context):
    with ctx.inject(Logger).push("colorable") as logger:
        recipes = ctx.inject(Recipes)
        ingredients: list[RecolorIngredient] = ctx.meta["colorable/ingredients"]
        colors: list[str] = ctx.meta["colors"]
        for ingredient in ingredients:
            for color in colors:
                identifier = f"{ctx.project_id}:generated/recolors/{ingredient.item}/{color}"
                ctx.data[identifier] = Recipe(
                    {
                        "type": "crafting_shaped",
                        "pattern": ["###", "#D#", "###"],
                        "key": {"#": f"#{ingredient.tag}", "D": f"{color}_dye"},
                        "result": {"id": f"{color}_{ingredient.item}", "count": 8},
                    }
                )
                ctx.data[identifier] = recipes.advancement(f"#{ingredient.tag}", identifier)
        for color in colors:
            identifier = f"micahcraft:helmet_banner/{color}"
            ctx.data[identifier] = Recipe(ctx.template.render("recipes/wearable_banner.json.j2", color=color))
            ctx.data[identifier] = recipes.advancement("#minecraft:banners", identifier)
        logger.info(f"{len(ingredients)} recolor recipes, {len(colors)} colors/wearable banner recipes")


@dataclass(frozen=True)
class RecolorIngredient:
    item: str
    tag: str
