data modify storage micahcraft:settings _dialog set value {\
    "type": "multi_action",\
    "title": {\
        "translate": "settings.micahcraft.general.title",\
        "fallback": "General",\
        "color": "#c0c0ff"\
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
            "contents": "<NEEDS RESOLVING>"\
        }\
    ],\
    "actions": [\
        {\
            "label": {\
                "translate": "settings.micahcraft.general.day_counter_enabled",\
                "fallback": "Day Counter"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.general.trigger set 1"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.general.day_counter_sound",\
                "fallback": "Day Counter Sound"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.general.trigger set 2"\
            }\
        }\
    ]\
}

execute store result score #mk.day_counter_enabled mk.math run function micahcraft:settings/data/get/basic {namespace:'general',path:'day_counter_enabled'}
execute store result score #mk.day_counter_sound mk.math run function micahcraft:settings/data/get/basic {namespace:'general',path:'day_counter_sound'}

execute if score #mk.day_counter_enabled mk.math matches 1 run \
    data modify storage micahcraft:settings display.general.day_counter_enabled set value \
    {text:'Disabled',color:'red',bold:1b}

execute unless score #mk.day_counter_enabled mk.math matches 1 run \
    data modify storage micahcraft:settings display.general.day_counter_enabled set value \
    {text:'Enabled',color:'dark_green',bold:1b}

execute if score #mk.day_counter_sound mk.math matches 1 run \
    data modify storage micahcraft:settings display.general.day_counter_sound set value \
    {text:'No Sound',color:'red',bold:1b}

execute unless score #mk.day_counter_sound mk.math matches 1 run \
    data modify storage micahcraft:settings display.general.day_counter_sound set value \
    {text:'Sound',color:'dark_green',bold:1b}

execute summon text_display run function micahcraft:settings/dialogs/resolve/general
function micahcraft:settings/show with storage micahcraft:settings