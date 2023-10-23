execute store result score #X Math run data get entity @s Pos[0] 0.125
execute store result score #Y Math run data get entity @s Pos[1] 0.125
execute store result score #Z Math run data get entity @s Pos[2] 0.125
tellraw @s [{"text":"Nether: ","color":"dark_purple"},{"score":{"name":"#X","objective": "Math"},"color":"red"},", ",{"score":{"name":"#Z","objective": "Math"},"color":"blue"}]