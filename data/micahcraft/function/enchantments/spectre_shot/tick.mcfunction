scoreboard players add @e[predicate=micahcraft:enchantments/spectre_shot/arrow] mk.spectre_shot.lifetime 1
execute as @e[predicate=micahcraft:enchantments/spectre_shot/arrow] run data modify entity @s PierceLevel set value 127
execute as @e[predicate=micahcraft:enchantments/spectre_shot/arrow] at @s run function micahcraft:enchantments/spectre_shot/summon_glowing
kill @e[predicate=micahcraft:enchantments/spectre_shot/expired]
execute as @e[tag=mk.spectre_shot.glowing] at @s run function micahcraft:enchantments/spectre_shot/glow