advancement revoke @s only micahcraft:generated/score_triggers/germination/mined_nether_wart
scoreboard players set @s mk.germination.mined_nether_wart 0
execute unless predicate micahcraft:enchantments/germination/holding run return fail
data modify storage micahcraft:germination block set value "nether_wart"
data modify storage micahcraft:germination predicate set value "micahcraft:location/plant_soul_sand"
function micahcraft:enchantments/germination/place with storage micahcraft:germination