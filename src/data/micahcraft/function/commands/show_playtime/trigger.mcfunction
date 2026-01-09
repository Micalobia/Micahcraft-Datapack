# @score_trigger
# scoreboard ShowPlaytime
tag @s[team=mk.playtime] add mk.leaveteam
team leave @s[tag=mk.leaveteam]
team join mk.playtime @s[tag=!mk.leaveteam]
tag @s[tag=mk.leaveteam] remove mk.leaveteam
scoreboard players set @s ShowPlaytime 0
dialog show @s micahcraft:empty
dialog clear @s