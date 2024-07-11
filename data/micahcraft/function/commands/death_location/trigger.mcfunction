execute store result score #X mk.math run data get entity @s LastDeathLocation.pos[0]
execute store result score #Y mk.math run data get entity @s LastDeathLocation.pos[1]
execute store result score #Z mk.math run data get entity @s LastDeathLocation.pos[2]
execute store result storage micahcraft:misc pos.x int 1 run scoreboard players get #X mk.math
execute store result storage micahcraft:misc pos.y int 1 run scoreboard players get #Y mk.math
execute store result storage micahcraft:misc pos.z int 1 run scoreboard players get #Z mk.math
function micahcraft:commands/death_location/macro with storage micahcraft:misc pos
scoreboard players set @s DeathLocation 0
advancement revoke @s only micahcraft:generated/score_triggers/death_location