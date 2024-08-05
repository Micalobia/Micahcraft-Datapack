tag @s add CurrentPlayer
execute as @e[type=magma_cube,tag=mk.measuring.cube] if score @s mk.measuring.id = @p[tag=CurrentPlayer] mk.measuring.id run tag @s add ActiveCube
execute store result score #X1 mk.math run data get entity @n[type=magma_cube,tag=ActiveCube,team=mk.no_collision.red] Pos[0]
execute store result score #Y1 mk.math run data get entity @n[type=magma_cube,tag=ActiveCube,team=mk.no_collision.red] Pos[1]
execute store result score #Z1 mk.math run data get entity @n[type=magma_cube,tag=ActiveCube,team=mk.no_collision.red] Pos[2]
execute store result score #X2 mk.math run data get entity @n[type=magma_cube,tag=ActiveCube,team=mk.no_collision.blue] Pos[0]
execute store result score #Y2 mk.math run data get entity @n[type=magma_cube,tag=ActiveCube,team=mk.no_collision.blue] Pos[1]
execute store result score #Z2 mk.math run data get entity @n[type=magma_cube,tag=ActiveCube,team=mk.no_collision.blue] Pos[2]
scoreboard players operation #X1 mk.math -= #X2 mk.math
scoreboard players operation #Y1 mk.math -= #Y2 mk.math
scoreboard players operation #Z1 mk.math -= #Z2 mk.math
execute if score #X1 mk.math matches ..-1 run scoreboard players operation #X1 mk.math *= #-1 mk.math
execute if score #Y1 mk.math matches ..-1 run scoreboard players operation #Y1 mk.math *= #-1 mk.math
execute if score #Z1 mk.math matches ..-1 run scoreboard players operation #Z1 mk.math *= #-1 mk.math
scoreboard players add #X1 mk.math 1
scoreboard players add #Y1 mk.math 1
scoreboard players add #Z1 mk.math 1
function micahcraft:enchantments/measuring/display
tag @s remove CurrentPlayer
