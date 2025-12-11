execute anchored eyes store result score @s mk.quarry.face if raycast 12 block exists outline none
scoreboard players add @s mk.quarry.face 2
scoreboard players operation @s mk.quarry.face /= #2 mk.math
execute anchored eyes raycast 12 block * outline none block summon marker run function micahcraft:enchantments/quarry/store
function micahcraft:enchantments/quarry/copy_to_score
tag @s remove mk.quarry.valid
execute store success score #Success mk.math run function micahcraft:enchantments/quarry/check_mined_block with storage micahcraft:quarry
execute if score #Success mk.math matches 1 run tag @s add mk.quarry.valid
tag @s remove mk.quarry.crouching
tag @s[scores={mk.quarry.crouching=1..}] add mk.quarry.crouching
scoreboard players set @s mk.quarry.crouching 0