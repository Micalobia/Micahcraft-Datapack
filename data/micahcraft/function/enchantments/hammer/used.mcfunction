$execute store result score #Crouch mk.math run function settings:data/get_value {key:"$(crouch)"}
execute if score #Crouch mk.math matches 1 unless entity @s[tag=mk.hammer.crouching] run return fail
execute if score #Crouch mk.math matches 2 if entity @s[tag=mk.hammer.crouching] run return fail
tag @s add mk.hammer.used
execute at @s as @e[type=marker,tag=mk.hammer.hit] \
    if score @s mk.misc.player.id = @p[tag=mk.hammer.used] mk.misc.player.id \
    run function micahcraft:enchantments/hammer/mine
tag @s remove mk.hammer.used