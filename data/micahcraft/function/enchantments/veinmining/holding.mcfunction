execute anchored eyes raycast 12 block * outline none block summon marker run function micahcraft:enchantments/veinmining/store
function micahcraft:enchantments/veinmining/copy_to_score
tag @s remove mk.veinmining.crouching
tag @s[scores={mk.veinmining.crouching=1..}] add mk.veinmining.crouching
scoreboard players set @s mk.veinmining.crouching 0