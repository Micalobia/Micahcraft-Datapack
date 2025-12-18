scoreboard players add @e[predicate=micahcraft:enchantments/spectre_shot/arrow] mk.spectre_shot.lifetime 1
execute as @e[predicate=micahcraft:enchantments/spectre_shot/arrow] run data modify entity @s PierceLevel set value 127
execute as @e[predicate=micahcraft:enchantments/spectre_shot/arrow] at @s run function micahcraft:misc/glow {level:15}
execute as @e[predicate=micahcraft:enchantments/spectre_shot/expired] run function micahcraft:util/remove