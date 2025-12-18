scoreboard players set #Blocks mk.math 0
execute store result score #Level mk.math run function settings:data/get_value {key:"mk_enchantments_veinmining_level"}
$execute positioned $(x) $(y) $(z) positioned ~ ~0.5 ~ run function micahcraft:enchantments/veinmining/summon
tag @s add CurrentPlayer
execute as @e[type=marker,tag=mk.veinmining,tag=Checked] \
    if score @s mk.misc.player.id = @p[tag=CurrentPlayer] mk.misc.player.id \
    run tag @s add Mine
tag @s remove CurrentPlayer
scoreboard players set #Blocks mk.math 0
execute at @n[type=marker,tag=Mine,limit=160] run function micahcraft:enchantments/veinmining/break
execute as @e[type=marker,tag=Mine] run function micahcraft:util/remove