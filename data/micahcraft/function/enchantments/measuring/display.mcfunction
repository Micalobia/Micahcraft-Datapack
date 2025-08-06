data modify storage micahcraft:measuring display set value []
data modify storage micahcraft:measuring display append value {text:"Size: ",color:"white"}
data modify storage micahcraft:measuring display append value {score:{name:"#X1",objective:"mk.math"},color:"red"}
data modify storage micahcraft:measuring display append value {text:"x",color:"gray"}
data modify storage micahcraft:measuring display append value {score:{name:"#Y1",objective:"mk.math"},color:"green"}
data modify storage micahcraft:measuring display append value {text:"x",color:"gray"}
data modify storage micahcraft:measuring display append value {score:{name:"#Z1",objective:"mk.math"},color:"blue"}
tellraw @s {storage:"micahcraft:measuring",nbt:"display",interpret:true}