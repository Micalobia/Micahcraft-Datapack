advancement revoke @s only micahcraft:generated/score_triggers/settings/close
advancement revoke @s only micahcraft:generated/score_triggers/settings/nop
scoreboard players set @s Settings 0

trigger mk.settings.general.trigger set 0
trigger mk.settings.hud.trigger set 0
trigger mk.settings.world.trigger set 0
trigger mk.settings.enchantments.trigger set 0
dialog show @s micahcraft:empty
dialog clear @s