from beet import Context
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes
from tools.logger import Logger
from tools.misode import Misode
import json
import pathlib

def run(ctx: Context):
    with ctx.inject(Logger).push("recipe_advancements") as logger:
        logger.info("Building...")
        with logger.push("recipe_advancements"):
            recipes = ctx.inject(Recipes)
            misode = ctx.inject(Misode)
            vanilla = ctx.inject(Vanilla)
            index: dict[str, list[str]] = json.loads(pathlib.Path("./config/recipe_advancements.json").read_text("utf-8"))
            valid_inputs = {
                *(f"#{_}" for _ in ctx.data.item_tags),
                *(f"#{_}" for _ in vanilla.data.item_tags),
                *(f"minecraft:{_}" for _ in misode.item_ids()),
                }
            valid_outputs = set(ctx.data.recipes)
            for item, recipe_list in index.items():
                if item not in valid_inputs:
                    logger.warn(f"Couldn't find item/tag '{item}'; Skipping")
                    continue
                for recipe in recipe_list:
                    if recipe not in valid_outputs:
                        logger.warn(f"Couldn't find recipe '{recipe}'; Skipping")
                        continue
                    path = f"{ctx.project_id}:generated/recipes/{recipe.replace(':','/')}"
                    ctx.data[path] = recipes.advancement(item, recipe)