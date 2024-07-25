execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:"trim_particles.show"}
execute if score #Value mk.math matches 1 run tag @s add mk.trim_particles.show
execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:"trim_particles.show_self"}
execute if score #Value mk.math matches 1 run tag @s add mk.trim_particles.show_self