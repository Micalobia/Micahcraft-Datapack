execute unless function micahcraft:events/invisible_item_frame/tick/has_item_frame at @s run return run function micahcraft:events/invisible_item_frame/tick/convert
execute at @s unless entity @p[distance=..10] run return 1
execute if entity @s[tag=mk.invisible.hidden] on vehicle unless items entity @s container.0 * on passengers run return run function micahcraft:events/invisible_item_frame/tick/show
execute if entity @s[tag=!mk.invisible.hidden] on vehicle if items entity @s container.0 * on passengers run return run function micahcraft:events/invisible_item_frame/tick/hide