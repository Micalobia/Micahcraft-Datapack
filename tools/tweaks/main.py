from beet import Context
from beet.contrib.vanilla import Vanilla
from tools.logger import Logger
from .enchants import run as enchants
from .loot_tables import run as loot_tables
from .enchant_balance import run as enchant_balance


def run(ctx: Context):
    with ctx.inject(Logger).push("tweaks") as logger:
        logger.info("Building...")
        vanilla = ctx.inject(Vanilla)
        enchants(ctx, vanilla)
        loot_tables(ctx, vanilla)
        enchant_balance(ctx, vanilla)
