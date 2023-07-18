advancement revoke @s only micahcraft:chair/sit
execute store result score #UUID_0 Math run data get entity @s UUID[0]
execute store result score #UUID_1 Math run data get entity @s UUID[1]
execute store result score #UUID_2 Math run data get entity @s UUID[2]
execute store result score #UUID_3 Math run data get entity @s UUID[3]
function micahcraft:loops/tag_sitting_chair
ride @s mount @e[tag=ChairSit,tag=ActiveChair,limit=1]
data remove entity @e[tag=ChairBox,tag=ActiveChair,limit=1] interaction
tag @e[tag=ActiveChair] remove ActiveChair
