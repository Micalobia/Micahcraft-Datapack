execute if entity @s[tag=mk.veinmining.scheduled.tilled] run function micahcraft:enchantments/veinmining/used/clear/tilled
execute if entity @s[tag=mk.veinmining.scheduled.sheared] run function micahcraft:enchantments/veinmining/used/clear/sheared
execute if entity @s[tag=mk.veinmining.scheduled.stripped] run function micahcraft:enchantments/veinmining/used/clear/stripped
execute if entity @s[tag=mk.veinmining.scheduled.made_path] run function micahcraft:enchantments/veinmining/used/clear/made_path
tag @s remove mk.veinmining.scheduled
tag @s remove mk.veinmining.scheduled.tilled
tag @s remove mk.veinmining.scheduled.sheared
tag @s remove mk.veinmining.scheduled.stripped
tag @s remove mk.veinmining.scheduled.made_path