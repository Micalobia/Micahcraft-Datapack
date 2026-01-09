# @score_trigger
# scoreboard mk.settings.enchantments.trigger

execute if score @s mk.settings.enchantments.trigger matches 1 run function micahcraft:settings/data/set/cycle_crouch {path:'veinmine_crouch'}
execute if score @s mk.settings.enchantments.trigger matches 4 run function micahcraft:settings/data/set/cycle_crouch {path:'hammer_crouch'}
execute unless score @s mk.settings.enchantments.trigger matches 1..4 run function micahcraft:settings/data/set/toggle {namespace:'enchantments'}

scoreboard players set @s mk.settings.enchantments.trigger 0
scoreboard players enable @s mk.settings.enchantments.trigger
scoreboard players set @s Settings 5