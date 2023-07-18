tellraw @a[scores={SeeHelp=1..}] [{"text":"Please go ","color":"white"},{"text":"here","color":"aqua","clickEvent":{"action":"open_url","value":"https://github.com/Micalobia/Micahcraft-Datapack/wiki/Commands"}},{"text":" to see the list of commands and how they work!"}]
scoreboard players set @a[scores={SeeHelp=1..}] SeeHelp 0
scoreboard players enable @a SeeHelp

