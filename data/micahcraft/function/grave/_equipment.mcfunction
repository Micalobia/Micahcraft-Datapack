$execute if data entity @s equipment.$(slot).components.minecraft:enchantments.micahcraft:soulbound run return fail
$execute if data entity @s equipment.$(slot).components.minecraft:enchantments.minecraft:vanishing_curse run return fail
$data modify storage micahcraft:grave Inventory append from entity @s equipment.$(slot)