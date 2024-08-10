summon marker ~ ~ ~ {Tags:["mk.veinmining","Fresh"]}
scoreboard players operation @n[type=marker,tag=Fresh] mk.misc.player.id = @s mk.misc.player.id
tag @n[tag=Fresh] add Checked
tag @n[tag=Fresh] remove Fresh
scoreboard players add #Blocks mk.math 1
execute positioned ~ ~1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~-1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~ ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~ ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~ ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~ ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute if score #Level mk.math matches ..0 run return 1
execute positioned ~1 ~1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~-1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~-1 ~ run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~1 ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~1 ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~-1 ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~ ~-1 ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~ ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~ ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~ ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~ ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute if score #Level mk.math matches ..1 run return 1
execute positioned ~1 ~1 ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~1 ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~-1 ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~-1 ~1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~1 ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~1 ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~1 ~-1 ~-1 run function micahcraft:enchantments/veinmining/try_summon
execute positioned ~-1 ~-1 ~-1 run function micahcraft:enchantments/veinmining/try_summon
