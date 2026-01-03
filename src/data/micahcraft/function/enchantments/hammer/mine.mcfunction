execute if entity @p[tag=mk.hammer.used,tag=mk.hammer.axis.x] run tp @s ~ ~ ~ 90 0
execute if entity @p[tag=mk.hammer.used,tag=mk.hammer.axis.y] run tp @s ~ ~ ~ 0 90
execute if entity @p[tag=mk.hammer.used,tag=mk.hammer.axis.z] run tp @s ~ ~ ~ 0 0
tag @s add mk.hammer.live
tag @s add mk.hammer.root
execute at @s run summon marker ^1 ^ ^ {Tags:['mk.hammer.live']}
execute at @s run summon marker ^-1 ^ ^ {Tags:['mk.hammer.live']}
execute at @n[limit=3,type=marker,tag=mk.hammer.live] rotated as @s run summon marker ^ ^1 ^ {Tags:['mk.hammer.live','mk.hammer.final']}
execute at @n[limit=3,type=marker,tag=mk.hammer.live,tag=!mk.hammer.final] rotated as @s run summon marker ^ ^-1 ^ {Tags:['mk.hammer.live']}
execute as @p[tag=mk.hammer.used] at @n[limit=8,type=marker,tag=mk.hammer.live,tag=!mk.hammer.root] run function micahcraft:util/mine_block
execute as @n[limit=9,type=marker,tag=mk.hammer.live] run function micahcraft:util/remove