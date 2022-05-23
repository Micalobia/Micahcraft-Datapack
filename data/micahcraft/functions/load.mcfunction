# Triggers
scoreboard objectives add SeeDeaths trigger
scoreboard objectives add SeeXP trigger
scoreboard objectives add SeeHUD trigger
scoreboard objectives add SetSpawn trigger
scoreboard objectives add SeeHelp trigger

# Teams
team add SeeDeaths "See Deaths"
team modify SeeDeaths color red
team add SeeXP "See XP Level"
team modify SeeXP color green

# Real Scoreboards
scoreboard objectives add Deaths deathCount "Deaths"
scoreboard objectives add XP level "XP Level"
scoreboard objectives add Health health "Health"

# Dummies
scoreboard objectives add Math dummy

# Constants
scoreboard players set $10 Math 10

# Display
scoreboard objectives setdisplay sidebar.team.red Deaths
scoreboard objectives setdisplay sidebar.team.green XP
scoreboard objectives setdisplay list Health

tellraw @a {"text":"Successfully loaded Micahcraft","color":"green"}