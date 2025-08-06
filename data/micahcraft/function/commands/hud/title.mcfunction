data modify storage micahcraft:hud display set value []
execute store result score #Coords mk.math run function settings:data/get_value {key:"mk_hud_coordinates"}
execute store result score #Saturation mk.math run function settings:data/get_value {key:"mk_hud_saturation"}
execute store result score #Phantom mk.math run function settings:data/get_value {key:"mk_hud_phantoms"}
execute store result score #Warden mk.math run function settings:data/get_value {key:"mk_hud_warden"}
execute store result score #Moon mk.math run function settings:data/get_value {key:"mk_hud_moon"}
execute store result score #Clock mk.math run function settings:data/get_value {key:"mk_hud_clock"}
scoreboard players set #Element mk.math 0
execute if score #Coords mk.math matches 1 run function micahcraft:commands/hud/title/coords with storage micahcraft:hud colors
execute if score #Saturation mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Saturation mk.math matches 1 run function micahcraft:commands/hud/title/saturation with storage micahcraft:hud colors
execute if score #Phantom mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Phantom mk.math matches 1 run function micahcraft:commands/hud/title/phantom with storage micahcraft:hud colors
execute if score #Warden mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Warden mk.math matches 1 run function micahcraft:commands/hud/title/warden with storage micahcraft:hud colors
execute if score #Moon mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Moon mk.math matches 1 run function micahcraft:commands/hud/title/moon with storage micahcraft:hud colors
execute if score #Clock mk.math matches 1 if score #Element mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":" "}
execute if score #Clock mk.math matches 1 run function micahcraft:commands/hud/title/clock with storage micahcraft:hud colors
title @s actionbar {"storage":"micahcraft:hud","nbt":"display","interpret":true}