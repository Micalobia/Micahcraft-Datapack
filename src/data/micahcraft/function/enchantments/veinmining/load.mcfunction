# Probably doesn't need to be this high, only needed for instant veinmine
gamerule max_command_forks 16777216
gamerule max_command_sequence_length 16777216

scoreboard objectives add mk.veinmining.group dummy
scoreboard objectives add mk.veinmining.depth dummy
scoreboard objectives add mk.veinmining.mined dummy
scoreboard objectives add mk.veinmining.sound dummy

scoreboard objectives add mk.veinmining.job_id dummy
scoreboard players add #ID mk.veinmining.job_id 0
scoreboard players set #MAX mk.veinmining.job_id 512