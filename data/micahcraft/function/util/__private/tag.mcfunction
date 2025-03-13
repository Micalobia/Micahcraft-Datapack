execute store success score #Success mk.math run function micahcraft:util/compare {\
    left:"storage micahcraft:util tag_player.uuid",\
    right:"entity @s UUID",\
}
execute if score #Success mk.math matches 0 run return fail
tag @s add mk.tag_player
return 1