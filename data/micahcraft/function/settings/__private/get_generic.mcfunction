$execute store success score #Test mk.math run data modify storage micahcraft:settings return set from storage micahcraft:settings users.user_$(id)."$(path)"
$execute if score #Test mk.math matches 0 run data modify storage micahcraft:settings return set from storage micahcraft:settings users.default."$(path)"