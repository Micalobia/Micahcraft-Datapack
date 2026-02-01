tag @s add mk.api.hit
data modify entity @s view_range set value 0
item replace entity @s container.0 from entity @p[tag=mk.api.hit] weapon.mainhand
scoreboard players operation @s mk.misc.player.id = @p[tag=mk.api.hit] mk.misc.player.id
scoreboard players operation @s mk.api.time = #mk.api.time mk.api.time
# Lifetime of 10 second minimum (TODO: Also limit to 20 entities)
scoreboard players add @s mk.api.time 200
execute if predicate micahcraft:api/mineable run tag @s add mk.api.hit.mineable
$function $(function)