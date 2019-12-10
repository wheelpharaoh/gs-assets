if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.create_food then LWF.Script.create_food={} end

LWF.Script.create_food._root_0_3 = function(self)
	local _root = self.lwf._root

	setSkipLabel("skip0")
end

LWF.Script.create_food._root_147_3 = function(self)
	local _root = self.lwf._root

	setSkipLabel(" ")
end

LWF.Script.create_food._root_148_3 = function(self)
	local _root = self.lwf._root

	if c_result == 2 then
		_root:gotoAndPlay("go2")
	elseif c_result == 0 then
		_root:gotoAndPlay("go0")
	end
end

LWF.Script.create_food._root_212_3 = function(self)
	local _root = self.lwf._root

	self.kekka:gotoAndPlay("st_"..c_result)
	if (yuge) then
		self.yuge1:gotoAndStop("stop")
	end
end

LWF.Script.create_food._root_22_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_037_CREATE_FOOD")
end

LWF.Script.create_food._root_24_3 = function(self)
	local _root = self.lwf._root

	mat = {_root.mat_1, _root.mat_2, _root.mat_3, _root.mat_4, _root.mat_5}
	for i = 5, mat_num+1, -1 do
		mat[i]:gotoAndStop("end")
	end
end

LWF.Script.create_food._root_294_3 = function(self)
	local _root = self.lwf._root

	_root.star:gotoAndPlay("go")
end

LWF.Script.create_food._root_368_3 = function(self)
	local _root = self.lwf._root

	_root.kekka:gotoAndPlay("st_"..c_result)
	if (yuge) then
		_root.yuge1:gotoAndStop("stop")
	end
end

LWF.Script.create_food._root_450_3 = function(self)
	local _root = self.lwf._root

	_root.star:gotoAndPlay("go")
end

LWF.Script.create_food._root_524_3 = function(self)
	local _root = self.lwf._root

	_root.kekka:gotoAndPlay("st_"..c_result)
	if (yuge) then
		_root.yuge1:gotoAndStop("stop")
	end
end

LWF.Script.create_food.stre_in_5_2 = function(self)
	local _root = self.lwf._root

	self.star_1:gotoAndStop("end")
	self.star_2:gotoAndStop("end")
	self.star_3:gotoAndStop("end")
	self.star_4:gotoAndStop("end")
	self.star_5:gotoAndStop("end")
end

LWF.Script.create_food.stre_in_6_2 = function(self)
	local _root = self.lwf._root

	local star = {self.star_1, self.star_2, self.star_3, self.star_4, self.star_5}
	star[star_num]:gotoAndPlay("start")
end
