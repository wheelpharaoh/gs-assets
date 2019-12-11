if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_50600 then LWF.Script.bg_battle_50600={} end

LWF.Script.bg_battle_50600.07highlight_s_anim_1_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*100)))
end

LWF.Script.bg_battle_50600.20Flame_right1_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*50)+1))
end

LWF.Script.bg_battle_50600.20Flame_right1_ptn_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*30)+1))
end

LWF.Script.bg_battle_50600.40smoke_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*370)))
end
