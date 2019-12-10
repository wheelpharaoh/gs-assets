if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_20300 then LWF.Script.bg_battle_20300={} end

LWF.Script.bg_battle_20300.tori_am_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*40)+1))
end
