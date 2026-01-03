advancement revoke @s only micahcraft:generated/score_triggers/create_grave
scoreboard players set @s mk.grave_deaths 0
execute store result score #KeepInventory mk.math run gamerule keep_inventory
execute if score #KeepInventory mk.math matches 0 run return fail

data modify storage micahcraft:grave Inventory set value []
function micahcraft:grave/copy_equipment
function micahcraft:util/loop {\
    nbt:"entity @s Inventory",\
    function:"micahcraft:grave/copy",\
}
execute store result score #XP mk.math run xp query @s levels

execute unless data storage micahcraft:grave Inventory[0] if score #XP mk.math matches 0 run return fail

execute if predicate micahcraft:location/void run tag @s add mk.void
execute if entity @s[tag=mk.void] if dimension overworld positioned ~ -60 ~ run function micahcraft:grave/summon
execute if entity @s[tag=mk.void] unless dimension overworld positioned ~ 4 ~ run function micahcraft:grave/summon
execute if entity @s[tag=!mk.void] run function micahcraft:grave/summon
tag @s[tag=mk.void] remove mk.void
scoreboard players operation @n[tag=Fresh,limit=4] mk.grave_id = #ID mk.grave_id
scoreboard players add #ID mk.grave_id 1
data modify entity @n[type=marker,tag=Fresh] data.Inventory set from storage micahcraft:grave Inventory
execute store result entity @n[type=marker,tag=Fresh] data.XP int 7 run scoreboard players get #XP mk.math
tag @n[tag=Fresh,limit=4] remove Fresh
function micahcraft:grave/clear_player_data
xp set @s 0 points
xp set @s 0 levels