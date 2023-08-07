data remove storage blockstate:data read.face
execute if block ~ ~ ~ #blockstate:face[face=ceiling] run data modify storage blockstate:data read.face set value "ceiling"
execute if block ~ ~ ~ #blockstate:face[face=floor] run data modify storage blockstate:data read.face set value "floor"
execute if block ~ ~ ~ #blockstate:face[face=wall] run data modify storage blockstate:data read.face set value "wall"