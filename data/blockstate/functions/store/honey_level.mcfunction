data remove storage blockstate:data read.honey_level
execute if block ~ ~ ~ #blockstate:honey_level[honey_level=0] run data modify storage blockstate:data read.honey_level set value 0
execute if block ~ ~ ~ #blockstate:honey_level[honey_level=1] run data modify storage blockstate:data read.honey_level set value 1
execute if block ~ ~ ~ #blockstate:honey_level[honey_level=2] run data modify storage blockstate:data read.honey_level set value 2
execute if block ~ ~ ~ #blockstate:honey_level[honey_level=3] run data modify storage blockstate:data read.honey_level set value 3
execute if block ~ ~ ~ #blockstate:honey_level[honey_level=4] run data modify storage blockstate:data read.honey_level set value 4
execute if block ~ ~ ~ #blockstate:honey_level[honey_level=5] run data modify storage blockstate:data read.honey_level set value 5