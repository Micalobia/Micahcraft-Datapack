execute unless score @s mk.phaethon.heat matches 1.. run return fail
execute unless score @s mk.phaethon.cooldown matches 40.. run return fail
scoreboard players operation #mk.value mk.math = @s mk.phaethon.cooldown
scoreboard players operation #mk.value mk.math %= #10 mk.math
execute if score #mk.value mk.math matches 0 run function micahcraft:enchantments/phaethon/remove_heat