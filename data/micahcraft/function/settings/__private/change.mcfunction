$data modify storage micahcraft:settings macro.key set from storage micahcraft:settings setup.settings.info[$(index)].key
$data modify storage micahcraft:settings macro.function set from storage micahcraft:settings setup.settings.info[$(index)].change
function micahcraft:settings/__private/_change with storage micahcraft:settings macro