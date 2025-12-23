# At the marker, as the player
# Job is an item display that stores the tool used, nodes are markers, all under job ids.
execute as @n[type=marker,tag=mk.veinmining.hit] if score @s mk.veinmining.group matches ..0 run return fail
tag @s add mk.veinmining.mining
summon marker ~ ~ ~ {Tags:["mk.veinmining.temp"]}
execute positioned ~ -64 ~ summon armor_stand positioned as @n[type=marker,tag=mk.veinmining.temp] run function micahcraft:enchantments/veinmining/jobs/create_job
execute as @n[type=marker,tag=mk.veinmining.temp] run function micahcraft:util/remove
tag @s remove mk.veinmining.mining