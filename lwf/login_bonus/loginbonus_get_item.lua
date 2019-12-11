if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.loginbonus_get_item then LWF.Script.loginbonus_get_item={} end

LWF.Script.loginbonus_get_item.kira_0_1 = function(self)
	local _root = self.lwf._root

	if eff_type == 2 then
		self:gotoAndStop(2)
	else
		self:stop()
	end
end
