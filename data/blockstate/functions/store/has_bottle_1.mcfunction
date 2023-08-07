data remove storage blockstate:data read.has_bottle_1
execute if block ~ ~ ~ #blockstate:has_bottle_1[has_bottle_1=true] run data modify storage blockstate:data read.has_bottle_1 set value 1b
execute if block ~ ~ ~ #blockstate:has_bottle_1[has_bottle_1=false] run data modify storage blockstate:data read.has_bottle_1 set value 0b