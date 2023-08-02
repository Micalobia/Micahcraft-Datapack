scoreboard players remove @e[scores={Lifetime=1..}] Lifetime 1
kill @e[scores={Lifetime=..0}]
execute if entity @e[scores={Lifetime=1..}] run schedule function micahcraft:scheduled/lifetime 1t append
