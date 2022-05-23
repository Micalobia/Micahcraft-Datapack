tag @a[tag=Spawn] remove Spawn
tag @a[scores={SetSpawn=1..}] add Spawn
execute as @a[tag=Spawn] at @s run spawnpoint
tellraw @a[tag=Spawn] {"text":"Set spawnpoint!","color":"dark_aqua"}
scoreboard players set @a[tag=Spawn] SetSpawn 0
scoreboard players enable @a SetSpawn