data modify entity @s data.GraveItem set from entity @s data.Inventory[0]
data remove entity @s data.GraveItem.Slot
summon item ~ ~ ~ {Tags:["GraveItem"],Item:{id:"minecraft:knowledge_book",count:1b},PickupDelay:0s}
data modify entity @n[tag=GraveItem,type=item] Item set from entity @s data.GraveItem
data modify entity @n[tag=GraveItem,type=item] Owner set from entity @p[tag=CurrentPlayer] UUID
tag @n[tag=GraveItem,type=item] remove GraveItem
data remove entity @s data.Inventory[0]
execute if entity @s[predicate=micahcraft:grave/has_items] run function micahcraft:grave/summon_items