data remove storage blockstate:data read.snowy
execute if block ~ ~ ~ #blockstate:snowy[snowy=true] run data modify storage blockstate:data read.snowy set value 1b
execute if block ~ ~ ~ #blockstate:snowy[snowy=false] run data modify storage blockstate:data read.snowy set value 0b