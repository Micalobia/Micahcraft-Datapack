$scoreboard players set #XP mk.math $(points)
execute if score #XP mk.math matches ..0 run return fail
function micahcraft:util/__private/orb