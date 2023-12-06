execute if block ~ ~ ~ #minecraft:stairs[facing=north,shape=straight] positioned ~ ~ ~0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=north,shape=inner_right] positioned ~-0.25 ~ ~0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=east,shape=inner_left] positioned ~-0.25 ~ ~0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=east,shape=straight] positioned ~-0.25 ~ ~ run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=east,shape=inner_right] positioned ~-0.25 ~ ~-0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=south,shape=inner_left] positioned ~-0.25 ~ ~-0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=south,shape=straight] positioned ~ ~ ~-0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=south,shape=inner_right] positioned ~0.25 ~ ~-0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=west,shape=inner_left] positioned ~0.25 ~ ~-0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=west,shape=straight] positioned ~0.25 ~ ~ run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=west,shape=inner_right] positioned ~0.25 ~ ~0.25 run function micahcraft:tick/chair/ride/create_seat
execute if block ~ ~ ~ #minecraft:stairs[facing=north,shape=inner_left] positioned ~0.25 ~ ~0.25 run function micahcraft:tick/chair/ride/create_seat
execute positioned ~ ~-0.5 ~ run data remove entity @e[type=interaction,tag=Chair,tag=Box,limit=1,sort=nearest] interaction
