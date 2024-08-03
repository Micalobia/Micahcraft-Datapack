execute store result score #Value mk.math run time query daytime
scoreboard players operation #Hours mk.math = #Value mk.math
scoreboard players operation #Hours mk.math /= #1000 mk.math
scoreboard players add #Hours mk.math 6
scoreboard players operation #Hours mk.math %= #24 mk.math
scoreboard players operation #Minutes mk.math = #Value mk.math
scoreboard players operation #Minutes mk.math %= #1000 mk.math
scoreboard players operation #Minutes mk.math *= #3 mk.math
scoreboard players operation #Minutes mk.math /= #50 mk.math
scoreboard players operation #PM mk.math = #Hours mk.math
scoreboard players operation #PM mk.math /= #12 mk.math
execute store result score #24H mk.math run function micahcraft:settings/data/get_value {path:"hud.clock.mode"}
execute if score #24H mk.math matches 0 run scoreboard players operation #Hours mk.math %= #12 mk.math
execute if score #24H mk.math matches 0 if score #Hours mk.math matches 0 run scoreboard players set #Hours mk.math 12
$execute if score #Hours mk.math matches ..9 run data modify storage micahcraft:hud display append value {"text":"0","color":"$(yellow)"}
$data modify storage micahcraft:hud display append value {"score":{"name":"#Hours","objective":"mk.math"},"color":"$(yellow)"}
$data modify storage micahcraft:hud display append value {"text":":","color":"$(yellow)"}
$execute if score #Minutes mk.math matches ..9 run data modify storage micahcraft:hud display append value {"text":"0","color":"$(yellow)"}
$data modify storage micahcraft:hud display append value {"score":{"name":"#Minutes","objective":"mk.math"},"color":"$(yellow)"}
$execute if score #24H mk.math matches 0 if score #PM mk.math matches 0 run \
    data modify storage micahcraft:hud display append value {"text":" AM","color":"$(yellow)"}
$execute if score #24H mk.math matches 0 if score #PM mk.math matches 1 run \
    data modify storage micahcraft:hud display append value {"text":" PM","color":"$(yellow)"}
scoreboard players set #Element mk.math 1