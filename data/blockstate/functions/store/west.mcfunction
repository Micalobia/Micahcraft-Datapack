data remove storage blockstate:data read.west
execute if block ~ ~ ~ #blockstate:west[west=true] run data modify storage blockstate:data read.west set value 1b
execute if block ~ ~ ~ #blockstate:west[west=false] run data modify storage blockstate:data read.west set value 0b