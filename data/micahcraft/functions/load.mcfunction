# Triggers
    scoreboard objectives add SeeHelp trigger
    scoreboard objectives add SeeDeaths trigger
    scoreboard objectives add SeeXP trigger
    scoreboard objectives add SeePlaytime trigger
    scoreboard objectives add SeeHUD trigger
    scoreboard objectives add SetSpawn trigger
    scoreboard objectives add SeeHorseJump trigger
    scoreboard objectives add SeeHorseSpeed trigger
    scoreboard objectives add SeeNetherCoords trigger
    scoreboard objectives add ShareCoords trigger
    scoreboard objectives add SeeDeathLocation trigger
    scoreboard objectives add ScanVillager trigger
    scoreboard objectives add Afk trigger

# Teams
    team add SeeDeaths "See Deaths"
    team modify SeeDeaths color red
    team add SeeXP "See XP Level"
    team modify SeeXP color green
    team add Afk "AFK"
    team modify Afk color gray
    team add SeePlaytime "See Playtime"
    team modify SeePlaytime color blue

# Real Scoreboards
    scoreboard objectives add Deaths deathCount "Deaths"
    scoreboard objectives add Death deathCount
    scoreboard objectives add XP level "XP Level"
    scoreboard objectives add Health health "Health"
    scoreboard objectives add Playtime minecraft.custom:minecraft.play_time
    scoreboard objectives add Aviate minecraft.custom:minecraft.aviate_one_cm
    scoreboard objectives add Boat minecraft.custom:minecraft.boat_one_cm
    scoreboard objectives add Climb minecraft.custom:minecraft.climb_one_cm
    scoreboard objectives add Crouch minecraft.custom:minecraft.crouch_one_cm
    scoreboard objectives add Fly minecraft.custom:minecraft.fly_one_cm
    scoreboard objectives add Horse minecraft.custom:minecraft.horse_one_cm
    scoreboard objectives add Sprint minecraft.custom:minecraft.sprint_one_cm
    scoreboard objectives add Swim minecraft.custom:minecraft.swim_one_cm
    scoreboard objectives add WalkOnWater minecraft.custom:minecraft.walk_on_water_one_cm
    scoreboard objectives add Walk minecraft.custom:minecraft.walk_one_cm
    scoreboard objectives add WalkUnderWater minecraft.custom:minecraft.walk_under_water_one_cm
    scoreboard objectives add TicksAfk minecraft.custom:minecraft.play_time
    scoreboard objectives add Jump minecraft.custom:minecraft.jump
    scoreboard objectives add Strider minecraft.custom:minecraft.strider_one_cm

# Dummies
    scoreboard objectives add Math dummy
    scoreboard objectives add Moving dummy
    scoreboard objectives add PlaytimeDisplay dummy "Playtime"
    scoreboard objectives add GraveID dummy
    scoreboard objectives add TeamID dummy

# Constants
    scoreboard players set #-1 Math -1
    scoreboard players set #8 Math 8
    scoreboard players set #10 Math 10
    scoreboard players set #100 Math 100
    scoreboard players set #1000 Math 1000
    scoreboard players set #1367 Math 1367
    scoreboard players set #2000 Math 2000
    scoreboard players set #5007 Math 5007
    scoreboard players set #9113 Math 9113
    scoreboard players set #42158 Math 42158
    scoreboard players set #72000 Math 72000

# Display
    scoreboard objectives setdisplay sidebar.team.red Deaths
    scoreboard objectives setdisplay sidebar.team.green XP
    scoreboard objectives setdisplay sidebar.team.blue PlaytimeDisplay
    scoreboard objectives setdisplay list Health

# Misc
    scoreboard players add #ID GraveID 0

tellraw @a {"text":"Successfully loaded Micahcraft","color":"green"}
