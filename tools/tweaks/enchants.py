from beet import Context, Enchantment
from beet.contrib.vanilla import Vanilla
from copy import deepcopy
from tools.logger import Logger
from .util import require, one, act, where


def run(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("enchants"):
        channeling(ctx, vanilla)
        impaling(ctx, vanilla)
        looting(ctx, vanilla)
        loyalty(ctx, vanilla)
        unbreaking(ctx, vanilla)
        protection(ctx, vanilla)
        fire_protection(ctx, vanilla)


# Make channeling work in the rain
def channeling(ctx: Context, vanilla: Vanilla):
    def swap_thundering(obj):
        del obj["thundering"]
        obj["raining"] = True

    with ctx.inject(Logger).push("channeling") as logger:
        channeling = deepcopy(vanilla.data.enchantments["minecraft:channeling"].data)
        count = 0
        for effect_id in ("minecraft:hit_block", "minecraft:post_attack"):
            effects = require(channeling, "effects")
            effect_type = require(effects, effect_id)
            for effect in effect_type:
                count += act(where(effect["requirements"]["terms"], lambda x: "thundering" in x), swap_thundering)
        if count != 2:
            logger.warn(f"{count} weather checks; Should be 2")
        ctx.data["minecraft:channeling"] = Enchantment(channeling)


# Make Impaling work like Bedrock and Java combined
def impaling(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("impaling"):
        impaling = deepcopy(vanilla.data.enchantments["minecraft:impaling"].data)
        effects = require(impaling, "effects")
        effect = one(require(effects, "minecraft:damage"))
        original = require(effect, "requirements")
        effect["requirements"] = {
            "condition": "minecraft:any_of",
            "terms": [
                original,
                {
                    "condition": "minecraft:all_of",
                    "terms": [
                        {"condition": "minecraft:weather_check", "raining": True},
                        {"condition": "minecraft:location_check", "predicate": {"can_see_sky": True}},
                    ],
                },
                {"condition": "minecraft:entity_properties", "entity": "this", "predicate": {"location": {"fluid": {"fluids": "minecraft:water"}}}},
            ],
        }
        ctx.data["minecraft:impaling"] = Enchantment(impaling)


# Make Looting compatible with axes
def looting(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("looting"):
        looting = deepcopy(vanilla.data.enchantments["minecraft:looting"].data)
        looting["supported_items"] = "#minecraft:enchantable/sharp_weapon"
        looting["primary_items"] = "#minecraft:enchantable/melee_weapon"
        ctx.data["minecraft:looting"] = Enchantment(looting)


# Make Loyalty return tridents from the void
def loyalty(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("loyalty"):
        loyalty = deepcopy(vanilla.data.enchantments["minecraft:loyalty"].data)
        require(loyalty, "effects")["minecraft:tick"] = [{"effect": {"type": "run_function", "function": "micahcraft:enchantments/loyalty/void"}}]
        ctx.data["minecraft:loyalty"] = Enchantment(loyalty)


# Make wolf armor + future stuff compatible with unbreaking
def unbreaking(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("unbreaking"):
        unbreaking = deepcopy(vanilla.data.enchantments["minecraft:unbreaking"].data)
        unbreaking["supported_items"] = "#micahcraft:enchantable/unbreaking"
        ctx.data["minecraft:unbreaking"] = Enchantment(unbreaking)


# Make Phaethon self-damage bypass protection
def protection(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("protection") as logger:
        protection = deepcopy(vanilla.data.enchantments["minecraft:protection"].data)
        damage_protection = one(require(protection["effects"], "minecraft:damage_protection"))
        requirements = require(damage_protection, "requirements")
        match requirements:
            case {"condition": "minecraft:damage_source_properties", "predicate": {"tags": tags}}:
                tag = one(tags)
                tag["id"] = "micahcraft:bypasses_protection"
            case _:
                logger.warn("Protection patch failed!")
        ctx.data["minecraft:protection"] = Enchantment(protection)


# Make Phaethon self-damage be resisted by Fire Protection, but not Fire Resistance
def fire_protection(ctx: Context, vanilla: Vanilla):
    with ctx.inject(Logger).push("fire_protection") as logger:
        fire_protection = deepcopy(vanilla.data.enchantments["minecraft:fire_protection"].data)
        damage_protection = one(require(fire_protection["effects"], "minecraft:damage_protection"))
        requirements = require(damage_protection, "requirements")
        match requirements:
            case {"condition": "minecraft:all_of", "terms": terms}:
                match one(terms):
                    case {"condition": "minecraft:damage_source_properties", "predicate": {"tags": tags}}:
                        tag = one(where(tags, lambda x: x["id"] == "minecraft:is_fire"))
                        tag["id"] = "micahcraft:is_fire_adjacent"
                    case _:
                        logger.warn("Fire Protection patch failed!")
            case _:
                logger.warn("Fire Protection patch failed!")
        ctx.data["minecraft:fire_protection"] = Enchantment(fire_protection)
