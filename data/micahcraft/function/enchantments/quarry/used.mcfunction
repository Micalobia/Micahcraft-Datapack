execute unless predicate micahcraft:enchantments/quarry/holding run return fail
execute unless entity @s[tag=mk.quarry.valid] run return fail
execute store result score #Crouch mk.math run function settings:data/get_value {key:"mk_enchantments_quarry_crouch"}
execute if score #Crouch mk.math matches 1 unless entity @s[tag=mk.quarry.crouching] run return fail
execute if score #Crouch mk.math matches 2 if entity @s[tag=mk.quarry.crouching] run return fail
function micahcraft:enchantments/quarry/copy_position
function micahcraft:enchantments/quarry/summon with storage micahcraft:quarry