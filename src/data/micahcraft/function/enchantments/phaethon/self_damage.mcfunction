scoreboard players set @s mk.phaethon.cooldown 0
scoreboard players operation @s mk.phaethon.heat < #10 mk.math
$execute if score @s mk.phaethon.heat matches ..3 run function micahcraft:enchantments/phaethon/macros/self_damage {type:"$(type)",damage:1}
$execute if score @s mk.phaethon.heat matches 4..6 run function micahcraft:enchantments/phaethon/macros/self_damage {type:"$(type)",damage:3}
$execute if score @s mk.phaethon.heat matches 7..9 run function micahcraft:enchantments/phaethon/macros/self_damage {type:"$(type)",damage:6}
$execute if score @s mk.phaethon.heat matches 10.. run function micahcraft:enchantments/phaethon/macros/self_damage {type:"$(type)",damage:10}
function micahcraft:enchantments/phaethon/apply_attack_speed