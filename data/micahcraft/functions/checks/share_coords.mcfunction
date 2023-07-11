tag @a[tag=ShareCoords] remove ShareCoords
tag @a[scores={ShareCoords=1..}] add ShareCoords
scoreboard players set @a[tag=ShareCoords] ShareCoords 0
scoreboard players enable @a ShareCoords
execute as @a[tag=ShareCoords] at @s run function micahcraft:math/share_coords
