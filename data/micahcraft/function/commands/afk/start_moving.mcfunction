team leave @s[team=mk.afk]
tellraw @a [{"selector":"@s","color":"gray","italic":true,"extra":[" is no longer AFK"]}]
tag @s remove mk.afk
advancement revoke @s only micahcraft:generated/score_triggers/afk/start_moving