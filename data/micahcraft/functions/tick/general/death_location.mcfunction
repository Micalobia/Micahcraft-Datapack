tag @a[tag=SeeDeathLocation] remove SeeDeathLocation
tag @a[scores={SeeDeathLocation=1..}] add SeeDeathLocation
execute as @a[tag=SeeDeathLocation] run function micahcraft:math/death_location
scoreboard players set @a[tag=SeeDeathLocation] SeeDeathLocation 0
scoreboard players enable @a SeeDeathLocation