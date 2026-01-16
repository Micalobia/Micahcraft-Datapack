data modify storage micahcraft:settings _dialog set value {\
    "type": "multi_action",\
    "title": {\
        "translate": "settings.micahcraft.hud.title",\
        "fallback": "HUD",\
        "color": "gold"\
    },\
    "after_action": "wait_for_response",\
    "exit_action": {\
        "label": {\
            "translate": "gui.back"\
        },\
        "action": {\
            "type": "run_command",\
            "command": "trigger Settings"\
        }\
    },\
    "columns": 1,\
    "body": [\
        {\
            "type": "plain_message",\
            "contents": "<NEEDS RESOLVING>",\
            "width": 512\
        }\
    ],\
    "actions": [\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.tps",\
                "fallback": "TPS"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 128"\
            },\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.coordinates",\
                "fallback": "Coordinates"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 1"\
            },\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.saturation",\
                "fallback": "Saturation"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 2"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.phantoms",\
                "fallback": "Phantom Timer"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 4"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.warden",\
                "fallback": "Warden Rage"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 8"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.moon",\
                "fallback": "Moon Phase"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 16"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.clock",\
                "fallback": "Clock"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 32"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.hud.clock_mode",\
                "fallback": "Clock Mode"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 64"\
            }\
        },\
        {\
            "label": "<NEEDS RESOLVING>",\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.hud.trigger set 16777216"\
            }\
        }\
    ]\
}

execute store result storage micahcraft:hud macro.theme int 1 run function micahcraft:settings/data/get/hud_theme
function micahcraft:commands/hud/theme with storage micahcraft:hud macro
function micahcraft:commands/hud/title

execute store result score #mk.theme mk.math run function micahcraft:settings/data/get/hud_theme

execute if score #mk.theme mk.math matches 0 run \
    data modify storage micahcraft:settings display.hud.theme set value \
    {text:"Light",color:"white",bold:true}

execute if score #mk.theme mk.math matches 1 run \
    data modify storage micahcraft:settings display.hud.theme set value \
    {text:"Dark",color:"dark_gray",bold:true}

execute if score #mk.theme mk.math matches 2 run \
    data modify storage micahcraft:settings display.hud.theme set value \
    {text:"Solarized Light",color:"#eee8d5",bold:true,shadow_color:[0,0.17,0.21,1]}

execute if score #mk.theme mk.math matches 3 run \
    data modify storage micahcraft:settings display.hud.theme set value \
    {text:"Solarized Dark",color:"#073642",bold:true,shadow_color:[0,0.17,0.21,0.25]}

execute if score #mk.theme mk.math matches 4 run \
    data modify storage micahcraft:settings display.hud.theme set value \
    [\
        {text:"R",color:"#aa0000",bold:true,shadow_color:[0.33,0,0,1]},\
        {text:"G",color:"#00aa00",bold:true,shadow_color:[0,0.33,0,1]},\
        {text:"B",color:"#0000aa",bold:true,shadow_color:[0,0,0.33,1]}\
    ]

execute summon text_display run function micahcraft:settings/dialogs/resolve/hud
function micahcraft:settings/show with storage micahcraft:settings