execute on vehicle store result score #Value Math run attribute @s minecraft:generic.movement_speed get 1000
# Wiki says 43.17, tests say 42.1584649991
    scoreboard players operation #Value Math *= #42158 Math
    scoreboard players add #Value Math 500
    scoreboard players operation #Value Math /= #1000 Math
    scoreboard players operation #Integer Math = #Value Math
    scoreboard players operation #Integer Math /= #1000 Math
    scoreboard players operation #Decimal Math = #Value Math
    scoreboard players operation #Decimal Math %= #1000 Math
    scoreboard players operation #Decimal Math /= #10 Math

tellraw @s [{"text":"Speed: ","color":"dark_green"},{"score":{"name":"#Integer","objective":"Math"},"color":"dark_green"},".",{"score":{"name":"#Decimal","objective":"Math"},"color":"dark_green"}]