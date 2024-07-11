execute on vehicle store result score #Value mk.math run attribute @s minecraft:generic.jump_strength get 100
scoreboard players operation #Value² mk.math = #Value mk.math
scoreboard players operation #Value² mk.math *= #Value mk.math
scoreboard players operation #Value³ mk.math = #Value² mk.math
scoreboard players operation #Value³ mk.math *= #Value mk.math

# https://www.desmos.com/calculator/3ljbjzmn7z

# -0.909x^3
scoreboard players operation #Value³ mk.math *= #-909 mk.math
scoreboard players operation #Value³ mk.math /= #100000 mk.math

# 5.359x^2
scoreboard players operation #Value² mk.math *= #5359 mk.math
scoreboard players operation #Value² mk.math /= #1000 mk.math

# 0.9x
scoreboard players operation #Value mk.math *= #90 mk.math

# -0.053
scoreboard players set #Result mk.math -53

# Add 'em up
scoreboard players operation #Result mk.math += #Value mk.math
scoreboard players operation #Result mk.math += #Value² mk.math
scoreboard players operation #Result mk.math += #Value³ mk.math
scoreboard players operation #Result mk.math /= #10 mk.math

# Extract integer and decimal parts
scoreboard players operation #Integer mk.math = #Result mk.math
scoreboard players operation #Integer mk.math /= #1000 mk.math
scoreboard players operation #Decimal mk.math = #Result mk.math
scoreboard players operation #Decimal mk.math %= #1000 mk.math

tellraw @s [{"text":"Jump Height: ","color":"light_purple","extra":[{"score":{"name":"#Integer","objective":"mk.math"}},".",{"score":{"name":"#Decimal","objective":"mk.math"}}]}]