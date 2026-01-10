execute store result score #DayCounter mk.math run function micahcraft:settings/data/get/basic {namespace:'general',path:'day_counter_enabled'}
execute store result score #Daytime mk.math run time query daytime
execute unless score #DayCounter mk.math matches 1 if score #Daytime mk.math matches 0..168 run return fail
execute store result storage micahcraft:hud macro.theme int 1 run function micahcraft:settings/data/get/hud_theme
function micahcraft:commands/hud/theme with storage micahcraft:hud macro
function micahcraft:commands/hud/title