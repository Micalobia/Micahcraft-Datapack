$summon experience_orb ~ ~ ~ {Count:1,Value:$(value)s,Age:0s,Tags:["Fresh"]}
execute as @n[type=experience_orb,tag=Fresh] run function micahcraft:util/__private/random_orb
tag @n[type=experience_orb,tag=Fresh] remove Fresh
$scoreboard players remove #XP mk.math $(value)