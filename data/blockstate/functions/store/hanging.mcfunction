data remove storage blockstate:data read.hanging
execute if block ~ ~ ~ #blockstate:hanging[hanging=true] run data modify storage blockstate:data read.hanging set value 1b
execute if block ~ ~ ~ #blockstate:hanging[hanging=false] run data modify storage blockstate:data read.hanging set value 0b