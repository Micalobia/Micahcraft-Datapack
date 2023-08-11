execute if score #GraveParticle Math matches 1..2 as @e[tag=Grave,type=interaction] at @s run particle minecraft:soul_fire_flame ~ ~.25 ~ .15 .3 .15 0.01 1 normal @a
execute if score #GraveParticle Math matches 3 as @e[tag=Grave,type=interaction] at @s run particle minecraft:soul ~ ~.25 ~ .1 .2 .1 0.01 1 normal @a
scoreboard players add #GraveParticle Math 1
scoreboard players operation #GraveParticle Math %= #8 Math