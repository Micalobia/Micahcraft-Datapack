summon item_display ~ ~ ~ {view_range:0,Tags:["mk.boreas.flap","Fresh"]}
item modify entity @s armor.chest micahcraft:damage/elytra_flap
item replace entity @n[type=item_display,tag=Fresh] container.0 from entity @s armor.chest
item replace entity @s armor.chest with air
scoreboard players operation @n[type=item_display,tag=Fresh] mk.misc.player.id = @s mk.misc.player.id
tag @n[type=item_display,tag=Fresh] remove Fresh
tag @s add mk.boreas.flapping
schedule function micahcraft:enchantments/boreas/return 1t replace