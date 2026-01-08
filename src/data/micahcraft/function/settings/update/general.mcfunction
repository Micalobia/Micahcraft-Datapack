# @score_trigger
# scoreboard mk.settings.general.trigger
# value 1..

function micahcraft:settings/data/set/toggle {namespace:'general'}

scoreboard players set @s mk.settings.general.trigger 0
scoreboard players enable @s mk.settings.general.trigger
scoreboard players set @s Settings 2