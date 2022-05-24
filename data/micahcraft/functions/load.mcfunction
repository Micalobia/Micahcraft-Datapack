# Triggers
scoreboard objectives add SeeDeaths trigger
scoreboard objectives add SeeXP trigger
scoreboard objectives add SeeHUD trigger
scoreboard objectives add SetSpawn trigger
scoreboard objectives add SeeHelp trigger
scoreboard objectives add SeeHorseJump trigger
scoreboard objectives add SeeHorseSpeed trigger

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
scoreboard players set $_1 Math -1
scoreboard players set $100 Math 100
scoreboard players set $1000 Math 1000
scoreboard players set $5007 Math 5007
scoreboard players set $9113 Math 9113
scoreboard players set $2000 Math 2000
scoreboard players set $1367 Math 1367
scoreboard players set $4317 Math 4317


# Display
scoreboard objectives setdisplay sidebar.team.red Deaths
scoreboard objectives setdisplay sidebar.team.green XP
scoreboard objectives setdisplay list Health

tellraw @a {"text":"Successfully loaded Micahcraft","color":"green"}