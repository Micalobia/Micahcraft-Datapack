function micahcraft:helper/location
tellraw @a [{"selector":"@s","color":"#7F00FF"},{"text":"'s Location: ","color":"#7F00FF"},{"score":{"name":"#X","objective":"Math"},"color":"red"}," ",{"score":{"name":"#Y","objective":"Math"},"color":"green"}," ",{"score":{"name":"#Z","objective":"Math"},"color":"blue"}]
scoreboard players set @s ShareLocation 0
advancement revoke @s only micahcraft:commands/share_location