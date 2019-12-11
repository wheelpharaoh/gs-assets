if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_3 then LWF.Script.bg_battle_3={} end

LWF.Script.bg_battle_3._root_1_2 = function(self)
	local _root = self.lwf._root

	self.mc:gotoAndPlay("in");
end

LWF.Script.bg_battle_3._root_22_2 = function(self)
	local _root = self.lwf._root

	self.mc:gotoAndPlay("out");
end
