execute if score @s mk.health < @s mk.trim_particles.emerald run tag @s add Hurt
execute if entity @s[tag=Hurt] run particle minecraft:angry_villager ~ ~1 ~ 0.2 0.2 0.2 0 5 normal
tag @s remove Hurt
scoreboard players operation @s mk.trim_particles.emerald = @s mk.health