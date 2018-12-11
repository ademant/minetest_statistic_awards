
statistic_awards.globaltimer=0

minetest.register_globalstep(function(dtime)
	statistic_awards.globaltimer=statistic_awards.globaltimer+dtime
	if statistic_awards.globaltimer > 1 then
		statistic_awards.globaltimer = 0
		local players = minetest.get_connected_players()
		for i=1, #players do
			local player=players[i]
			local player_awards=awards.player(player:get_player_name())
--			print(dump2(player_awards))
			local player_walked=xpfw.player_get_attribute(player,"walked")
			local hike_award=statistic_awards.hiking[1]
			if player_walked ~= nil then
				if player_walked > 0 then
					local hike_i=1
					local bhike = true
					local aw_def=statistic_awards.hiking[hike_i]
					while bhike do
						local aw_def=statistic_awards.hiking[hike_i]
						if aw_def ~= nil then
						
							if basic_functions.has_value(player_awards.unlocked,aw_def.basename..aw_def.level) == false then
								bhike=false
								hike_award=aw_def
							end
						else
							bhike = false
						end
						hike_i=hike_i+1
					end
					if aw_def ~= nil then
						if aw_def.threshold<player_walked then
							awards.unlock(player:get_player_name(),aw_def.basename..aw_def.level)
						end
					end
				end
			end
			local player_swam=xpfw.player_get_attribute(player,"swam")
			local swam_award=statistic_awards.swimming[1]
			if player_swam ~= nil then
				if player_swam > 0 then
					local swim_i=1
					local bswim = true
					local aw_def=statistic_awards.swimming[swim_i]
					while bswim do
						local aw_def=statistic_awards.swimming[swim_i]
						if aw_def ~= nil then
							if basic_functions.has_value(player_awards.unlocked,aw_def.basename..aw_def.level) == false then
								bswim=false
								swam_award=aw_def
							end
						else
							bswim = false
						end
						swim_i=swim_i+1
					end
					if aw_def ~= nil then
						if aw_def.threshold<player_swam then
							awards.unlock(player:get_player_name(),aw_def.basename..aw_def.level)
						end
					end
				end
			end
		end
	end
end)

minetest.register_on_respawnplayer(function(player)
	if player ~= nil then
		if xpfw.player_get_attribute(player,"deaths") > 0 then
			
			local player_awards=awards.player(player:get_player_name())
			print(dump2(player_awards))
			local death_award=statistic_awards.deaths[1]


			local death_i=1
			local bdeath = true
			local aw_def=statistic_awards.deaths[death_i]
			while bdeath do
				local aw_def=statistic_awards.deaths[death_i]
				if aw_def ~= nil then
					if basic_functions.has_value(player_awards.unlocked,aw_def.basename..aw_def.level) == false then
						bdeath=false
						death_award=aw_def
					end
				else
					bdeath = false
				end
				death_i=death_i+1
			end
			if aw_def ~= nil then
				if aw_def.threshold<xpfw.player_get_attribute(player,"deaths") then
					print(player:get_player_name())
					print(dump2(aw_def))
					awards.unlock(player:get_player_name(),aw_def.basename..aw_def.level)
				end
			end

		end
	end
end
)
