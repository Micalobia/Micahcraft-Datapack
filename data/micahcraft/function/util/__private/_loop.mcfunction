$data modify storage micahcraft:util loop.value_$(nest) set from storage micahcraft:util loop.list_$(nest)[0]
$data modify storage micahcraft:util loop.value set from storage micahcraft:util loop.list_$(nest)[0]
$data remove storage micahcraft:util loop.list_$(nest)[0]
$function $(function)
$execute store result score #Success mk.math run function micahcraft:util/empty {nbt:"storage micahcraft:util loop.list_$(nest)"}
$execute if score #Success mk.math matches 0 run function micahcraft:util/__private/_loop with storage micahcraft:util loop.macro_$(nest)