data remove storage blockstate:data read.hatch
execute if block ~ ~ ~ #blockstate:hatch[hatch=0] run data modify storage blockstate:data read.hatch set value 0
execute if block ~ ~ ~ #blockstate:hatch[hatch=1] run data modify storage blockstate:data read.hatch set value 1
execute if block ~ ~ ~ #blockstate:hatch[hatch=2] run data modify storage blockstate:data read.hatch set value 2