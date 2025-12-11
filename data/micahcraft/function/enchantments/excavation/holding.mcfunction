execute anchored eyes store result score @s mk.excavation.face if raycast 12 block exists outline none
scoreboard players add @s mk.excavation.face 2
scoreboard players operation @s mk.excavation.face /= #2 mk.math
execute anchored eyes raycast 12 block * outline none block summon marker run function micahcraft:enchantments/excavation/store
function micahcraft:enchantments/excavation/copy_to_score
tag @s remove mk.excavation.valid
execute store success score #Success mk.math run function micahcraft:enchantments/excavation/check_mined_block with storage micahcraft:excavation
execute if score #Success mk.math matches 1 run tag @s add mk.excavation.valid
tag @s remove mk.excavation.crouching
tag @s[scores={mk.excavation.crouching=1..}] add mk.excavation.crouching
scoreboard players set @s mk.excavation.crouching 0