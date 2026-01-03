$data modify storage micahcraft:util tag_player.uuid set from $(uuid_path)
execute as @a run function micahcraft:util/__private/tag
return run execute if entity @a[tag=mk.tag_player]