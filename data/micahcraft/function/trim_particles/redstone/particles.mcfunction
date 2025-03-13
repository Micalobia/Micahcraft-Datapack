execute if entity @s[tag=!mk.trim_particles.show] run return fail
tag @s[tag=!mk.trim_particles.show_self] add Nope
particle minecraft:dust{scale:0.5f,color:[1f,0.2f,0f]} ~ ~0.6 ~ 0.4 0.5 0.4 0 1 normal @a[tag=!Nope]
tag @s remove Nope