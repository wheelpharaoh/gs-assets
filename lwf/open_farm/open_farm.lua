if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.open_farm then LWF.Script.open_farm={} end

LWF.Script.open_farm._root_15_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_037_OPEN_PLACE")
end
