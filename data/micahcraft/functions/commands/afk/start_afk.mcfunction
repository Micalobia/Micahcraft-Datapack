scoreboard players remove @s TicksActive 5999
tag @s add AFK
advancement revoke @s only micahcraft:commands/afk/start_afk
tellraw @a [{"selector":"@s","color":"gray","italic":true,"extra":[" is now AFK"]}]