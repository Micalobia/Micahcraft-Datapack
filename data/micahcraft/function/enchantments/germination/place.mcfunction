tag @s add mk.germination.place
$execute at @s as @e[type=marker,tag=mk.germination.hit] \
    if score @s mk.misc.player.id = @p[tag=mk.germination.place] mk.misc.player.id \
    at @s if predicate $(predicate) run function micahcraft:enchantments/germination/place/place_and_kill with storage micahcraft:germination
tag @s remove mk.germination.place