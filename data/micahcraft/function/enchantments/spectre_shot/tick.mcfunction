scoreboard players add @e[predicate=micahcraft:enchantments/spectre_shot/arrow] mk.spectre_shot.lifetime 1
execute as @e[predicate=micahcraft:enchantments/spectre_shot/arrow] run data modify entity @s PierceLevel set value 127
kill @e[predicate=micahcraft:enchantments/spectre_shot/expired]