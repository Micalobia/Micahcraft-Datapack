scoreboard objectives add Settings trigger {"text":"Settings","color":"#f0e2bd","clickEvent":{"action":"run_command","value":"/trigger Settings"}}
scoreboard objectives add mk.settings.id dummy

scoreboard players add #ID mk.settings.id 0
scoreboard players set #Key mk.settings.id 0
scoreboard players set #PageKey mk.settings.id 0

scoreboard players set #5 mk.math 5

function micahcraft:settings/setup
function micahcraft:settings/book