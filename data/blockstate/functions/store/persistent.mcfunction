data remove storage blockstate:data read.persistent
execute if block ~ ~ ~ #blockstate:persistent[persistent=true] run data modify storage blockstate:data read.persistent set value 1b
execute if block ~ ~ ~ #blockstate:persistent[persistent=false] run data modify storage blockstate:data read.persistent set value 0b