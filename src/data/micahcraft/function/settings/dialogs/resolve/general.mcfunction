data modify entity @s view_range set value 0
data modify entity @s text set value [\
    {\
        "translate": "settings.micahcraft.general.day_counter_enabled"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.general.day_counter_enabled",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.general.day_counter_sound"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.general.day_counter_sound",\
        "interpret": true\
    }\
]
data modify storage micahcraft:settings _dialog.body[0].contents set from entity @s text
function micahcraft:util/remove
