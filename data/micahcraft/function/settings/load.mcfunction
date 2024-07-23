scoreboard objectives add Settings trigger {"text":"Settings","color":"#f0e2bd","clickEvent":{"action":"run_command","value":"/trigger Settings"}}
scoreboard objectives add mk.settings.change trigger {"text":"Changed Setting","color":"#f0e2bd"}
scoreboard objectives add mk.settings.id dummy

scoreboard players add #ID mk.settings.id 0
scoreboard players set #Key mk.settings.id 0
scoreboard players set #PageKey mk.settings.id 0

function micahcraft:settings/setup