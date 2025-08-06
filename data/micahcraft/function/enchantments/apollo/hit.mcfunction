scoreboard players set @s mk.apollo.timer 120
execute if entity @s[type=player,nbt={Health:0f}] run tellraw @a [\
    {selector:"@s"},\
    {text:" died a homosexual"}\
]
execute \
    if entity @s[type=#micahcraft:tameable,nbt={Health:0f}] \
    if data entity @s Owner \
    run tellraw @a [\
        {selector:"@s"},\
        {text:" died a homosexual"}\
    ]
schedule function micahcraft:enchantments/apollo/timer 1t replace