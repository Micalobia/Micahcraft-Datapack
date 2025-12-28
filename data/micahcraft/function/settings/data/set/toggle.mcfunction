# Toggles 1 bit flag
$scoreboard players operation #mk.settings.value mk.math = @s mk.settings.$(namespace)
$scoreboard players operation #mk.settings.flag mk.math = @s mk.settings.$(namespace).trigger
scoreboard players operation #mk.settings.value mk.math /= #mk.settings.flag mk.math
scoreboard players operation #mk.settings.value mk.math %= #2 mk.math
$execute if score #mk.settings.value mk.math matches 1 run scoreboard players operation @s mk.settings.$(namespace) -= #mk.settings.flag mk.math
$execute unless score #mk.settings.value mk.math matches 1 run scoreboard players operation @s mk.settings.$(namespace) += #mk.settings.flag mk.math