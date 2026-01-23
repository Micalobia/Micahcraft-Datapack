from beet import Context
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes
from tools.logger import Logger


def run(ctx: Context):
    with ctx.inject(Logger).push("paintings") as logger:
        recipes = ctx.inject(Recipes)
        vanilla = ctx.inject(Vanilla)
        _vanilla = vanilla.data.painting_variants.keys()
        _custom = ctx.data.painting_variants.keys()
        painting_keys = {*_vanilla, *_custom}
        for key in painting_keys:
            identifier = f"{ctx.project_id}:generated/paintings/{key.replace(':','/')}"
            ctx.data[identifier] = recipes.stonecutter("minecraft:painting", "minecraft:painting", components={"minecraft:painting/variant": key})
            ctx.data[identifier] = recipes.advancement("minecraft:painting", identifier)
        logger.info(f"{len(painting_keys)} recipes/advancements, {len(_vanilla)} vanilla, {len(_custom)} custom")
