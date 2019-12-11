if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_10600 then LWF.Script.bg_battle_10600={} end

LWF.Script.bg_battle_10600.rainball1_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end

LWF.Script.bg_battle_10600.rainball2_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*40)+15))
end

LWF.Script.bg_battle_10600.rainball3_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*30)+25))
end

LWF.Script.bg_battle_10600.rainball4_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end

LWF.Script.bg_battle_10600.rainball5_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end

LWF.Script.bg_battle_10600.rainball6_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end
