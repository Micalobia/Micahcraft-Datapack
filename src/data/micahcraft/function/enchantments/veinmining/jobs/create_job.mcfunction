# This should be an armor stand
data merge entity @s {Marker:1b,Invisible:1b}
tag @s add mk.veinmining.job
data modify entity @s data.owner set from entity @p[tag=mk.veinmining.used] UUID
scoreboard players operation @s mk.veinmining.group = @n[type=item_display,tag=mk.veinmining.hit.create] mk.veinmining.group
scoreboard players operation @s mk.veinmining.sound = @n[type=item_display,tag=mk.veinmining.hit.create] mk.veinmining.sound
scoreboard players operation @s mk.veinmining.job_id = #ID mk.veinmining.job_id
scoreboard players add #ID mk.veinmining.job_id 1
scoreboard players set @s mk.veinmining.depth 0
scoreboard players set @s mk.veinmining.mined 0
item replace entity @s weapon.mainhand from entity @p[tag=mk.veinmining.used] weapon.mainhand
scoreboard players set #mk.depth mk.math 0
tag @s add mk.veinmining.job.active
function micahcraft:enchantments/veinmining/jobs/create_neighbors
tag @s remove mk.veinmining.job.active
execute if score @s mk.veinmining.group matches 1.. run schedule function micahcraft:enchantments/veinmining/jobs/tick 1t replace
execute if score @s mk.veinmining.group matches ..-1 run function micahcraft:enchantments/veinmining/jobs/skip_animation