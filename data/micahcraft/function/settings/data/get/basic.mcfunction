# Returns 1 bit flag
$scoreboard players operation #mk.settings.value mk.math = @s mk.settings.$(namespace)
$execute store result score #mk.settings.flag mk.math run data get storage micahcraft:settings $(namespace).$(path) 1
scoreboard players operation #mk.settings.value mk.math /= #mk.settings.flag mk.math
scoreboard players operation #mk.settings.value mk.math %= #2 mk.math
return run scoreboard players get #mk.settings.value mk.math