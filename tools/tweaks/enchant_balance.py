from beet import Context, LootTable
from beet.contrib.vanilla import Vanilla
from copy import deepcopy
from tools.logger import Logger
from typing import Callable
from .util import require, where


def run(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("enchant_balance"):
        abandoned_mineshaft(ctx, vanilla)
        ancient_city(ctx, vanilla)
        end_city_treasure(ctx, vanilla)
        nether_bridge(ctx, vanilla)
        pillager_outpost(ctx, vanilla)
        simple_dungeon(ctx, vanilla)
        trial_chambers(ctx, vanilla)
        stronghold(ctx, vanilla)
        woodland_mansion(ctx, vanilla)


# Returns false if the options are an array
def is_enchant_function(enchant: str | None) -> Callable[[object], bool]:
    def predicate(f: object) -> bool:
        match f:
            case {"function": "minecraft:enchant_randomly", "options": options}:
                return enchant is None or enchant == options
            case {"function": "minecraft:enchant_with_levels", "options": options}:
                return enchant is None or enchant == options
            case _:
                return False

    return predicate


def replace_enchant_options(loot_table, from_enchant: str | None, to_enchant: str | list[str]):
    for pool in require(loot_table, "pools"):
        for entry in where(pool["entries"], lambda x: "functions" in x):
            for function in where(entry["functions"], is_enchant_function(from_enchant)):
                function["options"] = to_enchant


def add_enchant_option(loot_table, has_enchant: str | None, enchant: str | list[str]):
    def predicate(f: object) -> bool:
        match f:
            case {"function": "minecraft:enchant_randomly", "options": options}:
                if isinstance(options, list):
                    return has_enchant is None or has_enchant in options
                else:
                    return has_enchant is None or has_enchant == options
            case {"function": "minecraft:enchant_with_levels", "options": options}:
                if isinstance(options, list):
                    return has_enchant is None or has_enchant in options
                else:
                    return has_enchant is None or has_enchant == options
            case _:
                return False

    enchant_set = set(enchant) if isinstance(enchant, list) else {enchant}
    for pool in require(loot_table, "pools"):
        for entry in where(pool["entries"], lambda x: "functions" in x):
            for function in where(entry["functions"], predicate):
                options = function["options"]
                if isinstance(options, list):
                    function["options"] = list(set(options) | enchant_set)
                else:
                    function["options"] = list({options} | enchant_set)


# Change the random enchants to a custom pool
def abandoned_mineshaft(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("abandoned_mineshaft"):
        abandoned_mineshaft = deepcopy(vanilla.data.loot_tables["minecraft:chests/abandoned_mineshaft"].data)
        replace_enchant_options(abandoned_mineshaft, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/mineshaft")
        ctx.data["minecraft:chests/abandoned_mineshaft"] = LootTable(abandoned_mineshaft)


# Make Swift Sneak always max level
def ancient_city(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("ancient_city"):
        ancient_city = deepcopy(vanilla.data.loot_tables["minecraft:chests/ancient_city"].data)
        for pool in require(ancient_city, "pools"):
            for entry in where(pool["entries"], lambda x: "functions" in x):
                for function in where(entry["functions"], is_enchant_function("minecraft:swift_sneak")):
                    del function["options"]
                    function["function"] = "minecraft:set_enchantments"
                    function["enchantments"] = {"minecraft:swift_sneak": 3}
        ctx.data["minecraft:chests/ancient_city"] = LootTable(ancient_city)


# Change random enchants to a custom pool, add Ender Reach books
def end_city_treasure(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("end_city_treasure"):
        end_city_treasure = deepcopy(vanilla.data.loot_tables["minecraft:chests/end_city_treasure"].data)
        replace_enchant_options(end_city_treasure, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/end_city")
        require(end_city_treasure, "pools").append(
            {
                "bonus_rolls": 0.0,
                "entries": [
                    {"type": "minecraft:empty", "weight": 4},
                    {
                        "type": "minecraft:item",
                        "functions": [
                            {
                                "function": "minecraft:set_enchantments",
                                "enchantments": {"micahcraft:ender_reach": {"min": 1, "max": 3, "type": "uniform"}},
                            }
                        ],
                        "name": "minecraft:book",
                        "weight": 1,
                    },
                ],
                "rolls": 1.0,
            }
        )
        ctx.data["minecraft:chests/end_city_treasure"] = LootTable(end_city_treasure)


# Add Satyr Step to Nether Bridges
def nether_bridge(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("nether_bridge"):
        nether_bridge = deepcopy(vanilla.data.loot_tables["minecraft:chests/nether_bridge"].data)
        require(nether_bridge, "pools").append(
            {
                "rolls": 1.0,
                "bonus_rolls": 0.0,
                "entries": [
                    {"type": "minecraft:empty", "weight": 9},
                    {
                        "type": "minecraft:item",
                        "name": "book",
                        "functions": [
                            {"function": "set_enchantments", "enchantments": {"micahcraft:satyr_step": {"type": "uniform", "min": 1, "max": 2}}}
                        ],
                    },
                ],
            }
        )
        ctx.data["minecraft:chests/nether_bridge"] = LootTable(nether_bridge)


# Change random enchantments to a custom pool
def pillager_outpost(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("pillager_outpost"):
        pillager_outpost = deepcopy(vanilla.data.loot_tables["minecraft:chests/pillager_outpost"].data)
        replace_enchant_options(pillager_outpost, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/pillager_outpost")
        ctx.data["minecraft:chests/pillager_outpost"] = LootTable(pillager_outpost)


# Change random enchantments to a custom pool
def simple_dungeon(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("simple_dungeon"):
        simple_dungeon = deepcopy(vanilla.data.loot_tables["minecraft:chests/simple_dungeon"].data)
        replace_enchant_options(simple_dungeon, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/dungeon")
        ctx.data["minecraft:chests/simple_dungeon"] = LootTable(simple_dungeon)


# Change random enchantments to a custom pool
# Adds evasion to the trial chambers
def trial_chambers(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("trial_chambers") as logger:
        with logger.push("ominous_rare"):
            ominous_rare = deepcopy(vanilla.data.loot_tables["minecraft:chests/trial_chambers/reward_ominous_rare"].data)
            # replace_enchant_options(ominous_rare, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/trial")
            add_enchant_option(ominous_rare, "minecraft:multishot", "micahcraft:evasion")
            ctx.data["minecraft:chests/trial_chambers/ominous_rare"] = LootTable(ominous_rare)
        with logger.push("rare"):
            rare = deepcopy(vanilla.data.loot_tables["minecraft:chests/trial_chambers/reward_rare"].data)
            # replace_enchant_options(rare, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/trial")
            add_enchant_option(rare, "minecraft:silk_touch", "micahcraft:evasion")
            ctx.data["minecraft:chests/trial_chambers/reward_rare"] = LootTable(rare)


# Change random enchantments to a custom pool
def stronghold(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("stronghold") as logger:
        with logger.push("corridor"):
            corridor = deepcopy(vanilla.data.loot_tables["minecraft:chests/stronghold_corridor"].data)
            replace_enchant_options(corridor, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/stronghold")
            ctx.data["minecraft:chests/stronghold_corridor"] = LootTable(corridor)
        with logger.push("crossing"):
            crossing = deepcopy(vanilla.data.loot_tables["minecraft:chests/stronghold_crossing"].data)
            replace_enchant_options(crossing, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/stronghold")
            ctx.data["minecraft:chests/stronghold_crossing"] = LootTable(crossing)
        with logger.push("library"):
            library = deepcopy(vanilla.data.loot_tables["minecraft:chests/stronghold_library"].data)
            replace_enchant_options(library, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/stronghold")
            ctx.data["minecraft:chests/stronghold_library"] = LootTable(library)


# Change random enchantments to a custom pool
def woodland_mansion(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("woodland_mansion"):
        woodland_mansion = deepcopy(vanilla.data.loot_tables["minecraft:chests/woodland_mansion"].data)
        replace_enchant_options(woodland_mansion, "#minecraft:on_random_loot", "#micahcraft:on_random_loot/mansion")
        ctx.data["minecraft:chests/woodland_mansion"] = LootTable(woodland_mansion)
