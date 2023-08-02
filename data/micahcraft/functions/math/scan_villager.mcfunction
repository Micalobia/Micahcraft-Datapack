tag @e[tag=Recent] remove Recent
execute if entity @s[predicate=micahcraft:villager/brain/has_job_site] run function micahcraft:math/villager/highlight_workstation
team leave @e[type=villager,team=SeeXP]
effect give @s glowing 10 0 true
team leave @e[type=villager,team=Lime]
team join Lime @s