scoreboard objectives add Settings trigger {"text":"Settings","color":"#f0e2bd","clickEvent":{"action":"run_command","value":"/trigger Settings"}}
scoreboard objectives add mk.settings.id dummy

scoreboard players add #ID mk.settings.id 0
scoreboard players set #Key mk.settings.id 0
scoreboard players set #PageKey mk.settings.id 0

scoreboard players set #5 mk.math 5

# Mojang not letting me do a newline character in NBT, gotta do the jankiest stuff
summon item_display ~ ~ ~ {item:{id:"knowledge_book"},view_range:0,Tags:["Fresh"]}
item modify entity @n[type=item_display,tag=Fresh] container.0 micahcraft:newline
data modify storage micahcraft:misc newline set from entity @n[type=item_display,tag=Fresh] item.components."minecraft:custom_data".newline
kill @n[type=item_display,tag=Fresh]

function micahcraft:settings/setup
function micahcraft:settings/book