data modify entity @s data.Unchecked set from entity @p[tag=Copying] Inventory
data modify entity @s data.Inventory set value []
function micahcraft:grave/filter
data remove entity @s data.Unchecked
data remove entity @s data.CopyItem