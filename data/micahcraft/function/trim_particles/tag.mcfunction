execute store result score #Value mk.math run function settings:data/get_value {key:"mk_world_trim_particles_enabled"}
execute if score #Value mk.math matches 1 run tag @s add mk.trim_particles.show
execute store result score #Value mk.math run function settings:data/get_value {key:"mk_world_trim_particles_self"}
execute if score #Value mk.math matches 1 run tag @s add mk.trim_particles.show_self