data remove storage blockstate:data read.vertical_direction
execute if block ~ ~ ~ #blockstate:vertical_direction[vertical_direction=down] run data modify storage blockstate:data read.vertical_direction set value "down"
execute if block ~ ~ ~ #blockstate:vertical_direction[vertical_direction=up] run data modify storage blockstate:data read.vertical_direction set value "up"