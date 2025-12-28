advancement revoke @s only micahcraft:generated/score_triggers/veinmining/used/shovel
scoreboard players set @s mk.veinmining.used.wooden_shovel 0
scoreboard players set @s mk.veinmining.used.stone_shovel 0
scoreboard players set @s mk.veinmining.used.copper_shovel 0
scoreboard players set @s mk.veinmining.used.golden_shovel 0
scoreboard players set @s mk.veinmining.used.iron_shovel 0
scoreboard players set @s mk.veinmining.used.diamond_shovel 0
scoreboard players set @s mk.veinmining.used.netherite_shovel 0
execute if function micahcraft:enchantments/veinmining/used/clear/made_path run return fail
function micahcraft:enchantments/veinmining/used