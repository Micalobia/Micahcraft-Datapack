summon marker ~ ~ ~ {Tags:['mk.veinmining.hit','Fresh']}
scoreboard players operation @n[type=marker,tag=mk.veinmining.hit,tag=Fresh] mk.misc.player.id = @s mk.misc.player.id
execute store result score @n[type=marker,tag=Fresh] mk.veinmining.group run function micahcraft:enchantments/veinmining/data/group
execute store result score @n[type=marker,tag=Fresh] mk.veinmining.sound run function micahcraft:enchantments/veinmining/data/sound_group
tag @n[type=marker,tag=Fresh] remove Fresh
execute unless predicate micahcraft:player/mineable run function micahcraft:enchantments/veinmining/mine