# This is to run the collection for an owner, or any macro UUID
$tag @p[nbt={UUID:$(owner)}] add mk.telekinesis.collect
function micahcraft:enchantments/telekinesis/collect
tag @p[tag=mk.telekinesis.collect] remove mk.telekinesis.collect