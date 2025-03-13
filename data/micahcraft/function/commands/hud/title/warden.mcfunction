execute store result score #Warden mk.math run data get entity @s warden_spawn_tracker.warning_level
$execute if score #Warden mk.math matches 0 run data modify storage micahcraft:hud display append value {"text":"Warden: 0","color":"$(green)"}
$execute if score #Warden mk.math matches 1 run data modify storage micahcraft:hud display append value {"text":"Warden: 1","color":"$(yellow)"}
$execute if score #Warden mk.math matches 2 run data modify storage micahcraft:hud display append value {"text":"Warden: 2","color":"$(yellow)"}
$execute if score #Warden mk.math matches 3 run data modify storage micahcraft:hud display append value {"text":"Warden: 3","color":"$(red)"}
$execute if score #Warden mk.math matches 4 run data modify storage micahcraft:hud display append value {"text":"Warden: 4","color":"$(red)"}
scoreboard players set #Element mk.math 1