scoreboard objectives add AFK trigger {text:"Go AFK",color:"#A8A8FF",click_event:{action:"run_command",command:"/trigger AFK"}}
scoreboard objectives add mk.ticks_afk minecraft.custom:minecraft.play_time
team add mk.afk {text:"AFK",color:"gray",bold:true,underlined:true}
team modify mk.afk color gray 
team modify mk.afk prefix [{text:"[",color:"#5454A8",italic:true,bold:true},{text:"AFK",color:"#A8A8FF"},{text:"] ",color:"#5454A8"}] 

scoreboard objectives add mk.afk.last_team dummy

scoreboard objectives add mk.climb minecraft.custom:minecraft.climb_one_cm
scoreboard objectives add mk.crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add mk.fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add mk.fly minecraft.custom:minecraft.fly_one_cm
scoreboard objectives add mk.sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add mk.swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add mk.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add mk.walk_on_water minecraft.custom:minecraft.walk_on_water_one_cm
scoreboard objectives add mk.walk_under_water minecraft.custom:minecraft.walk_under_water_one_cm
scoreboard objectives add mk.boat minecraft.custom:minecraft.boat_one_cm
scoreboard objectives add mk.aviate minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add mk.horse minecraft.custom:minecraft.horse_one_cm
scoreboard objectives add mk.minecart minecraft.custom:minecraft.minecart_one_cm
scoreboard objectives add mk.pig minecraft.custom:minecraft.pig_one_cm
scoreboard objectives add mk.strider minecraft.custom:minecraft.strider_one_cm
scoreboard objectives add mk.jump minecraft.custom:minecraft.jump
scoreboard objectives add mk.fishing_movement minecraft.custom:minecraft.fish_caught
scoreboard objectives add mk.ghast minecraft.custom:minecraft.happy_ghast_one_cm
scoreboard objectives add mk.nautilus minecraft.custom:minecraft.nautilus_one_cm