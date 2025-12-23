advancement revoke @s only micahcraft:generated/score_triggers/veinmining/used/hoe
scoreboard players set @s mk.veinmining.used.wooden_hoe 0
scoreboard players set @s mk.veinmining.used.stone_hoe 0
scoreboard players set @s mk.veinmining.used.golden_hoe 0
scoreboard players set @s mk.veinmining.used.iron_hoe 0
scoreboard players set @s mk.veinmining.used.diamond_hoe 0
scoreboard players set @s mk.veinmining.used.netherite_hoe 0
execute if function micahcraft:enchantments/veinmining/used/clear/tilled run return fail
function micahcraft:enchantments/veinmining/used