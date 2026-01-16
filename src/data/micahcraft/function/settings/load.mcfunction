scoreboard objectives add Settings trigger {text:'Settings'}
scoreboard objectives add mk.settings.general dummy
scoreboard objectives add mk.settings.hud dummy
scoreboard objectives add mk.settings.world dummy
scoreboard objectives add mk.settings.enchantments dummy

scoreboard objectives add mk.settings.general.trigger trigger
scoreboard objectives add mk.settings.hud.trigger trigger
scoreboard objectives add mk.settings.world.trigger trigger
scoreboard objectives add mk.settings.enchantments.trigger trigger

data modify storage micahcraft:settings general set value {\
    day_counter_enabled:1,\
    day_counter_sound:2,\
}

data modify storage micahcraft:settings hud set value {\
    coordinates:1,\
    saturation:2,\
    phantoms:4,\
    warden:8,\
    moon:16,\
    clock:32,\
    clock_mode:64,\
    tps:128,\
    theme:16777216,\
}

data modify storage micahcraft:settings world set value {\
    trim_particles_enabled:1,\
    trim_particles_self:2,\
    drop_player_head:4,\
}

data modify storage micahcraft:settings enchantments set value {\
    veinmine_crouch:1,\
    hammer_crouch:4,\
    displacement_safety:16,\
}

scoreboard players set #2 mk.math 2
scoreboard players set #4 mk.math 4
scoreboard players set #5 mk.math 5