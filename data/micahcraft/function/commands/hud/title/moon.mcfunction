execute store result score #Day mk.math run time query day
scoreboard players operation #Day mk.math %= #8 mk.math
$execute if score #Day mk.math matches 0 run data modify storage micahcraft:hud display append value {"text":"Full Moon","color":"$(cyan)"}
$execute if score #Day mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":"Waning gibbous","color":"$(cyan)"}
$execute if score #Day mk.math matches 2 run data modify storage micahcraft:hud display append value {"text":"Third quarter","color":"$(cyan)"}
$execute if score #Day mk.math matches 3 run data modify storage micahcraft:hud display append value {"text":"Waning crescent","color":"$(cyan)"}
$execute if score #Day mk.math matches 4 run data modify storage micahcraft:hud display append value {"text":"New moon","color":"$(cyan)"}
$execute if score #Day mk.math matches 5 run data modify storage micahcraft:hud display append value {"text":"Waxing crescent","color":"$(cyan)"}
$execute if score #Day mk.math matches 6 run data modify storage micahcraft:hud display append value {"text":"First quarter","color":"$(cyan)"}
$execute if score #Day mk.math matches 7 run data modify storage micahcraft:hud display append value {"text":"Waxing gibbous","color":"$(cyan)"}
scoreboard players set #Element mk.math 1