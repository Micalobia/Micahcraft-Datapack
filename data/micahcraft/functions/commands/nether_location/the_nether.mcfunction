execute store result score #X Math run data get entity @s Pos[0]
execute store result score #Y Math run data get entity @s Pos[1]
execute store result score #Z Math run data get entity @s Pos[2]
scoreboard players operation #X Math *= #8 Math
scoreboard players operation #Y Math *= #8 Math
scoreboard players operation #Z Math *= #8 Math
tellraw @s [{"text":"Overworld: ","color":"dark_purple"},{"score":{"name":"#X","objective": "Math"},"color":"red"},", ",{"score":{"name":"#Z","objective": "Math"},"color":"blue"}]