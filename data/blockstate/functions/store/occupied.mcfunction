data remove storage blockstate:data read.occupied
execute if block ~ ~ ~ #blockstate:occupied[occupied=true] run data modify storage blockstate:data read.occupied set value 1b
execute if block ~ ~ ~ #blockstate:occupied[occupied=false] run data modify storage blockstate:data read.occupied set value 0b