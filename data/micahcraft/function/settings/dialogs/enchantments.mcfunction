data modify storage micahcraft:settings _dialog set value {\
    "type": "multi_action",\
    "title": {\
        "translate": "settings.micahcraft.enchantments.title",\
        "fallback": "Enchantments",\
        "color": "dark_purple"\
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
            "width":512\
        }\
    ],\
    "actions": [\
        {\
            "label": {\
                "translate": "settings.micahcraft.enchantments.veinmine_crouch",\
                "fallback": "Crouch for Veinmining"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.enchantments.trigger set 1"\
            },\
            "width":200\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.enchantments.hammer_crouch",\
                "fallback": "Crouch for Quarry/Excavation"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.enchantments.trigger set 4"\
            },\
            "width":200\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.enchantments.displacement_safety",\
                "fallback": "Curse of Displacement Safety"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.enchantments.trigger set 16"\
            },\
            "width":200\
        }\
    ]\
}


execute store result score #mk.veinmine_crouch mk.math run function micahcraft:settings/data/get/enchant_crouch {path:'veinmine_crouch'}
execute store result score #mk.hammer_crouch mk.math run function micahcraft:settings/data/get/enchant_crouch {path:'hammer_crouch'}
execute store result score #mk.displacement_safety mk.math run function micahcraft:settings/data/get/basic {namespace:'enchantments',path:'displacement_safety'}

execute unless score #mk.veinmine_crouch mk.math matches 1..2 run \
    data modify storage micahcraft:settings display.enchantments.veinmine_crouch set value \
    {text:'Either',bold:1b}

execute if score #mk.veinmine_crouch mk.math matches 1 run \
    data modify storage micahcraft:settings display.enchantments.veinmine_crouch set value \
    {text:'Required',color:'dark_green',bold:1b}

execute if score #mk.veinmine_crouch mk.math matches 2 run \
    data modify storage micahcraft:settings display.enchantments.veinmine_crouch set value \
    {text:'Inverted',color:'red',bold:1b}

execute unless score #mk.hammer_crouch mk.math matches 1..2 run \
    data modify storage micahcraft:settings display.enchantments.hammer_crouch set value \
    {text:'Either',bold:1b}

execute if score #mk.hammer_crouch mk.math matches 1 run \
    data modify storage micahcraft:settings display.enchantments.hammer_crouch set value \
    {text:'Required',color:'dark_green',bold:1b}

execute if score #mk.hammer_crouch mk.math matches 2 run \
    data modify storage micahcraft:settings display.enchantments.hammer_crouch set value \
    {text:'Inverted',color:'red',bold:1b}

execute if score #mk.displacement_safety mk.math matches 1 run \
    data modify storage micahcraft:settings display.enchantments.displacement_safety set value \
    {text:'Safe',color:'dark_green',bold:1b}

execute unless score #mk.displacement_safety mk.math matches 1 run \
    data modify storage micahcraft:settings display.enchantments.displacement_safety set value \
    {text:'Unsafe',color:'red',bold:1b}

execute summon text_display run function micahcraft:settings/dialogs/resolve/enchantments
function micahcraft:settings/show with storage micahcraft:settings