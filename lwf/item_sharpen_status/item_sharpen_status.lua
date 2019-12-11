if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.item_sharpen_status then LWF.Script.item_sharpen_status={} end

LWF.Script.item_sharpen_status.__Symbols_Symbol_Main_0_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_Symbol_Main_117_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_Symbol_Main_50_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_SYSTEM_RUNE_GET")
end

LWF.Script.item_sharpen_status.__Symbols_Symbol_RuneIcon_0_2 = function(self)
	local _root = self.lwf._root

	if _root.var_value == 1 then
		self:gotoAndStop("Level_1");
	elseif _root.var_value == 2 then
		self:gotoAndStop("Level_1_Plus");
	elseif _root.var_value == 3 then
		self:gotoAndStop("Level_2");
	elseif _root.var_value == 4 then
		self:gotoAndStop("Level_2_Plus");
	elseif _root.var_value == 5 then
		self:gotoAndStop("Level_3");
	elseif _root.var_value == 6 then
		self:gotoAndStop("Level_3_Plus");
	elseif _root.var_value == 7 then
		self:gotoAndStop("Level_4");
	elseif _root.var_value == 8 then
		self:gotoAndStop("Level_4_Plus");
	else
		self:gotoAndStop("Level_1");
	end
end

LWF.Script.item_sharpen_status.__Symbols_eff_base_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_base_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_base_magicCircle_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_base_magicCircle_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_bg_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_bg_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndStop("p_" .. _root.vars.item_pattern)
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_resize_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_resize_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_resize_2_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_resize_3_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_resize_4_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_set_591_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_tween_0_1 = function(self)
	local _root = self.lwf._root

	_root.vars._rotation_value = math.floor(math.random(360))
	_root.vars.ran = math.floor(math.random(5)) + 1
	self.eff:gotoAndStop("r_" .. _root.vars.ran)
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_tween_599_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 1 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_tween_619_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 2 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_tween_639_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 3 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_tween_659_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 4 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_sharpen_status.__Symbols_eff_kirakira_tween_679_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("start")
end

LWF.Script.item_sharpen_status._eff_eff_07_all_0_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.rare_max == 4 then
		self:gotoAndStop(2)
	elseif _root.vars.rare_max > 4 then
		self:gotoAndStop(3)
	end
	
	self:stop();
end

LWF.Script.item_sharpen_status._kira_kira_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	
	if _root.vars.rare_max == 4 then
		self:gotoAndStop(2)
	elseif _root.vars.rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.item_sharpen_status._kira_kira_All_2_8_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status._kira_kira_move_2_0_1 = function(self)
	local _root = self.lwf._root

	-- 角度をランダムでつける
	_root.vars._rotation_value_2 = math.floor(math.random(360))
	
	-- ランダムに値を取得
	_root.vars.ran_2 = math.floor(math.random(5)) + 1
end

LWF.Script.item_sharpen_status._kira_kira_move_2_50_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_sharpen_status._kira_kira_move_2_58_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_sharpen_status._kira_kira_move_2_66_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_sharpen_status._kira_kira_move_2_74_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_sharpen_status._kira_kira_move_2_82_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_sharpen_status._root_0_1 = function(self)
	local _root = self.lwf._root

	if not _root.vars then _root.vars = {} end
	if not _root.fn then _root.fn = {} end
	
	if not _root.fn.initialized then
	
	    _G.success_level = _G.success_level or 3;
		_root.vars.main = self.Sharpen_main;
		_root.vars.kirakira = _root.vars.main.kirakira;
	
	    _root.fn.update_function = function(update_time)
	
		end
	
	    _root.fn.initialized = true;
	end
end

LWF.Script.item_sharpen_status._root_19_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_sharpen_status.sharpens_Sharpen_main_120_2 = function(self)
	local _root = self.lwf._root

	_root.vars.main:stop();
end

LWF.Script.item_sharpen_status.sharpens_Sharpen_main_144_2 = function(self)
	local _root = self.lwf._root

	--_root.vars.main:gotoAndPlay("start");
end

LWF.Script.item_sharpen_status.sharpens_Sharpen_main_34_2 = function(self)
	local _root = self.lwf._root

	if _G.success_level == 1 then
		_root.vars.kirakira:gotoAndPlay("start_1");
	elseif _G.success_level == 2 then
		_root.vars.kirakira:gotoAndPlay("start_2");
	elseif _G.success_level == 3 then
		_root.vars.kirakira:gotoAndPlay("start_3");
	end
end

LWF.Script.item_sharpen_status.sharpens_Sharpen_main_97_2 = function(self)
	local _root = self.lwf._root

	_root.vars.main:stop();
end
