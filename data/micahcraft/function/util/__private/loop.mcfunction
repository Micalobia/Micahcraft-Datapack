$data modify storage micahcraft:util loop.list_$(nest) set from $(nbt)
$data modify storage micahcraft:util loop.macro_$(nest).function set value "$(function)"
$data modify storage micahcraft:util loop.macro_$(nest).nest set value $(nest)
$function micahcraft:util/__private/_loop with storage micahcraft:util loop.macro_$(nest)