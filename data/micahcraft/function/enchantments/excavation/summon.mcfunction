execute if score @s mk.excavation.face matches 0 run return fail
$execute positioned $(x) $(y) $(z) positioned ~ ~0.5 ~ run summon marker ~ ~ ~ {Tags:["Fresh","Root"]}
execute if score @s mk.excavation.face matches 1 as @n[type=marker,tag=Fresh] at @s run tp @s ~ ~ ~ 0 0
execute if score @s mk.excavation.face matches 2 as @n[type=marker,tag=Fresh] at @s run tp @s ~ ~ ~ 0 90
execute if score @s mk.excavation.face matches 3 as @n[type=marker,tag=Fresh] at @s run tp @s ~ ~ ~ 90 90
execute at @n[type=marker,tag=Root] run summon marker ^ ^ ^1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ^ ^ ^-1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Fresh,limit=3] rotated as @n[type=marker,tag=Root] run summon marker ^1 ^ ^ {Tags:["Fresh","Nope"]}
execute at @n[type=marker,tag=Fresh,tag=!Nope,limit=3] rotated as @n[type=marker,tag=Root] run summon marker ^-1 ^ ^ {Tags:["Fresh"]}
execute at @n[type=marker,tag=Fresh,tag=!Root,limit=8] run function micahcraft:enchantments/excavation/mine
kill @n[type=marker,tag=Fresh,limit=9]