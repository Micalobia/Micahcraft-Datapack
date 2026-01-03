function micahcraft:events/day_counter/animation/frame8
execute as @a[tag=mk.day_counter.enabled,tag=mk.day_counter.sound] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ .4 2
execute as @a[tag=mk.day_counter.enabled,tag=mk.day_counter.sound] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ .4 1.5
execute as @a[tag=mk.day_counter.enabled,tag=mk.day_counter.sound] at @s run playsound minecraft:block.copper.break master @s ~ ~ ~ .5 .6