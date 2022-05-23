scoreboard players set @a[scores={SeeHUD=3..}] SeeHUD 0
tag @a[tag=HUD] remove HUD
tag @a[tag=DarkHUD] remove DarkHUD
tag @a[tag=LightHUD] remove LightHUD
tag @a[scores={SeeHUD=1..2}] add HUD
tag @a[scores={SeeHUD=1}] add DarkHUD
tag @a[scores={SeeHUD=2}] add LightHUD
execute as @a[tag=HUD] at @s run function micahcraft:math/hud
scoreboard players enable @a SeeHUD