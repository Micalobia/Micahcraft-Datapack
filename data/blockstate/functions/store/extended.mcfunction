data remove storage blockstate:data read.extended
execute if block ~ ~ ~ #blockstate:extended[extended=true] run data modify storage blockstate:data read.extended set value 1b
execute if block ~ ~ ~ #blockstate:extended[extended=false] run data modify storage blockstate:data read.extended set value 0b