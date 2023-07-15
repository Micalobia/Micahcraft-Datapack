data modify storage micahcraft:graves GraveItem set from entity @s data.Inventory[0]
data remove storage micahcraft:graves GraveItem.Slot
summon item ~ ~ ~ {Tags:["GraveItem"],Item:{id:"minecraft:knowledge_book",Count:1b},PickupDelay:1s}
data modify entity @e[tag=GraveItem,limit=1] Item set from storage micahcraft:graves GraveItem
tag @e[tag=GraveItem,limit=1] remove GraveItem
data remove entity @s data.Inventory[0]
execute if entity @s[nbt=!{data:{Inventory:[]}}] run function micahcraft:loops/open_grave
