# Creates item displays containing information about the block that was hit
tag @s add mk.api.hit
$execute summon item_display run function micahcraft:api/internal/hit/summon_function {function:"$(function)"}
tag @s remove mk.api.hit