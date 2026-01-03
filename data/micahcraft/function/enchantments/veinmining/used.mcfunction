execute unless predicate micahcraft:enchantments/veinmining/holding run return fail
execute store result score #crouched mk.math run function micahcraft:settings/data/get/enchant_crouch {path:"veinmining_crouch"}
execute if score #crouched mk.math matches 1 unless predicate micahcraft:api/crouching run return fail
execute if score #crouched mk.math matches 2 if predicate micahcraft:api/crouching run return fail
tag @s add mk.veinmining.used
function micahcraft:api/hit/run {tag:"mk.veinmining.hit",function:"micahcraft:enchantments/veinmining/mine"}
tag @s remove mk.veinmining.used