$execute store success score #Test mk.math store result score #Value mk.math run data get storage micahcraft:settings users.user_$(id)."$(path)" 1
$execute if score #Test mk.math matches 0 store result score #Value mk.math run data get storage micahcraft:settings users.default."$(path)" 1
return run scoreboard players get #Value mk.math