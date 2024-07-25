# Gets the user's <path> setting, and stores it in `micahcraft:setting return`
execute store result storage micahcraft:settings macro.id int 1 run scoreboard players get @s mk.settings.id
$data modify storage micahcraft:settings macro.path set value "$(path)"
data remove storage micahcraft:settings return
function micahcraft:settings/__private/get_generic with storage micahcraft:settings macro