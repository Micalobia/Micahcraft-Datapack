advancement revoke @s only micahcraft:generated/score_triggers/settings/hud/update

execute unless score @s mk.settings.hud.trigger matches 16777216.. run function micahcraft:settings/data/set/toggle {namespace:'hud'}
execute if score @s mk.settings.hud.trigger matches 16777216.. run function micahcraft:settings/data/set/cycle_theme

scoreboard players set @s mk.settings.hud.trigger 0
scoreboard players enable @s mk.settings.hud.trigger
scoreboard players set @s Settings 3