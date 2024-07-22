scoreboard players add @s mk.trim_particles.lapis 1
scoreboard players operation @s mk.trim_particles.lapis %= #5 mk.math
execute unless score @s mk.trim_particles.lapis matches 0 run return fail
particle minecraft:enchant ~ ~1.2 ~ 0.1 0.3 0.1 0.8 1 normal @a