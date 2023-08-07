data remove storage blockstate:data read.east
execute if block ~ ~ ~ #blockstate:east[east=true] run data modify storage blockstate:data read.east set value 1b
execute if block ~ ~ ~ #blockstate:east[east=false] run data modify storage blockstate:data read.east set value 0b