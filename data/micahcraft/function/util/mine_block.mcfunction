execute unless predicate micahcraft:player/mineable run return fail
loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
execute store result storage micahcraft:util mine_block.points int 1 run function micahcraft:util/xp/block
setblock ~ ~ ~ air
function micahcraft:util/xp/spawn_orbs with storage micahcraft:util mine_block 