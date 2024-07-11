tag @s[team=Playtime] add LeaveTeam
team leave @s[tag=LeaveTeam]
team join Playtime @s[tag=!LeaveTeam]
tag @s[tag=LeaveTeam] remove LeaveTeam
scoreboard players set @s ShowPlaytime 0
advancement revoke @s only micahcraft:generated/score_triggers/show_playtime