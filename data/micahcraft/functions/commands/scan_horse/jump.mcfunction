execute on vehicle store result score #Value Math run attribute @s minecraft:horse.jump_strength get 100
scoreboard players operation #Value² Math = #Value Math
scoreboard players operation #Value² Math *= #Value Math
scoreboard players operation #Value³ Math = #Value² Math
scoreboard players operation #Value³ Math *= #Value Math

# https://www.desmos.com/calculator/3ljbjzmn7z

# -0.909x^3
scoreboard players operation #Value³ Math *= #-909 Math
scoreboard players operation #Value³ Math /= #100000 Math

# 5.359x^2
scoreboard players operation #Value² Math *= #5359 Math
scoreboard players operation #Value² Math /= #1000 Math

# 0.9x
scoreboard players operation #Value Math *= #90 Math

# -0.053
scoreboard players set #Result Math -53

# Add 'em up
scoreboard players operation #Result Math += #Value Math
scoreboard players operation #Result Math += #Value² Math
scoreboard players operation #Result Math += #Value³ Math
scoreboard players operation #Result Math /= #10 Math

# Extract integer and decimal parts
scoreboard players operation #Integer Math = #Result Math
scoreboard players operation #Integer Math /= #1000 Math
scoreboard players operation #Decimal Math = #Result Math
scoreboard players operation #Decimal Math %= #1000 Math

tellraw @s [{"text":"Jump Height: ","color":"light_purple","extra":[{"score":{"name":"#Integer","objective":"Math"}},".",{"score":{"name":"#Decimal","objective":"Math"}}]}]