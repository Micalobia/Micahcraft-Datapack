scoreboard objectives add ShowXP trigger {"text":"Show XP Leaderboard","color":"green","clickEvent":{"action":"run_command","value":"/trigger ShowXP"}}
scoreboard objectives add mk.xp xp {"text":"XP","color":"yellow","bold":true}
team add mk.xp {"text":"XP","color":"green","bold":true,"underlined":true}
team modify mk.xp color green
scoreboard objectives setdisplay sidebar.team.green mk.xp