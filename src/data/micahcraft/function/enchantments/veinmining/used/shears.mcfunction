advancement revoke @s only micahcraft:generated/score_triggers/veinmining/used/shears
scoreboard players set @s mk.veinmining.used.shears 0
execute if function micahcraft:enchantments/veinmining/used/clear/sheared run return fail
function micahcraft:enchantments/veinmining/used