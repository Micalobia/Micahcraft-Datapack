execute unless function micahcraft:enchantments/veinmining/jobs/owner_exists run return run function micahcraft:enchantments/veinmining/jobs/remove_job
execute if score @s mk.veinmining.mined >= #MAX mk.veinmining.job_id run return run function micahcraft:enchantments/veinmining/jobs/remove_job
scoreboard players operation #mk.depth mk.math = @s mk.veinmining.depth
tag @s add mk.veinmining.job.active
execute as @e[type=marker,tag=mk.veinmining.node,tag=!mk.veinmining.node.mined] \
    if score @s mk.veinmining.job_id = @n[type=armor_stand,tag=mk.veinmining.job.active] mk.veinmining.job_id \
    if score @s mk.veinmining.depth = #mk.depth mk.math \
    at @s run function micahcraft:enchantments/veinmining/jobs/node_tick
scoreboard players set #mk.check mk.math 0
execute as @e[type=marker,tag=mk.veinmining.node,tag=!mk.veinmining.node.mined] \
    if score @s mk.veinmining.job_id = @n[type=armor_stand,tag=mk.veinmining.job.active] mk.veinmining.job_id \
    run scoreboard players set #mk.check mk.math 1
execute if score #mk.check mk.math matches 0 run return run function micahcraft:enchantments/veinmining/jobs/remove_job
tag @s remove mk.veinmining.job.active
scoreboard players add @s mk.veinmining.depth 1