execute store result score #Value mk.math run time query day
scoreboard players operation #Value mk.math %= #365 mk.math
execute if score #Value mk.math matches 0..30 run data modify storage micahcraft:time date.month set value "Jan"
execute if score #Value mk.math matches 31..58 run data modify storage micahcraft:time date.month set value "Feb"
execute if score #Value mk.math matches 59..89 run data modify storage micahcraft:time date.month set value "Mar"
execute if score #Value mk.math matches 90..119 run data modify storage micahcraft:time date.month set value "Apr"
execute if score #Value mk.math matches 120..150 run data modify storage micahcraft:time date.month set value "May"
execute if score #Value mk.math matches 151..180 run data modify storage micahcraft:time date.month set value "Jun"
execute if score #Value mk.math matches 181..211 run data modify storage micahcraft:time date.month set value "Jul"
execute if score #Value mk.math matches 212..242 run data modify storage micahcraft:time date.month set value "Aug"
execute if score #Value mk.math matches 243..272 run data modify storage micahcraft:time date.month set value "Sep"
execute if score #Value mk.math matches 273..303 run data modify storage micahcraft:time date.month set value "Oct"
execute if score #Value mk.math matches 304..333 run data modify storage micahcraft:time date.month set value "Nov"
execute if score #Value mk.math matches 334..364 run data modify storage micahcraft:time date.month set value "Dec"