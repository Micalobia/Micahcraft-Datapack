advancement revoke @s only micahcraft:open_grave
execute store result score #UUID_0 Math run data get entity @s UUID[0]
execute store result score #UUID_1 Math run data get entity @s UUID[1]
execute store result score #UUID_2 Math run data get entity @s UUID[2]
execute store result score #UUID_3 Math run data get entity @s UUID[3]
function micahcraft:loops/tag_opening_grave
execute as @e[type=marker,tag=ActiveGrave,limit=1,nbt=!{data:{Inventory:[]}}] run function micahcraft:loops/open_grave
kill @e[tag=ActiveGrave,limit=3]
