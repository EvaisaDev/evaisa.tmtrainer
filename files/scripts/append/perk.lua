---@diagnostic disable: lowercase-global, undefined-global
local old_perk_get_spawn_order = perk_get_spawn_order
function perk_get_spawn_order( ignore )
    if(GameHasFlagRun("TMTRAINER"))then
        print("TMTRAINER ACTIVE")
        for i, perk in ipairs(perk_list) do
            if(perk.tmtrainer)then
                perk_list[i].not_in_default_perk_pool = false
            else
				if(ModSettingGet("evaisa.tmtrainer.replace_items"))then
					perk_list[i].was_disabled_by_tmtrainer = true
					perk_list[i].not_in_default_perk_pool = true
				end
            end
        end
    else
        if(GameHasFlagRun("TMTRAINER_DISABLED"))then
            for i, perk in ipairs(perk_list) do
                if(perk.was_disabled_by_tmtrainer)then
                    perk_list[i].not_in_default_perk_pool = false
                end
            end
        end
    end
    local spawn_order = old_perk_get_spawn_order(ignore)
    return spawn_order
end