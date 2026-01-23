from beet import Context
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes
from tools.logger import Logger
from tools.misode import Misode
from dataclasses import dataclass


def run(ctx: Context):
    with ctx.inject(Logger).push("recipe_advancements") as logger:
        recipes = ctx.inject(Recipes)
        misode = ctx.inject(Misode)
        vanilla = ctx.inject(Vanilla)
        valid_inputs = {
            *(f"#{_}" for _ in ctx.data.item_tags),
            *(f"#{_}" for _ in vanilla.data.item_tags),
            *(f"minecraft:{_}" for _ in misode.item_ids()),
        }
        valid_outputs = set(ctx.data.recipes)
        recipe_list: list[RecipeAdvancement] = ctx.meta["recipe_advancements"]

        items = set()
        unique_recipes = set()
        total_advancements = 0
        for recipe in recipe_list:
            if recipe.item not in valid_inputs:
                logger.warn(f"Couldn't find item/tag '{recipe.item}'; Skipping")
                continue
            if recipe.identifier not in valid_outputs:
                logger.warn(f"Couldn't find recipe '{recipe.identifier}'; Skipping")
                continue
            path = f"{ctx.project_id}:generated/recipes/{recipe.identifier.replace(':','/')}"
            ctx.data[path] = recipes.advancement(recipe.item, recipe.identifier)
            items.add(recipe.item)
            unique_recipes.add(recipe.identifier)
            total_advancements += 1
        logger.info(f"{total_advancements} advancements, {len(items)} items, {len(unique_recipes)} recipes")


@dataclass(frozen=True)
class RecipeAdvancement:
    item: str
    identifier: str
