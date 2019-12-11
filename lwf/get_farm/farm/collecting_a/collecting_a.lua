if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.collecting_a then LWF.Script.collecting_a={} end

LWF.Script.collecting_a._root_115_2 = function(self)
	local _root = self.lwf._root

	mcItem = {_root.item_1, _root.item_2, _root.item_3, _root.item_4, _root.item_5, _root.item_6, _root.item_7, _root.item_8, _root.item_9, _root.item_10}
	
	for i = item_Cnt + 1, 10 do
		mcItem[i]:gotoAndStop("stop")
	end
end

LWF.Script.collecting_a._root_12_2 = function(self)
	local _root = self.lwf._root

	mcItem = {_root.item_1, _root.item_2, _root.item_3, _root.item_4, _root.item_5, _root.item_6, _root.item_7, _root.item_8, _root.item_9, _root.item_10}
	
	amount_list = {amount1, amount2, amount3, amount4, amount5, amount6, amount7, amount8, amount9, amount10}
	
	for i = item_Cnt + 1, 10 do
		mcItem[i]:gotoAndStop("stop")
	end
	
	if ptrn ~= 0 then
		playSound("SE_SYSTEM_032_POWERUP_UNIT")
	else
		playSound("SE_SYSTEM_031_POWERUP_UNIT")
	end
end

LWF.Script.collecting_a._root_73_2 = function(self)
	local _root = self.lwf._root

	amount_set_list = {_root.amount_set1, _root.amount_set2, _root.amount_set3, _root.amount_set4, _root.amount_set5, _root.amount_set6, _root.amount_set7, _root.amount_set8, _root.amount_set9, _root.amount_set10}
	
	for i = 1, 10 do
		if item_Cnt >= i and amount_list[i] and amount_list[i] > 0 then
			amount_str_list = {}
			for s = 1, #tostring(amount_list[i]) do
				table.insert(amount_str_list, string.sub(amount_list[i], s, s))
			end
			keta = #amount_str_list
			local_number_list = {amount_set_list[i].amount.amount_numbers.n1, amount_set_list[i].amount.amount_numbers.n2, amount_set_list[i].amount.amount_numbers.n3, amount_set_list[i].amount.amount_numbers.n4, amount_set_list[i].amount.amount_numbers.n5, amount_set_list[i].amount.amount_numbers.n6}
			for j = 1, 6 do
				if j <= keta then
					local_number_list[j]:gotoAndStop(tonumber(amount_str_list[j]) + 1)
				else
					local_number_list[j].visible = false
				end
			end
			if keta > 3 then
				if keta > 6 then
					keta = 6
				end
				amount_set_list[i]:gotoAndStop("s" .. tostring(keta))
			end
			amount_set_list[i].amount.amount_numbers.x = amount_set_list[i].amount.amount_numbers.x - 11 - (keta * 11)
		else
			amount_set_list[i].visible = false
		end
	end
end

LWF.Script.collecting_a.chara_move_25_1 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_050_COLLECTING_A")
end

LWF.Script.collecting_a.eff3_0_1 = function(self)
	local _root = self.lwf._root

	if ptrn ~= 0 then
		self:gotoAndStop(2)
	else
		self:stop()
	end
end

LWF.Script.collecting_a.eff5_0_1 = function(self)
	local _root = self.lwf._root

	if ptrn ~= 0 then
		self:gotoAndStop(2)
	else
		self:stop()
	end
end

LWF.Script.collecting_a.eff7_0_2 = function(self)
	local _root = self.lwf._root

	if ptrn ~= 0 then
		self:gotoAndPlay("loop_1")
	end
end

LWF.Script.collecting_a.movie1_0_2 = function(self)
	local _root = self.lwf._root

	if ptrn ~= 0 then
		self:gotoAndPlay("loop_1")
	end
end

LWF.Script.collecting_a.movie1_59_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("loop_"..ptrn)
end

LWF.Script.collecting_a.txt_1_0_1 = function(self)
	local _root = self.lwf._root

	if ptrn ~= 0 then
		self:gotoAndStop(2);
	else
		self:stop()
	end
end
