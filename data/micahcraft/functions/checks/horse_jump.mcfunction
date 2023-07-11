tag @a[tag=SeeHorseJump] remove SeeHorseJump
tag @a[scores={SeeHorseJump=1..}] add SeeHorseJump
execute as @a[tag=SeeHorseJump] at @s if entity @e[type=horse,distance=..10] run function micahcraft:math/horse_jump
execute as @a[tag=SeeHorseJump] at @s unless entity @e[type=horse,distance=..10] run tellraw @s {"text":"No horse nearby!","color":"light_purple"}
scoreboard players set @a[tag=SeeHorseJump] SeeHorseJump 0
scoreboard players enable @a SeeHorseJump
