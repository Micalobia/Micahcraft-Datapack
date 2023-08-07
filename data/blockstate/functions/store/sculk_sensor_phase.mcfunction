data remove storage blockstate:data read.sculk_sensor_phase
execute if block ~ ~ ~ #blockstate:sculk_sensor_phase[sculk_sensor_phase=active] run data modify storage blockstate:data read.sculk_sensor_phase set value "active"
execute if block ~ ~ ~ #blockstate:sculk_sensor_phase[sculk_sensor_phase=cooldown] run data modify storage blockstate:data read.sculk_sensor_phase set value "cooldown"
execute if block ~ ~ ~ #blockstate:sculk_sensor_phase[sculk_sensor_phase=inactive] run data modify storage blockstate:data read.sculk_sensor_phase set value "inactive"