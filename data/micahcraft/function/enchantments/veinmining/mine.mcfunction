# At the item_display, as the item_display
# Job is an armor stand that stores the tool used, nodes are markers, all under job ids.
execute if score @s mk.veinmining.group matches ..0 run return fail
tag @s add mk.veinmining.hit.create
summon marker ~ ~ ~ {Tags:["mk.veinmining.temp"]}
execute positioned ~ -64 ~ summon armor_stand positioned as @n[type=marker,tag=mk.veinmining.temp] run function micahcraft:enchantments/veinmining/jobs/create_job
execute as @n[type=marker,tag=mk.veinmining.temp] run function micahcraft:util/remove
tag @s remove mk.veinmining.hit.create