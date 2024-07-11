$tellraw @s [\
    {"translate":"$(dimension)","color":"dark_purple"},\
    ": ",\
    {\
        "text":"",\
        "clickEvent": {\
            "action": "copy_to_clipboard",\
            "value": "$(x) $(y) $(z)"\
        },\
        "hoverEvent": {\
            "action": "show_text",\
            "contents": {\
                "translate":"chat.copy.click",\
                "color": "green"\
            }\
        },\
        "extra": [\
            {"score":{"name":"#X","objective":"mk.math"},"color":"red"},\
            " ",\
            {"score":{"name":"#Z","objective":"mk.math"},"color":"blue"}\
        ]\
    }\
]