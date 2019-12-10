if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.get_unit then LWF.Script.get_unit={} end

LWF.Script.get_unit._eff_eff_01_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_02_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_03_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_04_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_05_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_06_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_07_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_08_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_09_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_10_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._eff_eff_11_move_24_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("go")
end

LWF.Script.get_unit._kira_kira3_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._kira_kira_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		self:gotoAndStop(2)
	elseif rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_unit._kira_kira_move_1_0_1 = function(self)
	local _root = self.lwf._root

	local x1 = 10
	local x2 = 620
	
	local y1 = 0
	local y2 = 600
	
	self.x = math.random(x2 - x1) + x1
	
	self.y = math.random(y2 - y1) + y1
	
	ran3 = math.random(5) + 1
end

LWF.Script.get_unit._kira_kira_move_1_28_1 = function(self)
	local _root = self.lwf._root

	if ran3 == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_1_36_1 = function(self)
	local _root = self.lwf._root

	if ran3 == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_1_44_1 = function(self)
	local _root = self.lwf._root

	if ran3 == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_1_52_1 = function(self)
	local _root = self.lwf._root

	if ran3 == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_1_60_1 = function(self)
	local _root = self.lwf._root

	if ran3 == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_2_0_1 = function(self)
	local _root = self.lwf._root

	-- 角度をランダムでつける
	self.rotation = math.random(360)
	
	-- ランダムに値を取得
	ran2 = math.random(5) + 1
end

LWF.Script.get_unit._kira_kira_move_2_50_1 = function(self)
	local _root = self.lwf._root

	if ran2 == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_2_58_1 = function(self)
	local _root = self.lwf._root

	if ran2 == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_2_66_1 = function(self)
	local _root = self.lwf._root

	if ran2 == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_2_74_1 = function(self)
	local _root = self.lwf._root

	if ran2 == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_2_82_1 = function(self)
	local _root = self.lwf._root

	if ran2 == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_3_0_1 = function(self)
	local _root = self.lwf._root

	-- X座標の両端設定
	local x1 = 10
	local x2 = 620
	
	--[[
	//Y座標の両端設定
	y1 = 0;
	y2 = 600;
	]]
	
	-- 座標をランダムで決定する
	self.x = math.random(x2 - x1) + x1
	
	-- Y座標をランダムで決定する
	-- self.y = math.random(y2 - y1) + y1
	
	
	-- 角度をランダムでつける
	self.rotation = math.random(15)
	
	
	if math.random(2) == 1 then
		self.rotation = self.rotation * -1
	end
	
	
	if math.random(2) == 1 then
		self.xscale = self.xscale + -1
	end
	
	
	-- ランダムに値を取得
	ran = math.random(5) + 1
end

LWF.Script.get_unit._kira_kira_move_3_182_1 = function(self)
	local _root = self.lwf._root

	if ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_3_190_1 = function(self)
	local _root = self.lwf._root

	if ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_3_198_1 = function(self)
	local _root = self.lwf._root

	if ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_3_206_1 = function(self)
	local _root = self.lwf._root

	if ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._kira_kira_move_3_214_1 = function(self)
	local _root = self.lwf._root

	if ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_unit._root_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max > 5 then
		rare_max = 5
	end
	
	math.randomseed(os.time())
	math.random();math.random();math.random()
	
	setSkipLabel("skip0")
end

LWF.Script.get_unit._root_15_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 3 then
		playSound("SE_SYSTEM_027_GET_UNIT")
	end
end

LWF.Script.get_unit._root_2_1 = function(self)
	local _root = self.lwf._root

	if special ~= 0 then
		self:stop()
		self.special_eff:gotoAndPlay("go")
	end
end

LWF.Script.get_unit._root_33_1 = function(self)
	local _root = self.lwf._root

	if rare_max > 4 then
		self.eff_8:gotoAndStop("stop")	
		self.eff_9:gotoAndStop("stop")
	else
		self.wave_3:gotoAndStop("stop")
	end
end

LWF.Script.get_unit._root_45_1 = function(self)
	local _root = self.lwf._root

	if rare_max < 3 then
		self.rare_mc:gotoAndStop("stop")
	else
		self.rare_mc:gotoAndPlay("r_" .. rare_max)
	end
	
	self:gotoAndPlay("star_in")
	
	setSkipLabel(" ")
end

LWF.Script.get_unit._root_5_1 = function(self)
	local _root = self.lwf._root

	if rare_max == 4 then
		playSound("SE_SYSTEM_028_GET_UNIT")
	elseif rare_max == 3 then
		playSound("SE_SYSTEM_027_GET_UNIT")
	end
end

LWF.Script.get_unit._root_6_1 = function(self)
	local _root = self.lwf._root

	if rare_max < 5 then
		self.eff_11:gotoAndPlay("end")
		self.eff_11.visible = false
	end
	
	if rare_max == 5 then
		playSound("SE_SYSTEM_029_GET_UNIT")
	end
end

LWF.Script.get_unit.rare_All_143_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_151_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_159_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_220_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_unit.rare_All_277_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_358_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_372_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_386_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_401_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_478_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_unit.rare_All_557_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
	self.parent.star.star5:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_58_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_5_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_unit.rare_All_651_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_659_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_666_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_673_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_680_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star5:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_739_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_unit.rare_All_826_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
	self.parent.star.star5:gotoAndPlay("go")
	self.parent.star.star6:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_920_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_928_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_935_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_942_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_949_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star5:gotoAndPlay("go")
end

LWF.Script.get_unit.rare_All_956_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star6:gotoAndPlay("go")
end

LWF.Script.get_unit.special_eff_24_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_013_ARENA_ACQUISITION")
end

LWF.Script.get_unit.special_eff_68_1 = function(self)
	local _root = self.lwf._root

	self.parent:play()
end

LWF.Script.get_unit.star_0_1 = function(self)
	local _root = self.lwf._root

	if rare_max < 5 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_0_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("r_" .. rare_max)
end

LWF.Script.get_unit.star_All_142_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_148_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_14_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_154_2 = function(self)
	local _root = self.lwf._root

	if rare < 4 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_160_2 = function(self)
	local _root = self.lwf._root

	if rare < 5 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_166_2 = function(self)
	local _root = self.lwf._root

	if rare < 6 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_23_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_29_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_38_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_44_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_51_2 = function(self)
	local _root = self.lwf._root

	if rare < 4 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_61_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_67_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_73_2 = function(self)
	local _root = self.lwf._root

	if rare < 4 then
		self:stop()
	end
end

LWF.Script.get_unit.star_All_79_2 = function(self)
	local _root = self.lwf._root

	if rare < 5 then
		self:stop()
	end
end
