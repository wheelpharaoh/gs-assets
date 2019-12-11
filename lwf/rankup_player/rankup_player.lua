if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.rankup_player then LWF.Script.rankup_player={} end

LWF.Script.rankup_player._root_0_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_046_RANKUP_PLAYER")
	setSkipLabel("skip0")
end

LWF.Script.rankup_player._root_43_2 = function(self)
	local _root = self.lwf._root

	setSkipLabel("")
end
