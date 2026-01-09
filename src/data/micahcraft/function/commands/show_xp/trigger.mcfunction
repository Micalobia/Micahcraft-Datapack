# @score_trigger
# scoreboard ShowXP
tag @s[team=mk.xp] add mk.leaveteam
team leave @s[tag=mk.leaveteam]
team join mk.xp @s[tag=!mk.leaveteam]
tag @s[tag=mk.leaveteam] remove mk.leaveteam
scoreboard players set @s ShowXP 0
dialog show @s micahcraft:empty
dialog clear @s