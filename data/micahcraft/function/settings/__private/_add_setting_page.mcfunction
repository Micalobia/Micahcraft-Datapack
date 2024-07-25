$data modify storage micahcraft:settings page set value \
[\
    {"text":""},\
    {"text":"$(page_name) ","color":"$(page_color)"},\
    {"text":"[Back]","color":"gray","clickEvent":{"action":"change_page","value":"1"}},\
    {"storage":"micahcraft:misc","nbt":"newline"},\
    {"text":"==================="},\
    {"storage":"micahcraft:misc","nbt":"newline"},\
    {"storage":"micahcraft:misc","nbt":"newline"},\
]