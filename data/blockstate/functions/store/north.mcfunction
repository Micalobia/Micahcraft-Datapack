data remove storage blockstate:data read.north
execute if block ~ ~ ~ #blockstate:north[north=true] run data modify storage blockstate:data read.north set value 1b
execute if block ~ ~ ~ #blockstate:north[north=false] run data modify storage blockstate:data read.north set value 0b