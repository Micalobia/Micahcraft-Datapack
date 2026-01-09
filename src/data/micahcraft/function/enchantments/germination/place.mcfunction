execute if entity @s[tag=mk.germination.hit.beetroots] if predicate micahcraft:location/plant_farmland run setblock ~ ~ ~ beetroots[age=0] replace
execute if entity @s[tag=mk.germination.hit.carrots] if predicate micahcraft:location/plant_farmland run setblock ~ ~ ~ carrots[age=0] replace
execute if entity @s[tag=mk.germination.hit.nether_wart] if predicate micahcraft:location/plant_soul_sand run setblock ~ ~ ~ nether_wart[age=0] replace
execute if entity @s[tag=mk.germination.hit.potatoes] if predicate micahcraft:location/plant_farmland run setblock ~ ~ ~ potatoes[age=0] replace
execute if entity @s[tag=mk.germination.hit.wheat] if predicate micahcraft:location/plant_farmland run setblock ~ ~ ~ wheat[age=0] replace
function micahcraft:util/remove