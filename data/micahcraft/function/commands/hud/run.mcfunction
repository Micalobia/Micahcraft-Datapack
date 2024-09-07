advancement revoke @s only micahcraft:generated/score_triggers/hud/run
function settings:data/get {key:"hud:theme"}
data modify storage micahcraft:hud macro.theme set from storage settings:output get
function micahcraft:commands/hud/theme with storage micahcraft:hud macro
function micahcraft:commands/hud/title