execute if score #GraveParticle mk.math matches 1..2 as @e[tag=mk.grave,type=interaction] at @s run particle minecraft:soul_fire_flame ~ ~.25 ~ .15 .3 .15 0.01 1 normal @a
execute if score #GraveParticle mk.math matches 3 as @e[tag=mk.grave,type=interaction] at @s run particle minecraft:soul ~ ~.25 ~ .1 .2 .1 0.01 1 normal @a
scoreboard players add #GraveParticle mk.math 1
scoreboard players operation #GraveParticle mk.math %= #8 mk.math