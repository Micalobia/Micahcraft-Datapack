execute store result score $SVal Math run attribute @e[type=horse,limit=1,sort=nearest,distance=..10] minecraft:generic.movement_speed get 1000
# Wiki says 43.17, tests say 42.1584649991
    scoreboard players operation $SVal Math *= $42158 Math
    scoreboard players add $SVal Math 500
    scoreboard players operation $SVal Math /= $1000 Math
    scoreboard players operation $SInt Math = $SVal Math
    scoreboard players operation $SInt Math /= $1000 Math
    scoreboard players operation $SDec Math = $SVal Math
    scoreboard players operation $SDec Math %= $1000 Math
    scoreboard players operation $SDec Math /= $10 Math

tellraw @s [{"text":"Speed: ","color":"dark_green"},{"score":{"name":"$SInt","objective":"Math"},"color":"dark_green"},".",{"score":{"name":"$SDec","objective":"Math"},"color":"dark_green"}]
