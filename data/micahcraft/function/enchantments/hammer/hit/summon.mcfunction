summon marker ~ ~ ~ {Tags:['mk.hammer.hit','Fresh']}
scoreboard players operation @n[type=marker,tag=mk.hammer.hit,tag=Fresh] mk.misc.player.id = @s mk.misc.player.id
tag @n[type=marker,tag=Fresh] remove Fresh
execute unless predicate micahcraft:player/mineable run function micahcraft:enchantments/hammer/mine