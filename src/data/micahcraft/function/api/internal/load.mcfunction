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

# Movement
scoreboard objectives add mk.api.climb minecraft.custom:minecraft.climb_one_cm
scoreboard objectives add mk.api.crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add mk.api.fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add mk.api.fly minecraft.custom:minecraft.fly_one_cm
scoreboard objectives add mk.api.sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add mk.api.swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add mk.api.walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add mk.api.walk_on_water minecraft.custom:minecraft.walk_on_water_one_cm
scoreboard objectives add mk.api.walk_under_water minecraft.custom:minecraft.walk_under_water_one_cm
scoreboard objectives add mk.api.boat minecraft.custom:minecraft.boat_one_cm
scoreboard objectives add mk.api.aviate minecraft.custom:minecraft.aviate_one_cm
scoreboard objectives add mk.api.horse minecraft.custom:minecraft.horse_one_cm
scoreboard objectives add mk.api.minecart minecraft.custom:minecraft.minecart_one_cm
scoreboard objectives add mk.api.pig minecraft.custom:minecraft.pig_one_cm
scoreboard objectives add mk.api.strider minecraft.custom:minecraft.strider_one_cm
scoreboard objectives add mk.api.jump minecraft.custom:minecraft.jump
scoreboard objectives add mk.api.fishing_movement minecraft.custom:minecraft.fish_caught
scoreboard objectives add mk.api.ghast minecraft.custom:minecraft.happy_ghast_one_cm
scoreboard objectives add mk.api.nautilus minecraft.custom:minecraft.nautilus_one_cm

# Died
scoreboard objectives add mk.api.died deathCount

# Timestamp
scoreboard objectives add mk.api.time dummy

# Optional Argument Storage
scoreboard objectives add mk.api.args dummy

function micahcraft:api/internal/slow_tick