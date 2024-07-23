# Returns true if array is empty, fails otherwise
$execute store result score #Value mk.math run data get $(nbt)
execute if score #Value mk.math matches 0 run return 1
return fail