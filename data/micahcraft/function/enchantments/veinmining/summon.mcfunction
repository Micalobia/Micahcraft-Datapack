summon marker ~ ~ ~ {Tags:["mk.veinmining","Fresh"]}
scoreboard players operation @n[type=marker,tag=Fresh] mk.veinmining.id = @s mk.veinmining.id
tag @n[tag=Fresh] add Checked
tag @n[tag=Fresh] remove Fresh
scoreboard players add #Blocks mk.math 1
execute positioned ~ ~1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~-1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~ ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~ ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~ ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~ ~-1 run function micahcraft:enchantments/veinmining/try_summon