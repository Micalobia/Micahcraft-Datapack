data modify storage micahcraft:settings current set value {}
function micahcraft:util/loop {\
    nbt:"storage micahcraft:settings setup.settings.info",\
    function:"micahcraft:settings/__private/fetch_current with storage micahcraft:util loop.value",\
}