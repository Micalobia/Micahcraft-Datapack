data remove storage blockstate:data read.type
execute if block ~ ~ ~ #blockstate:type[type=bottom] run data modify storage blockstate:data read.type set value "bottom"
execute if block ~ ~ ~ #blockstate:type[type=double] run data modify storage blockstate:data read.type set value "double"
execute if block ~ ~ ~ #blockstate:type[type=top] run data modify storage blockstate:data read.type set value "top"
execute if block ~ ~ ~ #blockstate:type[type=left] run data modify storage blockstate:data read.type set value "left"
execute if block ~ ~ ~ #blockstate:type[type=right] run data modify storage blockstate:data read.type set value "right"
execute if block ~ ~ ~ #blockstate:type[type=single] run data modify storage blockstate:data read.type set value "single"
execute if block ~ ~ ~ #blockstate:type[type=normal] run data modify storage blockstate:data read.type set value "normal"
execute if block ~ ~ ~ #blockstate:type[type=sticky] run data modify storage blockstate:data read.type set value "sticky"