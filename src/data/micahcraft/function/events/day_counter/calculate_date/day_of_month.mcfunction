execute store result score #Value mk.math run time query day
scoreboard players operation #Value mk.math %= #365 mk.math
execute if score #Value mk.math matches ..30 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 31..58 run scoreboard players set #Temp mk.math 28
execute if score #Value mk.math matches 59..89 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 90..119 run scoreboard players set #Temp mk.math 30
execute if score #Value mk.math matches 120..150 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 151..180 run scoreboard players set #Temp mk.math 30
execute if score #Value mk.math matches 181..211 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 212..242 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 243..272 run scoreboard players set #Temp mk.math 30
execute if score #Value mk.math matches 273..303 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 304..333 run scoreboard players set #Temp mk.math 30
execute if score #Value mk.math matches 334..364 run scoreboard players set #Temp mk.math 31
execute if score #Value mk.math matches 31..58 run scoreboard players remove #Value mk.math 31
execute if score #Value mk.math matches 59..89 run scoreboard players remove #Value mk.math 59
execute if score #Value mk.math matches 90..119 run scoreboard players remove #Value mk.math 90
execute if score #Value mk.math matches 120..150 run scoreboard players remove #Value mk.math 120
execute if score #Value mk.math matches 151..180 run scoreboard players remove #Value mk.math 151
execute if score #Value mk.math matches 181..211 run scoreboard players remove #Value mk.math 181
execute if score #Value mk.math matches 212..242 run scoreboard players remove #Value mk.math 212
execute if score #Value mk.math matches 243..272 run scoreboard players remove #Value mk.math 243
execute if score #Value mk.math matches 273..303 run scoreboard players remove #Value mk.math 273
execute if score #Value mk.math matches 304..333 run scoreboard players remove #Value mk.math 304
execute if score #Value mk.math matches 334..364 run scoreboard players remove #Value mk.math 334
scoreboard players operation #Value mk.math %= #Temp mk.math
scoreboard players add #Value mk.math 1
execute store result storage micahcraft:time date.day_of_month int 1 run scoreboard players get #Value mk.math