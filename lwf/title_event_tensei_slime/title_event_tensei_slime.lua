if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.title_event_tensei_slime then LWF.Script.title_event_tensei_slime={} end

LWF.Script.title_event_tensei_slime.bbxx_0_1 = function(self)
	local _root = self.lwf._root

	setSkipLabel("skip0")
end

LWF.Script.title_event_tensei_slime.bbxx_182_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.title_event_tensei_slime.title_105_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end
