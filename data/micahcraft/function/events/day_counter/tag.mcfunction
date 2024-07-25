execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:"day_counter.enabled"}
execute if score #Value mk.math matches 1 run tag @s add mk.day_counter.enabled
execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:"day_counter.sound"}
execute if score #Value mk.math matches 1 run tag @s add mk.day_counter.sound