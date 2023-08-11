advancement revoke @s only micahcraft:events/grave/create_grave
scoreboard players set @s GraveDeaths 0
execute store result score #KeepInventory Math run gamerule keepInventory
execute if score #KeepInventory Math matches 0 run return -1
execute unless predicate micahcraft:player/has_items_in_inventory run return -1
summon minecraft:item_display ~ ~1 ~ {Tags:["Grave","Fresh"],item:{Count:1b,id:"minecraft:totem_of_undying"},billboard:"center",transformation:[0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,1f]}
summon minecraft:interaction ~ ~0.7 ~ {Tags:["Grave","Fresh"],response:true,width:0.5f,height:0.60f}
summon marker ~ ~ ~ {Tags:["Grave","Fresh"]}
scoreboard players operation @e[tag=Fresh,limit=3,sort=nearest] GraveID = #ID GraveID
scoreboard players add #ID GraveID 1
data modify entity @e[type=marker,limit=1,tag=Fresh] data.Inventory set from entity @s Inventory
tag @e[tag=Fresh,limit=3,sort=nearest] remove Fresh
clear @s