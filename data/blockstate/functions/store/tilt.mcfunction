data remove storage blockstate:data read.tilt
execute if block ~ ~ ~ #blockstate:tilt[tilt=full] run data modify storage blockstate:data read.tilt set value "full"
execute if block ~ ~ ~ #blockstate:tilt[tilt=none] run data modify storage blockstate:data read.tilt set value "none"
execute if block ~ ~ ~ #blockstate:tilt[tilt=partial] run data modify storage blockstate:data read.tilt set value "partial"
execute if block ~ ~ ~ #blockstate:tilt[tilt=unstable] run data modify storage blockstate:data read.tilt set value "unstable"