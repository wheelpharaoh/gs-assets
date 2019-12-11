if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.limitbreak_unit then LWF.Script.limitbreak_unit={} end

LWF.Script.limitbreak_unit._root_0_2 = function(self)
	local _root = self.lwf._root

	view = {view1, view2, view3, view4, view5}
	
	mc = {_root.mc_1, _root.mc_2, _root.mc_3, _root.mc_4, _root.mc_5}
	
	for i = 1, 5 do
		if view[i] == 0 then
			mc[i]:gotoAndStop("stop")
		end
	end
end

LWF.Script.limitbreak_unit._root_121_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_031_POWERUP_UNIT")
end

LWF.Script.limitbreak_unit._root_4_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_033_LIMITBREAK_UNIT")
end
