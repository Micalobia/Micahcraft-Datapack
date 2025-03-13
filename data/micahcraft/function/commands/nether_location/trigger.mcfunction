execute if dimension minecraft:overworld run function micahcraft:commands/nether_location/dimension/overworld
execute if dimension minecraft:the_nether run function micahcraft:commands/nether_location/dimension/the_nether
execute if dimension minecraft:the_end run function micahcraft:commands/nether_location/dimension/the_end
scoreboard players set @s NetherLocation 0
advancement revoke @s only micahcraft:generated/score_triggers/nether_location