if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.create_item then LWF.Script.create_item={} end

LWF.Script.create_item._root_0_3 = function(self)
	local _root = self.lwf._root

	setSkipLabel("skip0")
end

LWF.Script.create_item._root_147_3 = function(self)
	local _root = self.lwf._root

	setSkipLabel("")
end

LWF.Script.create_item._root_148_3 = function(self)
	local _root = self.lwf._root

	c_result = 1
	if star_num >= 5 then
		c_result = 3
	elseif star_num >= 3 then
		c_result = 2
	end
	
	if c_result == 2 then
		self:gotoAndPlay("go2")
	elseif c_result == 3 then
		self:gotoAndPlay("go3")
	end
end

LWF.Script.create_item._root_194_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_027_GET_UNIT")
end

LWF.Script.create_item._root_214_3 = function(self)
	local _root = self.lwf._root

	self.kekka:gotoAndPlay("st_"..c_result)
end

LWF.Script.create_item._root_22_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_036_CREATE_ITEM")
end

LWF.Script.create_item._root_24_3 = function(self)
	local _root = self.lwf._root

	mat = {_root.mat_1, _root.mat_2, _root.mat_3, _root.mat_4, _root.mat_5}
	for i = 5, mat_num+1, -1 do
		mat[i]:gotoAndStop("end")
	end
end

LWF.Script.create_item._root_262_3 = function(self)
	local _root = self.lwf._root

	self.star:gotoAndPlay("go")
end

LWF.Script.create_item._root_325_3 = function(self)
	local _root = self.lwf._root

	mat = {_root.mat_1, _root.mat_2, _root.mat_3, _root.mat_4, _root.mat_5}
	for i = 5, mat_num+1, -1 do
		mat[i]:gotoAndStop("end")
	end
end

LWF.Script.create_item._root_369_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_028_GET_UNIT")
end

LWF.Script.create_item._root_390_3 = function(self)
	local _root = self.lwf._root

	self.kekka:gotoAndPlay("st_"..c_result)
end

LWF.Script.create_item._root_435_3 = function(self)
	local _root = self.lwf._root

	self.star:gotoAndPlay("go")
end

LWF.Script.create_item._root_512_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_029_GET_UNIT")
end

LWF.Script.create_item._root_552_3 = function(self)
	local _root = self.lwf._root

	self.kekka:gotoAndPlay("st_"..c_result)
end

LWF.Script.create_item._root_584_3 = function(self)
	local _root = self.lwf._root

	self.star:gotoAndPlay("go")
end

LWF.Script.create_item.star_0_2 = function(self)
	local _root = self.lwf._root

	if c_result == 3 then
		self:gotoAndStop(2)
	end
end

LWF.Script.create_item.stre_in_6_2 = function(self)
	local _root = self.lwf._root

	star = {self.star_1, self.star_2, self.star_3, self.star_4, self.star_5}
	
	for i = 1, #star do
		if i ~= star_num then
			star[i].visible = false
		end
	end
end
