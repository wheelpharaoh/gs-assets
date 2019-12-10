if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_30500 then LWF.Script.bg_battle_30500={} end

LWF.Script.bg_battle_30500.80_star_1_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*100)+2))
end

LWF.Script.bg_battle_30500.81_drop_1_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*150)+50))
end
