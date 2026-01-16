# Used Pickaxe
scoreboard objectives add mk.api.used.wooden_pickaxe minecraft.used:minecraft.wooden_pickaxe
scoreboard objectives add mk.api.used.stone_pickaxe minecraft.used:minecraft.stone_pickaxe
scoreboard objectives add mk.api.used.copper_pickaxe minecraft.used:minecraft.copper_pickaxe
scoreboard objectives add mk.api.used.iron_pickaxe minecraft.used:minecraft.iron_pickaxe
scoreboard objectives add mk.api.used.golden_pickaxe minecraft.used:minecraft.golden_pickaxe
scoreboard objectives add mk.api.used.diamond_pickaxe minecraft.used:minecraft.diamond_pickaxe
scoreboard objectives add mk.api.used.netherite_pickaxe minecraft.used:minecraft.netherite_pickaxe

# Used Axe
scoreboard objectives add mk.api.used.wooden_axe minecraft.used:minecraft.wooden_axe
scoreboard objectives add mk.api.used.stone_axe minecraft.used:minecraft.stone_axe
scoreboard objectives add mk.api.used.copper_axe minecraft.used:minecraft.copper_axe
scoreboard objectives add mk.api.used.iron_axe minecraft.used:minecraft.iron_axe
scoreboard objectives add mk.api.used.golden_axe minecraft.used:minecraft.golden_axe
scoreboard objectives add mk.api.used.diamond_axe minecraft.used:minecraft.diamond_axe
scoreboard objectives add mk.api.used.netherite_axe minecraft.used:minecraft.netherite_axe

# Used Shovel
scoreboard objectives add mk.api.used.wooden_shovel minecraft.used:minecraft.wooden_shovel
scoreboard objectives add mk.api.used.stone_shovel minecraft.used:minecraft.stone_shovel
scoreboard objectives add mk.api.used.copper_shovel minecraft.used:minecraft.copper_shovel
scoreboard objectives add mk.api.used.iron_shovel minecraft.used:minecraft.iron_shovel
scoreboard objectives add mk.api.used.golden_shovel minecraft.used:minecraft.golden_shovel
scoreboard objectives add mk.api.used.diamond_shovel minecraft.used:minecraft.diamond_shovel
scoreboard objectives add mk.api.used.netherite_shovel minecraft.used:minecraft.netherite_shovel

# Used Hoe
scoreboard objectives add mk.api.used.wooden_hoe minecraft.used:minecraft.wooden_hoe
scoreboard objectives add mk.api.used.stone_hoe minecraft.used:minecraft.stone_hoe
scoreboard objectives add mk.api.used.copper_hoe minecraft.used:minecraft.copper_hoe
scoreboard objectives add mk.api.used.iron_hoe minecraft.used:minecraft.iron_hoe
scoreboard objectives add mk.api.used.golden_hoe minecraft.used:minecraft.golden_hoe
scoreboard objectives add mk.api.used.diamond_hoe minecraft.used:minecraft.diamond_hoe
scoreboard objectives add mk.api.used.netherite_hoe minecraft.used:minecraft.netherite_hoe

# Used Shears
scoreboard objectives add mk.api.used.shears minecraft.used:minecraft.shears

# Timestamp
scoreboard objectives add mk.api.time dummy

# TPS
scoreboard objectives add mk.api.tps dummy
function micahcraft:api/internal/tps/create_stopwatch
scoreboard players set #10 mk.math 10
scoreboard players add #ID mk.api.tps 0

# Optional Argument Storage
scoreboard objectives add mk.api.args dummy

function micahcraft:api/internal/tps/calculate
function micahcraft:api/internal/slow_tick