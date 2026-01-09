scoreboard players set #Phantom mk.math 72000
scoreboard players operation #Phantom mk.math -= @s mk.hud.slept
scoreboard players operation #Phantom mk.math /= #1200 mk.math
$data modify storage micahcraft:hud display append value {text:"Phantom: ",color:"$(purple)"}
$execute if score #Phantom mk.math matches ..0 run \
    data modify storage micahcraft:hud display append value {text:"Spawning",color:"$(red)"}
$execute if score #Phantom mk.math matches 16..60 run \
    data modify storage micahcraft:hud display append value \
    {score:{name:"#Phantom",objective:"mk.math"},color:"$(green)"}
$execute if score #Phantom mk.math matches 16..60 run \
    data modify storage micahcraft:hud display append value \
    {text:" minutes",color:"$(green)"}
$execute if score #Phantom mk.math matches 1..15 run \
    data modify storage micahcraft:hud display append value \
    {score:{name:"#Phantom",objective:"mk.math"},color:"$(yellow)"}
$execute if score #Phantom mk.math matches 1..15 run \
    data modify storage micahcraft:hud display append value \
    {text:" minutes",color:"$(yellow)"}
scoreboard players set #Element mk.math 1