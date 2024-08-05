scoreboard objectives add mk.measuring.used_carrot minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add mk.measuring.used_warped minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add mk.measuring.id dummy
scoreboard objectives add mk.measuring.state dummy
scoreboard objectives add mk.measuring.x dummy
scoreboard objectives add mk.measuring.y dummy
scoreboard objectives add mk.measuring.z dummy

team add mk.no_collision.red
team add mk.no_collision.blue
team modify mk.no_collision.red color red
team modify mk.no_collision.red collisionRule never
team modify mk.no_collision.blue color blue
team modify mk.no_collision.blue collisionRule never

scoreboard players add #ID mk.measuring.id 0
scoreboard players set #2 mk.math 2
scoreboard players set #-1 mk.math -1