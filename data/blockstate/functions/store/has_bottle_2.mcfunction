data remove storage blockstate:data read.has_bottle_2
execute if block ~ ~ ~ #blockstate:has_bottle_2[has_bottle_2=true] run data modify storage blockstate:data read.has_bottle_2 set value 1b
execute if block ~ ~ ~ #blockstate:has_bottle_2[has_bottle_2=false] run data modify storage blockstate:data read.has_bottle_2 set value 0b