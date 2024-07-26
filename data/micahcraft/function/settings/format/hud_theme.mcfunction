$execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:'$(key)'}
$execute if score #Value mk.math matches 0 run data modify storage micahcraft:settings current.'$(key)' set value "§7Light"
$execute if score #Value mk.math matches 1 run data modify storage micahcraft:settings current.'$(key)' set value "§8Dark"
$execute if score #Value mk.math matches 2 run data modify storage micahcraft:settings current.'$(key)' set value "§9Solar Light"
$execute if score #Value mk.math matches 3 run data modify storage micahcraft:settings current.'$(key)' set value "§1Solar Dark"
$execute if score #Value mk.math matches 4 run data modify storage micahcraft:settings current.'$(key)' set value "§cR§aG§9B"
