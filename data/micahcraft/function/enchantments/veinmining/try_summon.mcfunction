execute unless predicate micahcraft:player/mineable run return fail
execute if score #Blocks mk.math matches 513.. run return fail
execute store result score #Value mk.math run function micahcraft:enchantments/veinmining/data/group
execute if score #Value mk.math matches 0 run return fail
execute unless score #Value mk.math = @s mk.veinmining.group run return fail
execute if entity @n[type=marker,tag=Checked,distance=..0.2] run return fail
function micahcraft:enchantments/veinmining/summon