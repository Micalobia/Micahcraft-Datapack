scoreboard players remove @e[scores={mk.apollo.timer=1..}] mk.apollo.timer 1
scoreboard players reset @e[scores={mk.apollo.timer=0}] mk.apollo.timer
execute as @e[scores={mk.apollo.timer=1..}] at @s run function micahcraft:enchantments/apollo/particles
execute if entity @e[scores={mk.apollo.timer=1..}] run schedule function micahcraft:enchantments/apollo/timer 1t replace