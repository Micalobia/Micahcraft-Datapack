function micahcraft:location/score
function micahcraft:location/storage
function micahcraft:commands/share_location/macro with storage micahcraft:misc pos
scoreboard players set @s mk.dialog 0
advancement revoke @s only micahcraft:generated/score_triggers/share_location
dialog show @s micahcraft:empty
dialog clear @s