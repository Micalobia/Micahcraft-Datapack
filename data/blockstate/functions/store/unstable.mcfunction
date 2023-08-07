data remove storage blockstate:data read.unstable
execute if block ~ ~ ~ #blockstate:unstable[unstable=true] run data modify storage blockstate:data read.unstable set value 1b
execute if block ~ ~ ~ #blockstate:unstable[unstable=false] run data modify storage blockstate:data read.unstable set value 0b