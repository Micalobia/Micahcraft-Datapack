$data modify storage micahcraft:excavation HitFace set value "$(face)"
execute store success score #Test mk.excavation.face run data modify storage micahcraft:excavation HitFace set from storage retina:output HitFace
$execute if score #Test mk.excavation.face matches 0 run scoreboard players set @s mk.excavation.face $(value)