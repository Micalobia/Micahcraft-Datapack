data remove storage blockstate:data read.stage
execute if block ~ ~ ~ #blockstate:stage[stage=0] run data modify storage blockstate:data read.stage set value 0
execute if block ~ ~ ~ #blockstate:stage[stage=1] run data modify storage blockstate:data read.stage set value 1