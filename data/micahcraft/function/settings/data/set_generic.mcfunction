execute store result storage micahcraft:settings macro.id int 1 run scoreboard players get @s mk.misc.player.id
$data modify storage micahcraft:settings macro.path set value "$(path)"
$data modify storage micahcraft:settings macro.value set value "$(value)"
function micahcraft:settings/__private/set_generic with storage micahcraft:settings macro