execute as @a[tag=Moving,tag=Afk] run tellraw @a [{"selector":"@s","color":"gray","italic":true},{"text":" is no longer AFK","color":"gray","italic":true}]
scoreboard players enable @a Afk
execute as @a run scoreboard players operation @s Math = @s TicksAfk
scoreboard players set @a[scores={Afk=1..}] TicksAfk 12000
scoreboard players set @a[scores={Afk=1..}] Afk 0
scoreboard players set @a[scores={Moving=1..}] TicksAfk 0
tag @a[tag=Afk] remove Afk
tag @a[scores={TicksAfk=12000..}] add Afk
execute as @a[scores={TicksAfk=12000}] run scoreboard players operation @s Playtime -= @s Math
scoreboard players remove @a[tag=Afk,scores={TicksAfk=12001..}] Playtime 1
execute as @a[scores={TicksAfk=12000}] run tellraw @a [{"selector":"@s","color":"gray","italic":true},{"text":" is now AFK","color":"gray","italic":true}]
scoreboard players set @a[tag=Afk] TeamID 1