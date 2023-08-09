scoreboard objectives add ShowXP trigger
scoreboard objectives add XP xp {"text":"XP","color":"yellow","bold":true}
team add XP {"text":"XP","color":"green","bold":true,"underlined":true}
team modify XP color green
scoreboard objectives setdisplay sidebar.team.green XP