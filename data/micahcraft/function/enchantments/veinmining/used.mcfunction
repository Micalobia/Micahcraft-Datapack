execute unless predicate micahcraft:enchantments/veinmining/holding run return fail
execute store result score #Crouch mk.math run function settings:data/get_value {key:"mk_enchantments_veinmining_crouch"}
execute if score #Crouch mk.math matches 1 unless entity @s[tag=mk.veinmining.crouching] run return fail
execute if score #Crouch mk.math matches 2 if entity @s[tag=mk.veinmining.crouching] run return fail
tag @s add mk.veinmining.used
execute at @s as @e[type=marker,tag=mk.veinmining.hit] \
    if score @s mk.misc.player.id = @p[tag=mk.veinmining.used] mk.misc.player.id \
    at @s as @p[tag=mk.veinmining.used] run function micahcraft:enchantments/veinmining/mine
tag @s remove mk.veinmining.used