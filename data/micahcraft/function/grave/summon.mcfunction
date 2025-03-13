summon minecraft:item_display ~ ~1 ~ {Tags:["mk.grave","Fresh"],billboard:"center",transformation:[0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,0.75f,0f,0f,0f,0f,1f]}
summon minecraft:interaction ~ ~0.65 ~ {Tags:["mk.grave","Fresh"],response:true,width:0.6f,height:0.7f}
execute as @n[type=item_display,tag=Fresh] run loot replace entity @s container.0 loot micahcraft:grave_display
tag @s add Died
summon minecraft:text_display ~ ~1 ~ {Tags:["mk.grave","Fresh"],alignment:"center",billboard:"center",see_through:true,text:'{"selector":"@p[tag=Died]","color":"gray","extra":[{"text":"\'s Grave"}]}',transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0f,0f,0f,0f,1f]}
tag @s remove Died
summon marker ~ ~ ~ {Tags:["mk.grave","Fresh"]}