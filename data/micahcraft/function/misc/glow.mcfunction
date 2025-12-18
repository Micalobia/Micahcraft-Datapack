execute align xyz positioned ~0.5 ~0.5 ~0.5 \
    run summon marker ~ ~ ~ {Tags:[mk.misc.glowing,Fresh]}
$scoreboard players set @n[type=marker,tag=Fresh] mk.misc.lifetime $(level)
execute as @n[type=marker,tag=Fresh] at @s run execute as @e[type=marker,tag=mk.misc.glowing,tag=!Fresh,distance=0..0.2] run function micahcraft:util/remove
tag @n[type=marker,tag=Fresh] remove Fresh