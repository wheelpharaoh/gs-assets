if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.loading then LWF.Script.loading={} end

LWF.Script.loading._root_0_1 = function(self)
	local _root = self.lwf._root

	math.randomseed(os.time())
	math.random();math.random();math.random()
	
	tmp_rand = math.random(8)
	if tmp_rand <= 1 then
		_root.cat_metal:gotoAndStop(2)
	end
end
