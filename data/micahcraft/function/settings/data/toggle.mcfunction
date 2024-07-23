$execute store result score #Value mk.math run function micahcraft:settings/data/get_value {path:"$(path)"}
$execute if score #Value mk.math matches 0 run function micahcraft:settings/data/set_generic {path:"$(path)",value:"1b"}
$execute unless score #Value mk.math matches 0 run function micahcraft:settings/data/set_generic {path:"$(path)",value:"0b"}
