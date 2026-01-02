execute unless predicate micahcraft:enchantments/telekinesis/holding run return fail
tag @s add mk.telekinesis.collect
function micahcraft:api/hit/run {tag:"mk.telekinesis.hit",function:"micahcraft:enchantments/telekinesis/collect"}
tag @s remove mk.telekinesis.collect