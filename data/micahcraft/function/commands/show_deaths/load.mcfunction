scoreboard objectives add ShowDeaths trigger {"text":"Show Death Leaderboard","color":"red","clickEvent":{"action":"run_command","value":"/trigger ShowDeaths"}}
scoreboard objectives add Deaths deathCount {"text":"Deaths","color":"yellow","bold":true}
team add Deaths {"text":"Deaths","color":"red","bold":true,"underlined":true}
team modify Deaths color red
scoreboard objectives setdisplay sidebar.team.red Deaths