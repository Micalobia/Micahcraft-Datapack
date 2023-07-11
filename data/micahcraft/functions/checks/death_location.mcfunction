tag @a[tag=SeeDeathLocation] remove SeeDeathLocation
tag @a[scores={SeeDeathLocation=1..}] add SeeDeathLocation
execute as @a[tag=SeeDeathLocation] run function micahcraft:math/death_location
execute as @a[tag=SeeDeathLocation] run tellraw @s [{"text":"Last Death: ","color":"dark_red"},{"score":{"name":"$X","objective":"Math"},"color":"dark_red"},{"text":" "},{"score":{"name":"$Y","objective":"Math"},"color":"dark_red"},{"text":" "},{"score":{"name":"$Z","objective":"Math"},"color":"dark_red"}]
scoreboard players set @a[tag=SeeDeathLocation] SeeDeathLocation 0
scoreboard players enable @a SeeDeathLocation
