if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.bg_download then LWF.Script.bg_download={} end

LWF.Script.bg_download._root_0_1 = function(self)
	local _root = self.lwf._root

	math.randomseed(os.time())
	math.random();math.random();math.random()
	
	flg = 0
end

LWF.Script.bg_download.function_2_2 = function(self)
	local _root = self.lwf._root

	self.parent.mc1.c_1.x = self.parent.mc1.c_1.x - 1
	
	if flg == 0 then
		self.parent.mc1.c_2.x = self.parent.mc1.c_2.x - 1
	end
end

LWF.Script.bg_download.ki_loop_0_1 = function(self)
	local _root = self.lwf._root

	c_1 = c_2
	
	c_2 = math.ceil(math.random()*3)
	
	self.mc1:gotoAndStop("p_" .. c_1)
	self.mc2:gotoAndStop("p_" .. c_2)
end

LWF.Script.bg_download.maruta_loop_2257_2 = function(self)
	local _root = self.lwf._root

	flg = 1
end

LWF.Script.bg_download.maruta_loop_3217_2 = function(self)
	local _root = self.lwf._root

	flg = 0
end

LWF.Script.bg_download.tori_am_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay(math.floor((math.random()*40)+1))
end
