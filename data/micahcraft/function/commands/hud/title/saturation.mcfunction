execute store result score #Integer mk.math run data get entity @s foodSaturationLevel
execute store result score #Decimal mk.math run data get entity @s foodSaturationLevel 10
scoreboard players operation #Decimal mk.math %= #10 mk.math
$data modify storage micahcraft:hud display append value \
{\
    "text":"Saturation: ",\
    "color":"$(yellow)",\
    "extra":[\
        {"score":{"name":"#Integer","objective":"mk.math"}},\
        {"text":"."},\
        {"score":{"name":"#Decimal","objective":"mk.math"}},\
    ]\
}
