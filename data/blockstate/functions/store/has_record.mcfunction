data remove storage blockstate:data read.has_record
execute if block ~ ~ ~ #blockstate:has_record[has_record=true] run data modify storage blockstate:data read.has_record set value 1b
execute if block ~ ~ ~ #blockstate:has_record[has_record=false] run data modify storage blockstate:data read.has_record set value 0b