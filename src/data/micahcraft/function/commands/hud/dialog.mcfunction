# @score_trigger
# scoreboard mk.dialog
# value 4
function micahcraft:settings/data/set/toggle {namespace:'hud',path:'enabled'}
function micahcraft:commands/hud/trigger
scoreboard players set @s mk.dialog 0
dialog show @s micahcraft:empty
dialog clear @s