function micahcraft:location
execute store result storage micahcraft:misc pos.x int 1 run scoreboard players get #X mk.math
execute store result storage micahcraft:misc pos.y int 1 run scoreboard players get #Y mk.math
execute store result storage micahcraft:misc pos.z int 1 run scoreboard players get #Z mk.math
function micahcraft:commands/share_location/macro with storage micahcraft:misc pos
scoreboard players set @s ShareLocation 0
advancement revoke @s only micahcraft:generated/score_triggers/share_location