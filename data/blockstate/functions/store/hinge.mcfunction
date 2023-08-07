data remove storage blockstate:data read.hinge
execute if block ~ ~ ~ #blockstate:hinge[hinge=left] run data modify storage blockstate:data read.hinge set value "left"
execute if block ~ ~ ~ #blockstate:hinge[hinge=right] run data modify storage blockstate:data read.hinge set value "right"