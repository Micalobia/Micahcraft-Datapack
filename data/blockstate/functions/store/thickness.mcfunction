data remove storage blockstate:data read.thickness
execute if block ~ ~ ~ #blockstate:thickness[thickness=base] run data modify storage blockstate:data read.thickness set value "base"
execute if block ~ ~ ~ #blockstate:thickness[thickness=frustum] run data modify storage blockstate:data read.thickness set value "frustum"
execute if block ~ ~ ~ #blockstate:thickness[thickness=middle] run data modify storage blockstate:data read.thickness set value "middle"
execute if block ~ ~ ~ #blockstate:thickness[thickness=tip] run data modify storage blockstate:data read.thickness set value "tip"
execute if block ~ ~ ~ #blockstate:thickness[thickness=tip_merge] run data modify storage blockstate:data read.thickness set value "tip_merge"