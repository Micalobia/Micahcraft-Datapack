execute if function micahcraft:enchantments/excavation/clear_made_path run return fail
execute unless predicate micahcraft:enchantments/excavation/holding run return fail
execute store result score #Crouch mk.math run function micahcraft:settings/data/get_value {path:"enchantments.excavation.crouch"}
execute if score #Crouch mk.math matches 1 unless entity @s[tag=mk.excavation.crouching] run return fail
execute if score #Crouch mk.math matches 2 if entity @s[tag=mk.excavation.crouching] run return fail
function micahcraft:enchantments/excavation/copy_position
function micahcraft:enchantments/excavation/summon with storage micahcraft:excavation