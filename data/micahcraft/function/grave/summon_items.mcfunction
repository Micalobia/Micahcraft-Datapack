data modify entity @s data.GraveItem set from entity @s data.Inventory[0]
function micahcraft:grave/summon_item
data remove entity @s data.Inventory[0]
execute if entity @s[predicate=micahcraft:grave/has_items] run function micahcraft:grave/summon_items