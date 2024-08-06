scoreboard players set #Result mk.math -1
execute \
    positioned ~ ~-1 ~ \
    if predicate micahcraft:enchantments/displacement/permeable \
    store result score #Result mk.math run \
    function micahcraft:enchantments/displacement/__private/move
execute if score #Result mk.math matches 0 run return fail
execute if score #Result mk.math matches 1 run return 1
execute if score #Unsafe mk.math matches 0 unless predicate micahcraft:enchantments/displacement/no_fluid run return fail
summon marker ~ ~ ~ {Tags:["Fresh"]}
return 1