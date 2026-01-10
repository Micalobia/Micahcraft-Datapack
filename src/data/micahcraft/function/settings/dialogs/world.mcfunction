data modify storage micahcraft:settings _dialog set value {\
    "type": "multi_action",\
    "title": {\
        "translate": "settings.micahcraft.world.title",\
        "fallback": "World",\
        "color": "dark_green"\
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
        }\
    ],\
    "actions": [\
        {\
            "label": {\
                "translate": "settings.micahcraft.world.trim_particles_enabled",\
                "fallback": "Trim Particles"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.world.trigger set 1"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.world.trim_particles_self",\
                "fallback": "Trim Particles Self"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.world.trigger set 2"\
            }\
        },\
        {\
            "label": {\
                "translate": "settings.micahcraft.world.drop_player_head",\
                "fallback": "Drop Player Head"\
            },\
            "action": {\
                "type": "run_command",\
                "command": "trigger mk.settings.world.trigger set 4"\
            }\
        }\
    ]\
}

execute store result score #mk.trim_particles_enabled mk.math run function micahcraft:settings/data/get/basic {namespace:'world',path:'trim_particles_enabled'}
execute store result score #mk.trim_particles_self mk.math run function micahcraft:settings/data/get/basic {namespace:'world',path:'trim_particles_self'}
execute store result score #mk.drop_player_head mk.math run function micahcraft:settings/data/get/basic {namespace:'world',path:'drop_player_head'}

execute if score #mk.trim_particles_enabled mk.math matches 1 run \
    data modify storage micahcraft:settings display.world.trim_particles_enabled set value \
    {text:'Disabled',color:'red',bold:1b}

execute unless score #mk.trim_particles_enabled mk.math matches 1 run \
    data modify storage micahcraft:settings display.world.trim_particles_enabled set value \
    {text:'Enabled',color:'dark_green',bold:1b}

execute if score #mk.trim_particles_self mk.math matches 1 run \
    data modify storage micahcraft:settings display.world.trim_particles_self set value \
    {text:'Disabled',color:'red',bold:1b}

execute unless score #mk.trim_particles_self mk.math matches 1 run \
    data modify storage micahcraft:settings display.world.trim_particles_self set value \
    {text:'Enabled',color:'dark_green',bold:1b}

execute if score #mk.drop_player_head mk.math matches 1 run \
    data modify storage micahcraft:settings display.world.drop_player_head set value \
    {text:'Disabled',color:'red',bold:1b}

execute unless score #mk.drop_player_head mk.math matches 1 run \
    data modify storage micahcraft:settings display.world.drop_player_head set value \
    {text:'Enabled',color:'dark_green',bold:1b}

execute summon text_display run function micahcraft:settings/dialogs/resolve/world
function micahcraft:settings/show with storage micahcraft:settings