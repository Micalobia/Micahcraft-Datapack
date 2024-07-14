advancement revoke @a only micahcraft:events/open_grave
tag @s add CurrentPlayer
execute as @e[type=interaction,tag=mk.grave,distance=..7] at @s on attacker if entity @s[tag=CurrentPlayer] run tag @n[type=interaction,tag=mk.grave] add ActiveGrave
execute as @e[tag=mk.grave,distance=..7] if score @s mk.grave_id = @n[tag=ActiveGrave] mk.grave_id run tag @s add ActiveGrave
execute as @n[type=marker,tag=ActiveGrave,distance=..7] run function micahcraft:grave/summon_items
kill @e[tag=ActiveGrave,limit=4,distance=..7]
tag @s remove CurrentPlayer