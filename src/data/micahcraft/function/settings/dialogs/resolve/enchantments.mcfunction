data modify entity @s view_range set value 0
data modify entity @s text set value [\
    {\
        "translate": "settings.micahcraft.enchantments.veinmine_crouch"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.enchantments.veinmine_crouch",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.enchantments.hammer_crouch"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.enchantments.hammer_crouch",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.enchantments.displacement_safety"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.enchantments.displacement_safety",\
        "interpret": true,\
        "hover_event": {\
            "action": "show_text",\
            "value": {\
                "translate": "settings.micahcraft.enchantments.displacement_safety.description"\
            }\
        }\
    }\
]
data modify storage micahcraft:settings _dialog.body[0].contents set from entity @s text
function micahcraft:util/remove
