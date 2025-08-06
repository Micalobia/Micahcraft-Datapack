execute store result score #X mk.math run data get entity @s Pos[0]
execute store result score #Y mk.math run data get entity @s Pos[1]
execute store result score #Z mk.math run data get entity @s Pos[2]

execute store result score #X_Inc mk.math run random value -8..8
execute store result score #Y_Inc mk.math run random value -8..8
execute store result score #Z_Inc mk.math run random value -8..8

scoreboard players operation #X mk.math += #X_Inc mk.math
scoreboard players operation #Y mk.math += #Y_Inc mk.math
scoreboard players operation #Z mk.math += #Z_Inc mk.math
execute if score #Y mk.math matches ..-65 run scoreboard players set #Y mk.math -64
execute if score #Y mk.math matches 320.. run scoreboard players set #Y mk.math 319

execute store result storage micahcraft:displacement macro.x int 1 run scoreboard players get #X mk.math
execute store result storage micahcraft:displacement macro.y int 1 run scoreboard players get #Y mk.math
execute store result storage micahcraft:displacement macro.z int 1 run scoreboard players get #Z mk.math

execute store result score #Unsafe mk.math run function settings:data/get_value {key:"mk_enchantments_displacement_safety"}
execute \
    store success score #Success mk.math run \
    function micahcraft:enchantments/displacement/__private/summon with storage micahcraft:displacement macro

execute if score #Success mk.math matches 0 run return fail
ride @s dismount
execute positioned as @n[type=marker,tag=Fresh] run tp @s ~ ~ ~
execute at @s run playsound item.chorus_fruit.teleport player @s ~ ~ ~
execute at @s run function micahcraft:misc/particles/teleport
kill @n[type=marker,tag=Fresh]
return -1