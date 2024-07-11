function micahcraft:location/score
scoreboard players operation #X mk.math /= #8 mk.math
scoreboard players set #Y mk.math 64
scoreboard players operation #Z mk.math /= #8 mk.math
function micahcraft:location/storage
data modify storage micahcraft:misc pos.dimension set value "flat_world_preset.minecraft.overworld"
function micahcraft:commands/nether_location/macro with storage micahcraft:misc pos