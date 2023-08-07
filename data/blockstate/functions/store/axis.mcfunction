data remove storage blockstate:data read.axis
execute if block ~ ~ ~ #blockstate:axis[axis=x] run data modify storage blockstate:data read.axis set value "x"
execute if block ~ ~ ~ #blockstate:axis[axis=y] run data modify storage blockstate:data read.axis set value "y"
execute if block ~ ~ ~ #blockstate:axis[axis=z] run data modify storage blockstate:data read.axis set value "z"