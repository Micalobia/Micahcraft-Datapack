tag @a[tag=SeeHorseSpeed] remove SeeHorseSpeed
tag @a[scores={SeeHorseSpeed=1..}] add SeeHorseSpeed
execute as @a[tag=SeeHorseSpeed] at @s if entity @e[type=horse,distance=..10] run function micahcraft:math/horse_speed
execute as @a[tag=SeeHorseSpeed] at @s unless entity @e[type=horse,distance=..10] run tellraw @s {"text":"No horse nearby!","color":"dark_green"}
scoreboard players set @a[tag=SeeHorseSpeed] SeeHorseSpeed 0
scoreboard players enable @a SeeHorseSpeed
