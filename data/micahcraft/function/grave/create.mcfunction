advancement revoke @s only micahcraft:generated/score_triggers/create_grave
scoreboard players set @s mk.grave_deaths 0
execute store result score #KeepInventory mk.math run gamerule keepInventory
execute if score #KeepInventory mk.math matches 0 run return fail
execute unless predicate micahcraft:player/has_items run return fail
summon minecraft:item_display ~ ~1 ~ {Tags:["mk.grave","Fresh"],billboard:"center",transformation:[0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,1f]}
summon minecraft:interaction ~ ~0.65 ~ {Tags:["mk.grave","Fresh"],response:true,width:0.6f,height:0.7f}
execute as @n[type=item_display,tag=Fresh] run loot replace entity @s container.0 loot micahcraft:grave_display
tag @s add Died
summon minecraft:text_display ~ ~1 ~ {Tags:["mk.grave","Fresh"],billboard:"center",see_through:true,text:'{"selector":"@p[tag=Died]","color":"gray","extra":[{"text":"\'s Grave"}]}',transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0f,0f,0f,0f,1f]}
tag @s remove Died
summon marker ~ ~ ~ {Tags:["mk.grave","Fresh"]}
scoreboard players operation @n[tag=Fresh,limit=4] mk.grave_id = #ID mk.grave_id
scoreboard players add #ID mk.grave_id 1
tag @s add Copying
execute as @n[type=marker,tag=Fresh] run function micahcraft:grave/copy_player_data
tag @s remove Copying
tag @n[tag=Fresh,limit=4] remove Fresh
function micahcraft:grave/clear_player_data