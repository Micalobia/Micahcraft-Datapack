data remove storage blockstate:data read.locked
execute if block ~ ~ ~ #blockstate:locked[locked=true] run data modify storage blockstate:data read.locked set value 1b
execute if block ~ ~ ~ #blockstate:locked[locked=false] run data modify storage blockstate:data read.locked set value 0b