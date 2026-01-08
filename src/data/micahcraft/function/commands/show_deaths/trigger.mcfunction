# @score_trigger
# scoreboard ShowDeaths
tag @s[team=mk.deaths] add mk.leaveteam
team leave @s[tag=mk.leaveteam]
team join mk.deaths @s[tag=!mk.leaveteam]
tag @s[tag=mk.leaveteam] remove mk.leaveteam
dialog show @s micahcraft:empty
dialog clear @s
scoreboard players set @s ShowDeaths 0