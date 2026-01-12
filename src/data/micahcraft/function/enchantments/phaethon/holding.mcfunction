execute unless entity @s[type=player] run return fail
execute if score @s mk.phaethon.dash matches 19 run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.1 0.8
execute if entity @s[advancements={micahcraft:enchantments/phaethon/holding_dash=false}] run function micahcraft:enchantments/phaethon/dash_cooldown
advancement revoke @s only micahcraft:enchantments/phaethon/holding_dash
schedule function micahcraft:enchantments/phaethon/cool_off 1t append