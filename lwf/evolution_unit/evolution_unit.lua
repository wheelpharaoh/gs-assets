if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.evolution_unit then LWF.Script.evolution_unit={} end

LWF.Script.evolution_unit._root_0_3 = function(self)
	local _root = self.lwf._root

	view = {view1, view2, view3, view4, view5}
end

LWF.Script.evolution_unit._root_105_3 = function(self)
	local _root = self.lwf._root

	mc = {self.mc1, self.mc2, self.mc3, self.mc4, self.mc5}
	
	for i = 1, 5 do
		mc[i].mc1:gotoAndStop("li")
	end
end

LWF.Script.evolution_unit._root_140_3 = function(self)
	local _root = self.lwf._root

	mc = {self.mc1, self.mc2, self.mc3, self.mc4, self.mc5}
	
	for i = 1, 5 do
		mc[i].mc1:gotoAndPlay("go")
	end
end

LWF.Script.evolution_unit._root_191_3 = function(self)
	local _root = self.lwf._root

	mc = {self.down1, self.down2, self.down3, self.down4, self.down5}
	
	for i = 1, 5 do
		mc[i]:gotoAndPlay("go")
	end
end

LWF.Script.evolution_unit._root_75_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_054_UNIT_EVOLUTION")
end

LWF.Script.evolution_unit._root_75_3 = function(self)
	local _root = self.lwf._root

	mc = {self.down1, self.down2, self.down3, self.down4, self.down5}
	
	for i = 1, 5 do
		if view[i] == 0 then
			mc[i].visible = false
		end
	end
end

LWF.Script.evolution_unit._root_93_3 = function(self)
	local _root = self.lwf._root

	mc = {self.mc1, self.mc2, self.mc3, self.mc4, self.mc5}
	
	for i = 1, 5 do
		if view[i] == 0 then
			mc[i].visible = false
		else
			mc[i].mc1.card:gotoAndStop(i)
		end
	end
end
