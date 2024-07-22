advancement revoke @s only micahcraft:trim_particles/lapis
execute if predicate micahcraft:trim_particles/lapis/equiped run tag @s add mk.trim_particles.lapis
execute unless predicate micahcraft:trim_particles/lapis/equiped run tag @s remove mk.trim_particles.lapis