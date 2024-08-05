advancement revoke @s only micahcraft:generated/score_triggers/measuring/used_carrot
advancement revoke @s only micahcraft:generated/score_triggers/measuring/used_warped
scoreboard players set @s mk.measuring.used_carrot 0
scoreboard players set @s mk.measuring.used_warped 0
execute if data entity @s SelectedItem.components.minecraft:enchantments.levels.micahcraft:measuring run \
    function micahcraft:enchantments/measuring/use