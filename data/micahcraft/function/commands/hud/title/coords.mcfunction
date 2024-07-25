function micahcraft:location/score
$data modify storage micahcraft:hud display append value {"text":"Coords: ","color":"$(base)"}
$data modify storage micahcraft:hud display append value {"score":{"name":"#X","objective":"mk.math"},"color":"$(red)"}
data modify storage micahcraft:hud display append value {"text":" "}
$data modify storage micahcraft:hud display append value {"score":{"name":"#Y","objective":"mk.math"},"color":"$(green)"}
data modify storage micahcraft:hud display append value {"text":" "}
$data modify storage micahcraft:hud display append value {"score":{"name":"#Z","objective":"mk.math"},"color":"$(blue)"}