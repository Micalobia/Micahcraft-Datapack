execute store result score #Value mk.math run function settings:data/get_value {key:"mk_day_counter_enabled"}
execute if score #Value mk.math matches 1 run tag @s add mk.day_counter.enabled
execute store result score #Value mk.math run function settings:data/get_value {key:"mk_day_counter_sound"}
execute if score #Value mk.math matches 1 run tag @s add mk.day_counter.sound