tellraw @s [{"text":"Last Death: ","color":"dark_red"},{"nbt":"LastDeathLocation.pos[0]","entity":"@s","color":"red"}," ",{"nbt":"LastDeathLocation.pos[1]","entity":"@s","color":"green"}," ",{"nbt":"LastDeathLocation.pos[2]","entity":"@s","color":"blue"}]
scoreboard players set @s DeathLocation 0
advancement revoke @s only micahcraft:commands/death_location