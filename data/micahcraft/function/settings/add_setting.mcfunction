# key         [str] => key for the setting
# name        [str] => name for the setting
# page        [str] => key for the page
# description [str] => description for the setting
# default     [val] => default value for the setting
# formatter   [str] => function for formatting the value when displayed in the book
execute store result storage micahcraft:settings temp int 1 run scoreboard players get #Key mk.misc.player.id
scoreboard players add #Key mk.misc.player.id 1
$data modify storage micahcraft:settings setup.settings.index."$(key)" set from storage micahcraft:settings temp
$data modify storage micahcraft:settings setup.settings.info append value {\
    key:"$(key)",\
    name:"$(name)",\
    page:"$(page)",\
    description:"$(description)",\
    formatter:"$(formatter)",\
    change:"$(change)",\
}
scoreboard players operation #Value mk.math = #Key mk.misc.player.id
scoreboard players add #Value mk.math 1
execute store result storage micahcraft:settings setup.settings.info[-1].trigger int 1 run scoreboard players get #Value mk.math
$data modify storage micahcraft:settings users.default."$(key)" set value $(default)