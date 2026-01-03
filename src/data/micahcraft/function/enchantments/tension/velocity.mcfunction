# For some reason, the `projectile_spawned` effect in an enchantment runs the function before motion data is set, so we wait a tick
tag @s add mk.tension.unchanged
schedule function micahcraft:enchantments/tension/change 1t