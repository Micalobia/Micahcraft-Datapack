$function micahcraft:settings/data/toggle {path:'$(key)'}
execute if score #Value mk.math matches 1 run tag @s add mk.headless
execute if score #Value mk.math matches 0 run tag @s remove mk.headless