execute store result score #Value Math run time query day
scoreboard players operation #Value Math %= #365 Math
execute if score #Value Math matches ..30 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 31..58 run scoreboard players set #Temp Math 28
execute if score #Value Math matches 59..89 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 90..119 run scoreboard players set #Temp Math 30
execute if score #Value Math matches 120..150 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 151..180 run scoreboard players set #Temp Math 30
execute if score #Value Math matches 181..211 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 212..242 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 243..272 run scoreboard players set #Temp Math 30
execute if score #Value Math matches 273..303 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 304..333 run scoreboard players set #Temp Math 30
execute if score #Value Math matches 334..364 run scoreboard players set #Temp Math 31
execute if score #Value Math matches 31..58 run scoreboard players remove #Value Math 31
execute if score #Value Math matches 59..89 run scoreboard players remove #Value Math 59
execute if score #Value Math matches 90..119 run scoreboard players remove #Value Math 90
execute if score #Value Math matches 120..150 run scoreboard players remove #Value Math 120
execute if score #Value Math matches 151..180 run scoreboard players remove #Value Math 151
execute if score #Value Math matches 181..211 run scoreboard players remove #Value Math 181
execute if score #Value Math matches 212..242 run scoreboard players remove #Value Math 212
execute if score #Value Math matches 243..272 run scoreboard players remove #Value Math 243
execute if score #Value Math matches 273..303 run scoreboard players remove #Value Math 273
execute if score #Value Math matches 304..333 run scoreboard players remove #Value Math 304
execute if score #Value Math matches 334..364 run scoreboard players remove #Value Math 334
scoreboard players operation #Value Math %= #Temp Math
scoreboard players add #Value Math 1
execute store result storage micahcraft:time DayOfMonth int 1 run scoreboard players get #Value Math