data remove storage blockstate:data read.eggs
execute if block ~ ~ ~ #blockstate:eggs[eggs=1] run data modify storage blockstate:data read.eggs set value 1
execute if block ~ ~ ~ #blockstate:eggs[eggs=2] run data modify storage blockstate:data read.eggs set value 2
execute if block ~ ~ ~ #blockstate:eggs[eggs=3] run data modify storage blockstate:data read.eggs set value 3
execute if block ~ ~ ~ #blockstate:eggs[eggs=4] run data modify storage blockstate:data read.eggs set value 4