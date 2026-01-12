scoreboard players remove @s mk.phaethon.heat 1
execute if score @s mk.phaethon.heat matches 9 run playsound minecraft:block.candle.extinguish player @a[distance=..16] ~ ~ ~ 1.5 0.8
execute if score @s mk.phaethon.heat matches 6 run playsound minecraft:block.candle.extinguish player @a[distance=..16] ~ ~ ~ 1.2 0.75
execute if score @s mk.phaethon.heat matches 3 run playsound minecraft:block.candle.extinguish player @a[distance=..16] ~ ~ ~ 0.9 0.7
execute if score @s mk.phaethon.heat matches 0 run playsound minecraft:entity.generic.extinguish_fire player @a[distance=..16] ~ ~ ~ 0.15 1.75
function micahcraft:enchantments/phaethon/apply_attack_speed