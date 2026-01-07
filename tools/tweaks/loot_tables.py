from beet import Context, LootTable
from beet.contrib.vanilla import Vanilla
from copy import deepcopy
from tools.logger import Logger
from .util import require, one, where


def run(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("loot_tables"):
        germination(ctx, vanilla)
        budding_amethyst(ctx, vanilla)
        dirt_path(ctx, vanilla)
        jungle_leaves(ctx, vanilla)
        piglin_bartering(ctx, vanilla)


# Add seed count changes for germination
def germination(ctx: Context, vanilla: Vanilla):
    reduce_count = {"function": "reference", "name": "micahcraft:enchantment/germination/reduce_count"}
    conditionless = lambda x: "conditions" not in x
    with ctx.inject(Logger).push("germination") as logger:
        with logger.push("beetroots"):
            beetroots = deepcopy(vanilla.data.loot_tables["minecraft:blocks/beetroots"].data)
            pool = one(where(require(beetroots, "pools"), conditionless))
            entry = one(require(pool, "entries"))
            child = one(where(require(entry, "children"), conditionless))
            child["functions"] = [reduce_count]
            ctx.data["minecraft:blocks/beetroots"] = LootTable(beetroots)
        with logger.push("carrots"):
            carrots = deepcopy(vanilla.data.loot_tables["minecraft:blocks/carrots"].data)
            pool = one(where(require(carrots, "pools"), conditionless))
            pool["functions"] = [reduce_count]
            ctx.data["minecraft:blocks/carrots"] = LootTable(carrots)
        with logger.push("nether_wart"):
            nether_wart = deepcopy(vanilla.data.loot_tables["minecraft:blocks/nether_wart"].data)
            pool = one(require(nether_wart, "pools"))
            require(pool, "functions").append(reduce_count)
            ctx.data["minecraft:blocks/nether_wart"] = LootTable(nether_wart)
        with logger.push("potatoes"):
            potatoes = deepcopy(vanilla.data.loot_tables["minecraft:blocks/potatoes"].data)
            pool = one(where(require(potatoes, "pools"), conditionless))
            pool["functions"] = [reduce_count]
            ctx.data["minecraft:blocks/potatoes"] = LootTable(potatoes)
        with logger.push("wheat"):
            wheat = deepcopy(vanilla.data.loot_tables["minecraft:blocks/wheat"].data)
            pool = one(where(require(wheat, "pools"), conditionless))
            entry = one(require(pool, "entries"))
            child = one(where(require(entry, "children"), conditionless))
            child["functions"] = [reduce_count]
            ctx.data["minecraft:blocks/wheat"] = LootTable(wheat)


# Make Budding Amethyst silkable
def budding_amethyst(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("budding_amethyst"):
        budding_amethyst = deepcopy(vanilla.data.loot_tables["minecraft:blocks/budding_amethyst"].data)
        if "pools" in budding_amethyst:
            raise ValueError("`pools` already exists!")
        budding_amethyst["pools"] = [
            {
                "rolls": 1,
                "conditions": [{"condition": "minecraft:reference", "name": "micahcraft:used_silk"}],
                "entries": [{"type": "minecraft:item", "name": "minecraft:budding_amethyst"}],
            }
        ]
        ctx.data["minecraft:blocks/budding_amethyst"] = LootTable(budding_amethyst)


# Make Dirt Path silkable
def dirt_path(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("dirt_path"):
        dirt_path = deepcopy(vanilla.data.loot_tables["minecraft:blocks/dirt_path"].data)
        pool = one(require(dirt_path, "pools"))
        entry = one(require(pool, "entries"))
        pool["entries"] = [
            {
                "type": "minecraft:alternatives",
                "children": [
                    {
                        "type": "minecraft:item",
                        "conditions": [{"condition": "minecraft:reference", "name": "micahcraft:used_silk"}],
                        "name": "minecraft:dirt_path",
                    },
                    entry,
                ],
            }
        ]
        ctx.data["minecraft:blocks/dirt_path"] = LootTable(dirt_path)


# Buff the jungle sapling rate from jungle leaves
def jungle_leaves(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("jungle_leaves"):
        jungle_leaves = deepcopy(vanilla.data.loot_tables["minecraft:blocks/jungle_leaves"].data)
        pool = one(where(require(jungle_leaves, "pools"), lambda x: "conditions" not in x))
        entry = one(require(pool, "entries"))
        child = one(where(require(entry, "children"), lambda x: x["name"] == "minecraft:jungle_sapling"))
        condition = one(where(require(child, "conditions"), lambda x: "chances" in x))
        condition["chances"] = [0.05, 0.0625, 0.0833, 0.1]
        ctx.data["minecraft:blocks/jungle_leaves"] = LootTable(jungle_leaves)


# Add netherite upgrade templates to Piglin bartering
def piglin_bartering(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("piglin_bartering"):
        piglin_bartering = deepcopy(vanilla.data.loot_tables["minecraft:gameplay/piglin_bartering"].data)
        pool = one(require(piglin_bartering, "pools"))
        require(pool, "entries").append(
            {
                "type": "minecraft:item",
                "functions": [{"add": False, "count": {"type": "minecraft:uniform", "max": 2.0, "min": 1.0}, "function": "minecraft:set_count"}],
                "name": "minecraft:netherite_upgrade_smithing_template",
                "weight": 3,
            }
        )
        ctx.data["minecraft:gameplay/piglin_bartering"] = LootTable(piglin_bartering)
