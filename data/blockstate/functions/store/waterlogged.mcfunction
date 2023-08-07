data remove storage blockstate:data read.waterlogged
execute if block ~ ~ ~ #blockstate:waterlogged[waterlogged=true] run data modify storage blockstate:data read.waterlogged set value 1b
execute if block ~ ~ ~ #blockstate:waterlogged[waterlogged=false] run data modify storage blockstate:data read.waterlogged set value 0b