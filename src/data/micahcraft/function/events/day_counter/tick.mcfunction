execute unless predicate micahcraft:new_day run return fail
tag @a remove mk.day_counter.enabled
tag @a remove mk.day_counter.sound
execute as @a run function micahcraft:events/day_counter/tag
function micahcraft:events/day_counter/calculate_date
function micahcraft:events/day_counter/animation
