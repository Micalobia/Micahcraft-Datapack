tag @a[tag=SeeHorseJump] remove SeeHorseJump
tag @a[tag=SeeHorseSpeed] remove SeeHorseSpeed
tag @a[scores={SeeHorseJump=1..}] add SeeHorseJump
tag @a[scores={SeeHorseSpeed=1..}] add SeeHorseSpeed
execute as @a if predicate micahcraft:on_horse run tag @s add OnHorse
execute as @a[tag=SeeHorseJump,tag=OnHorse] run function micahcraft:math/horse_jump
execute as @a[tag=SeeHorseSpeed,tag=OnHorse] run function micahcraft:math/horse_speed
execute as @a[tag=SeeHorseJump,tag=!OnHorse] run tellraw @s {"text":"You're not on a horse!","color":"light_purple"}
execute as @a[tag=SeeHorseSpeed,tag=!OnHorse] run tellraw @s {"text":"You're not on a horse!","color":"dark_green"}
tag @a[tag=OnHorse] remove OnHorse
scoreboard players set @a[tag=SeeHorseJump] SeeHorseJump 0
scoreboard players set @a[tag=SeeHorseSpeed] SeeHorseSpeed 0
scoreboard players enable @a SeeHorseJump
scoreboard players enable @a SeeHorseSpeed
