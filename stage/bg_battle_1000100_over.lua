if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_battle_1000100_over then LWF.Script.bg_battle_1000100_over={} end

LWF.Script.bg_battle_1000100_over.rainball1_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end

LWF.Script.bg_battle_1000100_over.rainball2_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*40)+15))
end

LWF.Script.bg_battle_1000100_over.rainball3_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*30)+25))
end

LWF.Script.bg_battle_1000100_over.rainball4_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end

LWF.Script.bg_battle_1000100_over.rainball5_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end

LWF.Script.bg_battle_1000100_over.rainball6_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*35)+20))
end
