advancement revoke @s only micahcraft:generated/score_triggers/telekinesis/used/shears
scoreboard players set @s mk.telekinesis.used.shears 0
execute if function micahcraft:enchantments/telekinesis/used/clear/sheared run return fail
function micahcraft:enchantments/telekinesis/used