from beet import Context
from tools.misode import Misode
from tools.logger import Logger
from tools.utility import Recipes


def run(ctx: Context):
    with ctx.inject(Logger) as logger:
        logger.info("Building unwaxed recipes...")
        misode = ctx.inject(Misode)
        recipes = ctx.inject(Recipes)
        waxed = [_ for _ in misode.item_ids() if _.startswith("waxed_")]
        for item in waxed:
            unwaxed = item[6:]
            identifier = f"{ctx.project_id}:generated/unwaxed/{unwaxed}"
            ctx.data[identifier] = recipes.stonecutter(f"minecraft:{item}", f"minecraft:{unwaxed}")
            ctx.data[identifier] = recipes.advancement(f"minecraft:{item}", identifier)
