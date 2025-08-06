scoreboard objectives add ShowPlaytime trigger {text:"Show Playtime Leaderboard",color:"blue",click_event:{action:"run_command",command:"/trigger ShowPlaytime"}}
scoreboard objectives add mk.ticks_active minecraft.custom:minecraft.play_time
scoreboard objectives add mk.hours_active dummy {text:"Playtime",color:"yellow",bold:true}
team add mk.playtime {text:"Playtime",color:"blue",bold:true,underlined:true}
team modify mk.playtime color blue
scoreboard objectives setdisplay sidebar.team.blue mk.hours_active
scoreboard players set #72000 mk.math 72000
