advancement revoke @s only micahcraft:generated/score_triggers/hud/trigger
scoreboard players operation @s HUD %= #2 mk.math
execute if score @s HUD matches 0 run title @s actionbar ""