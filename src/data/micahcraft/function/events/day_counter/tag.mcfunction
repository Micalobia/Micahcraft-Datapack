execute store result score #Value mk.math run function micahcraft:settings/data/get/basic {namespace:"general",path:"day_counter_enabled"}
execute unless score #Value mk.math matches 1 run tag @s add mk.day_counter.enabled
execute store result score #Value mk.math run function micahcraft:settings/data/get/basic {namespace:"general",path:"day_counter_sound"}
execute unless score #Value mk.math matches 1 run tag @s add mk.day_counter.sound