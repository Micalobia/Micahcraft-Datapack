data remove storage blockstate:data read.in_wall
execute if block ~ ~ ~ #blockstate:in_wall[in_wall=true] run data modify storage blockstate:data read.in_wall set value 1b
execute if block ~ ~ ~ #blockstate:in_wall[in_wall=false] run data modify storage blockstate:data read.in_wall set value 0b