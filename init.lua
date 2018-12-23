statistic_awards  = {}
statistic_awards.path = minetest.get_modpath("statistic_awards")
statistic_awards.modname = minetest.get_current_modname()

-- import settingtypes.txt
basic_functions.import_settingtype(statistic_awards.path .. "/settingtypes.txt")

dofile(statistic_awards.path .. "/config.lua")
dofile(statistic_awards.path .. "/awards.lua")
dofile(statistic_awards.path .. "/abm.lua")

