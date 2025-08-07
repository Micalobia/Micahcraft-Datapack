function micahcraft:location/score
scoreboard players operation #X mk.math *= #8 mk.math
scoreboard players operation #Z mk.math *= #8 mk.math
function micahcraft:location/storage
data modify storage micahcraft:misc pos.dimension set value "Overworld"
function micahcraft:dialog/dynamic/nether_location/macro with storage micahcraft:misc pos