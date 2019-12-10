if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.get_material then LWF.Script.get_material={} end

LWF.Script.get_material._root_1_1 = function(self)
	local _root = self.lwf._root

	self.all.item_images:gotoAndStop("p_" .. item_pattern)
	self.all.text_set.item_names:gotoAndStop("p_" .. item_pattern)
	self.all.text_set.board:gotoAndStop("p_" .. item_pattern)
	self.all.eff_start:gotoAndStop("p_" .. item_pattern)
	self.all.eff_base_all_set.eff_base_set.eff_base_loop.eff_base:gotoAndStop("p_" .. item_pattern)
	self.all.eff_base_all_set.eff_base_set2.eff_base_loop.eff_base:gotoAndStop("p_" .. item_pattern)
	self.all.eff_bg_set.eff_bg:gotoAndStop("p_" .. item_pattern)
	self.all.eff_particle_01:gotoAndStop("p_" .. item_pattern)
	self.all.eff_particle_02:gotoAndStop("p_" .. item_pattern)
	self.all.eff_particle_03:gotoAndStop("p_" .. item_pattern)
	self.all.eff_particle_04:gotoAndStop("p_" .. item_pattern)
end

LWF.Script.get_material._root_29_1 = function(self)
	local _root = self.lwf._root

	self.all:gotoAndPlay("start")
end

LWF.Script.get_material.eff_kirakira_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndStop("p_" .. item_pattern)
end

LWF.Script.get_material.eff_kirakira_tween_0_1 = function(self)
	local _root = self.lwf._root

	self.rotation = math.random(360)
	ran = math.random(5) + 1
	self.eff:gotoAndStop("r_" .. ran)
end

LWF.Script.get_material.eff_kirakira_tween_599_1 = function(self)
	local _root = self.lwf._root

	if ran == 1 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.get_material.eff_kirakira_tween_619_1 = function(self)
	local _root = self.lwf._root

	if ran == 2 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.get_material.eff_kirakira_tween_639_1 = function(self)
	local _root = self.lwf._root

	if ran == 3 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.get_material.eff_kirakira_tween_659_1 = function(self)
	local _root = self.lwf._root

	if ran == 4 then
		self:gotoAndPlay("start")
	end
end

LWF.Script.get_material.eff_kirakira_tween_679_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("start")
end

LWF.Script.get_material.text_set_0_1 = function(self)
	local _root = self.lwf._root

	keta_max = 4
	
	if amount < 1 then
		amount = 1
	end
	
	amount_str_list = {}
	for s = 1, #tostring(amount) do
		table.insert(amount_str_list, string.sub(amount, s, s))
	end
	keta = #amount_str_list
	if keta > keta_max then
		keta = keta_max
	end
	local_number_list = {self.amount_set.amount.amount_numbers.n1, self.amount_set.amount.amount_numbers.n2, self.amount_set.amount.amount_numbers.n3, self.amount_set.amount.amount_numbers.n4}
	for j = 1, keta_max do
		if j <= keta then
			local_number_list[j]:gotoAndStop(tonumber(amount_str_list[j]) + 1)
		else
			local_number_list[j].visible = false
		end
	end
	
	self:gotoAndStop("l_" .. keta)
end
