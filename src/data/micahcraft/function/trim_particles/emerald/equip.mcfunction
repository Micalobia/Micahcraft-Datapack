advancement revoke @s only micahcraft:trim_particles/emerald
execute if predicate micahcraft:trim_particles/emerald/equiped run tag @s add mk.trim_particles.emerald
execute unless predicate micahcraft:trim_particles/emerald/equiped run tag @s remove mk.trim_particles.emerald