# Returns the theme of the hud. Greedy, returns all remaining bits.
scoreboard players operation #mk.settings.value mk.math = @s mk.settings.hud
execute store result score #mk.settings.flag mk.math run data get storage micahcraft:settings hud.theme 1
scoreboard players operation #mk.settings.value mk.math /= #mk.settings.flag mk.math
return run scoreboard players get #mk.settings.value mk.math