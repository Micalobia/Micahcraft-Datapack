advancement revoke @s only micahcraft:events/grave/create_grave
scoreboard players set @s GraveDeaths 0
execute store result score #KeepInventory Math run gamerule keepInventory
execute if score #KeepInventory Math matches 0 run return -1
execute unless predicate micahcraft:player/has_items_in_inventory run return -1
summon minecraft:item_display ~ ~1 ~ {Tags:["Grave","Fresh"],item:{Count:1b,id:"minecraft:totem_of_undying"},billboard:"center",transformation:[0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,1f]}
summon minecraft:interaction ~ ~0.65 ~ {Tags:["Grave","Fresh"],response:true,width:0.6f,height:0.7f}
tag @s add Died
summon minecraft:text_display ~ ~1 ~ {Tags:["Grave","Fresh"],billboard:"center",see_through:true,text:'{"selector":"@p[tag=Died]","color":"gray","extra":[{"text":"\'s Grave"}]}',transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0f,0f,0f,0f,1f]}
tag @s remove Died
summon marker ~ ~ ~ {Tags:["Grave","Fresh"]}
scoreboard players operation @e[tag=Fresh,limit=4,sort=nearest] GraveID = #ID GraveID
scoreboard players add #ID GraveID 1
tag @s add Copying
execute as @e[type=marker,limit=1,tag=Fresh] run function micahcraft:events/grave/create_grave/copy_player_data
tag @s remove Copying
tag @e[tag=Fresh,limit=4,sort=nearest] remove Fresh
clear @s