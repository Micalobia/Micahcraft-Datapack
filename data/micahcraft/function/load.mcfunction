scoreboard objectives add mk.math dummy
scoreboard objectives add mk.health health
scoreboard objectives setdisplay list mk.health
function micahcraft:retina_setup
tellraw @a {text:"Successfully loaded Micahcraft!",color:"green"}
