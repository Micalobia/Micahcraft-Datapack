execute align xyz run summon minecraft:interaction ~0.5 ~-0.01 ~0.5 {height:1.02,width:1.02,Tags:["ChairBox","Fresh"]}
execute align xyz run summon minecraft:interaction ~0.5 ~0.25 ~0.5 {height:0,width:0,Tags:["ChairSit","Fresh"]}
execute align xyz run particle flame ~0.5 ~0.5 ~0.5 0.25 0.25 0.25 0.01 20 normal
scoreboard players operation @e[tag=Fresh,limit=2] ChairID = #ID ChairID
scoreboard players add #ID ChairID 1
tag @e[tag=Fresh,limit=2] remove Fresh
