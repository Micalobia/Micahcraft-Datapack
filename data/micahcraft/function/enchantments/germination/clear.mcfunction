tag @s add mk.germination.clear
execute at @s as @e[type=marker,tag=mk.germination.hit] if score @s mk.misc.player.id = @p[tag=mk.germination.clear] mk.misc.player.id run function micahcraft:util/remove
tag @s remove mk.germination.clear