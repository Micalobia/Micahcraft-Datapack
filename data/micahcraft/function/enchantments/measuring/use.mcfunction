scoreboard players set #Success mk.math 0
execute anchored eyes unless raycast 32 block exists outline source run scoreboard players set #Success mk.math 1
execute if score #Success mk.math matches 1 run tellraw @s {"text":"Missed!","color":"red"}
execute if score #Success mk.math matches 1 run return fail
execute if score @s mk.measuring.state matches 0 run function micahcraft:enchantments/measuring/kill
execute if score @s mk.measuring.state matches 0 run data modify storage micahcraft:measuring macro.color set value "red"
execute if score @s mk.measuring.state matches 1 run data modify storage micahcraft:measuring macro.color set value "blue"
execute anchored eyes raycast 32 block * outline source block run function micahcraft:enchantments/measuring/summon with storage micahcraft:measuring macro
execute if score @s mk.measuring.state matches 1 run function micahcraft:enchantments/measuring/math
scoreboard players add @s mk.measuring.state 1
scoreboard players operation @s mk.measuring.state %= #2 mk.math