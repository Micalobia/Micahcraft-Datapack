data remove storage blockstate:data read.pickles
execute if block ~ ~ ~ #blockstate:pickles[pickles=1] run data modify storage blockstate:data read.pickles set value 1
execute if block ~ ~ ~ #blockstate:pickles[pickles=2] run data modify storage blockstate:data read.pickles set value 2
execute if block ~ ~ ~ #blockstate:pickles[pickles=3] run data modify storage blockstate:data read.pickles set value 3
execute if block ~ ~ ~ #blockstate:pickles[pickles=4] run data modify storage blockstate:data read.pickles set value 4