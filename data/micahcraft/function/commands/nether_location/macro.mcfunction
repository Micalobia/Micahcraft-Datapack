$tellraw @s [\
    {translate:"$(dimension)",color:"dark_purple"},\
    ": ",\
    {\
        text:"",\
        click_event: {\
            action: "copy_to_clipboard",\
            value: "$(x) $(y) $(z)"\
        },\
        hover_event: {\
            action: "show_text",\
            value: {\
                translate:"chat.copy.click",\
                color: "green"\
            }\
        },\
        extra: [\
            {score:{name:"#X",objective:"mk.math"},color:"red"},\
            " ",\
            {score:{name:"#Z",objective:"mk.math"},color:"blue"}\
        ]\
    }\
]