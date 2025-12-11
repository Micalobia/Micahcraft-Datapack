$summon magma_cube ~ ~-0.5 ~ \
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