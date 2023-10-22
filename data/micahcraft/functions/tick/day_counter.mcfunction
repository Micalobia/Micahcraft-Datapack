scoreboard players enable @a DayCounter
execute store result score #DayTime Math run time query daytime
execute unless score #DayTime Math matches 0 run return 1
execute unless entity @a[tag=!NoTime] run return 2

function micahcraft:tick/day_counter/get_year
function micahcraft:tick/day_counter/get_month
function micahcraft:tick/day_counter/get_day_of_month
function micahcraft:tick/day_counter/animation