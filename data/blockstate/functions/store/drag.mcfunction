data remove storage blockstate:data read.drag
execute if block ~ ~ ~ #blockstate:drag[drag=true] run data modify storage blockstate:data read.drag set value 1b
execute if block ~ ~ ~ #blockstate:drag[drag=false] run data modify storage blockstate:data read.drag set value 0b