advancement revoke @s only micahcraft:generated/score_triggers/germination/mined_potatoes
scoreboard players set @s mk.germination.mined_potatoes 0
execute unless predicate micahcraft:enchantments/germination/holding run return fail
data modify storage micahcraft:germination block set value "potatoes"
data modify storage micahcraft:germination predicate set value "micahcraft:location/plant_farmland"
function micahcraft:enchantments/germination/copy_position
function micahcraft:enchantments/germination/place with storage micahcraft:germination