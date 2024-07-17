execute align xyz positioned ~0.5 ~0.5 ~0.5 \
    run summon marker ~ ~ ~ {Tags:[mk.spectre_shot.glowing,Fresh]}
scoreboard players set @n[type=marker,tag=Fresh] mk.spectre_shot.lifetime 15
tag @n[type=marker,tag=Fresh] remove Fresh