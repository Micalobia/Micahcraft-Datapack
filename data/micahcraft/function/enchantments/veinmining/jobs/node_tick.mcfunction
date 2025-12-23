# Job is tagged with mk.veinmining.job.active
execute store result score #mk.group mk.math run function micahcraft:enchantments/veinmining/data/group
execute unless score #mk.group mk.math = @s mk.veinmining.group run return run function micahcraft:enchantments/veinmining/jobs/node_miss
execute if score @n[type=armor_stand,tag=mk.veinmining.job.active] mk.veinmining.mined >= #MAX mk.veinmining.job_id run return run function micahcraft:enchantments/veinmining/jobs/node_miss
execute as @n[type=armor_stand,tag=mk.veinmining.job.active] run function micahcraft:enchantments/veinmining/mine_block
scoreboard players add @n[type=armor_stand,tag=mk.veinmining.job.active] mk.veinmining.mined 1
tag @s add mk.veinmining.node.mined
execute unless entity @s[tag=mk.veinmining.node.frontier] run return 1
tag @s remove mk.veinmining.node.frontier
scoreboard players add #mk.depth mk.math 1
function micahcraft:enchantments/veinmining/jobs/create_neighbors
scoreboard players remove #mk.depth mk.math 1