data remove storage blockstate:data read.bites
execute if block ~ ~ ~ #blockstate:bites[bites=0] run data modify storage blockstate:data read.bites set value 0
execute if block ~ ~ ~ #blockstate:bites[bites=1] run data modify storage blockstate:data read.bites set value 1
execute if block ~ ~ ~ #blockstate:bites[bites=2] run data modify storage blockstate:data read.bites set value 2
execute if block ~ ~ ~ #blockstate:bites[bites=3] run data modify storage blockstate:data read.bites set value 3
execute if block ~ ~ ~ #blockstate:bites[bites=4] run data modify storage blockstate:data read.bites set value 4
execute if block ~ ~ ~ #blockstate:bites[bites=5] run data modify storage blockstate:data read.bites set value 5
execute if block ~ ~ ~ #blockstate:bites[bites=6] run data modify storage blockstate:data read.bites set value 6