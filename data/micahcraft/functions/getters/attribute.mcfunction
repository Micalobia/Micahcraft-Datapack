# Need to do a /data modify storage micahcraft:get_attribute Attribute set value "<attribute name>"
data modify storage micahcraft:get_attribute Attributes set from entity @s Attributes
function micahcraft:getters/attribute_loop
data remove storage micahcraft:get_attribute Attributes
data remove storage micahcraft:get_attribute CheckingAttribute
data remove storage micahcraft:get_attribute CheckingName