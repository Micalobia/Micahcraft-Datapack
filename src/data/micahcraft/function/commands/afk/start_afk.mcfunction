# @score_trigger
# scoreboard mk.ticks_afk
# value 6000
scoreboard players remove @s mk.ticks_active 5999
execute if entity @s[team=!mk.deaths,team=!mk.xp,team=!mk.playtime] run scoreboard players set @s mk.afk.last_team 0
execute if entity @s[team=mk.deaths] run scoreboard players set @s mk.afk.last_team 1
execute if entity @s[team=mk.xp] run scoreboard players set @s mk.afk.last_team 2
execute if entity @s[team=mk.playtime] run scoreboard players set @s mk.afk.last_team 3
tag @s add mk.afk
tellraw @a [{"selector":"@s","color":"gray","italic":true,"extra":[" is now AFK"]}]