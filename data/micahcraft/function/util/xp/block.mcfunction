execute unless predicate micahcraft:player/mineable run return 0
execute if block ~ ~ ~ spawner run return run random value 15..43
execute if predicate micahcraft:player/holding/enchantment/silk run return 0
execute if block ~ ~ ~ #coal_ores run return run random value 0..2
execute if block ~ ~ ~ nether_gold_ore run return run random value 0..1
execute if block ~ ~ ~ #diamond_ores run return run random value 3..7
execute if block ~ ~ ~ #emerald_ores run return run random value 3..7
execute if block ~ ~ ~ #lapis_ores run return run random value 2..5
execute if block ~ ~ ~ nether_quartz_ore run return run random value 2..5
execute if block ~ ~ ~ #redstone_ores run return run random value 1..5
execute if block ~ ~ ~ sculk run return 1
execute if block ~ ~ ~ sculk_sensor run return 5
execute if block ~ ~ ~ sculk_shrieker run return 5
execute if block ~ ~ ~ sculk_catalyst run return 5