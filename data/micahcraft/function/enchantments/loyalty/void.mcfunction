execute as @e[type=trident] \
    if data entity @s item.components.'minecraft:enchantments'.levels.'minecraft:loyalty' \
    at @s if predicate micahcraft:enchantments/loyalty/in_void \
    run data modify entity @s DealtDamage set value true
execute as @e[type=trident] \
    if data entity @s item.components.'minecraft:enchantments'.levels.'minecraft:loyalty' \
    run schedule function micahcraft:enchantments/loyalty/void 1t replace