tag @s add mk.api.hit.run
scoreboard players add #tolerance mk.api.args 0
scoreboard players set #max mk.api.time -1
$execute as @e[type=item_display,tag=mk.api.hit,tag=$(tag)] at @s \
    if score @s mk.misc.player.id = @p[tag=mk.api.hit.run] mk.misc.player.id \
    run scoreboard players operation #max mk.api.time > @s mk.api.time
scoreboard players operation #max mk.api.time -= #tolerance mk.api.args
$execute as @e[type=item_display,tag=mk.api.hit,tag=$(tag)] at @s \
    if score @s mk.misc.player.id = @p[tag=mk.api.hit.run] mk.misc.player.id \
    if score @s mk.api.time >= #max mk.api.time \
    run tag @s add mk.api.hit.run
$execute as @e[type=item_display,tag=mk.api.hit.run] at @s run function $(function)
tag @e[type=item_display,tag=mk.api.hit.run] remove mk.api.hit.run
scoreboard players set #tolerance mk.api.args 0
tag @s remove mk.api.hit.run