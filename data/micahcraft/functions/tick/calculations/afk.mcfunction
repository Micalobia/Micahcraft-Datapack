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