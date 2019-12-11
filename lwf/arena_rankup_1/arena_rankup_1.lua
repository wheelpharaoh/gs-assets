if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.arena_rankup_1 then LWF.Script.arena_rankup_1={} end

LWF.Script.arena_rankup_1._root_27_2 = function(self)
	local _root = self.lwf._root

	self.board:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_1._root_38_2 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end
