execute store result score $SVal Math run data get entity @e[type=horse,limit=1,sort=nearest,distance=..10] Attributes[0].Base 100
scoreboard players operation $SVal Math *= $4317 Math
scoreboard players add $SVal Math 50
scoreboard players operation $SVal Math /= $100 Math
scoreboard players operation $SInt Math = $SVal Math
scoreboard players operation $SInt Math /= $100 Math
scoreboard players operation $SDec Math = $SVal Math
scoreboard players operation $SDec Math %= $100 Math

tellraw @s [{"text":"Speed: ","color":"dark_green"},{"score":{"name":"$SInt","objective":"Math"},"color":"dark_green"},".",{"score":{"name":"$SDec","objective":"Math"},"color":"dark_green"}]