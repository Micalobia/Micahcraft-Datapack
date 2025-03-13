tag @s add CurrentPlayer
execute as @e[type=magma_cube,tag=mk.measuring.cube] if score @s mk.misc.player.id = @p[tag=CurrentPlayer] mk.misc.player.id at @s run tp @s ~ -100 ~
scoreboard players set @s mk.measuring.state 0
tag @s remove CurrentPlayer