execute store result score $JVal Math run attribute @e[type=horse,sort=nearest,distance=..10,limit=1] minecraft:horse.jump_strength get 100
scoreboard players operation $JVal2 Math = $JVal Math
scoreboard players operation $JVal2 Math *= $JVal Math
scoreboard players operation $JVal3 Math = $JVal Math
scoreboard players operation $JVal3 Math *= $JVal2 Math

# Taylor series for 5.293x^1.7 around 0.7, truncated at x^3 because integer limit + close enough

# -0.5007x^3
scoreboard players operation $JVal3 Math /= $10 Math
scoreboard players operation $JVal3 Math *= $5007 Math
scoreboard players operation $JVal3 Math /= $1000 Math
scoreboard players operation $JVal3 Math *= $_1 Math
scoreboard players operation $JVal3 Math /= $100 Math

# 4.5565x^2
scoreboard players operation $JVal2 Math *= $9113 Math
scoreboard players operation $JVal2 Math /= $2000 Math

# 1.367x
scoreboard players operation $JVal Math *= $1367 Math
scoreboard players operation $JVal Math /= $10 Math

# -0.1313 (+.005 so that it does round(x) instead of floor(x))
scoreboard players set $JEnd Math -1263

# Add 'em up
scoreboard players operation $JEnd Math += $JVal Math
scoreboard players operation $JEnd Math += $JVal2 Math
scoreboard players operation $JEnd Math += $JVal3 Math
scoreboard players operation $JEnd Math /= $100 Math

# Extract integer and decimal part
scoreboard players operation $JInt Math = $JEnd Math
scoreboard players operation $JInt Math /= $100 Math
scoreboard players operation $JDec Math = $JEnd Math
scoreboard players operation $JDec Math %= $100 Math

tellraw @s [{"text":"Jump Height: ","color":"light_purple"},{"score":{"name":"$JInt","objective":"Math"},"color":"light_purple"},".",{"score":{"name":"$JDec","objective":"Math"},"color":"light_purple"}]