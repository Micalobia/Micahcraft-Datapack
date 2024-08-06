function retina:traverse/setup
execute store result score @s mk.veinmining.x run data get storage retina:output TargetedBlock[0]
execute store result score @s mk.veinmining.y run data get storage retina:output TargetedBlock[1]
execute store result score @s mk.veinmining.z run data get storage retina:output TargetedBlock[2]
data modify storage micahcraft:veinmining macro.x set from storage retina:output TargetedBlock[0]
data modify storage micahcraft:veinmining macro.y set from storage retina:output TargetedBlock[1]
data modify storage micahcraft:veinmining macro.z set from storage retina:output TargetedBlock[2]
execute store result score @s mk.veinmining.group run \
    function micahcraft:enchantments/veinmining/data/macro_group with storage micahcraft:veinmining macro