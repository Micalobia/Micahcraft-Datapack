execute as @e[predicate=micahcraft:silent,distance=..10] run data modify entity @s Silent set value true
execute as @e[predicate=!micahcraft:silent,distance=..10] run data modify entity @s Silent set value false
advancement revoke @s only micahcraft:events/silence