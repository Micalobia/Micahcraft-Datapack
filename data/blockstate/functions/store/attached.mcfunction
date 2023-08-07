data remove storage blockstate:data read.attached
execute if block ~ ~ ~ #blockstate:attached[attached=true] run data modify storage blockstate:data read.attached set value 1b
execute if block ~ ~ ~ #blockstate:attached[attached=false] run data modify storage blockstate:data read.attached set value 0b