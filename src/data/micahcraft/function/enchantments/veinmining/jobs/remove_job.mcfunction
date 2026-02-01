# Executed as the job entity (the armor stand)
tag @s add mk.veinmining.removing
execute at @s as @e[type=marker,tag=mk.veinmining.node] \
    if score @s mk.veinmining.job_id = @n[type=armor_stand,tag=mk.veinmining.removing] mk.veinmining.job_id \
    run function micahcraft:util/remove
function micahcraft:util/remove