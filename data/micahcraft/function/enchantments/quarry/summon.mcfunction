execute if score @s mk.quarry.face matches 0 run return fail
$summon marker $(x) $(y).5 $(z) {Tags:["Fresh","Root"]}
execute if score @s mk.quarry.face matches 1 as @n[type=marker,tag=Fresh] at @s run tp @s ~ ~ ~ 0 0
execute if score @s mk.quarry.face matches 2 as @n[type=marker,tag=Fresh] at @s run tp @s ~ ~ ~ 0 90
execute if score @s mk.quarry.face matches 3 as @n[type=marker,tag=Fresh] at @s run tp @s ~ ~ ~ 90 90
execute at @n[type=marker,tag=Root] run summon marker ^ ^ ^1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ^ ^ ^-1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Fresh,limit=3] rotated as @n[type=marker,tag=Root] run summon marker ^1 ^ ^ {Tags:["Fresh","Nope"]}
execute at @n[type=marker,tag=Fresh,tag=!Nope,limit=3] rotated as @n[type=marker,tag=Root] run summon marker ^-1 ^ ^ {Tags:["Fresh"]}
execute at @n[type=marker,tag=Fresh,tag=!Root,limit=8] run function micahcraft:enchantments/quarry/mine
kill @n[type=marker,tag=Fresh,limit=9]