execute if block ~ ~ ~ #retina:attached_stem[facing=east] run data modify storage retina:data Surfaces set value {Top:[[180,300,180,480,300,300]],Bottom:[[180,0,180,480,0,300]],West:[[180,0,180,180,300,300]],East:[[480,0,180,480,300,300]],North:[[180,0,180,480,300,180]],South:[[180,0,300,480,300,300]]}
execute if block ~ ~ ~ #retina:attached_stem[facing=west] run data modify storage retina:data Surfaces set value {Top:[[0,300,180,300,300,300]],Bottom:[[0,0,180,300,0,300]],West:[[0,0,180,0,300,300]],East:[[300,0,180,300,300,300]],North:[[0,0,180,300,300,180]],South:[[0,0,300,300,300,300]]}
execute if block ~ ~ ~ #retina:attached_stem[facing=north] run data modify storage retina:data Surfaces set value {Top:[[180,300,0,300,300,300]],Bottom:[[180,0,0,300,0,300]],West:[[180,0,0,180,300,300]],East:[[300,0,0,300,300,300]],North:[[180,0,0,300,300,0]],South:[[180,0,300,300,300,300]]}
execute if block ~ ~ ~ #retina:attached_stem[facing=south] run data modify storage retina:data Surfaces set value {Top:[[180,300,180,300,300,480]],Bottom:[[180,0,180,300,0,480]],West:[[180,0,180,180,300,480]],East:[[300,0,180,300,300,480]],North:[[180,0,180,300,300,180]],South:[[180,0,480,300,300,480]]}