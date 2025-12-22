tag @s add mk.hammer.hit
function micahcraft:enchantments/hammer/clear
execute if predicate micahcraft:player/mineable run function micahcraft:enchantments/hammer/hit/summon
tag @s remove mk.hammer.hit