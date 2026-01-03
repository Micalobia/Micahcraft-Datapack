data modify entity @s view_range set value 0
data modify entity @s text set value {\
    "storage": "micahcraft:hud",\
    "nbt": "display",\
    "interpret": true,\
    "hover_event": {\
        "action": "show_text",\
        "value": {\
            "text": "Some themes might not display correctly",\
            "italic": true,\
            "color": "gray"\
        }\
    }\
}
data modify storage micahcraft:settings _dialog.body[0].contents set from entity @s text
data modify entity @s text set value [\
    'Theme: ',\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.hud.theme",\
        "interpret": true\
    }\
]
data modify storage micahcraft:settings _dialog.actions[-1].label set from entity @s text
function micahcraft:util/remove
