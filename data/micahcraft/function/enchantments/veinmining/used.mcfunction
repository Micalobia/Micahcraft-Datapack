execute unless predicate micahcraft:enchantments/veinmining/holding run return fail
execute if score @s mk.veinmining.group matches 0 run return fail
execute store result score #Crouch mk.math run function settings:data/get_value {key:"mk_enchantments_veinmining_crouch"}
execute if score #Crouch mk.math matches 1 unless entity @s[tag=mk.veinmining.crouching] run return fail
execute if score #Crouch mk.math matches 2 if entity @s[tag=mk.veinmining.crouching] run return fail
execute store result storage micahcraft:veinmining macro.x int 1 run scoreboard players get @s mk.veinmining.x
execute store result storage micahcraft:veinmining macro.y int 1 run scoreboard players get @s mk.veinmining.y
execute store result storage micahcraft:veinmining macro.z int 1 run scoreboard players get @s mk.veinmining.z
function micahcraft:enchantments/veinmining/mine with storage micahcraft:veinmining macro