execute store result storage micahcraft:misc macro.level int 1 run scoreboard players get @s mk.misc.lifetime
function micahcraft:misc/__private/_glow with storage micahcraft:misc macro
execute if score @s mk.misc.lifetime matches ..0 run return run function micahcraft:util/remove
scoreboard players remove @s mk.misc.lifetime 1