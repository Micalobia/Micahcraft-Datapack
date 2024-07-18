function retina:traverse/setup
execute store result score @s mk.quarry.x run data get storage retina:output TargetedBlock[0]
execute store result score @s mk.quarry.y run data get storage retina:output TargetedBlock[1]
execute store result score @s mk.quarry.z run data get storage retina:output TargetedBlock[2]
scoreboard players set @s mk.quarry.face 0
function micahcraft:enchantments/quarry/compare {face:"Top",value:1}
function micahcraft:enchantments/quarry/compare {face:"Bottom",value:1}
function micahcraft:enchantments/quarry/compare {face:"North",value:2}
function micahcraft:enchantments/quarry/compare {face:"South",value:2}
function micahcraft:enchantments/quarry/compare {face:"East",value:3}
function micahcraft:enchantments/quarry/compare {face:"West",value:3}
