advancement revoke @s only micahcraft:generated/score_triggers/settings/change
scoreboard players operation #Change mk.settings.id = @s Settings
scoreboard players set @s Settings 0
execute if score #Change mk.settings.id matches 1 run return fail

scoreboard players remove #Change mk.settings.id 2
execute store result storage micahcraft:settings macro.index int 1 run scoreboard players get #Change mk.settings.id
function micahcraft:settings/__private/change with storage micahcraft:settings macro

loot replace entity @s weapon.mainhand loot micahcraft:settings_book
function micahcraft:settings/book/add_book_pages