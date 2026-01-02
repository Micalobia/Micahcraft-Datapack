execute unless predicate micahcraft:enchantments/telekinesis/holding run return fail
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=item,dx=0] run data modify entity @s PickupDelay set value 0
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=item,dx=0] at @p[tag=mk.telekinesis.collect] run tp @s ~ ~.5 ~