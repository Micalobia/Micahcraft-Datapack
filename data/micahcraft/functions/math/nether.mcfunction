function micahcraft:getters/coords
execute if entity @s[tag=Overworld] run scoreboard players add $X Math 4
execute if entity @s[tag=Overworld] run scoreboard players add $Z Math 4
execute if entity @s[tag=Overworld] run scoreboard players operation $X Math /= $8 Math
execute if entity @s[tag=Overworld] run scoreboard players operation $Z Math /= $8 Math
execute if entity @s[tag=Nether] run scoreboard players operation $X Math *= $8 Math
execute if entity @s[tag=Nether] run scoreboard players operation $Z Math *= $8 Math
tellraw @s[tag=Overworld] [{"text":"Nether coords: ","color":"dark_purple"},{"score":{"name":"$X","objective": "Math"}},", ",{"score":{"name":"$Z","objective": "Math"}}]
tellraw @s[tag=Nether] [{"text":"Overworld coords: ","color":"dark_purple"},{"score":{"name":"$X","objective": "Math"}},", ",{"score":{"name":"$Z","objective": "Math"}}]
