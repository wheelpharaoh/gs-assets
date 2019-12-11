if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.item_engraved_mark then LWF.Script.item_engraved_mark={} end

LWF.Script.item_engraved_mark.__Symbols_Symbol_Main_0_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_Symbol_Main_117_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_Symbol_Main_50_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_SYSTEM_RUNE_GET")
end

LWF.Script.item_engraved_mark.__Symbols_Symbol_RuneIcon_0_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndStop("Level_1");
end

LWF.Script.item_engraved_mark.__Symbols_eff_base_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_base_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_base_magicCircle_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_base_magicCircle_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_bg_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_bg_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndStop("p_" .. _root.vars.item_pattern)
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_resize_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_resize_1_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_resize_2_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_resize_3_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_resize_4_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_set_591_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_tween_0_1 = function(self)
	local _root = self.lwf._root

	--_root.vars._rotation_value = math.floor(math.random(360))
	self.rotation = math.floor(math.random(360))
	_root.vars.ran = math.floor(math.random(5)) + 1
	self.eff:gotoAndStop("r_" .. _root.vars.ran)
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_tween_599_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 1 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_tween_619_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 2 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_tween_639_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 3 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_tween_659_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran == 4 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.item_engraved_mark.__Symbols_eff_kirakira_tween_679_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("start")
end

LWF.Script.item_engraved_mark._eff_eff_07_all_0_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.rare_max == 4 then
		self:gotoAndStop(2)
	elseif _root.vars.rare_max > 4 then
		self:gotoAndStop(3)
	end
	
	self:stop();
end

LWF.Script.item_engraved_mark._kira_kira_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	
	if _root.vars.rare_max == 4 then
		self:gotoAndStop(2)
	elseif _root.vars.rare_max > 4 then
		self:gotoAndStop(3)
	end
end

LWF.Script.item_engraved_mark._kira_kira_All_2_8_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.item_engraved_mark._kira_kira_move_2_0_1 = function(self)
	local _root = self.lwf._root

	-- 角度をランダムでつける
	--_root.vars._rotation_value_2 = math.floor(math.random(360))
	self.rotation = math.floor(math.random(360))
	
	-- ランダムに値を取得
	_root.vars.ran_2 = math.floor(math.random(5)) + 1
end

LWF.Script.item_engraved_mark._kira_kira_move_2_50_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_engraved_mark._kira_kira_move_2_58_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_engraved_mark._kira_kira_move_2_66_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_engraved_mark._kira_kira_move_2_74_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_engraved_mark._kira_kira_move_2_82_1 = function(self)
	local _root = self.lwf._root

	if _root.vars.ran_2 == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.item_engraved_mark._root_0_2 = function(self)
	local _root = self.lwf._root

	if not _root.vars then _root.vars = {} end
	if not _root.fn then _root.fn = {} end
	
	if not _root.fn.initialized then
	
	    --
	    _root.var_value = _root.var_value or 0;
	
		_root.vars.symbol_main = self.Symbol_Main_Root;
		_root.vars._rotation_value = 0;
		_root.vars.ran = 0;
		_root.vars.item_pattern = 1;
		_root.vars.rare_max = 4;
	
	    _root.fn.update_function = function(update_time)
	
		end
	
	    _root.fn.initialized = true;
	end
end

LWF.Script.item_engraved_mark._root_19_2 = function(self)
	local _root = self.lwf._root

	self:stop();
	_root.vars.symbol_main:gotoAndPlay("Play");
end
