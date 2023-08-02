execute as @e[tag=VillagerHighlight,tag=Workstation] at @s unless block ~ ~ ~ #micahcraft:workstations run kill @s
execute if entity @e[tag=VillagerHighlight] run schedule function micahcraft:scheduled/villager_highlights 1t append
execute as @e[tag=VillagerHighlight] run function micahcraft:math/villager/highlight_color