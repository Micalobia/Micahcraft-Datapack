# @score_trigger
# scoreboard AFK
scoreboard players set @s AFK 0
execute if entity @s[tag=mk.afk] run return fail
execute if entity @s[predicate=micahcraft:player/is_moving] run return fail
scoreboard players operation @s mk.ticks_active -= @s mk.ticks_afk
scoreboard players add @s mk.ticks_active 6000
scoreboard players set @s mk.ticks_afk 5999