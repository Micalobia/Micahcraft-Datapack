summon item ~ ~ ~ {Tags:["GraveItem"],Item:{id:"minecraft:knowledge_book",count:1b},PickupDelay:0s}
data modify entity @n[tag=GraveItem,type=item] Item set from storage micahcraft:util loop.value
data modify entity @n[tag=GraveItem,type=item] Owner set from entity @p[tag=CurrentPlayer] UUID
tag @n[tag=GraveItem,type=item] remove GraveItem