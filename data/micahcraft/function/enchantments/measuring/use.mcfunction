function retina:traverse/setup
data modify storage micahcraft:measuring none set value "NONE"
execute store success score #Success mk.math run function micahcraft:util/compare {\
    left:"storage micahcraft:measuring none",\
    right:"storage retina:output Target",\
}
execute if score #Success mk.math matches 1 run tellraw @s {"text":"Missed!","color":"red"}
execute if score #Success mk.math matches 1 run return fail
execute store result storage micahcraft:measuring macro.x int 1 run data get storage retina:output TargetedBlock[0]
execute store result storage micahcraft:measuring macro.y int 1 run data get storage retina:output TargetedBlock[1]
execute store result storage micahcraft:measuring macro.z int 1 run data get storage retina:output TargetedBlock[2]
execute if score @s mk.measuring.state matches 0 run function micahcraft:enchantments/measuring/kill
execute if score @s mk.measuring.state matches 0 run data modify storage micahcraft:measuring macro.color set value "red"
execute if score @s mk.measuring.state matches 1 run data modify storage micahcraft:measuring macro.color set value "blue"
function micahcraft:enchantments/measuring/summon with storage micahcraft:measuring macro
execute if score @s mk.measuring.state matches 1 run function micahcraft:enchantments/measuring/math
scoreboard players add @s mk.measuring.state 1
scoreboard players operation @s mk.measuring.state %= #2 mk.math
# execute align xyz positioned ~0.5 ~ ~0.5 run summon magma_cube ~ ~ ~ \
# {NoAI:1b,NoGravity:1b,Tags:["mk.measuring.cube"],Glowing:true,active_effects:[{id:"invisibility",duration:-1}],Invulnerable:true,Size:1}