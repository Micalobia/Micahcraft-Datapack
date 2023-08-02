scoreboard players operation #Color Math = @s Lifetime
scoreboard players operation #Color Math *= #256 Math
execute if entity @s[tag=Recent] run scoreboard players add #Color Math 255
execute unless entity @s[tag=Recent] run scoreboard players operation #Color Math += @s Lifetime
scoreboard players operation #Color Math *= #256 Math
execute if entity @s[tag=Recent] run scoreboard players operation #Color Math += @s Lifetime
execute unless entity @s[tag=Recent] run scoreboard players add #Color Math 255
execute store result entity @s glow_color_override int 1 run scoreboard players get #Color Math