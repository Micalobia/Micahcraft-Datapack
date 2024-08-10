execute store result storage micahcraft:settings macro.id int 1 run scoreboard players get @s mk.misc.player.id
$data modify storage micahcraft:settings macro.path set value "$(path)"
return run function micahcraft:settings/__private/get_value with storage micahcraft:settings macro