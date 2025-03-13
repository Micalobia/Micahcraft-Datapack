team leave @s[team=mk.afk]
execute if score @s mk.afk.last_team matches 1 run team join mk.deaths
execute if score @s mk.afk.last_team matches 2 run team join mk.xp
execute if score @s mk.afk.last_team matches 3 run team join mk.playtime
tellraw @a [{"selector":"@s","color":"gray","italic":true,"extra":[" is no longer AFK"]}]
tag @s remove mk.afk
advancement revoke @s only micahcraft:generated/score_triggers/afk/start_moving