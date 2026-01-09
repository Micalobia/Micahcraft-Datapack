execute if entity @s[tag=mk.invisible.glowing] run tag @n[distance=..2,type=item,tag=!mk.invisible.converted,nbt={Item:{id:"minecraft:glow_item_frame"}}] add mk.invisible.started
execute unless entity @s[tag=mk.invisible.glowing] run tag @n[distance=..2,type=item,tag=!mk.invisible.converted,nbt={Item:{id:"minecraft:item_frame"}}] add mk.invisible.started
execute if entity @s[tag=mk.invisible.glowing] run loot replace entity @n[type=item,tag=mk.invisible.started] container.0 loot micahcraft:invisible_glow_item_frame
execute unless entity @s[tag=mk.invisible.glowing] run loot replace entity @n[type=item,tag=mk.invisible.started] container.0 loot micahcraft:invisible_item_frame
tag @n[type=item,tag=mk.invisible.started] add mk.invisible.converted
tag @n[type=item,tag=mk.invisible.started] remove mk.invisible.started
function micahcraft:util/remove