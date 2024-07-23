$data modify storage micahcraft:util compare.value set from $(left)
$execute store success score #Success mk.math run data modify storage micahcraft:util compare.value set from $(right)
execute if score #Success mk.math matches 0 run return 1
return fail