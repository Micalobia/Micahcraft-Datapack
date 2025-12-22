function micahcraft:enchantments/germination/clear
summon marker ~ ~ ~ {Tags:['mk.germination.hit','Fresh']}
scoreboard players operation @n[type=marker,tag=mk.germination.hit,tag=Fresh] mk.misc.player.id = @s mk.misc.player.id
tag @n[type=marker,tag=Fresh] remove Fresh