tag @s remove mk.show_hud
execute store result score #Test mk.math run function settings:data/get_value {key:"mk_hud_enabled"}
execute if score #Test mk.math matches 1 run tag @s add mk.show_hud
execute if score #Test mk.math matches 0 run title @s actionbar ""