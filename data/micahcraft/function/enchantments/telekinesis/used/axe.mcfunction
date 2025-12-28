advancement revoke @s only micahcraft:generated/score_triggers/telekinesis/used/axe
scoreboard players set @s mk.telekinesis.used.wooden_axe 0
scoreboard players set @s mk.telekinesis.used.stone_axe 0
scoreboard players set @s mk.telekinesis.used.copper_axe 0
scoreboard players set @s mk.telekinesis.used.golden_axe 0
scoreboard players set @s mk.telekinesis.used.iron_axe 0
scoreboard players set @s mk.telekinesis.used.diamond_axe 0
scoreboard players set @s mk.telekinesis.used.netherite_axe 0
execute if function micahcraft:enchantments/telekinesis/used/clear/stripped run return fail
function micahcraft:enchantments/telekinesis/used