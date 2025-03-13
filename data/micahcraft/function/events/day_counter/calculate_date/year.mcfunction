execute store result score #Value mk.math run time query day
scoreboard players operation #Value mk.math /= #365 mk.math
scoreboard players add #Value mk.math 1
execute store result storage micahcraft:time date.year int 1 run scoreboard players get #Value mk.math