tag @s[team=Deaths] add LeaveTeam
team leave @s[tag=LeaveTeam]
team join Deaths @s[tag=!LeaveTeam]
tag @s[tag=LeaveTeam] remove LeaveTeam
scoreboard players set @s ShowDeaths 0
advancement revoke @s only micahcraft:generated/score_triggers/show_deaths