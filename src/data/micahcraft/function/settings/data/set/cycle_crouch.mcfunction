# Cycles the crouch setting for an enchant
scoreboard players operation #mk.settings.value mk.math = @s mk.settings.enchantments
$execute store result score #mk.settings.flag mk.math run data get storage micahcraft:settings enchantments.$(path)
$execute store result score #mk.settings.before_value mk.math run function micahcraft:settings/data/get/enchant_crouch {path:'$(path)'}
scoreboard players operation #mk.settings.after_value mk.math = #mk.settings.before_value mk.math
scoreboard players add #mk.settings.after_value mk.math 1
execute if score #mk.settings.after_value mk.math matches 3.. run scoreboard players set #mk.settings.after_value mk.math 0
scoreboard players operation #mk.settings.before_value mk.math *= #mk.settings.flag mk.math
scoreboard players operation #mk.settings.after_value mk.math *= #mk.settings.flag mk.math
scoreboard players operation @s mk.settings.enchantments -= #mk.settings.before_value mk.math
scoreboard players operation @s mk.settings.enchantments += #mk.settings.after_value mk.math