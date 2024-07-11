function micahcraft:location
tellraw @a [\
    {"selector":"@s","color":"#7F00FF"},\
    {"text":"'s Location: ","color":"#7F00FF"},\
    {"score":{"name":"#X","objective":"mk.math"},"color":"red"},\
    " ",\
    {"score":{"name":"#Y","objective":"mk.math"},"color":"green"}\
    ," ",\
    {"score":{"name":"#Z","objective":"mk.math"},"color":"blue"}\
]
scoreboard players set @s ShareLocation 0
advancement revoke @s only micahcraft:generated/score_triggers/share_location