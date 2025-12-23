tag @s add mk.veinmining.clear
execute at @s as @e[type=marker,tag=mk.veinmining.hit] if score @s mk.misc.player.id = @p[tag=mk.veinmining.clear] mk.misc.player.id run function micahcraft:util/remove
tag @s remove mk.veinmining.clear