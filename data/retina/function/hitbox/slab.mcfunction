execute if block ~ ~ ~ #retina:sculk_sensor run data modify storage retina:data Surfaces set value {Top:[[0,240,0,480,240,480]],Bottom:[[0,0,0,480,0,480]],West:[[0,0,0,0,240,480]],East:[[480,0,0,480,240,480]],North:[[0,0,0,480,240,0]],South:[[0,0,480,480,240,480]]}
execute if block ~ ~ ~ #minecraft:slabs[type=bottom] run data modify storage retina:data Surfaces set value {Top:[[0,240,0,480,240,480]],Bottom:[[0,0,0,480,0,480]],West:[[0,0,0,0,240,480]],East:[[480,0,0,480,240,480]],North:[[0,0,0,480,240,0]],South:[[0,0,480,480,240,480]]}
execute if block ~ ~ ~ #minecraft:slabs[type=top] run data modify storage retina:data Surfaces set value {Top:[[0,480,0,480,480,480]],Bottom:[[0,240,0,480,240,480]],West:[[0,240,0,0,480,480]],East:[[480,240,0,480,480,480]],North:[[0,240,0,480,480,0]],South:[[0,240,480,480,480,480]]}
execute if block ~ ~ ~ #minecraft:slabs[type=double] run data modify storage retina:data Surfaces set value {Top:[[0,480,0,480,480,480]],Bottom:[[0,0,0,480,0,480]],West:[[0,0,0,0,480,480]],East:[[480,0,0,480,480,480]],North:[[0,0,0,480,480,0]],South:[[0,0,480,480,480,480]]}