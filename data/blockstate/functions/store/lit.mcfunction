data remove storage blockstate:data read.lit
execute if block ~ ~ ~ #blockstate:lit[lit=true] run data modify storage blockstate:data read.lit set value 1b
execute if block ~ ~ ~ #blockstate:lit[lit=false] run data modify storage blockstate:data read.lit set value 0b