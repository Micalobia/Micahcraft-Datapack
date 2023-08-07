data remove storage blockstate:data read.bottom
execute if block ~ ~ ~ #blockstate:bottom[bottom=true] run data modify storage blockstate:data read.bottom set value 1b
execute if block ~ ~ ~ #blockstate:bottom[bottom=false] run data modify storage blockstate:data read.bottom set value 0b