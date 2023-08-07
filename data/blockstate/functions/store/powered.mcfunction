data remove storage blockstate:data read.powered
execute if block ~ ~ ~ #blockstate:powered[powered=true] run data modify storage blockstate:data read.powered set value 1b
execute if block ~ ~ ~ #blockstate:powered[powered=false] run data modify storage blockstate:data read.powered set value 0b