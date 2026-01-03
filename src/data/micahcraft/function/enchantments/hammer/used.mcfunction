execute store result score #crouched mk.math run function micahcraft:settings/data/get/enchant_crouch {path:"hammer_crouch"}
execute if score #crouched mk.math matches 1 unless predicate micahcraft:api/crouching run return fail
execute if score #crouched mk.math matches 2 if predicate micahcraft:api/crouching run return fail
execute at @s rotated as @s run function micahcraft:enchantments/hammer/direction
tag @s add mk.hammer.used
function micahcraft:api/hit/run {tag:"mk.hammer.hit",function:"micahcraft:enchantments/hammer/start"}
tag @s remove mk.hammer.used