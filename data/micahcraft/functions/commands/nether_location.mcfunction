execute if dimension minecraft:overworld run function micahcraft:commands/nether_location/overworld
execute if dimension minecraft:the_nether run function micahcraft:commands/nether_location/the_nether
execute if dimension minecraft:the_end run function micahcraft:commands/nether_location/the_end
scoreboard players set @s NetherLocation 0
advancement revoke @s only micahcraft:commands/nether_location