execute unless predicate micahcraft:enchantments/telekinesis/holding run return fail
tag @s add mk.telekinesis.used
execute at @s as @e[type=marker,tag=mk.telekinesis.hit] \
    if score @s mk.misc.player.id = @p[tag=mk.telekinesis.used] mk.misc.player.id \
    at @s as @p[tag=mk.telekinesis.used] run function micahcraft:enchantments/telekinesis/collect
tag @s remove mk.telekinesis.used