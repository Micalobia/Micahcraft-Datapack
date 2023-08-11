execute on vehicle store result score #Value Math run attribute @s minecraft:generic.movement_speed get 42158
scoreboard players operation #Integer Math = #Value Math
scoreboard players operation #Integer Math /= #1000 Math
scoreboard players operation #Decimal Math = #Value Math
scoreboard players operation #Decimal Math %= #1000 Math
tellraw @s [{"text":"Speed: ","color":"dark_green","extra":[{"score":{"name":"#Integer","objective":"Math"}},".",{"score":{"name":"#Decimal","objective":"Math"}}]}]