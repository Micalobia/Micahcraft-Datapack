function micahcraft:getters/coords
execute store result score $SatInt Math run data get entity @s foodSaturationLevel
execute store result score $SatDec Math run data get entity @s foodSaturationLevel 10
scoreboard players operation $SatDec Math %= $10 Math
execute if entity @s[tag=DarkHUD] run title @s actionbar [{"text":"Coords: ","color":"black"},{"score":{"name":"$X","objective":"Math"},"color":"black"},{"text":" "},{"score":{"name":"$Y","objective":"Math"},"color":"black"},{"text":" "},{"score":{"name":"$Z","objective":"Math"},"color":"black"},{"text":" "},{"text":"Saturation: ","color":"gold"},{"score":{"name":"$SatInt","objective":"Math"},"color":"gold"},{"text":".","color":"gold"},{"score":{"name":"$SatDec","objective":"Math"},"color":"gold"}]
execute if entity @s[tag=LightHUD] run title @s actionbar [{"text":"Coords: ","color":"white"},{"score":{"name":"$X","objective":"Math"},"color":"white"},{"text":" "},{"score":{"name":"$Y","objective":"Math"},"color":"white"},{"text":" "},{"score":{"name":"$Z","objective":"Math"},"color":"white"},{"text":" "},{"text":"Saturation: ","color":"yellow"},{"score":{"name":"$SatInt","objective":"Math"},"color":"yellow"},{"text":".","color":"yellow"},{"score":{"name":"$SatDec","objective":"Math"},"color":"yellow"}]
