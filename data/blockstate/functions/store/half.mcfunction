data remove storage blockstate:data read.half
execute if block ~ ~ ~ #blockstate:half[half=bottom] run data modify storage blockstate:data read.half set value "bottom"
execute if block ~ ~ ~ #blockstate:half[half=top] run data modify storage blockstate:data read.half set value "top"
execute if block ~ ~ ~ #blockstate:half[half=lower] run data modify storage blockstate:data read.half set value "lower"
execute if block ~ ~ ~ #blockstate:half[half=upper] run data modify storage blockstate:data read.half set value "upper"