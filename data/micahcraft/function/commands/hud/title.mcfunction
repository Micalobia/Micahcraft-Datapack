data modify storage micahcraft:hud display set value []
execute store result score #Coords mk.math run function micahcraft:settings/data/get_value {path:"hud.coords"}
execute store result score #Saturation mk.math run function micahcraft:settings/data/get_value {path:"hud.saturation"}
execute store result score #Phantom mk.math run function micahcraft:settings/data/get_value {path:"hud.phantom"}
execute store result score #Moon mk.math run function micahcraft:settings/data/get_value {path:"hud.moon"}
scoreboard players set #Element mk.math 0
execute if score #Coords mk.math matches 1 run function micahcraft:commands/hud/title/coords with storage micahcraft:hud colors
execute if score #Saturation mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Saturation mk.math matches 1 run function micahcraft:commands/hud/title/saturation with storage micahcraft:hud colors
execute if score #Phantom mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Phantom mk.math matches 1 run function micahcraft:commands/hud/title/phantom with storage micahcraft:hud colors
execute if score #Moon mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Moon mk.math matches 1 run function micahcraft:commands/hud/title/moon with storage micahcraft:hud colors
title @s actionbar {"storage":"micahcraft:hud","nbt":"display","interpret":true}