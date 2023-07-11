execute as @a run function micahcraft:math/afk
tag @a[tag=Moving] remove Moving
tag @a[scores={Moving=1..}] add Moving
scoreboard players set @a[tag=Moving] Aviate 0
scoreboard players set @a[tag=Moving] Boat 0
scoreboard players set @a[tag=Moving] Climb 0
scoreboard players set @a[tag=Moving] Crouch 0
scoreboard players set @a[tag=Moving] Fly 0
scoreboard players set @a[tag=Moving] Horse 0
scoreboard players set @a[tag=Moving] Sprint 0
scoreboard players set @a[tag=Moving] Swim 0
scoreboard players set @a[tag=Moving] WalkOnWater 0
scoreboard players set @a[tag=Moving] Walk 0
scoreboard players set @a[tag=Moving] WalkUnderWater 0
scoreboard players set @a[tag=Moving] Jump 0
scoreboard players set @a[tag=Moving] Strider 0
execute as @a[tag=Moving,tag=Afk] run tellraw @a [{"selector":"@s","color":"gray","italic":true},{"text":" is no longer AFK","color":"gray","italic":true}]
scoreboard players set @a[scores={Afk=1..}] TicksAfk 12000
scoreboard players set @a[scores={Afk=1..}] Afk 0
scoreboard players set @a[tag=Moving] TicksAfk 0
tag @a[tag=Afk] remove Afk
tag @a[scores={TicksAfk=12000..}] add Afk
execute as @a[scores={TicksAfk=12000}] run tellraw @a [{"selector":"@s","color":"gray","italic":true},{"text":" is now AFK","color":"gray","italic":true}]
team join Afk @a[tag=Afk]
team leave @a[team=Afk,tag=!Afk]
scoreboard players enable @a Afk
