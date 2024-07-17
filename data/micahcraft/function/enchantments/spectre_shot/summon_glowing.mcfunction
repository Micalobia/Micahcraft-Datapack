execute align xyz positioned ~0.5 ~0.5 ~0.5 unless entity @n[tag=mk.spectre_shot.glowing,distance=..0.5] \
    run summon marker ~ ~ ~ {Tags:[mk.spectre_shot.glowing]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @n[tag=mk.spectre_shot.glowing] \
    run scoreboard players set @s mk.spectre_shot.lifetime 15