scoreboard objectives add ShowPlaytime trigger {"text":"Show Playtime Leaderboard","color":"blue","clickEvent":{"action":"run_command","value":"/trigger ShowPlaytime"}}
scoreboard objectives add TicksActive minecraft.custom:minecraft.play_time
scoreboard objectives add HoursActive dummy {"text":"Playtime","color":"yellow","bold":true}
team add Playtime {"text":"Playtime","color":"blue","bold":true,"underlined":true}
team modify Playtime color blue
scoreboard objectives setdisplay sidebar.team.blue HoursActive
scoreboard players set #72000 Math 72000
