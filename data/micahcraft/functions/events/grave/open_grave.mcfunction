advancement revoke @s only micahcraft:events/grave/open_grave
tag @s add CurrentPlayer
execute as @e[type=interaction,tag=Grave,distance=..7] at @s on attacker if entity @s[tag=CurrentPlayer] run tag @e[type=interaction,tag=Grave,limit=1,sort=nearest] add ActiveGrave
execute as @e[tag=Grave] if score @s GraveID = @e[tag=ActiveGrave,limit=1] GraveID run tag @s add ActiveGrave
execute as @e[type=marker,tag=ActiveGrave,limit=1] run function micahcraft:events/grave/open_grave/summon_items
kill @e[tag=ActiveGrave,limit=3]