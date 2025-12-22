execute at @s run function micahcraft:enchantments/hammer/direction
tag @s remove mk.hammer.crouching
tag @s[scores={mk.hammer.crouching=1..}] add mk.hammer.crouching
scoreboard players set @s mk.hammer.crouching 0