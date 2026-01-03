data modify entity @s view_range set value 0
data modify entity @s text set value [\
    {\
        "translate": "settings.micahcraft.world.trim_particles_enabled",\
        "fallback": "Trim Particles"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.trim_particles_enabled",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.world.trim_particles_self",\
        "fallback": "Trim Particles Self"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.trim_particles_self",\
        "interpret": true\
    }\
    ,\
    "\n",\
    {\
        "translate": "settings.micahcraft.world.drop_player_head",\
        "fallback": "Drop Player Head"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.drop_player_head",\
        "interpret": true\
    }\
]
data modify storage micahcraft:settings _dialog.body[0].contents set from entity @s text
function micahcraft:util/remove
