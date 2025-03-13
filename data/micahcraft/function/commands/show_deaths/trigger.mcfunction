tag @s[team=mk.deaths] add mk.leaveteam
team leave @s[tag=mk.leaveteam]
team join mk.deaths @s[tag=!mk.leaveteam]
tag @s[tag=mk.leaveteam] remove mk.leaveteam
scoreboard players set @s ShowDeaths 0
advancement revoke @s only micahcraft:generated/score_triggers/show_deaths