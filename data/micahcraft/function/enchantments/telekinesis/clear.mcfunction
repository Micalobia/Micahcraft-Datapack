tag @s add mk.telekinesis.clear
execute at @s as @e[type=marker,tag=mk.telekinesis.hit] if score @s mk.misc.player.id = @p[tag=mk.telekinesis.clear] mk.misc.player.id run function micahcraft:util/remove
tag @s remove mk.telekinesis.clear