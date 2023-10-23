scoreboard players operation @s TicksActive -= @s TicksAFK
scoreboard players add @s TicksActive 6000
scoreboard players set @s TicksAFK 5999
scoreboard players set @s AFK 0
advancement revoke @s only micahcraft:commands/afk