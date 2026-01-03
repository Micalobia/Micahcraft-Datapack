execute unless score @s mk.deaths matches 1.. run return fail
execute store result score #X mk.math run data get entity @s LastDeathLocation.pos[0]
execute store result score #Y mk.math run data get entity @s LastDeathLocation.pos[1]
execute store result score #Z mk.math run data get entity @s LastDeathLocation.pos[2]
function micahcraft:location/storage
function micahcraft:dialog/dynamic/death_location/macro with storage micahcraft:misc pos