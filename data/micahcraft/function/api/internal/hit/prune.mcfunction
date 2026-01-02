# Should be hooked into the slow tick
execute as @e[type=item_display,tag=mk.api.hit] if score @s mk.api.time <= #mk.api.time mk.api.time run function micahcraft:util/remove