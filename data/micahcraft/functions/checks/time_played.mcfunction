scoreboard players remove @a[tag=Afk] Playtime 1
scoreboard players set @a[scores={SeePlaytime=2..}] SeePlaytime 0
team join SeePlaytime @a[team=!SeePlaytime,scores={SeePlaytime=1}]
team leave @a[team=SeePlaytime,scores={SeePlaytime=0}]
scoreboard players enable @a SeePlaytime
execute as @a run function micahcraft:math/playtime
