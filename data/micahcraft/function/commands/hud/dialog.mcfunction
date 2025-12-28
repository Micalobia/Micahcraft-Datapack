advancement revoke @s only micahcraft:generated/score_triggers/hud
function micahcraft:settings/data/set/toggle {namespace:'hud',path:'enabled'}
function micahcraft:commands/hud/trigger
scoreboard players set @s mk.dialog 0
dialog show @s micahcraft:empty
dialog clear @s