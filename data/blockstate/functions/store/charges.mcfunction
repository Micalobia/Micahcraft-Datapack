data remove storage blockstate:data read.charges
execute if block ~ ~ ~ #blockstate:charges[charges=0] run data modify storage blockstate:data read.charges set value 0
execute if block ~ ~ ~ #blockstate:charges[charges=1] run data modify storage blockstate:data read.charges set value 1
execute if block ~ ~ ~ #blockstate:charges[charges=2] run data modify storage blockstate:data read.charges set value 2
execute if block ~ ~ ~ #blockstate:charges[charges=3] run data modify storage blockstate:data read.charges set value 3
execute if block ~ ~ ~ #blockstate:charges[charges=4] run data modify storage blockstate:data read.charges set value 4