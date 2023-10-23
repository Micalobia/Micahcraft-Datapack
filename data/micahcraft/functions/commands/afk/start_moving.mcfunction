team leave @s[team=AFK]
tellraw @a [{"selector":"@s","color":"gray","italic":true,"extra":[" is no longer AFK"]}]
tag @s remove AFK
advancement revoke @s only micahcraft:commands/afk/start_moving