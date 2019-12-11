if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.get_item then LWF.Script.get_item={} end

LWF.Script.get_item._eff_eff_01_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_02_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_03_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_04_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_05_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_06_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_07_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_08_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_09_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_10_all_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._eff_eff_11_move_28_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("go")
end

LWF.Script.get_item._kira_kira3_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._kira_kira_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.get_item._kira_kira_move_1_0_1 = function(self)
	local _root = self.lwf._root

	-- X座標の両端設定
	local x1 = 10
	local x2 = 620
	
	-- Y座標の両端設定
	local y1 = 0;
	local y2 = 600
	
	-- 座標をランダムで決定する
	self.x = math.random(x2 - x1) + x1
	
	-- Y座標をランダムで決定する
	self.y = math.random(y2 - y1) + y1
	
	-- ランダムに値を取得
	self.ran = math.random(5) + 1
end

LWF.Script.get_item._kira_kira_move_1_28_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_1_36_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_1_44_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_1_52_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_1_60_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_2_0_1 = function(self)
	local _root = self.lwf._root

	-- 角度をランダムでつける
	self.rotation = math.random(360)
end

LWF.Script.get_item._kira_kira_move_3_0_1 = function(self)
	local _root = self.lwf._root

	-- X座標の両端設定
	local x1 = 10
	local x2 = 620
	--[[
	-- Y座標の両端設定
	local y1 = 0
	local y2 = 600
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
		self.xscale = self.xscale * -1
	end
	
	-- ランダムに値を取得
	self.ran = math.random(5) + 1
end

LWF.Script.get_item._kira_kira_move_3_182_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_3_190_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_3_198_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_3_206_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._kira_kira_move_3_214_1 = function(self)
	local _root = self.lwf._root

	if self.ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.get_item._root_0_2 = function(self)
	local _root = self.lwf._root

	math.randomseed(os.time())
	math.random();math.random();math.random()
	
	setSkipLabel("skip0")
end

LWF.Script.get_item._root_2_2 = function(self)
	local _root = self.lwf._root

	if special ~= 0 then
		self:stop()
		self.special_eff:gotoAndPlay("go")
	end
end

LWF.Script.get_item._root_45_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self.rare_mc:gotoAndStop("stop")
		self:gotoAndPlay("star_in")
	else
		self.rare_mc:gotoAndPlay("r_" .. rare)
	end
	
	setSkipLabel("")
end

LWF.Script.get_item._root_5_2 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		playSound("SE_SYSTEM_028_GET_UNIT")
	elseif rare == 3 then
		playSound("SE_SYSTEM_027_GET_UNIT")
	end
end

LWF.Script.get_item._root_6_2 = function(self)
	local _root = self.lwf._root

	if rare ~= 5 then
		self.eff_11:gotoAndPlay("end")
		self.eff_11.visible = false
	end
	
	if rare == 5 then
		playSound("SE_SYSTEM_029_GET_UNIT")
	end
end

LWF.Script.get_item.rare_All_143_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_151_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_159_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_220_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_item.rare_All_277_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_358_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_372_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_386_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_401_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_478_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_item.rare_All_557_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
	self.parent.star.star5:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_58_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_5_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.get_item.rare_All_651_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_659_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_666_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_673_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.get_item.rare_All_680_2 = function(self)
	local _root = self.lwf._root

	self.star.star5:gotoAndPlay("go")
end

LWF.Script.get_item.special_eff_24_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_013_ARENA_ACQUISITION")
end

LWF.Script.get_item.special_eff_68_1 = function(self)
	local _root = self.lwf._root

	self.parent:play()
end

LWF.Script.get_item.star_0_1 = function(self)
	local _root = self.lwf._root

	if rare < 5 then
		self:stop()
	end
end

LWF.Script.get_item.star_All_0_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("r_" .. rare)
end

LWF.Script.get_item.star_All_14_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_item.star_All_23_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_item.star_All_29_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.get_item.star_All_38_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.get_item.star_All_44_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.get_item.star_All_51_2 = function(self)
	local _root = self.lwf._root

	if rare < 4 then
		self:stop()
	end
end
