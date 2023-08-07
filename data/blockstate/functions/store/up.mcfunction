data remove storage blockstate:data read.up
execute if block ~ ~ ~ #blockstate:up[up=true] run data modify storage blockstate:data read.up set value 1b
execute if block ~ ~ ~ #blockstate:up[up=false] run data modify storage blockstate:data read.up set value 0b