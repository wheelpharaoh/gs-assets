if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.levelup_common then LWF.Script.levelup_common={} end

LWF.Script.levelup_common._root_0_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_041_LEVELUP_UNIT")
end
