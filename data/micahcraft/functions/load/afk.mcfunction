scoreboard objectives add AFK trigger
scoreboard objectives add TicksAFK minecraft.custom:minecraft.play_time
team add AFK {"text":"AFK","color":"gray","bold":true,"underlined":true} 
team modify AFK color gray 
team modify AFK prefix [{"text":"[","color":"#5454A8","italic":true,"bold":true},{"text":"AFK","color":"#A8A8FF"},{"text":"] ","color":"#5454A8"}] 
function micahcraft:load/afk/movement