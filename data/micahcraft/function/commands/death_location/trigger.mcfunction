execute store result score #X mk.math run data get entity @s LastDeathLocation.pos[0]
execute store result score #Y mk.math run data get entity @s LastDeathLocation.pos[1]
execute store result score #Z mk.math run data get entity @s LastDeathLocation.pos[2]
function micahcraft:location/storage
function micahcraft:commands/death_location/macro with storage micahcraft:misc pos
scoreboard players set @s DeathLocation 0
advancement revoke @s only micahcraft:generated/score_triggers/death_location