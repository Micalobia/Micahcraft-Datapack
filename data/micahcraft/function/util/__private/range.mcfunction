execute if score #Value mk.util.loop >= #End mk.util.loop run return 1
execute store result storage micahcraft:util loop.temp int 1 run scoreboard players get #Value mk.util.loop
data modify storage micahcraft:util loop.range append from storage micahcraft:util loop.temp
scoreboard players add #Value mk.util.loop 1
function micahcraft:util/__private/range