data modify entity @s data.GraveItem set from entity @s data.Inventory[0]
data remove entity @s data.GraveItem.Slot
summon item ~ ~ ~ {Tags:["GraveItem"],Item:{id:"minecraft:knowledge_book",Count:1b},PickupDelay:0s}
data modify entity @e[tag=GraveItem,limit=1] Item set from entity @s data.GraveItem
data modify entity @e[tag=GraveItem,limit=1] Owner set from entity @p UUID
tag @e[tag=GraveItem,limit=1] remove GraveItem
data remove entity @s data.Inventory[0]
execute if entity @s[predicate=micahcraft:grave/has_items_in_inventory] run function micahcraft:events/grave/open_grave/summon_items