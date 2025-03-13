function retina:traverse/setup
execute store result score @s mk.excavation.x run data get storage retina:output TargetedBlock[0]
execute store result score @s mk.excavation.y run data get storage retina:output TargetedBlock[1]
execute store result score @s mk.excavation.z run data get storage retina:output TargetedBlock[2]
function micahcraft:enchantments/excavation/copy_position
tag @s remove mk.excavation.valid
execute store success score #Success mk.math run function micahcraft:enchantments/excavation/check_mined_block with storage micahcraft:excavation
execute if score #Success mk.math matches 1 run tag @s add mk.excavation.valid
scoreboard players set @s mk.excavation.face 0
function micahcraft:enchantments/excavation/compare {face:"Top",value:1}
function micahcraft:enchantments/excavation/compare {face:"Bottom",value:1}
function micahcraft:enchantments/excavation/compare {face:"North",value:2}
function micahcraft:enchantments/excavation/compare {face:"South",value:2}
function micahcraft:enchantments/excavation/compare {face:"East",value:3}
function micahcraft:enchantments/excavation/compare {face:"West",value:3}
tag @s remove mk.excavation.crouching
tag @s[scores={mk.excavation.crouching=1..}] add mk.excavation.crouching
scoreboard players set @s mk.excavation.crouching 0