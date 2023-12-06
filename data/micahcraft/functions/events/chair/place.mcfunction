advancement revoke @s only micahcraft:events/chair/place
execute anchored eyes store result score #Result Math run function micahcraft:events/chair/place/create
execute if score #Result Math matches ..-1 run tellraw @s {"text":"Failed to create the chair!","color":"red"}