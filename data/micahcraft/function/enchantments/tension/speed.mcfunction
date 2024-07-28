execute store result score #X mk.math run data get entity @s Motion[0] 100
execute store result score #Y mk.math run data get entity @s Motion[1] 100
execute store result score #Z mk.math run data get entity @s Motion[2] 100
function micahcraft:util/tag_player {uuid_path:"entity @s Owner"}
execute store result score #Level mk.math run \
    data get entity @p[tag=mk.tag_player] SelectedItem.components.'minecraft:enchantments'.levels.'micahcraft:tension'
tag @p[tag=mk.tag_player] remove mk.tag_player
scoreboard players set #Percent mk.math 10
scoreboard players operation #Level mk.math *= #Percent mk.math
scoreboard players add #Level mk.math 100
scoreboard players operation #X mk.math *= #Level mk.math
scoreboard players operation #Y mk.math *= #Level mk.math
scoreboard players operation #Z mk.math *= #Level mk.math
execute store result entity @s Motion[0] double 0.0001 run scoreboard players get #X mk.math
execute store result entity @s Motion[1] double 0.0001 run scoreboard players get #Y mk.math
execute store result entity @s Motion[2] double 0.0001 run scoreboard players get #Z mk.math