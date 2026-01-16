scoreboard players operation #Integer mk.math = #TPS mk.api.tps
scoreboard players operation #Decimal mk.math = #TPS mk.api.tps
scoreboard players operation #Integer mk.math /= #10 mk.math
scoreboard players operation #Decimal mk.math %= #10 mk.math
$data modify storage micahcraft:hud display append value \
{\
    text:"TPS: ",\
    color:"$(cyan)",\
    extra:[\
        {score:{name:"#Integer",objective:"mk.math"}},\
        {text:"."},\
        {score:{name:"#Decimal",objective:"mk.math"}},\
    ]\
}
scoreboard players set #Element mk.math 1