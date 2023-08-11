scoreboard players set @s ScanHorse 0
advancement revoke @s only micahcraft:commands/scan_horse
execute unless predicate micahcraft:on_horse run tellraw @s {"text":"You're not on a horse!","color":"red"}
execute unless predicate micahcraft:on_horse run return -1
function micahcraft:commands/scan_horse/speed
function micahcraft:commands/scan_horse/jump