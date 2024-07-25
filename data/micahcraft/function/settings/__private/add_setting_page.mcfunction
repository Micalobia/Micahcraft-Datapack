data modify storage micahcraft:settings macro.page_color set from storage micahcraft:util loop.value_0.color
data modify storage micahcraft:settings macro.page_name set from storage micahcraft:util loop.value_0.name
data modify storage micahcraft:settings macro.page_key set from storage micahcraft:util loop.value_0.page
function micahcraft:settings/__private/_add_setting_page with storage micahcraft:settings macro

function micahcraft:util/loop {\
    nbt:"storage micahcraft:settings setup.settings.info",\
    function:"micahcraft:settings/__private/add_setting_line with storage micahcraft:util loop.value_1",\
}

data modify storage micahcraft:settings book append from storage micahcraft:settings page