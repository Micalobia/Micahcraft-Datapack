execute store success score #mk.api.success mk.math run advancement revoke @s only micahcraft:api/internal/used/hoe
scoreboard players set @s mk.api.used.wooden_hoe 0
scoreboard players set @s mk.api.used.stone_hoe 0
scoreboard players set @s mk.api.used.copper_hoe 0
scoreboard players set @s mk.api.used.iron_hoe 0
scoreboard players set @s mk.api.used.golden_hoe 0
scoreboard players set @s mk.api.used.diamond_hoe 0
scoreboard players set @s mk.api.used.netherite_hoe 0
execute if score #mk.api.success mk.math matches 1 run return fail
tag @s add mk.api.mined
tag @s add mk.api.mined.hoe
function #micahcraft:api/mined/hoe
function #micahcraft:api/mined/any