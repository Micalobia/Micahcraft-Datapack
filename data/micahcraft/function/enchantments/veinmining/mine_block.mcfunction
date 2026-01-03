execute unless predicate micahcraft:api/mineable run return fail
execute store result score #TileDrops mk.math run gamerule block_drops
execute if score #TileDrops mk.math matches 1 run loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
execute if predicate micahcraft:enchantments/telekinesis/holding run function micahcraft:enchantments/telekinesis/collect_to_owner with entity @s data
execute store result storage micahcraft:util mine_block.points int 1 run function micahcraft:util/xp/block
setblock ~ ~ ~ air
execute if score #TileDrops mk.math matches 1 run function micahcraft:util/xp/spawn_orbs with storage micahcraft:util mine_block 
function micahcraft:enchantments/veinmining/sound