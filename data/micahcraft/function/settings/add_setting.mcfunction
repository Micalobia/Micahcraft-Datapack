# key         [str] => key for the setting
# name        [str] => name for the setting
# page        [str] => key for the page
# description [str] => description for the setting
# default     [val] => default value for the setting
execute store result storage micahcraft:settings temp int 1 run scoreboard players get #Key mk.settings.id
scoreboard players add #Key mk.settings.id 1
$data modify storage micahcraft:settings setup.settings.index."$(key)" set from storage micahcraft:settings temp
$data modify storage micahcraft:settings setup.settings.info append value {\
    key:"$(key)",\
    name:"$(name)",\
    page:"$(page)",\
    description:"$(description)",\
}
$data modify storage micahcraft:settings users.default."$(key)" set value $(default)