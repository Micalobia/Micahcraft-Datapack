data remove storage blockstate:data read.south
execute if block ~ ~ ~ #blockstate:south[south=true] run data modify storage blockstate:data read.south set value 1b
execute if block ~ ~ ~ #blockstate:south[south=false] run data modify storage blockstate:data read.south set value 0b