# @score_trigger
# scoreboard mk.dialog
# value 5
scoreboard players set @s mk.dialog 0
dialog show @s micahcraft:empty
dialog clear @s
execute unless data entity @s {OnGround:1b} run return fail
summon interaction ~ ~ ~ {Tags:["mk.chair","mk.chair.fresh"],width:0,height:0}
ride @s mount @n[type=interaction,tag=mk.chair.fresh]
tag @n[type=interaction,tag=mk.chair.fresh] remove mk.chair.fresh