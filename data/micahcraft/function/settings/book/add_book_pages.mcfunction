scoreboard players set #Page mk.math 0
data modify storage micahcraft:settings macro.page set value 0
function micahcraft:settings/book/fetch_current
function micahcraft:util/loop {nbt:"storage micahcraft:settings book",function:"micahcraft:settings/__private/add_page with storage micahcraft:settings macro"}