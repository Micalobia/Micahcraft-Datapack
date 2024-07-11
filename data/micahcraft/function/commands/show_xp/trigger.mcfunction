tag @s[team=XP] add LeaveTeam
team leave @s[tag=LeaveTeam]
team join XP @s[tag=!LeaveTeam]
tag @s[tag=LeaveTeam] remove LeaveTeam
scoreboard players set @s ShowXP 0
advancement revoke @s only micahcraft:generated/score_triggers/show_xp