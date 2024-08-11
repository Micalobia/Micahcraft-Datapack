scoreboard players operation #Value mk.math = @s mk.apollo.timer
scoreboard players operation #Value mk.math /= #10 mk.math
scoreboard players operation #Value mk.math %= #6 mk.math
execute if score #Value mk.math matches 5 run particle dust_color_transition{scale:1,from_color:[1f,0f,0f],to_color:[1f,1f,0f]} ~ ~1 ~ 0.2 0.5 0.2 0 3
execute if score #Value mk.math matches 4 run particle dust_color_transition{scale:1,from_color:[1f,1f,0f],to_color:[0f,1f,0f]} ~ ~1 ~ 0.2 0.5 0.2 0 3
execute if score #Value mk.math matches 3 run particle dust_color_transition{scale:1,from_color:[0f,1f,0f],to_color:[0f,1f,1f]} ~ ~1 ~ 0.2 0.5 0.2 0 3
execute if score #Value mk.math matches 2 run particle dust_color_transition{scale:1,from_color:[0f,1f,1f],to_color:[0f,0f,1f]} ~ ~1 ~ 0.2 0.5 0.2 0 3
execute if score #Value mk.math matches 1 run particle dust_color_transition{scale:1,from_color:[0f,0f,1f],to_color:[1f,0f,1f]} ~ ~1 ~ 0.2 0.5 0.2 0 3
execute if score #Value mk.math matches 0 run particle dust_color_transition{scale:1,from_color:[1f,0f,1f],to_color:[1f,0f,0f]} ~ ~1 ~ 0.2 0.5 0.2 0 3