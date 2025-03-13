$data modify storage micahcraft:util loop.macro set value {nbt:"$(nbt)",function:"$(function)"}
execute store result storage micahcraft:util loop.macro.nest int 1 run scoreboard players get #Index mk.util.loop
scoreboard players add #Index mk.util.loop 1
function micahcraft:util/__private/loop with storage micahcraft:util loop.macro
scoreboard players remove #Index mk.util.loop 1