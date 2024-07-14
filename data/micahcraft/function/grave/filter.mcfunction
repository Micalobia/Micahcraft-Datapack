data modify entity @s data.CopyItem set from entity @s data.Unchecked[0]
data remove entity @s data.CopyItem.Slot
data remove entity @s data.Unchecked[0]
execute unless data entity @s data.CopyItem.components.minecraft:enchantments.levels.micahcraft:soulbound \
    run data modify entity @s data.Inventory append from entity @s data.CopyItem
execute unless entity @s[predicate=micahcraft:grave/done_filtering] run function micahcraft:grave/filter