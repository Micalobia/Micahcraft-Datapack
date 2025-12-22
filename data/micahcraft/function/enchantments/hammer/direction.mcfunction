tag @s remove mk.hammer.axis.x
tag @s remove mk.hammer.axis.y
tag @s remove mk.hammer.axis.z
execute if entity @s[x_rotation=-90..-60] run tag @s add mk.hammer.axis.y
execute if entity @s[x_rotation=60..90] run tag @s add mk.hammer.axis.y
execute if entity @s[tag=!mk.hammer.axis.y,y_rotation=-135..-45] run tag @s add mk.hammer.axis.x
execute if entity @s[tag=!mk.hammer.axis.y,y_rotation=45..135] run tag @s add mk.hammer.axis.x
execute if entity @s[tag=!mk.hammer.axis.x,tag=!mk.hammer.axis.y] run tag @s add mk.hammer.axis.z