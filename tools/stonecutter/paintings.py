from beet import Context
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes
from tools.logger import Logger


def run(ctx: Context):
    with ctx.inject(Logger).push("paintings") as logger:
        logger.info("Building...")
        recipes = ctx.inject(Recipes)
        vanilla = ctx.inject(Vanilla)
        painting_keys = {*vanilla.data.painting_variants.keys(), *ctx.data.painting_variants.keys()}
        for key in painting_keys:
            identifier = f"{ctx.project_id}:generated/paintings/{key.replace(':','/')}"
            ctx.data[identifier] = recipes.stonecutter("minecraft:painting", "minecraft:painting", components={"minecraft:painting/variant": key})
            ctx.data[identifier] = recipes.advancement("minecraft:painting", f"{ctx.project_id}:{identifier}")
