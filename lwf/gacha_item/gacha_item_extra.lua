if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.gacha_item_extra then LWF.Script.gacha_item_extra={} end

LWF.Script.gacha_item_extra._root_0_2 = function(self)
	local _root = self.lwf._root

	setSkipLabel("skip_0")
	
	_root.rare:gotoAndStop("r_" .. rare_2)
	_root.r_light:gotoAndStop("r_" .. rare_2)
end

LWF.Script.gacha_item_extra._root_1_2 = function(self)
	local _root = self.lwf._root

	self.en:gotoAndStop(rare_2)
end

LWF.Script.gacha_item_extra._root_96_2 = function(self)
	local _root = self.lwf._root

	self.en_2:gotoAndStop(rare_2)
	self.last_light:gotoAndPlay("go")
	setSkipLabel("")
end

LWF.Script.gacha_item_extra._root_97_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.gacha_item_extra.eff_up_0_2 = function(self)
	local _root = self.lwf._root

	if rare_1 == rare_2 or rare_2 < 4 then
		self:gotoAndStop("stop");
	end
end

LWF.Script.gacha_item_extra.last_light_17_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_022_GACHA_UNIT")
end

LWF.Script.gacha_item_extra.last_light_35_1 = function(self)
	local _root = self.lwf._root

	self.parent:stop()
end
