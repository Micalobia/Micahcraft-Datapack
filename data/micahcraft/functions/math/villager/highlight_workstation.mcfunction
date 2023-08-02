function micahcraft:fetch/workstation
summon block_display ~ ~2000 ~ {Glowing:1b,Tags:["Fresh","Workstation","VillagerHighlight","Recent"],transformation:[0.99f,0f,0f,0f,0f,0.99f,0f,0f,0f,0f,0.99f,0f,0f,0f,0f,1f]}
data modify entity @e[tag=Fresh,limit=1] block_state.Name set from storage micahcraft:villager workstation
execute store result entity @e[tag=Fresh,limit=1] Pos[0] double 1 run data get entity @s Brain.memories.minecraft:job_site.value.pos[0]
execute store result entity @e[tag=Fresh,limit=1] Pos[1] double 1 run data get entity @s Brain.memories.minecraft:job_site.value.pos[1]
execute store result entity @e[tag=Fresh,limit=1] Pos[2] double 1 run data get entity @s Brain.memories.minecraft:job_site.value.pos[2]
execute as @e[tag=Fresh,limit=1] at @s run function micahcraft:fetch/absorb_blockstate
scoreboard players set @e[tag=Fresh,limit=1] Lifetime 200
tag @e[tag=Fresh,limit=1] remove Fresh
schedule function micahcraft:scheduled/lifetime 1t append
schedule function micahcraft:scheduled/villager_highlights 1t append
