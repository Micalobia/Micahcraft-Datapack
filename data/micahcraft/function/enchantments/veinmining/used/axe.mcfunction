advancement revoke @s only micahcraft:generated/score_triggers/veinmining/used/axe
scoreboard players set @s mk.veinmining.used.wooden_axe 0
scoreboard players set @s mk.veinmining.used.stone_axe 0
scoreboard players set @s mk.veinmining.used.golden_axe 0
scoreboard players set @s mk.veinmining.used.iron_axe 0
scoreboard players set @s mk.veinmining.used.diamond_axe 0
scoreboard players set @s mk.veinmining.used.netherite_axe 0
execute if function micahcraft:enchantments/veinmining/used/clear/stripped run return fail
function micahcraft:enchantments/veinmining/used