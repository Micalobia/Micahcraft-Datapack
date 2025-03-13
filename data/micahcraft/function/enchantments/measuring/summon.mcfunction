$execute positioned $(x).0 $(y).0 $(z).0 positioned ~0.5 ~ ~0.5 run summon magma_cube ~ ~ ~ \
{\
    NoAI:1b,\
    NoGravity:1b,\
    Tags:["mk.measuring.cube","Fresh"],\
    Glowing:true,\
    active_effects:[{id:"invisibility",duration:-1,show_particles:false}],\
    Invulnerable:true,\
    Size:1,\
    Team:'mk.no_collision.$(color)',\
}
scoreboard players operation @n[type=magma_cube,tag=Fresh] mk.misc.player.id = @s mk.misc.player.id
tag @n[type=magma_cube,tag=Fresh] remove Fresh