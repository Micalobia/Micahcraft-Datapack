tag @e[tag=Grave,type=interaction,limit=1,sort=nearest,tag=!GraveChecked] add GraveChecking
execute store result score #UUID_0_Check Math run data get entity @e[tag=GraveChecking,limit=1] attack.player[0]
execute store result score #UUID_1_Check Math run data get entity @e[tag=GraveChecking,limit=1] attack.player[1]
execute store result score #UUID_2_Check Math run data get entity @e[tag=GraveChecking,limit=1] attack.player[2]
execute store result score #UUID_3_Check Math run data get entity @e[tag=GraveChecking,limit=1] attack.player[3]
tag @e[tag=GraveChecking,limit=1] add GraveChecked
scoreboard players set #UUID_Check Math 0
execute if score #UUID_0 Math = #UUID_0_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_1 Math = #UUID_1_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_2 Math = #UUID_2_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_3 Math = #UUID_3_Check Math run scoreboard players add #UUID_Check Math 1
execute if score #UUID_Check Math matches 4 run tag @e[tag=GraveChecking,limit=1] add ActiveGrave
execute if score #UUID_Check Math matches 4 run tag @e[tag=GraveChecked,type=interaction] remove GraveChecked
execute if score #UUID_Check Math matches 4 as @e[tag=Grave] if score @s GraveID = @e[tag=ActiveGrave,limit=1] GraveID run tag @s add ActiveGrave 
tag @e[tag=GraveChecking,limit=1] remove GraveChecking
execute unless score #UUID_Check Math matches 4 run function minecraft:loops/tag_opening_grave
