data remove storage blockstate:data read.has_bottle_0
execute if block ~ ~ ~ #blockstate:has_bottle_0[has_bottle_0=true] run data modify storage blockstate:data read.has_bottle_0 set value 1b
execute if block ~ ~ ~ #blockstate:has_bottle_0[has_bottle_0=false] run data modify storage blockstate:data read.has_bottle_0 set value 0b