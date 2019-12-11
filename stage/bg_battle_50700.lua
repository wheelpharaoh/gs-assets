if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_50700 then LWF.Script.bg_battle_50700={} end

LWF.Script.bg_battle_50700.groundparticle_anim2_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*300)+195))
end

LWF.Script.bg_battle_50700.groundparticle_anim3_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*200)+95))
end

LWF.Script.bg_battle_50700.groundparticle_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*200)+95))
end

LWF.Script.bg_battle_50700.kona_p_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*110)+129))
end

LWF.Script.bg_battle_50700.lights_u_animp_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*280)+155))
end

LWF.Script.bg_battle_50700.line01_turn_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*620)+2))
end

LWF.Script.bg_battle_50700.star1_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*70)))
end

LWF.Script.bg_battle_50700.star2anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*70)))
end

LWF.Script.bg_battle_50700.star3_anim_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*70)))
end
