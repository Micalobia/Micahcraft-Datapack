data remove storage blockstate:data read.delay
execute if block ~ ~ ~ #blockstate:delay[delay=1] run data modify storage blockstate:data read.delay set value 1
execute if block ~ ~ ~ #blockstate:delay[delay=2] run data modify storage blockstate:data read.delay set value 2
execute if block ~ ~ ~ #blockstate:delay[delay=3] run data modify storage blockstate:data read.delay set value 3
execute if block ~ ~ ~ #blockstate:delay[delay=4] run data modify storage blockstate:data read.delay set value 4