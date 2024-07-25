$execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:'$(key)'}
$execute if score #Value mk.math matches 0 run data modify storage micahcraft:settings current.'$(key)' set value "§cNo"
$execute unless score #Value mk.math matches 0 run data modify storage micahcraft:settings current.'$(key)' set value "§2Yes"
