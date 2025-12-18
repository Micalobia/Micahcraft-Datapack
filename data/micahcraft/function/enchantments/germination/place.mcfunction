$summon marker $(x) $(y).5 $(z) {Tags:["Fresh","Root"]}
execute at @n[type=marker,tag=Root] run summon marker ~ ~ ~-1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~ ~ ~1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~-1 ~ ~ {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~1 ~ ~ {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~1 ~ ~1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~-1 ~ ~1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~-1 ~ ~-1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Root] run summon marker ~1 ~ ~-1 {Tags:["Fresh"]}
execute at @n[type=marker,tag=Fresh,limit=9] run summon marker ~ ~1 ~ {Tags:["Fresh"]}
$execute as @n[type=marker,limit=18,tag=Fresh] at @s if predicate $(predicate) run tag @s add Valid
$execute at @n[type=marker,tag=Root] positioned ~ ~4 ~ as @n[type=marker,tag=Valid] at @s run setblock ~ ~ ~ $(block) replace
execute as @n[type=marker,limit=18,tag=Fresh] run function micahcraft:util/remove