# @score_trigger
# scoreboard mk.dialog
# value 3
function micahcraft:location/score
function micahcraft:location/storage
function micahcraft:commands/share_location/macro with storage micahcraft:misc pos
scoreboard players set @s mk.dialog 0
dialog show @s micahcraft:empty
dialog clear @s