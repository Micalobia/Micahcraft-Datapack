tag @e[tag=Chair,tag=LookedAt] remove LookedAt
execute as @a if predicate micahcraft:player/has_empty_hands at @s anchored eyes if raycast 12 block #minecraft:stairs outline none raycast 12 block #minecraft:stairs outline none block as @e[type=marker,tag=Chair,distance=..0.01] run tag @s add LookedAt
execute as @e[type=marker,tag=Chair,tag=LookedAt] at @s if block ~ ~ ~ #minecraft:stairs[half=top] run kill @s
execute as @e[type=marker,tag=Chair] at @s unless block ~ ~ ~ #minecraft:stairs run kill @s
execute as @e[tag=Box,tag=Chair] at @s positioned ~ ~0.5 ~ unless entity @e[type=marker,tag=Chair,distance=..0.01] run kill @s
tag @e[tag=Chair,tag=Seat,tag=DontKill] remove DontKill
execute as @a on vehicle if entity @s[tag=Chair,tag=Seat] run tag @s add DontKill
kill @e[tag=Chair,tag=Seat,tag=!DontKill]
execute as @e[type=marker,tag=Chair,tag=!LookedAt] at @s positioned ~ ~-0.5 ~ run kill @e[type=interaction,tag=Chair,distance=..0.01]
execute as @e[type=marker,tag=Chair,tag=LookedAt] at @s positioned ~ ~-0.5 ~ unless entity @e[type=interaction,tag=Chair,distance=..0.01] run summon interaction ~ ~ ~ {Tags:["Chair","Box"],response:true}
execute as @e[type=marker,tag=Chair,tag=LookedAt] at @s unless entity @e[tag=Seat,tag=Chair,distance=..0.36] run particle dust 0.7 0.7 1 1 ~ ~ ~ 0.25 0.25 0.25 0 1 normal
execute as @e[type=interaction,tag=Chair,tag=Box] at @s on target positioned ~ ~0.5 ~ run function micahcraft:tick/chair/ride