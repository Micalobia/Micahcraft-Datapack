data remove storage blockstate:data read.enabled
execute if block ~ ~ ~ #blockstate:enabled[enabled=true] run data modify storage blockstate:data read.enabled set value 1b
execute if block ~ ~ ~ #blockstate:enabled[enabled=false] run data modify storage blockstate:data read.enabled set value 0b