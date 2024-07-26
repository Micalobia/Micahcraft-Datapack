advancement revoke @s only micahcraft:generated/score_triggers/create_grave
scoreboard players set @s mk.grave_deaths 0
execute store result score #KeepInventory mk.math run gamerule keepInventory
execute if score #KeepInventory mk.math matches 0 run return fail

data modify storage micahcraft:grave Inventory set value []
function micahcraft:util/loop {\
    nbt:"entity @s Inventory",\
    function:"micahcraft:grave/copy",\
}
execute store result score #XP mk.math run xp query @s levels

execute unless data storage micahcraft:grave Inventory[0] if score #XP mk.math matches 0 run return fail

summon minecraft:item_display ~ ~1 ~ {Tags:["mk.grave","Fresh"],billboard:"center",transformation:[0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,1f]}
summon minecraft:interaction ~ ~0.65 ~ {Tags:["mk.grave","Fresh"],response:true,width:0.6f,height:0.7f}
execute as @n[type=item_display,tag=Fresh] run loot replace entity @s container.0 loot micahcraft:grave_display
tag @s add Died
summon minecraft:text_display ~ ~1 ~ {Tags:["mk.grave","Fresh"],billboard:"center",see_through:true,text:'{"selector":"@p[tag=Died]","color":"gray","extra":[{"text":"\'s Grave"}]}',transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0f,0f,0f,0f,1f]}
tag @s remove Died
summon marker ~ ~ ~ {Tags:["mk.grave","Fresh"]}
scoreboard players operation @n[tag=Fresh,limit=4] mk.grave_id = #ID mk.grave_id
scoreboard players add #ID mk.grave_id 1
data modify entity @n[type=marker,tag=Fresh] data.Inventory set from storage micahcraft:grave Inventory
execute store result entity @n[type=marker,tag=Fresh] data.XP int 7 run scoreboard players get #XP mk.math
tag @n[tag=Fresh,limit=4] remove Fresh
function micahcraft:grave/clear_player_data
xp set @s 0 points
xp set @s 0 levels