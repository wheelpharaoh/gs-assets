if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.luck_max_100_ver then LWF.Script.luck_max_100_ver={} end

LWF.Script.luck_max_100_ver._eff_eff_01_a_44_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(1);
end

LWF.Script.luck_max_100_ver._eff_eff_08_74_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(1);
end

LWF.Script.luck_max_100_ver._kira_kira_All_1_8_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.luck_max_100_ver._kira_kira_All_2_8_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.luck_max_100_ver._kira_kira_move_1_0_1 = function(self)
	local _root = self.lwf._root

	local x1 = 10
	local x2 = 620
	
	local y1 = 0
	local y2 = 1100
	
	self.x = math.random(x2 - x1) + x1
	
	self.y = math.random(y2 - y1) + y1
	
	local ran = math.random(5) + 1
end

LWF.Script.luck_max_100_ver._kira_kira_move_1_28_1 = function(self)
	local _root = self.lwf._root

	if ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_1_36_1 = function(self)
	local _root = self.lwf._root

	if ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_1_44_1 = function(self)
	local _root = self.lwf._root

	if ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_1_52_1 = function(self)
	local _root = self.lwf._root

	if ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_1_60_1 = function(self)
	local _root = self.lwf._root

	if ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_2_0_1 = function(self)
	local _root = self.lwf._root

	local x1 = 10
	local x2 = 620
	
	local y1 = 0
	local y2 = 1100
	
	self.x = math.random(x2 - x1) + x1
	
	self.y = math.random(y2 - y1) + y1
	
	local ran = math.random(5) + 1
end

LWF.Script.luck_max_100_ver._kira_kira_move_2_50_1 = function(self)
	local _root = self.lwf._root

	if ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_2_58_1 = function(self)
	local _root = self.lwf._root

	if ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_2_66_1 = function(self)
	local _root = self.lwf._root

	if ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_2_74_1 = function(self)
	local _root = self.lwf._root

	if ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._kira_kira_move_2_82_1 = function(self)
	local _root = self.lwf._root

	if ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.luck_max_100_ver._root_0_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_034_LUCKMAX")
end

LWF.Script.luck_max_100_ver._root_136_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_035_LUCKMAX")
end

LWF.Script.luck_max_100_ver._root_155_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.luck_max_100_ver.txt_Congratulations_113_2 = function(self)
	local _root = self.lwf._root

	_root.txt_luck:gotoAndPlay("loop");
end

LWF.Script.luck_max_100_ver.txt_Congratulations_183_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("loop");
end

LWF.Script.luck_max_100_ver.txt_LUCK_MAX_113_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.luck_max_100_ver.txt_LUCK_MAX_62_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end
