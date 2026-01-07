from beet import Context
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes
from tools.logger import Logger

def run(ctx: Context):
    with ctx.inject(Logger) as logger:
        logger.info("Building painting recipes...")
        recipes = ctx.inject(Recipes)
        vanilla = ctx.inject(Vanilla)
        micahcraft = ctx.data[ctx.project_id]
        painting_keys = {*vanilla.data.painting_variants.keys(), *ctx.data.painting_variants.keys()}
        for key in painting_keys:
            namespace, path = key.split(":")
            full_path = f"generated/paintings/{namespace}/{path}"
            micahcraft[full_path] = recipes.stonecutter("minecraft:painting","minecraft:painting",components={"minecraft:painting/variant":key})
            micahcraft[full_path] = recipes.advancement("minecraft:painting",f"{ctx.project_id}:{full_path}")