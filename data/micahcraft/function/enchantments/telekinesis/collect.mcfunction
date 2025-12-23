tag @s add mk.telekinesis.collect
execute as @e[type=item,distance=..0.8660254038] run data modify entity @s PickupDelay set value 0
execute as @e[type=item,distance=..0.8660254038] at @p[tag=mk.telekinesis.collect] run tp @s ~ ~.5 ~
tag @s remove mk.telekinesis.collect