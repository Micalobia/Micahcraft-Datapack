tag @s add mk.hammer.clear
execute at @s as @e[type=marker,tag=mk.hammer.hit] if score @s mk.misc.player.id = @p[tag=mk.hammer.clear] mk.misc.player.id run function micahcraft:util/remove
tag @s remove mk.hammer.clear