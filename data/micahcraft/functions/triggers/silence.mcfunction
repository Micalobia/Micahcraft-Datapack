execute as @e[name=Quiet,distance=..7] run data modify entity @s Silent set value true
execute as @e[name=quiet,distance=..7] run data modify entity @s Silent set value true
execute as @e[name=!quiet,name=!Quiet,distance=..7] run data modify entity @s Silent set value false
advancement revoke @s only micahcraft:silence