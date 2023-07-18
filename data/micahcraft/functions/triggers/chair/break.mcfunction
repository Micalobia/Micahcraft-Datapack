advancement revoke @s only micahcraft:chair/break
execute store result score #UUID_0 Math run data get entity @s UUID[0]
execute store result score #UUID_1 Math run data get entity @s UUID[1]
execute store result score #UUID_2 Math run data get entity @s UUID[2]
execute store result score #UUID_3 Math run data get entity @s UUID[3]
function micahcraft:loops/tag_breaking_chair
execute at @e[tag=ActiveChair,tag=ChairSit] run particle crit ~ ~0.25 ~ 0.25 0.25 0.25 0.1 20 normal
kill @e[tag=ActiveChair,limit=2]