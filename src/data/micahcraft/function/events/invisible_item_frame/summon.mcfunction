tp @s ^ ^ ^ ~ ~
data modify entity @s[x_rotation=-89..89] transformation set value {left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,-0.5f,0.46875f]}
data modify entity @s[x_rotation=-90..-89] transformation set value {left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.0f,-0.03125f]}
data modify entity @s[x_rotation=89..90] transformation set value {left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.0f,0.96875f]}
data modify entity @s item_display set value 'head'
ride @s mount @n[type=#micahcraft:item_frames,tag=mk.invisible.fresh]
execute on vehicle unless entity @s[type=glow_item_frame] on passengers run loot replace entity @s container.0 loot micahcraft:block/invisible_item_frame
execute on vehicle if entity @s[type=glow_item_frame] on passengers run loot replace entity @s container.0 loot micahcraft:block/invisible_glow_item_frame
execute on vehicle if entity @s[type=glow_item_frame] on passengers run tag @s add mk.invisible.glowing
execute on vehicle run tag @s remove mk.invisible.fresh
tag @s add mk.invisible