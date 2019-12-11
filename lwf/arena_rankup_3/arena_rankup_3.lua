if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.arena_rankup_3 then LWF.Script.arena_rankup_3={} end

LWF.Script.arena_rankup_3._root_0_1 = function(self)
	local _root = self.lwf._root

	math.randomseed(os.time())
	math.random();math.random();math.random()
end

LWF.Script.arena_rankup_3._root_39_1 = function(self)
	local _root = self.lwf._root

	self.rankup_body:gotoAndPlay("st_1")
end

LWF.Script.arena_rankup_3.arena_rank_emb_102_1 = function(self)
	local _root = self.lwf._root

	self.emb.emb:gotoAndStop("st_2")
	self.emb2.emb:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_3.arena_rank_emb_123_1 = function(self)
	local _root = self.lwf._root

	self.emb:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_3.arena_rank_emb_138_1 = function(self)
	local _root = self.lwf._root

	self.emb2:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_3.arena_rank_emb_147_1 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_end")
end

LWF.Script.arena_rankup_3.arena_rankup_body_all_112_2 = function(self)
	local _root = self.lwf._root

	if Rank_up == 0 then
		self:stop()
	end
end

LWF.Script.arena_rankup_3.arena_rankup_body_all_130_2 = function(self)
	local _root = self.lwf._root

	--self.emb:gotoAndPlay("go")
	--self.emb2:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_3.arena_rankup_body_all_20_3 = function(self)
	local _root = self.lwf._root

	playSound("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.arena_rankup_3.arena_rankup_body_all_51_2 = function(self)
	local _root = self.lwf._root

	self.num:gotoAndPlay("go")
end

LWF.Script.arena_rankup_3.arena_rankup_body_all_57_2 = function(self)
	local _root = self.lwf._root

	self.num_2:gotoAndPlay("go");
end

LWF.Script.arena_rankup_3.kira_mov_0_1 = function(self)
	local _root = self.lwf._root

	-- 角度をランダムでつける
	self.rotation = math.random(360)
	
	-- ランダムに値を取得
	kira_ran = math.random(5) + 1
end

LWF.Script.arena_rankup_3.kira_mov_102_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 5 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_3.kira_mov_70_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 1 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_3.kira_mov_78_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 2 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_3.kira_mov_86_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 3 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_3.kira_mov_94_1 = function(self)
	local _root = self.lwf._root

	if kira_ran == 4 then
		self:gotoAndPlay(1)
	end
end

LWF.Script.arena_rankup_3.mc_ef_kami_0_1 = function(self)
	local _root = self.lwf._root

	-- ランダムフレーム
	self.gotoAndStop(math.random(self.totalframes) + 1)
end

LWF.Script.arena_rankup_3.mc_ef_kami_mov_0_1 = function(self)
	local _root = self.lwf._root

	-- ランダム位置
	self.x = math.random(480) - 240
	
	-- ランダムサイズ
	self.xscale = math.random(200) + 50
	self.yscale = self.xscale
	
	-- ランダム角度
	self.rotation = math.random(60) - 30
end

LWF.Script.arena_rankup_3.movie0_9_1 = function(self)
	local _root = self.lwf._root

	self.emb.emb:gotoAndStop("st_2")
end

LWF.Script.arena_rankup_3.num_000_0_2 = function(self)
	local _root = self.lwf._root

	mc1 = {self.num_10000000, self.num_1000000, self.num_100000, self.num_10000, self.num_1000, self.num_100, self.num_10, self.num_1}
	info_orb_str_list = {}
	for s = 1, #tostring(info_orb) do
		table.insert(info_orb_str_list, string.sub(info_orb, s, s))
	end
	after_orb_str_list = {}
	for s = 1, #tostring(info_orb+in_orb) do
		table.insert(after_orb_str_list, string.sub(info_orb+in_orb, s, s))
	end
	default_x1 = self.x;
	
	for i = 1, #mc1 do
		if type(info_orb_str_list[i]) == "string" then
			mc1[i]:gotoAndStop("n_" .. info_orb_str_list[i])
		else
			mc1[i]:gotoAndStop("non")
			self.x = self.x + 14
		end
	end
end

LWF.Script.arena_rankup_3.num_000_1_2 = function(self)
	local _root = self.lwf._root

	for i = 1, #mc1 do
		if type(info_orb_str_list[i]) == "string" then
			mc1[i]:play()
		end
	end
end

LWF.Script.arena_rankup_3.num_000_38_2 = function(self)
	local _root = self.lwf._root

	self.x = default_x1
	
	for i = 1, #mc1 do
		if type(after_orb_str_list[i]) == "string" then
			mc1[i]:gotoAndStop("n_" .. after_orb_str_list[i])
		else
			mc1[i]:gotoAndStop("non")
			self.x = self.x + 14
		end
	end
	
	self.parent:gotoAndPlay("st_num")
end

LWF.Script.arena_rankup_3.num_000_p_0_2 = function(self)
	local _root = self.lwf._root

	mc2 = {self.num_1000000, self.num_100000, self.num_10000, self.num_1000, self.num_100, self.num_10, self.num_1}
	info_order_str_list = {}
	for s = 1, #tostring(info_order) do
		table.insert(info_order_str_list, string.sub(info_order, s, s))
	end
	a_order_str_list = {}
	for s = 1, #tostring(a_order) do
		table.insert(a_order_str_list, string.sub(a_order, s, s))
	end
	default_x2 = self.x;
	
	for i = 1, #mc2 do
		if type(info_order_str_list[i]) == "string" then
			mc2[i]:gotoAndStop("n_" .. info_order_str_list[i])
		else
			mc2[i]:gotoAndStop("non")
			self.x = self.x + 20
		end
	end
end

LWF.Script.arena_rankup_3.num_000_p_1_2 = function(self)
	local _root = self.lwf._root

	for i = 1, #mc2 do
		if type(info_order_str_list[i]) == "string" then
			mc2[i]:play()
		end
	end
end

LWF.Script.arena_rankup_3.num_000_p_38_2 = function(self)
	local _root = self.lwf._root

	self.x = default_x2
	
	for i = 1, #mc2 do
		if type(a_order_str_list[i]) == "string" then
			mc2[i]:gotoAndStop("n_" .. a_order_str_list[i])
		else
			mc2[i]:gotoAndStop("non")
			self.x = self.x + 20
		end
	end
end

LWF.Script.arena_rankup_3.orb_move1_29_1 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndPlay("st_2")
end
