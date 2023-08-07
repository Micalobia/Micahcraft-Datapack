data remove storage blockstate:data read.leaves
execute if block ~ ~ ~ #blockstate:leaves[leaves=large] run data modify storage blockstate:data read.leaves set value "large"
execute if block ~ ~ ~ #blockstate:leaves[leaves=none] run data modify storage blockstate:data read.leaves set value "none"
execute if block ~ ~ ~ #blockstate:leaves[leaves=small] run data modify storage blockstate:data read.leaves set value "small"