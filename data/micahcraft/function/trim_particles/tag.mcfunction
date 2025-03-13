execute store result score #Value mk.math run function settings:data/get_value {key:"trim:particles/enabled"}
execute if score #Value mk.math matches 1 run tag @s add mk.trim_particles.show
execute store result score #Value mk.math run function settings:data/get_value {key:"trim:particles/self"}
execute if score #Value mk.math matches 1 run tag @s add mk.trim_particles.show_self