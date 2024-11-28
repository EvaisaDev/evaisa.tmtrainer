---@diagnostic disable: lowercase-global, undefined-global
local old_perk_get_spawn_order = perk_get_spawn_order
function perk_get_spawn_order( ignore )
	ignore = ignore or {}
    if(GameHasFlagRun("TMTRAINER"))then
        for i, perk in ipairs(perk_list) do
			if(ModSettingGet("evaisa.tmtrainer.replace_items") and not perk.tmtrainer)then
				table.insert(ignore, perk.id)
			end
        end
    else
		for i, perk in ipairs(perk_list) do
			if(perk.tmtrainer)then
				table.insert(ignore, perk.id)
			end
		end
    end
    return old_perk_get_spawn_order(ignore)
end