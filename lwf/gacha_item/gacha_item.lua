if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.gacha_item then LWF.Script.gacha_item={} end

LWF.Script.gacha_item._root_0_2 = function(self)
	local _root = self.lwf._root

	rare_1 = rare_2
	if rare_1 > 3 then
		math.randomseed(os.time())
		math.random();math.random();math.random();
		ran = math.random(10)
		if ran > 7 then
			rare_1 = rare_1 - 1
		end
	end
	
	g_ten = {g_ten1, g_ten2, g_ten3, g_ten4, g_ten5, g_ten6, g_ten7, g_ten8, g_ten9, g_ten10, g_ten11}
	g_mc_list = {self.en_1, self.en_2, self.en_3, self.en_4, self.en_5, self.en_6, self.en_7, self.en_8, self.en_9, self.en_10, self.en_11}
	max_ten_count = 11
	
	if g_cnt == 0 then
		setSkipLabel("skip_1")
	else
		if type(g_ten[11]) == "number" then
			setSkipLabel("skip_11")
		else
			setSkipLabel("skip_10")
		end
	end
end

LWF.Script.gacha_item._root_133_2 = function(self)
	local _root = self.lwf._root

	if g_cnt == 0 then
	    _root.en_1:gotoAndStop("e_".. g_ten[1])
		
		for i = 1, max_ten_count do
			if i ~= 1 then
				g_mc_list[i]:gotoAndStop("no")
			end
		end
	else
		for i = 1, max_ten_count do
			if type(g_ten[i]) == "number" then
				g_mc_list[i]:gotoAndStop("e_".. g_ten[i])
			else
				g_mc_list[i]:gotoAndStop("no")
			end
		end
	end
end

LWF.Script.gacha_item._root_161_2 = function(self)
	local _root = self.lwf._root

	self.rare:gotoAndStop("r_" .. rare_2)
	self.r_light:gotoAndStop("r_" .. rare_2)
end

LWF.Script.gacha_item._root_219_2 = function(self)
	local _root = self.lwf._root

	if g_cnt == 0 then
		setSkipLabel("")
		self.last_light:gotoAndPlay("go")
		self.eff_up:gotoAndStop("stop")
		self.rare:gotoAndStop("r_" .. rare_2)
		self.r_light:gotoAndStop("r_" .. rare_2)
		
	    self.en_1:gotoAndStop("e_".. g_ten[1])
		
		for i = 1, max_ten_count do
			if i ~= 1 then
				g_mc_list[i]:gotoAndStop("no")
			end
		end
	else
		for i = 1, max_ten_count do
			if type(g_ten[i]) == "number" then
				g_mc_list[i]:gotoAndStop("e_".. g_ten[i])
			else
				g_mc_list[i]:gotoAndStop("no")
			end
		end
	end
end

LWF.Script.gacha_item._root_230_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_246_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_262_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_278_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_293_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_2_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_024_GACHA_ITEM")
end

LWF.Script.gacha_item._root_308_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_325_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_342_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_359_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_363_2 = function(self)
	local _root = self.lwf._root

	self.eff_up:gotoAndStop("stop")
	self.rare:gotoAndStop("r_" .. rare_2)
	self.r_light:gotoAndStop("r_" .. rare_2)
	self.en_9:gotoAndStop("e_".. g_ten[9])
	self.en_10:gotoAndStop("e_".. g_ten[10])
	if type(g_ten[11]) == "number" then
		self.en_11:gotoAndStop("e_".. g_ten[11])
	else
		setSkipLabel("")
		self.en_11:gotoAndStop("no")
		self.last_light:gotoAndPlay("go")
	end
end

LWF.Script.gacha_item._root_374_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_379_2 = function(self)
	local _root = self.lwf._root

	self.eff_up:gotoAndStop("stop")
	self.rare:gotoAndStop("r_" .. rare_2)
	self.r_light:gotoAndStop("r_" .. rare_2)
	self.en_10:gotoAndStop("e_".. g_ten[10])
	if type(g_ten[11]) == "number" then
		setSkipLabel("")
		self.last_light:gotoAndPlay("go")
		self.en_11:gotoAndStop("e_".. g_ten[11])
	else
		self.en_11:gotoAndStop("no")
	end
end

LWF.Script.gacha_item._root_389_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_025_GACHA_ITEM")
end

LWF.Script.gacha_item._root_56_2 = function(self)
	local _root = self.lwf._root

	self.rare:gotoAndStop("r_" .. rare_1)
	self.r_light:gotoAndStop("r_" .. rare_1)
end

LWF.Script.gacha_item.eff_up_0_2 = function(self)
	local _root = self.lwf._root

	if rare_1 == rare_2 or rare_2 < 4 then
		self:gotoAndStop("stop");
	end
end

LWF.Script.gacha_item.last_light_17_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_022_GACHA_UNIT")
end

LWF.Script.gacha_item.last_light_35_1 = function(self)
	local _root = self.lwf._root

	self.parent:stop()
end
