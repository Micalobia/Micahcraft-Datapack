data remove storage blockstate:data read.disarmed
execute if block ~ ~ ~ #blockstate:disarmed[disarmed=true] run data modify storage blockstate:data read.disarmed set value 1b
execute if block ~ ~ ~ #blockstate:disarmed[disarmed=false] run data modify storage blockstate:data read.disarmed set value 0b