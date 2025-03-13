tag @s add CurrentPlayer
execute as @e[type=item_display,tag=mk.boreas.flap,tag=!Fresh] \
    if score @s mk.misc.player.id = @p[tag=CurrentPlayer] mk.misc.player.id \
    run tag @s add Flap
tag @s remove CurrentPlayer
item replace entity @s armor.chest from entity @n[type=item_display,tag=Flap] container.0
kill @n[type=item_display,tag=Flap]
tag @s remove mk.boreas.flapping