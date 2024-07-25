# page  [str] => key for the page
# name  [str] => name for the page
# color [hex] => color for the page
execute store result storage micahcraft:settings temp int 1 run scoreboard players get #PageKey mk.settings.id
scoreboard players add #PageKey mk.settings.id 1
$data modify storage micahcraft:settings setup.pages.index."$(page)" set from storage micahcraft:settings temp
$data modify storage micahcraft:settings temp set value {\
    page:"$(page)",\
    name:"$(name)",\
    color:"$(color)",\
}
scoreboard players operation #Value mk.math = #PageKey mk.settings.id
scoreboard players add #Value mk.math 1
execute store result storage micahcraft:settings temp.number int 1 run scoreboard players get #Value mk.math
data modify storage micahcraft:settings setup.pages.info append from storage micahcraft:settings temp