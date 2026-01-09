summon item ~ ~ ~ {Tags:["Fresh"],Item:{"id":"knowledge_book"},PickupDelay:60}
item replace entity @n[type=item,tag=Fresh] container.0 from entity @s weapon.mainhand
item replace entity @s weapon.mainhand with air
data modify entity @n[type=item,tag=Fresh] Thrower set from entity @s UUID
tag @n[type=item,tag=Fresh] remove Fresh