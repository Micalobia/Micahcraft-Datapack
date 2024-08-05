tag @s add CurrentPlayer
execute as @e[type=magma_cube,tag=mk.measuring.cube] if score @s mk.measuring.id = @p[tag=CurrentPlayer] mk.measuring.id at @s run tp @s ~ -100 ~
scoreboard players set @s mk.measuring.state 0
tag @s remove CurrentPlayer