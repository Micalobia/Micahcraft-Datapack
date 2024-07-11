execute on vehicle store result score #Value mk.math run attribute @s minecraft:generic.movement_speed get 42158
scoreboard players operation #Integer mk.math = #Value mk.math
scoreboard players operation #Integer mk.math /= #1000 mk.math
scoreboard players operation #Decimal mk.math = #Value mk.math
scoreboard players operation #Decimal mk.math %= #1000 mk.math
tellraw @s [{"text":"Speed: ","color":"dark_green","extra":[{"score":{"name":"#Integer","objective":"mk.math"}},".",{"score":{"name":"#Decimal","objective":"mk.math"}}]}]