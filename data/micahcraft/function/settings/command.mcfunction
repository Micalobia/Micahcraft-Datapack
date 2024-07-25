advancement revoke @s only micahcraft:generated/score_triggers/settings/command
scoreboard players set @s Settings 0
loot replace entity @s weapon.mainhand loot micahcraft:settings_book
function micahcraft:settings/book/add_book_pages
scoreboard players enable @s mk.settings.change