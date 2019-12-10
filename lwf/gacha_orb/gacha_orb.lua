if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.gacha_orb then LWF.Script.gacha_orb={} end

LWF.Script.gacha_orb._eff_eff_08_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_10_1_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_10_2_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_11_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_12_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_13_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_14_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_15_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_16_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_17_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_19_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_20_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_21_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_22_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_23_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._eff_eff_24_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb._root_0_3 = function(self)
	local _root = self.lwf._root

	setSkipLabel("skip0")
end

LWF.Script.gacha_orb._root_154_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_040_GACHA_ORB")
end

LWF.Script.gacha_orb._root_160_3 = function(self)
	local _root = self.lwf._root

	self.kama:gotoAndPlay("st_1")
end

LWF.Script.gacha_orb._root_29_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_019_GACHA_UNIT")
end

LWF.Script.gacha_orb._root_478_3 = function(self)
	local _root = self.lwf._root

	self.kama:gotoAndStop("stop")
	setSkipLabel("")
end

LWF.Script.gacha_orb._root_481_3 = function(self)
	local _root = self.lwf._root

	if obj_type ~= 3 then
		self:gotoAndStop("white_out")
	else
		self:gotoAndStop("get")
	end
end

LWF.Script.gacha_orb._root_483_3 = function(self)
	local _root = self.lwf._root

	if rare ~= 5 then
		self.eff_11:gotoAndPlay("end")
	end
	
	if rare == 5 then
		playSound("SE_SYSTEM_029_GET_UNIT")
	end
end

LWF.Script.gacha_orb._root_497_2 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		playSound("SE_SYSTEM_028_GET_UNIT")
	elseif rare == 3 then
		playSound("SE_SYSTEM_027_GET_UNIT")
	end
end

LWF.Script.gacha_orb._root_537_3 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self.rare_mc:gotoAndStop("stop")
		self:gotoAndPlay("star_in")
	else
		self.rare_mc:gotoAndPlay("r_" .. rare)
	end
end

LWF.Script.gacha_orb.eff_26_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb.eff_27_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb.eff_28_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb.eff_bg_0_1 = function(self)
	local _root = self.lwf._root

	if rare == 4 then
		self:gotoAndStop(2)
	elseif rare == 5 then
		self:gotoAndStop(3)
	end
end

LWF.Script.gacha_orb.rare5_interval_17_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_143_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_151_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_159_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_220_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.gacha_orb.rare_All_277_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_358_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_372_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_386_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_401_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_478_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.gacha_orb.rare_All_557_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
	self.parent.star.star4:gotoAndPlay("go")
	self.parent.star.star5:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_58_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
	self.parent.star.star2:gotoAndPlay("go")
	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_5_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("star_in")
end

LWF.Script.gacha_orb.rare_All_651_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star1:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_659_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star2:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_666_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star3:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_673_2 = function(self)
	local _root = self.lwf._root

	self.parent.star.star4:gotoAndPlay("go")
end

LWF.Script.gacha_orb.rare_All_680_2 = function(self)
	local _root = self.lwf._root

	self.star.star5:gotoAndPlay("go")
end

LWF.Script.gacha_orb.star_0_1 = function(self)
	local _root = self.lwf._root

	if rare < 5 then
		self:stop()
	end
end

LWF.Script.gacha_orb.star_All_0_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("r_" .. rare)
end

LWF.Script.gacha_orb.star_All_14_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.gacha_orb.star_All_23_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.gacha_orb.star_All_29_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.gacha_orb.star_All_38_2 = function(self)
	local _root = self.lwf._root

	if rare < 2 then
		self:stop()
	end
end

LWF.Script.gacha_orb.star_All_44_2 = function(self)
	local _root = self.lwf._root

	if rare < 3 then
		self:stop()
	end
end

LWF.Script.gacha_orb.star_All_51_2 = function(self)
	local _root = self.lwf._root

	if rare < 4 then
		self:stop()
	end
end
