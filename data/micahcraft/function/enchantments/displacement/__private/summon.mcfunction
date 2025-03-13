$execute positioned $(x) $(y) $(z) unless predicate micahcraft:enchantments/displacement/permeable run return fail
$execute \
    positioned $(x) $(y) $(z) \
    align xyz positioned ~0.5 ~0.5 ~0.5 \
    store result score #Success mk.math run \
    function micahcraft:enchantments/displacement/__private/move
return run scoreboard players get #Success mk.math