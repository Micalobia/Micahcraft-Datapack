data modify storage micahcraft:graves Inventory set from entity @s Inventory
summon minecraft:item_display ~ ~1 ~ {Tags:["Grave","Fresh"],item:{Count:1b,id:"minecraft:totem_of_undying"},billboard:"center",transformation:[0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,1f]}
summon minecraft:interaction ~ ~0.7 ~ {Tags:["Grave","Fresh"],response:true,width:0.5,height:0.60}
summon marker ~ ~ ~ {Tags:["Grave","Fresh"]}
scoreboard players operation @e[tag=Fresh,limit=3,sort=nearest] GraveID = #ID GraveID
scoreboard players add #ID GraveID 1
data modify entity @e[type=marker,limit=1,tag=Fresh] data.Inventory set from entity @s Inventory
tag @e[tag=Fresh,limit=3,sort=nearest] remove Fresh
clear @s
