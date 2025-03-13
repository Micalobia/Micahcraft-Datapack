execute if entity @s[tag=!mk.trim_particles.show] run return fail
execute if score @s mk.health < @s mk.trim_particles.emerald run tag @s add Hurt
tag @s[tag=!mk.trim_particles.show_self] add Nope
execute if entity @s[tag=Hurt] run particle minecraft:angry_villager ~ ~1 ~ 0.2 0.2 0.2 0 5 normal @a[tag=!Nope]
tag @s remove Nope
tag @s remove Hurt
scoreboard players operation @s mk.trim_particles.emerald = @s mk.health