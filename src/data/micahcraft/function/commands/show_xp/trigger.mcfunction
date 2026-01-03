tag @s[team=mk.xp] add mk.leaveteam
team leave @s[tag=mk.leaveteam]
team join mk.xp @s[tag=!mk.leaveteam]
tag @s[tag=mk.leaveteam] remove mk.leaveteam
scoreboard players set @s ShowXP 0
advancement revoke @s only micahcraft:generated/score_triggers/show_xp
dialog show @s micahcraft:empty
dialog clear @s