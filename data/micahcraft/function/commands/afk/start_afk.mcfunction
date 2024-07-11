scoreboard players remove @s mk.ticks_active 5999
tag @s add mk.afk
advancement revoke @s only micahcraft:generated/score_triggers/afk/start_afk
tellraw @a [{"selector":"@s","color":"gray","italic":true,"extra":[" is now AFK"]}]