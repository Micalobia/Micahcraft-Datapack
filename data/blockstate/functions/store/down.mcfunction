data remove storage blockstate:data read.down
execute if block ~ ~ ~ #blockstate:down[down=true] run data modify storage blockstate:data read.down set value 1b
execute if block ~ ~ ~ #blockstate:down[down=false] run data modify storage blockstate:data read.down set value 0b