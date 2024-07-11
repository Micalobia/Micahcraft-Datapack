execute store result score #Integer mk.math run data get entity @s foodSaturationLevel
execute store result score #Decimal mk.math run data get entity @s foodSaturationLevel 10
scoreboard players operation #Decimal mk.math %= #10 mk.math