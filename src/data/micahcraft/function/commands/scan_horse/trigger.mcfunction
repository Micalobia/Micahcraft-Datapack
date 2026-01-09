# @score_trigger
# scoreboard ScanHorse
scoreboard players set @s ScanHorse 0
execute unless predicate micahcraft:on_horse run tellraw @s {text:"You're not on a horse!",color:"red"}
execute unless predicate micahcraft:on_horse run return fail
function micahcraft:commands/scan_horse/speed
function micahcraft:commands/scan_horse/jump