execute store success score #mk.api.success mk.math run advancement revoke @s only micahcraft:api/internal/used/axe
scoreboard players set @s mk.api.used.wooden_axe 0
scoreboard players set @s mk.api.used.stone_axe 0
scoreboard players set @s mk.api.used.copper_axe 0
scoreboard players set @s mk.api.used.iron_axe 0
scoreboard players set @s mk.api.used.golden_axe 0
scoreboard players set @s mk.api.used.diamond_axe 0
scoreboard players set @s mk.api.used.netherite_axe 0
execute if score #mk.api.success mk.math matches 1 run return fail
tag @s add mk.api.mined
tag @s add mk.api.mined.axe
function #micahcraft:api/mined/axe
function #micahcraft:api/mined/any