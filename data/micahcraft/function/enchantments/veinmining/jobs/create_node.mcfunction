# Executed at the position the node should be created as the newly summoned node marker
# Job should be tagged with mk.veinmining.job.active
# Node depth should be stored in #mk.depth mk.math
execute if entity @n[type=marker,tag=mk.veinmining.node,distance=..0.01] run return run function micahcraft:util/remove
execute store result score @s mk.veinmining.group run function micahcraft:enchantments/veinmining/data/group
execute unless score @s mk.veinmining.group = @n[type=armor_stand,tag=mk.veinmining.job.active] mk.veinmining.group run return run function micahcraft:util/remove
scoreboard players operation @s mk.veinmining.job_id = @n[type=armor_stand,tag=mk.veinmining.job.active] mk.veinmining.job_id
scoreboard players operation @s mk.veinmining.depth = #mk.depth mk.math
tag @s add mk.veinmining.node
tag @s add mk.veinmining.node.frontier