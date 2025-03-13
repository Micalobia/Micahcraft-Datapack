scoreboard players set #Blocks mk.math 0
execute store result score #Level mk.math run function settings:data/get_value {key:"enchantments:veinmining/level"}
$execute positioned $(x) $(y) $(z) positioned ~ ~0.5 ~ run function micahcraft:enchantments/veinmining/summon
tag @s add CurrentPlayer
execute as @e[type=marker,tag=mk.veinmining,tag=Checked] \
    if score @s mk.misc.player.id = @p[tag=CurrentPlayer] mk.misc.player.id \
    run tag @s add Mine
tag @s remove CurrentPlayer
scoreboard players set #Blocks mk.math 0
execute at @n[type=marker,tag=Mine,limit=128] run function micahcraft:enchantments/veinmining/break
kill @e[type=marker,tag=Mine]