data remove storage blockstate:data read.open
execute if block ~ ~ ~ #blockstate:open[open=true] run data modify storage blockstate:data read.open set value 1b
execute if block ~ ~ ~ #blockstate:open[open=false] run data modify storage blockstate:data read.open set value 0b