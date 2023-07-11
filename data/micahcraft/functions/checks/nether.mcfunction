tag @a[tag=SeeNetherCoords] remove SeeNetherCoords
tag @a[scores={SeeNetherCoords=1..}] add SeeNetherCoords
tag @a[tag=SeeNetherCoords,nbt={Dimension:"minecraft:overworld"}] add Overworld
tag @a[tag=SeeNetherCoords,nbt={Dimension:"minecraft:the_nether"}] add Nether
execute as @a[tag=SeeNetherCoords] at @s run function micahcraft:math/nether
tellraw @a[tag=SeeNetherCoords,tag=!Overworld,tag=!Nether] {"text":"Wrong dimension, wingding!","color":"dark_purple"}
tag @a[tag=Overworld] remove Overworld
tag @a[tag=Nether] remove Nether
scoreboard players set @a[tag=SeeNetherCoords] SeeNetherCoords 0
scoreboard players enable @a SeeNetherCoords
