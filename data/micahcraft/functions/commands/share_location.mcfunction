execute store result score #X Math run data get entity @s Pos[0]
execute store result score #Y Math run data get entity @s Pos[1]
execute store result score #Z Math run data get entity @s Pos[2]
tellraw @a [{"selector":"@s","color":"#7F00FF"},{"text":"'s Location: ","color":"#7F00FF"},{"score":{"name":"#X","objective":"Math"},"color":"red"}," ",{"score":{"name":"#Y","objective":"Math"},"color":"green"}," ",{"score":{"name":"#Z","objective":"Math"},"color":"blue"}]
scoreboard players set @s ShareLocation 0
advancement revoke @s only micahcraft:commands/share_location