$data modify storage micahcraft:util join.list set from $(nbt)
$data modify storage micahcraft:util join.macro.char set value "$(char)"
data modify storage micahcraft:util join.macro.str set from storage micahcraft:util join.list[0]
data remove storage micahcraft:util join.list[0]
function micahcraft:util/loop {function:"micahcraft:util/__private/join",nbt:"storage micahcraft:util join.list"}
data modify storage micahcraft:util join.output set from storage micahcraft:util join.macro.str