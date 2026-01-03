advancement revoke @s only micahcraft:generated/score_triggers/settings/world/update

function micahcraft:settings/data/set/toggle {namespace:'world'}

scoreboard players set @s mk.settings.world.trigger 0
scoreboard players enable @s mk.settings.world.trigger
scoreboard players set @s Settings 4