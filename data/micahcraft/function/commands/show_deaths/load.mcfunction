scoreboard objectives add ShowDeaths trigger {"text":"Show Death Leaderboard","color":"red","clickEvent":{"action":"run_command","value":"/trigger ShowDeaths"}}
scoreboard objectives add mk.deaths deathCount {"text":"Deaths","color":"yellow","bold":true}
team add mk.deaths {"text":"Deaths","color":"red","bold":true,"underlined":true}
team modify mk.deaths color red
scoreboard objectives setdisplay sidebar.team.red mk.deaths