data remove storage blockstate:data read.attachment
execute if block ~ ~ ~ #blockstate:attachment[attachment=ceiling] run data modify storage blockstate:data read.attachment set value "ceiling"
execute if block ~ ~ ~ #blockstate:attachment[attachment=double_wall] run data modify storage blockstate:data read.attachment set value "double_wall"
execute if block ~ ~ ~ #blockstate:attachment[attachment=floor] run data modify storage blockstate:data read.attachment set value "floor"
execute if block ~ ~ ~ #blockstate:attachment[attachment=single_wall] run data modify storage blockstate:data read.attachment set value "single_wall"