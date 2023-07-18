execute positioned ^ ^ ^.2 align xyz if block ~.5 ~.5 ~.5 #minecraft:stairs run function micahcraft:chair/raycast/hit
execute positioned ^ ^ ^.2 unless block ~ ~ ~ #minecraft:stairs if entity @s[distance=..10] run function micahcraft:chair/raycast/loop
