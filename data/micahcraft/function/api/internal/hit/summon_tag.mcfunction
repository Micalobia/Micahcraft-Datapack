tag @s add mk.api.hit
$tag @s add $(tag)
data modify entity @s view_range set value 0
item replace entity @s container.0 from entity @p[tag=mk.api.hit] weapon.mainhand
scoreboard players operation @s mk.misc.player.id = @p[tag=mk.api.hit] mk.misc.player.id
scoreboard players operation @s mk.api.time = #mk.api.time mk.api.time
# Lifetime of 1 second minimum
scoreboard players add @s mk.api.time 20
execute if predicate micahcraft:api/mineable run tag @s add mk.api.hit.mineable