tellraw @a[tag=mk.slow_tick] "slow tick"
execute as @e[type=happy_ghast] unless score @s mk.version matches 2 run function micahcraft:misc/__private/boost
function micahcraft:misc/global_cure
execute as @e[type=interaction,tag=mk.chair] unless function micahcraft:misc/has_passenger run function micahcraft:util/remove
schedule function micahcraft:slow_tick 1s replace