---@diagnostic disable: lowercase-global, undefined-global
dofile("data/scripts/lib/mod_settings.lua")



local mod_id = "evaisa.tmtrainer" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings =
{
	{
		category_id = "tmtrainer_settings",
		ui_name = "",
		ui_description = "",
		settings = {
			{
				id = "always_active",
				ui_name = "TMTRAINER Always Active",
				ui_description = "Instead of being a perk, TMTRAINER is always active.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "replace_items",
				ui_name = "Replace Content",
				ui_description = "When TMTRAINER is active, all future spells and perks are replaced with TMTRAINER spells and perks.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
		},
	},
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
