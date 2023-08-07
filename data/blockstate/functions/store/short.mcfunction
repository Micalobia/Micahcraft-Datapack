data remove storage blockstate:data read.short
execute if block ~ ~ ~ #blockstate:short[short=true] run data modify storage blockstate:data read.short set value 1b
execute if block ~ ~ ~ #blockstate:short[short=false] run data modify storage blockstate:data read.short set value 0b