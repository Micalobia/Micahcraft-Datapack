$data modify storage micahcraft:settings page append value {\
    "text": "$(index). $(name)",\
    "color": "$(color)",\
    "hoverEvent": {\
        "action": "show_text",\
        "contents": {\
            "text": "Go to page",\
            "color": "$(color)",\
        }\
    },\
    "clickEvent": {\
        "action": "change_page",\
        "value": "$(number)",\
    },\
}