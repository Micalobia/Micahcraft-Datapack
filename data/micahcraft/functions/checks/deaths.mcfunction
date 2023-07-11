scoreboard players set @a[scores={SeeDeaths=2..}] SeeDeaths 0
team join SeeDeaths @a[team=!SeeDeaths,scores={SeeDeaths=1}]
team leave @a[team=SeeDeaths,scores={SeeDeaths=0}]
scoreboard players enable @a SeeDeaths
