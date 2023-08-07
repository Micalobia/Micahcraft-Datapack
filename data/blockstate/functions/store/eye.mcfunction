data remove storage blockstate:data read.eye
execute if block ~ ~ ~ #blockstate:eye[eye=true] run data modify storage blockstate:data read.eye set value 1b
execute if block ~ ~ ~ #blockstate:eye[eye=false] run data modify storage blockstate:data read.eye set value 0b