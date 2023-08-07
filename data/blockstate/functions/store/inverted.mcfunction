data remove storage blockstate:data read.inverted
execute if block ~ ~ ~ #blockstate:inverted[inverted=true] run data modify storage blockstate:data read.inverted set value 1b
execute if block ~ ~ ~ #blockstate:inverted[inverted=false] run data modify storage blockstate:data read.inverted set value 0b