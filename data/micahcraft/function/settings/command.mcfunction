advancement revoke @s only micahcraft:generated/score_triggers/settings/command
scoreboard players set @s Settings 0
execute if function #micahcraft:settings/invalid run return fail
execute as @a[tag=mk.settings.has_book] run function micahcraft:settings/ghost
tag @s add mk.settings.has_book
loot replace entity @s weapon.mainhand loot micahcraft:settings_book
function micahcraft:settings/book/add_book_pages