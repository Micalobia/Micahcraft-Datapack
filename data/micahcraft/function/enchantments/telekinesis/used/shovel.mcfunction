advancement revoke @s only micahcraft:generated/score_triggers/telekinesis/used/shovel
scoreboard players set @s mk.telekinesis.used.wooden_shovel 0
scoreboard players set @s mk.telekinesis.used.stone_shovel 0
scoreboard players set @s mk.telekinesis.used.copper_shovel 0
scoreboard players set @s mk.telekinesis.used.golden_shovel 0
scoreboard players set @s mk.telekinesis.used.iron_shovel 0
scoreboard players set @s mk.telekinesis.used.diamond_shovel 0
scoreboard players set @s mk.telekinesis.used.netherite_shovel 0
execute if function micahcraft:enchantments/telekinesis/used/clear/made_path run return fail
function micahcraft:enchantments/telekinesis/used