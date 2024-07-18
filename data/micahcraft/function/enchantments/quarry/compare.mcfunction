$data modify storage micahcraft:quarry HitFace set value "$(face)"
execute store success score #Test mk.quarry.face run data modify storage micahcraft:quarry HitFace set from storage retina:output HitFace
$execute if score #Test mk.quarry.face matches 0 run scoreboard players set @s mk.quarry.face $(value)