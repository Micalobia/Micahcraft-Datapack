$execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:'$(key)'}
scoreboard players add #Value mk.math 1
scoreboard players operation #Value mk.math %= #5 mk.math
execute store result storage micahcraft:settings macro.value int 1 run scoreboard players get #Value mk.math
$data modify storage micahcraft:settings macro.path set value '$(key)'
function micahcraft:settings/data/set_generic with storage micahcraft:settings macro