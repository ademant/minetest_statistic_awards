if minetest.get_modpath("awards") and minetest.get_modpath("xpfw") then

	for i,aw_def in ipairs(statistic_awards.hiking) do
		local awdef={
			title=aw_def.titel,
			description=aw_def.description,
			icon=aw_def.baseicon.."^awards_level"..aw_def.level..".png",
			background = "awards_bg_mining.png",
		}
		if aw_def.level > 1 then
			awdef.requires=aw_def.basename..(aw_def.level-1)
			awdef.secret=true
		end
		awards.register_achievement(aw_def.basename..aw_def.level,awdef)
	end
	for i,aw_def in ipairs(statistic_awards.deaths) do
		local awdef={
			title=aw_def.titel,
			description=aw_def.description,
			icon=aw_def.baseicon.."^awards_level"..aw_def.level..".png",
			background = "awards_bg_mining.png",
		}
		if aw_def.level > 1 then
			awdef.requires=aw_def.basename..(aw_def.level-1)
			awdef.secret=true
		end
		awards.register_achievement(aw_def.basename..aw_def.level,awdef)
	end
end

