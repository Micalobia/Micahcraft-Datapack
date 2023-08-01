tag @a[tag=ScanVillager] remove ScanVillager
tag @a[scores={ScanVillager=1..}] add ScanVillager
execute as @a[tag=ScanVillager] at @s as @e[type=villager,sort=nearest,limit=1] at @s run function micahcraft:math/scan_villager
scoreboard players set @a[tag=ScanVillager] ScanVillager 0
scoreboard players enable @a ScanVillager
