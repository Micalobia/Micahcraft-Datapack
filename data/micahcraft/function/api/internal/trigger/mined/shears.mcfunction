execute store success score #mk.api.success mk.math run advancement revoke @s only micahcraft:api/internal/used/shears
scoreboard players set @s mk.api.used.shears 0
execute if score #mk.api.success mk.math matches 1 run return fail
tag @s add mk.api.mined
tag @s add mk.api.mined.shears
function #micahcraft:api/mined/shears
function #micahcraft:api/mined/any