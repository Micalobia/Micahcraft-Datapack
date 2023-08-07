data remove storage blockstate:data read.part
execute if block ~ ~ ~ #blockstate:part[part=foot] run data modify storage blockstate:data read.part set value "foot"
execute if block ~ ~ ~ #blockstate:part[part=head] run data modify storage blockstate:data read.part set value "head"