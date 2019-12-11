if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.arena_rankup_2 then LWF.Script.arena_rankup_2={} end

LWF.Script.arena_rankup_2._root_0_1 = function(self)
	local _root = self.lwf._root

	A_class = slot - 2
	
	math.randomseed(os.time())
	math.random();math.random();math.random()
end

LWF.Script.arena_rankup_2._root_1_1 = function(self)
	local _root = self.lwf._root

	if in_orb > 0 then
		self.rankup_body.mc:gotoAndStop("st_" .. A_class)
		self.rankup_body.mc2:gotoAndStop("non")
	else
		self.rankup_body.mc:gotoAndStop("non")
		self.rankup_body.mc2:gotoAndStop("st_" .. A_class)
	end
end

LWF.Script.arena_rankup_2._root_39_1 = function(self)
	local _root = self.lwf._root

	self.rankup_body:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_2.arena_rankup_body_all_0_2 = function(self)
	local _root = self.lwf._root

	if in_orb > 0 then
		mc_orb = {self.mc.orb_1, self.mc.orb_2, self.mc.orb_3, self.mc.orb_4, self.mc.orb_5, self.mc.orb_6, self.mc.orb_7, self.mc.orb_8}
	else
		mc_orb = {self.mc2.orb_1, self.mc2.orb_2, self.mc2.orb_3, self.mc2.orb_4, self.mc2.orb_5, self.mc2.orb_6, self.mc2.orb_7, self.mc2.orb_8}
	end
	
	T_flg = 0
	
	for i = 1, info_orb do
		mc_orb[i]:gotoAndStop("stop")
	end
	
	cnt = 0
	init_class = A_class
end

LWF.Script.arena_rankup_2.arena_rankup_body_all_1_2 = function(self)
	local _root = self.lwf._root

	if in_orb > 0 then
		if T_flg == 0 then
			mc_orb[info_orb + cnt + 1]:gotoAndPlay("go")
		elseif cnt < 2 and in_orb == 2 then
			mc_orb[1]:gotoAndPlay("go")
		end
	else
		if T_flg == 0 then
			mc_orb[info_orb + cnt - 1]:gotoAndPlay("down")
		elseif in_orb == -2 then
			mc_orb[slot_a - 1]:gotoAndPlay("down")
		end
	end
end

LWF.Script.arena_rankup_2.arena_rankup_body_all_61_2 = function(self)
	local _root = self.lwf._root

	-- フレームがランクアップしていない
	
	if T_flg == 0 then
		if in_orb > 0 then
			cnt = cnt + 1
			if (info_orb + cnt) >= (A_class + 2) then
				A_class = A_class + 1
				self.mc:gotoAndPlay("st_" .. (A_class - 1) .. "_2")
				self:stop()
			elseif in_orb > 1 and cnt <= 1 then
				self:gotoAndPlay("st_1")
			elseif in_orb > 0 then
				self:gotoAndPlay("st_up")
			end
		else
			cnt = cnt - 1
			if (info_orb + cnt) == 0 then
				A_class = A_class - 1	
				self.mc2:gotoAndPlay("st_" .. (A_class + 1) .. "_2")
				self:stop();
			elseif in_orb < -1 and cnt >= -1 then
				self:gotoAndPlay("st_1")
			end
		end
	elseif in_orb > 0 then
		self:gotoAndPlay("st_up")
	end
end

LWF.Script.arena_rankup_2.arena_rankup_body_all_62_2 = function(self)
	local _root = self.lwf._root

	if (info_orb + in_orb) < (init_class + 2) then
		self.runk_up:gotoAndStop("non")
	end
end

LWF.Script.arena_rankup_2.kira_mov_0_1 = function(self)
	local _root = self.lwf._root

	-- 角度をランダムでつける
	self.rotation = math.random(360)
	
	-- ランダムに値を取得
	kira_ran = math.random(5) + 1
end

LWF.Script.arena_rankup_2.kira_mov_102_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_2.kira_mov_70_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_2.kira_mov_78_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_2.kira_mov_86_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_2.kira_mov_94_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_2.mc_ef_kami_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndStop(math.random(self.totalframes) + 1)
end

LWF.Script.arena_rankup_2.mc_ef_kami_mov_0_1 = function(self)
	local _root = self.lwf._root

	-- ランダム位置
	self.x = math.random(480) - 240
	
	-- ランダムサイズ
	self.xscale = math.random(200) + 50
	self.yscale = self.xscale
	
	-- ランダム角度
	self.rotation = math.random(60) - 30
end

LWF.Script.arena_rankup_2.orb_move_46_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_073_QUEST_MISSION")
end

LWF.Script.arena_rankup_2.ord_and_board_130_2 = function(self)
	local _root = self.lwf._root

	self.board:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_2.ord_and_board_134_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.arena_rankup_2.ord_and_board_180_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	self.parent:gotoAndPlay("st_1")
	
	if (in_orb + info_orb) > (A_class + 1) then
	
		--  ランクアップ後のスロット数
		if slot ~= slot_a then
			self:gotoAndPlay("st_2_in")
		else
			self:gotoAndPlay("st_1_in")
		end
	else
		self:stop()
	end
end

LWF.Script.arena_rankup_2.ord_and_board_210_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.arena_rankup_2.ord_and_board_217_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop(1)
	self.orb_2:gotoAndStop(1)
	self.orb_3:gotoAndStop(1)
	self.orb_4:gotoAndStop(1)
end

LWF.Script.arena_rankup_2.ord_and_board_2_11_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_2.ord_and_board_2_144_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	if (in_orb + info_orb) < 0 then
		
		if slot ~= slot_a then
			self:gotoAndPlay("st_4_in")
		else
			self:gotoAndPlay("st_5_in")
		end
	else
		self:stop()
		self.parent:gotoAndPlay("st_1")
	end
end

LWF.Script.arena_rankup_2.ord_and_board_2_145_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop("stop")
	self.orb_2:gotoAndStop("stop")
	self.orb_3:gotoAndStop("stop")
	self.orb_4:gotoAndStop("stop")
	self.orb_5:gotoAndStop("stop")
end

LWF.Script.arena_rankup_2.ord_and_board_2_162_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_2.ord_and_board_2_228_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	if (in_orb + info_orb) < 0 then
		
		if slot ~= slot_a then
			self:gotoAndPlay("st_3_in")
		else
			self:gotoAndPlay("st_4_in")
		end
	else
		self:stop()
		self.parent:gotoAndPlay("st_1")
	end
end

LWF.Script.arena_rankup_2.ord_and_board_2_229_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop("stop")
	self.orb_2:gotoAndStop("stop")
	self.orb_3:gotoAndStop("stop")
	self.orb_4:gotoAndStop("stop")
end

LWF.Script.arena_rankup_2.ord_and_board_2_244_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_2.ord_and_board_2_2_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop("stop")
	self.orb_2:gotoAndStop("stop")
	self.orb_3:gotoAndStop("stop")
	self.orb_4:gotoAndStop("stop")
	self.orb_5:gotoAndStop("stop")
	self.orb_6:gotoAndStop("stop")
	self.orb_7:gotoAndStop("stop")
end

LWF.Script.arena_rankup_2.ord_and_board_2_311_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	if (in_orb + info_orb) < 0 then
		
		if slot ~= slot_a then
			self:gotoAndPlay("st_2_in")
		else
			self:gotoAndPlay("st_3_in")
		end
	else
		self:stop()
		self.parent:gotoAndPlay("st_1")
	end
end

LWF.Script.arena_rankup_2.ord_and_board_2_312_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop("stop")
	self.orb_2:gotoAndStop("stop")
	self.orb_3:gotoAndStop("stop")
end

LWF.Script.arena_rankup_2.ord_and_board_2_327_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_2.ord_and_board_2_389_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	if (in_orb + info_orb) < 0 then
		
		if slot ~= slot_a then
			self:gotoAndPlay("st_1")
		else
			self:gotoAndPlay("st_2_in")
		end
	else
		self:stop()
		self.parent:gotoAndPlay("st_1")
	end
end

LWF.Script.arena_rankup_2.ord_and_board_2_63_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	if (in_orb + info_orb) < 0 then
		if slot ~= slot_a then
			self:gotoAndPlay("st_5_in")
		else
			self:gotoAndPlay("st_6_in")
		end
	else
		self:stop();
		self.parent:gotoAndPlay("st_1")
	end
end

LWF.Script.arena_rankup_2.ord_and_board_2_66_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop("stop")
	self.orb_2:gotoAndStop("stop")
	self.orb_3:gotoAndStop("stop")
	self.orb_4:gotoAndStop("stop")
	self.orb_5:gotoAndStop("stop")
	self.orb_6:gotoAndStop("stop")
end

LWF.Script.arena_rankup_2.ord_and_board_2_80_2 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_2.ord_and_board_309_2 = function(self)
	local _root = self.lwf._root

	self.board:gotoAndStop("st_3")
	self.parent.emb:gotoAndPlay("go")
end

LWF.Script.arena_rankup_2.ord_and_board_312_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.arena_rankup_2.ord_and_board_33_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.arena_rankup_2.ord_and_board_356_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	self.parent:gotoAndPlay("st_1")
	
	if (in_orb + info_orb) > (A_class + 1) then
	
		--  ランクアップ後のスロット数
		if slot ~= slot_a then
			self:gotoAndPlay("st_3_in")
		else
			self:gotoAndPlay("st_2_in")
		end
	else
		self:stop()
	end
end

LWF.Script.arena_rankup_2.ord_and_board_387_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.arena_rankup_2.ord_and_board_394_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop(1)
	self.orb_2:gotoAndStop(1)
	self.orb_3:gotoAndStop(1)
	self.orb_4:gotoAndStop(1)
	self.orb_5:gotoAndStop(1)
end

LWF.Script.arena_rankup_2.ord_and_board_39_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop(1)
	self.orb_2:gotoAndStop(1)
	self.orb_3:gotoAndStop(1)
end

LWF.Script.arena_rankup_2.ord_and_board_490_2 = function(self)
	local _root = self.lwf._root

	self.board.gotoAndStop("st_4")
	self.parent.emb:gotoAndPlay("go")
end

LWF.Script.arena_rankup_2.ord_and_board_493_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.arena_rankup_2.ord_and_board_540_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	self.parent:gotoAndPlay("st_1")
	
	if (in_orb + info_orb) > (A_class + 1) then
	
		--  ランクアップ後のスロット数
		if slot ~= slot_a then
			self:gotoAndPlay("st_4_in")
		else
			self:gotoAndPlay("st_3_in")
		end
	else
		self:stop()
	end
end

LWF.Script.arena_rankup_2.ord_and_board_574_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.arena_rankup_2.ord_and_board_582_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop(1)
	self.orb_2:gotoAndStop(1)
	self.orb_3:gotoAndStop(1)
	self.orb_4:gotoAndStop(1)
	self.orb_5:gotoAndStop(1)
	self.orb_6:gotoAndStop(1)
end

LWF.Script.arena_rankup_2.ord_and_board_680_2 = function(self)
	local _root = self.lwf._root

	self.board:gotoAndStop("st_5")
	self.parent.emb:gotoAndPlay("go")
end

LWF.Script.arena_rankup_2.ord_and_board_683_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.arena_rankup_2.ord_and_board_726_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	self.parent:gotoAndPlay("st_1")
	
	if (in_orb + info_orb) > (A_class + 1) then
	
		--  ランクアップ後のスロット数
		if slot ~= slot_a then
			self:gotoAndPlay("st_5_in")
		else
			self:gotoAndPlay("st_4_in")
		end
	else
		self:stop()
	end
end

LWF.Script.arena_rankup_2.ord_and_board_753_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_032_POWERUP_UNIT")
end

LWF.Script.arena_rankup_2.ord_and_board_762_2 = function(self)
	local _root = self.lwf._root

	self.orb_1:gotoAndStop(1)
	self.orb_2:gotoAndStop(1)
	self.orb_3:gotoAndStop(1)
	self.orb_4:gotoAndStop(1)
	self.orb_5:gotoAndStop(1)
	self.orb_6:gotoAndStop(1)
	self.orb_7:gotoAndStop(1)
end

LWF.Script.arena_rankup_2.ord_and_board_859_2 = function(self)
	local _root = self.lwf._root

	self.board:gotoAndStop("st_6")
	self.parent.emb:gotoAndPlay("go")
end

LWF.Script.arena_rankup_2.ord_and_board_865_45 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.arena_rankup_2.ord_and_board_903_2 = function(self)
	local _root = self.lwf._root

	T_flg = 1 -- フレームがランクアップした
	self.parent:gotoAndPlay("st_1")
	
	if (in_orb + info_orb) > (A_class + 1) then
	
		--  ランクアップ後のスロット数
		if slot ~= slot_a then
			self:gotoAndPlay("st_5_in")
		else
			self:stop()
		end
	else
		self:stop()
	end
end
