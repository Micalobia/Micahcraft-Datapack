# Same deal as create_node, you need to set #mk.depth mk.math
# Faces
execute positioned ~-1 ~ ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~ ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~ ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~ ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~-1 ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~1 ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
# Edges
scoreboard players add #mk.depth mk.math 1
execute positioned ~-1 ~ ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~ ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~-1 ~ ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~ ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~-1 ~-1 ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~-1 ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~-1 ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~-1 ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~-1 ~1 ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~1 ~ summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~1 ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~ ~1 ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
# Corners
scoreboard players add #mk.depth mk.math 1
execute positioned ~-1 ~-1 ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~-1 ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~-1 ~-1 ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~-1 ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~-1 ~1 ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~1 ~-1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~-1 ~1 ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node
execute positioned ~1 ~1 ~1 summon marker run function micahcraft:enchantments/veinmining/jobs/create_node

scoreboard players remove #mk.depth mk.math 2