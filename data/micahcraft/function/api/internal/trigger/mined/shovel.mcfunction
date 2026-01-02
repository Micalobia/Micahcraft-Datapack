execute store success score #mk.api.success mk.math run advancement revoke @s only micahcraft:api/internal/used/shovel
scoreboard players set @s mk.api.used.wooden_shovel 0
scoreboard players set @s mk.api.used.stone_shovel 0
scoreboard players set @s mk.api.used.copper_shovel 0
scoreboard players set @s mk.api.used.iron_shovel 0
scoreboard players set @s mk.api.used.golden_shovel 0
scoreboard players set @s mk.api.used.diamond_shovel 0
scoreboard players set @s mk.api.used.netherite_shovel 0
execute if score #mk.api.success mk.math matches 1 run return fail
tag @s add mk.api.mined
tag @s add mk.api.mined.shovel
function #micahcraft:api/mined/shovel
function #micahcraft:api/mined/any