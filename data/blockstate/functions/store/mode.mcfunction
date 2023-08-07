data remove storage blockstate:data read.mode
execute if block ~ ~ ~ #blockstate:mode[mode=compare] run data modify storage blockstate:data read.mode set value "compare"
execute if block ~ ~ ~ #blockstate:mode[mode=subtract] run data modify storage blockstate:data read.mode set value "subtract"
execute if block ~ ~ ~ #blockstate:mode[mode=corner] run data modify storage blockstate:data read.mode set value "corner"
execute if block ~ ~ ~ #blockstate:mode[mode=data] run data modify storage blockstate:data read.mode set value "data"
execute if block ~ ~ ~ #blockstate:mode[mode=load] run data modify storage blockstate:data read.mode set value "load"
execute if block ~ ~ ~ #blockstate:mode[mode=save] run data modify storage blockstate:data read.mode set value "save"