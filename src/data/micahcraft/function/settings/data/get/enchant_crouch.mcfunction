# Returns two bit flags
# 00 (0) -> Always
# 01 (1) -> When Crouched
# 10 (2) -> Unused
# 11 (3) -> When Uncrouched
scoreboard players operation #mk.settings.value mk.math = @s mk.settings.enchantments
$execute store result score #mk.settings.flag mk.math run data get storage micahcraft:settings enchantments.$(path) 1
scoreboard players operation #mk.settings.value mk.math /= #mk.settings.flag mk.math
scoreboard players operation #mk.settings.value mk.math %= #4 mk.math
return run scoreboard players get #mk.settings.value mk.math