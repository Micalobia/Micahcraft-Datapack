execute store result score #milliseconds mk.math run function micahcraft:api/internal/tps/query_and_cycle
scoreboard players set #TPS mk.api.tps 50000
scoreboard players operation #TPS mk.api.tps /= #milliseconds mk.math
schedule function micahcraft:api/internal/tps/calculate 5t replace