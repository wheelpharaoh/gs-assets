if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.test_lwf then LWF.Script.test_lwf={} end

LWF.Script.test_lwf.Symbol_BackFrame_0_2 = function(self)
	local _root = self.lwf._root

		if var_value == 1 then
			self:gotoAndStop("Level_1");
		elseif var_value == 2 then
			self:gotoAndStop("Level_2");
		elseif var_value == 3 then
			self:gotoAndStop("Level_3");
		elseif var_value == 4 then
			self:gotoAndStop("Level_4");
		else
			self:gotoAndStop("Level_1");
		end
end

LWF.Script.test_lwf.Symbol_RuneLevelIcon_0_1 = function(self)
	local _root = self.lwf._root

	if var_value == 1 then
		self:gotoAndStop("Level_1");
	elseif var_value == 2 then
		self:gotoAndStop("Level_2");
	elseif var_value == 3 then
		self:gotoAndStop("Level_3");
	elseif var_value == 4 then
		self:gotoAndStop("Level_4");
	else
		self:gotoAndStop("Level_1");
	end
end

LWF.Script.test_lwf._root_19_1 = function(self)
	local _root = self.lwf._root

	self.Symbol_Main_Root:gotoAndPlay("Play")
end
