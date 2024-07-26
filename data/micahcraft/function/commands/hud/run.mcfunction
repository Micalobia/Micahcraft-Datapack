advancement revoke @s only micahcraft:generated/score_triggers/hud/run
function micahcraft:settings/data/get_generic {path:"hud.theme"}
data modify storage micahcraft:hud macro.theme set from storage micahcraft:settings return
function micahcraft:commands/hud/theme with storage micahcraft:hud macro
function micahcraft:commands/hud/title