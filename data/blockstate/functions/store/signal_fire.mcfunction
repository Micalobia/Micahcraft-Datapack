data remove storage blockstate:data read.signal_fire
execute if block ~ ~ ~ #blockstate:signal_fire[signal_fire=true] run data modify storage blockstate:data read.signal_fire set value 1b
execute if block ~ ~ ~ #blockstate:signal_fire[signal_fire=false] run data modify storage blockstate:data read.signal_fire set value 0b