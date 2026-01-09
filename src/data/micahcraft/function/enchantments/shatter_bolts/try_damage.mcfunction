scoreboard players remove @s mk.shatter_bolts.time 1
scoreboard players operation @s mk.math = @s mk.shatter_bolts.time
scoreboard players operation @s mk.math %= #20 mk.math
execute if score @s mk.shatter_bolts.time matches 180.. run function micahcraft:enchantments/shatter_bolts/shatter
execute if score @s mk.math matches 0 run damage @s 2 generic_kill
execute if score @s mk.shatter_bolts.time matches 0 run scoreboard players reset @s mk.shatter_bolts.time