$scoreboard players set #Value mk.util.loop $(start)
$scoreboard players set #End mk.util.loop $(length)
scoreboard players operation #End mk.util.loop += #Value mk.util.loop
data modify storage micahcraft:util loop.range set value []
function micahcraft:util/__private/range
$function micahcraft:util/loop {\
    nbt:"storage micahcraft:util loop.range",\
    function:"$(function)",\
}