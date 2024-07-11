$title @s actionbar [\
    {"text":"Coords: ","color":"$(base)"},\
    {"score":{"name":"#X","objective":"mk.math"},"color":"$(red)"},\
    " ",\
    {"score":{"name":"#Y","objective":"mk.math"},\
    "color":"$(green)"},\
    " ",\
    {"score":{"name":"#Z","objective":"mk.math"},"color":"$(blue)"},\
    " ",\
    {"text":"Saturation: ","color":"$(yellow)","extra":[\
        {"score":{"name":"#Integer","objective":"mk.math"}},\
        ".",\
        {"score":{"name":"#Decimal","objective":"mk.math"}}\
    ]}\
]