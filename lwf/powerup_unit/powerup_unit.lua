if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.powerup_unit then LWF.Script.powerup_unit={} end

LWF.Script.powerup_unit._root_0_2 = function(self)
	local _root = self.lwf._root

	view = {view1, view2, view3, view4, view5}
	
	mc = {_root.mc_1, _root.mc_2, _root.mc_3, _root.mc_4, _root.mc_5}
	
	for i = 1, 5 do
		if view[i] == 0 then
			mc[i]:gotoAndStop("stop")
		end
	end
end

LWF.Script.powerup_unit._root_115_2 = function(self)
	local _root = self.lwf._root

	if g_suc == 2 then
		self:gotoAndPlay("st_2")
	end
end

LWF.Script.powerup_unit._root_116_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_031_POWERUP_UNIT")
end

LWF.Script.powerup_unit._root_200_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.powerup_unit._root_32_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_030_POWERUP_UNIT")
end
