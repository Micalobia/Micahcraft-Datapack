from beet import Context, LootTable
from beet.contrib.vanilla import Vanilla
import json
import pathlib
from copy import deepcopy
from tools.logger import Logger
from typing import Any
from .util import require, one, where, remove_where


def run(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("loot_tables"):
        germination(ctx, vanilla)
        budding_amethyst(ctx, vanilla)
        dirt_path(ctx, vanilla)
        jungle_leaves(ctx, vanilla)
        piglin_bartering(ctx, vanilla)
        beheading(ctx, vanilla)


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


# Add mob heads for the Beheading enchantment
def beheading(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("beheading") as logger:
        logger.info("Building...")
        heads: dict[str, dict[str, str] | list[dict[str, str]]] = json.loads(pathlib.Path("./config/heads.json").read_text("utf-8"))
        for id, options in heads.items():
            if isinstance(options, dict):
                options = [options]
            if not options:
                logger.warn(f"Head info for '{id}' was missing an entry; Skipping")
                continue
            entries = []
            id_path = id.split(":")[-1]
            for option in options:
                match option:
                    case {"texture": texture, "sound": sound, "name": name}:
                        entry = {
                            "type": "minecraft:item",
                            "name": "minecraft:player_head",
                            "functions": [
                                {
                                    "function": "minecraft:set_components",
                                    "components": {
                                        "minecraft:note_block_sound": sound,
                                        "minecraft:profile": {"properties": [{"name": "textures", "value": texture}]},
                                        "minecraft:item_name": {"translate": f"item.micahcraft.{id_path}", "fallback": name},
                                    },
                                },
                            ],
                        }
                        if "condition" in option:
                            suffix = "." + "_".join(name.split(" ")[:-1]).lower()
                            entry["functions"][0]["components"]["minecraft:item_name"]["translate"] += suffix
                    case {"item": item}:
                        entry: dict[str, Any] = {"type": "item", "name": item}
                    case _:
                        logger.warn(f"Head info for '{id}' was malformed; Skipping")
                        break
                if "condition" in option:
                    entry["conditions"] = [{"condition": "entity_properties", "entity": "this", "predicate": option["condition"]}]
                entries.append(entry)
            else:
                table_path = ":entities/".join(id.split(":"))
                mob = deepcopy(vanilla.data.loot_tables[table_path].data)
                pools = mob.get("pools") or []
                if len(entries) > 1:
                    entries = [{"type": "alternatives", "children": entries}]
                pool = {
                    "rolls": 1,
                    "entries": entries,
                    "conditions": [
                        {"condition": "killed_by_player"},
                        {
                            "condition": "random_chance_with_enchanted_bonus",
                            "enchantment": "micahcraft:beheading",
                            "unenchanted_chance": 0,
                            "enchanted_chance": {"type": "minecraft:linear", "base": 0.03334, "per_level_above_first": 0.03333},
                        },
                    ],
                }
                pools.append(pool)
                mob["pools"] = pools
                ctx.data[table_path] = LootTable(mob)
        wither_skeleton_skull(ctx, vanilla)


def wither_skeleton_skull(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("wither_skeleton"):
        wither_skeleton = deepcopy(vanilla.data.loot_tables["minecraft:entities/wither_skeleton"].data)
        pools = require(wither_skeleton, "pools")
        pool = one(
            where(pools, lambda x: one(x["entries"])["type"] == "minecraft:item" and x["entries"][0]["name"] == "minecraft:wither_skeleton_skull")
        )

        pool_conditions = require(pool, "conditions")
        looting_condition_predicate = lambda x: x["condition"] == "minecraft:random_chance_with_enchanted_bonus"
        looting_condition = one(remove_where(pool_conditions, looting_condition_predicate))
        beheading_condition = deepcopy(looting_condition)
        beheading_condition["enchantment"] = "micahcraft:beheading"
        beheading_chance = beheading_condition["enchanted_chance"]
        beheading_chance["base"] = 0.05
        beheading_chance["per_level_above_first"] = 0.025

        has_beheading = {
            "condition": "minecraft:entity_properties",
            "entity": "attacking_player",
            "predicate": {
                "equipment": {
                    "mainhand": {"predicates": {"minecraft:enchantments": [{"enchantments": "micahcraft:beheading", "levels": {"min": 1}}]}}
                }
            },
        }
        no_beheading = {"condition": "minecraft:inverted", "term": has_beheading}

        entries = pool["entries"]
        looting_entry = one(entries)
        beheading_entry = deepcopy(looting_entry)
        looting_entry["conditions"] = [looting_condition, no_beheading]
        beheading_entry["conditions"] = [beheading_condition, has_beheading]
        entries[:] = [{"type": "minecraft:alternatives", "children": [looting_entry, beheading_entry]}]

        ctx.data["minecraft:entities/wither_skeleton"] = LootTable(wither_skeleton)
