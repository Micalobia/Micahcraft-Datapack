execute if entity @s[type=player] run return fail
scoreboard players reset @s
execute at @s run tp @s ~ -1000 ~
return run kill @s