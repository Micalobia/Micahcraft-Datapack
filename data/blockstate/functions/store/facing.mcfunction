data remove storage blockstate:data read.facing
execute if block ~ ~ ~ #blockstate:facing[facing=down] run data modify storage blockstate:data read.facing set value "down"
execute if block ~ ~ ~ #blockstate:facing[facing=east] run data modify storage blockstate:data read.facing set value "east"
execute if block ~ ~ ~ #blockstate:facing[facing=north] run data modify storage blockstate:data read.facing set value "north"
execute if block ~ ~ ~ #blockstate:facing[facing=south] run data modify storage blockstate:data read.facing set value "south"
execute if block ~ ~ ~ #blockstate:facing[facing=up] run data modify storage blockstate:data read.facing set value "up"
execute if block ~ ~ ~ #blockstate:facing[facing=west] run data modify storage blockstate:data read.facing set value "west"