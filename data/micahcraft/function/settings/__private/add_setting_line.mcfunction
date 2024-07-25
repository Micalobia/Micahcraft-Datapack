$data modify storage micahcraft:settings temp set value '$(page)'
execute store result score #Success mk.math run function micahcraft:util/compare {\
    left:"storage micahcraft:settings macro.page_key",\
    right:"storage micahcraft:settings temp",\
}
execute if score #Success mk.math matches 0 run return fail
$data modify storage micahcraft:settings page append value \
{\
    "text":"$(name) [",\
    "extra":[\
        {\
            "storage":"micahcraft:settings",\
            "nbt":"current.'$(key)'",\
            "hoverEvent": \
            {\
                "action": "show_text",\
                "contents": \
                {\
                    "text": "Change",\
                    "color": "dark_purple"\
                }\
            },\
            "clickEvent": \
            {\
                "action":"run_command",\
                "value":"/trigger mk.settings.change set $(trigger)",\
            }\
        },\
        {"text":"]"},\
    ],\
    "hoverEvent":\
    {\
        "action":"show_text",\
        "contents": \
        {\
            "text":"$(description)",\
            "color":"blue",\
        }\
    }\
}
data modify storage micahcraft:settings page append value {"storage":"micahcraft:misc","nbt":"newline"}
