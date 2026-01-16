execute store result storage micahcraft:api/tps id int 1 run scoreboard players get #ID mk.api.tps
scoreboard players add #ID mk.api.tps 1
scoreboard players operation #ID mk.api.tps %= #10 mk.math
return run function micahcraft:api/internal/tps/query_and_restart with storage micahcraft:api/tps