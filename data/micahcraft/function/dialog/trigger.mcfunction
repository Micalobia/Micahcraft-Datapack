scoreboard players set @s mk.dialog 0
advancement revoke @s only micahcraft:generated/score_triggers/dialog/trigger
data modify storage micahcraft:dialog root set value {\
    type: "multi_action",\
    title: {\
        text: "Micahcraft",\
        bold: true,\
        color: "#eee8d5"\
    },\
    columns: 1,\
    actions: []\
}
function micahcraft:dialog/dynamic/more
function settings:__private__/util/nbt_dialog {nbt:"storage micahcraft:dialog root"}