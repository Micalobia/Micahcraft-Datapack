execute if entity @s[tag=!mk.trim_particles.show] run return fail
scoreboard players add @s mk.trim_particles.lapis 1
scoreboard players operation @s mk.trim_particles.lapis %= #5 mk.math
execute unless score @s mk.trim_particles.lapis matches 0 run return fail
tag @s[tag=!mk.trim_particles.show_self] add Nope
particle minecraft:enchant ~ ~1.2 ~ 0.1 0.3 0.1 0.8 1 normal @a[tag=!Nope]
tag @s remove Nope