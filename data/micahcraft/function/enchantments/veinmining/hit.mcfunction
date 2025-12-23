tag @s add mk.veinmining.hit
function micahcraft:enchantments/veinmining/clear
execute if predicate micahcraft:player/mineable run function micahcraft:enchantments/veinmining/hit/summon
tag @s remove mk.veinmining.hit