data remove storage blockstate:data read.berries
execute if block ~ ~ ~ #blockstate:berries[berries=true] run data modify storage blockstate:data read.berries set value 1b
execute if block ~ ~ ~ #blockstate:berries[berries=false] run data modify storage blockstate:data read.berries set value 0b