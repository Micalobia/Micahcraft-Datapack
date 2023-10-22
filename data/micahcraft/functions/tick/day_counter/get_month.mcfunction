execute store result score #Value Math run time query day
scoreboard players operation #Value Math %= #365 Math
execute if score #Value Math matches 0..30 run data modify storage micahcraft:time Month set value "Jan"
execute if score #Value Math matches 31..58 run data modify storage micahcraft:time Month set value "Feb"
execute if score #Value Math matches 59..89 run data modify storage micahcraft:time Month set value "Mar"
execute if score #Value Math matches 90..119 run data modify storage micahcraft:time Month set value "Apr"
execute if score #Value Math matches 120..150 run data modify storage micahcraft:time Month set value "May"
execute if score #Value Math matches 151..180 run data modify storage micahcraft:time Month set value "Jun"
execute if score #Value Math matches 181..211 run data modify storage micahcraft:time Month set value "Jul"
execute if score #Value Math matches 212..242 run data modify storage micahcraft:time Month set value "Aug"
execute if score #Value Math matches 243..272 run data modify storage micahcraft:time Month set value "Sep"
execute if score #Value Math matches 273..303 run data modify storage micahcraft:time Month set value "Oct"
execute if score #Value Math matches 304..333 run data modify storage micahcraft:time Month set value "Nov"
execute if score #Value Math matches 334..364 run data modify storage micahcraft:time Month set value "Dec"