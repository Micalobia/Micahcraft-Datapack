data modify storage micahcraft:get_attribute CheckingName set from storage micahcraft:get_attribute Attribute
data modify storage micahcraft:get_attribute CheckingAttribute set from storage micahcraft:get_attribute Attributes[0]
execute store success score $HasData Math run data remove storage micahcraft:get_attribute Attributes[0]
execute if score $HasData Math matches 1 store success score $Wrong Math run data modify storage micahcraft:get_attribute CheckingName set from storage micahcraft:get_attribute CheckingAttribute.Name
execute if score $HasData Math matches 0 run data modify storage micahcraft:get_attribute Value set value 350000000000000000000000000000000000000.0f
execute if score $HasData Math matches 0 run scoreboard players set $Wrong Math 0
execute if score $Wrong Math matches 1 run function micahcraft:getters/attribute_loop
execute if score $HasData Math matches 1 if score $Wrong Math matches 0 run data modify storage micahcraft:get_attribute Value set from storage micahcraft:get_attribute CheckingAttribute.Base