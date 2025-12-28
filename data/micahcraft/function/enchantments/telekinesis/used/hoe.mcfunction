advancement revoke @s only micahcraft:generated/score_triggers/telekinesis/used/hoe
scoreboard players set @s mk.telekinesis.used.wooden_hoe 0
scoreboard players set @s mk.telekinesis.used.stone_hoe 0
scoreboard players set @s mk.telekinesis.used.copper_hoe 0
scoreboard players set @s mk.telekinesis.used.golden_hoe 0
scoreboard players set @s mk.telekinesis.used.iron_hoe 0
scoreboard players set @s mk.telekinesis.used.diamond_hoe 0
scoreboard players set @s mk.telekinesis.used.netherite_hoe 0
execute if function micahcraft:enchantments/telekinesis/used/clear/tilled run return fail
function micahcraft:enchantments/telekinesis/used