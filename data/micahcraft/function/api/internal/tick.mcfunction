scoreboard players add #mk.api.time mk.api.time 1
tag @a remove mk.api.mined
tag @a remove mk.api.mined.axe
tag @a remove mk.api.mined.hoe
tag @a remove mk.api.mined.pickaxe
tag @a remove mk.api.mined.shears
tag @a remove mk.api.mined.shovel
execute as @a if predicate micahcraft:api/internal/used/axe at @s run function micahcraft:api/internal/trigger/mined/axe
execute as @a if predicate micahcraft:api/internal/used/hoe at @s run function micahcraft:api/internal/trigger/mined/hoe
execute as @a if predicate micahcraft:api/internal/used/pickaxe at @s run function micahcraft:api/internal/trigger/mined/pickaxe
execute as @a if predicate micahcraft:api/internal/used/shears at @s run function micahcraft:api/internal/trigger/mined/shears
execute as @a if predicate micahcraft:api/internal/used/shovel at @s run function micahcraft:api/internal/trigger/mined/shovel