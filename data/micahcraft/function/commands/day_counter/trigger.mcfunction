tag @s[tag=mk.no_day_counter] add _t
tag @s[tag=!_t] add mk.no_day_counter
tag @s[tag=_t] remove mk.no_day_counter
tag @s[tag=_t] remove _t
scoreboard players set @s DayCounter 0
advancement revoke @s only micahcraft:generated/score_triggers/day_counter