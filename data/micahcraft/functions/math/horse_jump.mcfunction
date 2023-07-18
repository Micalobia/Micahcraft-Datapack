execute on vehicle store result score #Value Math run attribute @s minecraft:horse.jump_strength get 100
scoreboard players operation #Value² Math = #Value Math
scoreboard players operation #Value² Math *= #Value Math
scoreboard players operation #Value³ Math = #Value² Math
scoreboard players operation #Value³ Math *= #Value

# Taylor series for 5.293x^1.7 around 0.7, truncated at x^3 because integer limit + close enough

# -0.5007x^3
    scoreboard players operation #Value³ Math /= #10 Math
    scoreboard players operation #Value³ Math *= #5007 Math
    scoreboard players operation #Value³ Math /= #1000 Math
    scoreboard players operation #Value³ Math *= #-1 Math
    scoreboard players operation #Value³ Math /= #100 Math

# 4.5565x^2
    scoreboard players operation #Value² Math *= #9113 Math
    scoreboard players operation #Value² Math /= #2000 Math

# 1.367x
    scoreboard players operation #Value Math *= #1367 Math
    scoreboard players operation #Value Math /= #10 Math

# -0.1313 (+.005 so that it does round(x) instead of floor(x))
    scoreboard players set #Result Math -1263

# Add 'em up
    scoreboard players operation #Result Math += #Value Math
    scoreboard players operation #Result Math += #Value² Math
    scoreboard players operation #Result Math += #Value³ Math
    scoreboard players operation #Result Math /= #100 Math

# Extract integer and decimal part
    scoreboard players operation #Integer Math = #Result Math
    scoreboard players operation #Integer Math /= #100 Math
    scoreboard players operation #Decimal Math = #Result Math
    scoreboard players operation #Decimal Math %= #100 Math

tellraw @s [{"text":"Jump Height: ","color":"light_purple"},{"score":{"name":"#Integer","objective":"Math"},"color":"light_purple"},".",{"score":{"name":"#Decimal","objective":"Math"},"color":"light_purple"}]