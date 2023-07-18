tag @e[tag=ChairBox,type=interaction,limit=1,sort=nearest,tag=!ChairChecked] add ChairChecking
execute store result score #UUID_0_Check Math run data get entity @e[tag=ChairChecking,limit=1] attack.player[0]
execute store result score #UUID_1_Check Math run data get entity @e[tag=ChairChecking,limit=1] attack.player[1]
execute store result score #UUID_2_Check Math run data get entity @e[tag=ChairChecking,limit=1] attack.player[2]
execute store result score #UUID_3_Check Math run data get entity @e[tag=ChairChecking,limit=1] attack.player[3]
tag @e[tag=ChairChecking,limit=1] add ChairChecked
scoreboard players set #UUID_Check Math 0
execute if score #UUID_0 Math = #UUID_0_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_1 Math = #UUID_1_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_2 Math = #UUID_2_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_3 Math = #UUID_3_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_Check Math matches 4 run tag @e[tag=ChairChecking,limit=1] add ActiveChair
execute if score #UUID_Check Math matches 4 run tag @e[tag=ChairChecked,type=interaction] remove ChairChecked
execute if score #UUID_Check Math matches 4 as @e[tag=ChairSit,tag=!ChairBox] if score @s ChairID = @e[tag=ActiveChair,limit=1] ChairID run tag @s add ActiveChair 
tag @e[tag=ChairChecking,limit=1] remove ChairChecking
execute unless score #UUID_Check Math matches 4 run function minecraft:loops/tag_breaking_chair
