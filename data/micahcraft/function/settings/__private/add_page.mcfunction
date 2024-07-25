scoreboard players add #Page mk.math 1
execute store result storage micahcraft:settings macro.page int 1 run scoreboard players get #Page mk.math
$item modify entity @s weapon.mainhand micahcraft:add_settings_page/$(page)