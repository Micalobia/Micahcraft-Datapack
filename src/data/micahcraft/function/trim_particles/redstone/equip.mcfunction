advancement revoke @s only micahcraft:trim_particles/redstone
execute if predicate micahcraft:trim_particles/redstone/equiped run tag @s add mk.trim_particles.redstone
execute unless predicate micahcraft:trim_particles/redstone/equiped run tag @s remove mk.trim_particles.redstone