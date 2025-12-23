tag @s add mk.veinmining.holding
tag @s remove mk.veinmining.crouching
tag @s[scores={mk.veinmining.crouching=1..}] add mk.veinmining.crouching
scoreboard players set @s mk.veinmining.crouching 0
schedule function micahcraft:enchantments/veinmining/scheduled_clear 1t append 