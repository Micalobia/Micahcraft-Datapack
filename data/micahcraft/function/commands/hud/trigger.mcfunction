tag @s[tag=mk.show_hud] add mk.show_hud.old
tag @s[tag=mk.show_hud.old] remove mk.show_hud
tag @s[tag=!mk.show_hud.old] add mk.show_hud
tag @s remove mk.show_hud.old
execute if entity @s[tag=!mk.show_hud] run title @s actionbar ""