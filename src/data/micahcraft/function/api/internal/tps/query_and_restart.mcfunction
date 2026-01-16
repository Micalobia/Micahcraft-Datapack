$execute store result score #result mk.math run stopwatch query micahcraft:api/tps/$(id) 100
$stopwatch restart micahcraft:api/tps/$(id)
return run scoreboard players get #result mk.math