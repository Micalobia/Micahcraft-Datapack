tag @a[tag=ShareCoords] remove ShareCoords
tag @a[scores={ShareCoords=1..}] add ShareCoords
execute as @a[tag=ShareCoords] run function micahcraft:math/coords
scoreboard players set @a[tag=ShareCoords] ShareCoords 0
scoreboard players enable @a ShareCoords
