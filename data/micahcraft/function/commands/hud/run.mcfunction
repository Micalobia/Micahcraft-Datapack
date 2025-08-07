execute store result score #DayCounter mk.math run function settings:data/get_value {key:"mk_day_counter_enabled"}
execute store result score #Daytime mk.math run time query daytime
execute if score #DayCounter mk.math matches 1 if score #Daytime mk.math matches 0..168 run return fail
function settings:data/get {key:"mk_hud_theme"}
data modify storage micahcraft:hud macro.theme set from storage settings:output get
function micahcraft:commands/hud/theme with storage micahcraft:hud macro
function micahcraft:commands/hud/title