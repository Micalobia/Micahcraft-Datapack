execute store result score #Index mk.math run data get storage micahcraft:util loop.value.number
scoreboard players remove #Index mk.math 1
execute store result storage micahcraft:util loop.value.index int 1 run scoreboard players get #Index mk.math
function micahcraft:settings/__private/_generate_page_line with storage micahcraft:util loop.value
data modify storage micahcraft:settings page append value {"storage":"micahcraft:misc","nbt":"newline"}
