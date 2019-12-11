if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.gacha_unit then LWF.Script.gacha_unit={} end

LWF.Script.gacha_unit._root_0_1 = function(self)
	local _root = self.lwf._root

	math.randomseed(os.time())
	math.random();math.random();math.random()
	
	all_cnt = 11
	rare_cap = 5
	rare_level = 0
	
	chara_no = 1
	other_chara_1 = 0
	other_chara_2 = 0
	chara_extend = 0
	sky_mode = 0
	touch_mode = 0
	congrats = 0
	
	if rare_2 > rare_cap then
		rare_2 = rare_cap
	end
	
	g_ten = {g_ten1, g_ten2, g_ten3, g_ten4, g_ten5, g_ten6, g_ten7, g_ten8, g_ten9, g_ten10, g_ten11}
	for i = 1, #g_ten do
		if g_ten[i] > rare_cap then
			g_ten[i] = rare_cap
		end
	end
	
	
	if g_cnt == 0 then
		if rare_2 >= 5 then
			rare_level = rare_level + 1
		end
	else
		for i = 1, #g_ten do
			if g_ten[i] >= 5 then
				rare_level = rare_level + 1
			end
		end
	end
	
	chara_ran = math.random(100)
	other_chara_1_ran = math.random(100)
	other_chara_2_ran = math.random(100)
	chara_extend_ran = math.random(100)
	sky_mode_ran = math.random(100)
	touch_mode_ran = math.random(100)
	extend_wait_ran = math.random(3)
	
	if rare_level >= 3 then
		
		
		if chara_ran <= 40 then
			
			if chara_extend_ran <= 30 then
				chara_extend = 1
			elseif chara_extend_ran <= 80 then
				chara_extend = 2
				
				if other_chara_2_ran <= 50 then
					other_chara_2 = 1
					extend_wait_ran = 1
				end
			else
				congrats = 1
			end
	
			if other_chara_1_ran <= 80 then
				other_chara_1 = 1
			end
		
			if touch_mode_ran <= 40 then
				touch_mode = 1
			end
		
			if sky_mode_ran <= 30 then
				sky_mode = 1
			elseif sky_mode_ran <= 90 then
				sky_mode = 2
			end
			
		else
			chara_no = 2
			chara_extend = 1
			touch_mode = 1
			sky_mode = 2
		end
		
	elseif rare_level >= 2 then
		
		if chara_ran <= 60 then
			
			if chara_extend_ran <= 40 then
				chara_extend = 1
			elseif chara_extend_ran <= 80 then
				chara_extend = 2
				
				if other_chara_2_ran <= 40 then
					other_chara_2 = 1
					extend_wait_ran = 1
				end
			else
				congrats = 1
			end
	
			if other_chara_1_ran <= 70 then
				other_chara_1 = 1
			end
		
			if touch_mode_ran <= 20 then
				touch_mode = 1
			end
		
			if sky_mode_ran <= 30 then
				sky_mode = 1
			elseif sky_mode_ran <= 70 then
				sky_mode = 2
			end
		else
			chara_no = 2
			chara_extend = 1
			touch_mode = 1
		
			if sky_mode_ran <= 40 then
				sky_mode = 1
			else
				sky_mode = 2
			end
		end
		
	elseif rare_level >= 1 then
		
		if chara_extend_ran <= 50 then
			chara_extend = 1
		elseif chara_extend_ran <= 70 then
			chara_extend = 2
			
			if other_chara_2_ran <= 20 then
				other_chara_2 = 1
				extend_wait_ran = 1
			end
		end
	
		if other_chara_1_ran <= 60 then
			other_chara_1 = 1
		end
		
		if sky_mode_ran <= 30 then
			sky_mode = 1
		elseif sky_mode_ran <= 50 then
			sky_mode = 2
		end
		
	else
	
		if chara_extend_ran <= 60 then
			chara_extend = 1
		end
		
		if other_chara_1_ran <= 40 then
			other_chara_1 = 1
		end
		
		if sky_mode_ran <= 30 then
			sky_mode = 1
		end
	end
end

LWF.Script.gacha_unit._root_1_1 = function(self)
	local _root = self.lwf._root

	if sky_mode == 1 then
		self.commands_mc:gotoAndStop("sky_mode1")
	elseif sky_mode == 2 then
		self.commands_mc:gotoAndStop("sky_mode2")
	elseif sky_mode == 3 then
		self.commands_mc:gotoAndStop("sky_mode3")
	else
		self.commands_mc:gotoAndStop("sky_mode1")
	end
	
	self.main_set.main:gotoAndPlay("start")
end

LWF.Script.gacha_unit._root_214_1 = function(self)
	local _root = self.lwf._root

	self.main_set:gotoAndStop("none")
	self.conc_set:gotoAndStop("none")
end

LWF.Script.gacha_unit._root_234_1 = function(self)
	local _root = self.lwf._root

	self.main_set.main:gotoAndPlay("result")
	
	setSkipLabel("skip0")
end

LWF.Script.gacha_unit._root_276_1 = function(self)
	local _root = self.lwf._root

	setSkipLabel("")
end

LWF.Script.gacha_unit._root_337_1 = function(self)
	local _root = self.lwf._root

	setSkipLabel("")
	
	if congrats == 1 then
		self.conc_set:gotoAndStop("show")
		self.main_set:gotoAndPlay("shake")
		self.main_set.main:gotoAndPlay("congra")
	else
		self.main_set:gotoAndStop("none")
		self.main_set.main:gotoAndPlay("main_skip")
	end
end

LWF.Script.gacha_unit.beam_set_set_0_1 = function(self)
	local _root = self.lwf._root

	if chara_extend <= 1 then
		self.beam:gotoAndStop("chara_" .. chara_no)
	else
		self.beam:gotoAndStop("chara_" .. chara_no .. "_2")
	end
end

LWF.Script.gacha_unit.chara_1_skill2_1_100_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent.parent:gotoAndPlay("zoome_in_extend")
end

LWF.Script.gacha_unit.chara_1_skill2_1_1_1 = function(self)
	local _root = self.lwf._root

	playVoice("101", "101_VOICE_SKILL_C")
end

LWF.Script.gacha_unit.chara_1_skill2_1_1_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
end

LWF.Script.gacha_unit.chara_1_skill2_1_69_1 = function(self)
	local _root = self.lwf._root

	playVoice("101", "101_VOICE_FULLARTS_RANK4")
end

LWF.Script.gacha_unit.chara_1_skill2_1_69_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent.parent:gotoAndPlay("zoome_out")
	self.parent.parent.parent.parent.parent:gotoAndStop("none")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("none")
end

LWF.Script.gacha_unit.chara_1_skill2_1_99_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
	
	self.parent.parent.parent.parent:gotoAndPlay("chance")
end

LWF.Script.gacha_unit.chara_1_skill2_effect_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE")
end

LWF.Script.gacha_unit.chara_1_skill_effect_comp_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE_COMPLETION")
end

LWF.Script.gacha_unit.chara_1_skill_effect_comp_set_2_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE_COMPLETION")
end

LWF.Script.gacha_unit.chara_2_idol_12_1 = function(self)
	local _root = self.lwf._root

	playVoice("3103", "3103_VOICE_PARTY")
end

LWF.Script.gacha_unit.chara_2_skill2_1_1 = function(self)
	local _root = self.lwf._root

	playVoice("103", "103_VOICE_FULLARTS_RANK5")
end

LWF.Script.gacha_unit.chara_2_skill2_1_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
end

LWF.Script.gacha_unit.chara_2_skill2_69_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent.parent:gotoAndPlay("zoome_out")
	self.parent.parent.parent.parent.parent:gotoAndStop("none")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("none")
end

LWF.Script.gacha_unit.chara_2_skill2_99_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
	
	self.parent.parent.parent.parent:gotoAndPlay("chance")
end

LWF.Script.gacha_unit.chara_2_skill2_effect_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE")
end

LWF.Script.gacha_unit.cutin_all_set_125_2 = function(self)
	local _root = self.lwf._root

	self.parent.main_set.main:play()
end

LWF.Script.gacha_unit.cutin_all_set_19_1 = function(self)
	local _root = self.lwf._root

	playVoice("3102", "3102_VOICE_PRAISE")
end

LWF.Script.gacha_unit.cutin_all_set_1_1 = function(self)
	local _root = self.lwf._root

	playCommon("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.gacha_unit.cutin_chara_set_1_1_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_012_FULLARTS_SHOOT2")
	playVoice("101", "101_VOICE_FULLARTS_NOW")
end

LWF.Script.gacha_unit.cutin_chara_set_2_1_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_053_BREAK")
end

LWF.Script.gacha_unit.cutin_chara_set_3_1_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_053_BREAK")
end

LWF.Script.gacha_unit.ganan_idol_76_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SWORD_SWISH_HEAVY")
end

LWF.Script.gacha_unit.lightning_group_set_0_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 1 then
		self.l3.visible = false
	end
end

LWF.Script.gacha_unit.lightning_group_set_25_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 1 then
		self.l2.visible = false
	end
end

LWF.Script.gacha_unit.lightning_group_set_34_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 2 then
		self.l5.visible = false
	end
end

LWF.Script.gacha_unit.lightning_group_set_46_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 2 then
		self.l4.visible = false
	end
end

LWF.Script.gacha_unit.lightning_group_set_55_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 1 then
		self.l6.visible = false
	end
end

LWF.Script.gacha_unit.lightning_group_set_9_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 2 then
		self.l1.visible = false
	end
end

LWF.Script.gacha_unit.main_163_1 = function(self)
	local _root = self.lwf._root

	self:stop()
end

LWF.Script.gacha_unit.main_164_1 = function(self)
	local _root = self.lwf._root

	playCommon("SE_SYSTEM_002_DECISION")
	
	self.daiza_set.chara_set.chara:gotoAndStop("skill2")
	self.parent.parent:gotoAndPlay("zoome_in")
	self.touch_set:gotoAndPlay("released")
end

LWF.Script.gacha_unit.main_1_1 = function(self)
	local _root = self.lwf._root

	self.daiza_set.chara_set:gotoAndStop("chara_" .. chara_no)
end

LWF.Script.gacha_unit.main_229_1 = function(self)
	local _root = self.lwf._root

	if chara_extend >= 1 then
		self.parent.parent.cutin_set:gotoAndStop("cutin_chara_" .. chara_no)
	end
end

LWF.Script.gacha_unit.main_264_1 = function(self)
	local _root = self.lwf._root

	if chara_extend == 0 then
		self:gotoAndStop("chance_skip")
	end
	
	if other_chara_2 == 1 then
		self.daiza_set.other_chara_2_set:play()
	end
end

LWF.Script.gacha_unit.main_329_1 = function(self)
	local _root = self.lwf._root

	if chara_no == 2 then
		self:gotoAndPlay("chance_end")
	end
	
	if chara_no == 1 and chara_extend == 2 and extend_wait_ran == 1 then
		self.parent.parent.cutin_set:gotoAndStop("cutin_chara_" .. chara_no .. "_2")
		self.daiza_set.chara_set.chara.chara:gotoAndPlay("extend")
		self:gotoAndPlay("wait_end")
	end
end

LWF.Script.gacha_unit.main_354_1 = function(self)
	local _root = self.lwf._root

	if chara_no == 1 and chara_extend == 2 and extend_wait_ran == 2 then
		self.parent.parent.cutin_set:gotoAndStop("cutin_chara_" .. chara_no .. "_2")
		self.daiza_set.chara_set.chara.chara:gotoAndPlay("extend")
		self:gotoAndPlay("wait_end")
	end
end

LWF.Script.gacha_unit.main_381_1 = function(self)
	local _root = self.lwf._root

	if chara_no == 1 and chara_extend == 2 and extend_wait_ran == 3 then
		self.parent.parent.cutin_set:gotoAndStop("cutin_chara_" .. chara_no .. "_2")
		self.daiza_set.chara_set.chara.chara:gotoAndPlay("extend")
		self:gotoAndPlay("wait_end")
	end
	
	if chara_no == 1 and chara_extend <= 1 then
		self:gotoAndPlay("chance_end")
	end
end

LWF.Script.gacha_unit.main_471_1 = function(self)
	local _root = self.lwf._root

	self.parent.parent.cutin_set.cutin:gotoAndPlay("end")
end

LWF.Script.gacha_unit.main_479_1 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndStop("none")
	self.parent.parent:gotoAndPlay("scene_change")
end

LWF.Script.gacha_unit.main_480_1 = function(self)
	local _root = self.lwf._root

	self.bg_2.bg_2_2:gotoAndPlay(100)
end

LWF.Script.gacha_unit.main_592_1 = function(self)
	local _root = self.lwf._root

	self.parent.parent:gotoAndPlay("sky_zoome_in")
	self.parent:gotoAndPlay("shake")
	self.parent.parent.conc_set:gotoAndStop("show")
end

LWF.Script.gacha_unit.main_669_1 = function(self)
	local _root = self.lwf._root

	if congrats == 1 then
		setSkipLabel("")
	end
end

LWF.Script.gacha_unit.main_670_1 = function(self)
	local _root = self.lwf._root

	if congrats == 1 then
		self:stop()
		self.parent.parent.cutin_all:gotoAndPlay("show")
	end
end

LWF.Script.gacha_unit.main_671_1 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndStop("none")
	self.parent.parent.conc_set:gotoAndStop("none")
	self.beam_set.beam.beam:gotoAndPlay("end")
end

LWF.Script.gacha_unit.main_701_1 = function(self)
	local _root = self.lwf._root

	self.parent.parent:gotoAndPlay("sky_zoome_out")
	self.bg_2:gotoAndPlay("open")
end

LWF.Script.gacha_unit.main_9_1 = function(self)
	local _root = self.lwf._root

	if other_chara_1 == 1 then
		self.daiza_set.other_chara_1_set:play()
	end
end

LWF.Script.gacha_unit.other_chara_1_set_39_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_POP_LANDING")
end

LWF.Script.gacha_unit.other_chara_1_set_64_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_POP_LANDING")
end

LWF.Script.gacha_unit.other_chara_1_set_67_1 = function(self)
	local _root = self.lwf._root

	self.chara:gotoAndPlay("damage")
end

LWF.Script.gacha_unit.other_chara_2_set_21_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_LANDING")
end

LWF.Script.gacha_unit.other_chara_2_set_24_1 = function(self)
	local _root = self.lwf._root

	self.chara:gotoAndPlay("idol")
end

LWF.Script.gacha_unit.other_chara_2_set_59_1 = function(self)
	local _root = self.lwf._root

	self.chara:gotoAndPlay("skill1")
end

LWF.Script.gacha_unit.other_chara_2_set_60_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_JUMP")
end

LWF.Script.gacha_unit.other_chara_2_set_7_1 = function(self)
	local _root = self.lwf._root

	playVoice("111", "111_VOICE_ITEM")
end

LWF.Script.gacha_unit.rayus_beam_eff_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SKILL_ELXPLOSION")
	playSE("SE_BATTLE_036_EXPLOSION_ELEMENT_04")
end

LWF.Script.gacha_unit.rayus_beam_eff_set_2_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SKILL_ELXPLOSION")
	playSE("SE_BATTLE_036_EXPLOSION_ELEMENT_04")
end

LWF.Script.gacha_unit.rayus_beam_eff_set_2_2_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_LIGHTNING")
end

LWF.Script.gacha_unit.roi_beam_eff_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_HARD_HIT")
	playSE("SE_BATTLE_EXPLOSION_WATER_01")
end

LWF.Script.gacha_unit.roi_beam_eff_set_2_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SKILL_ELXPLOSION")
end

LWF.Script.gacha_unit.touch_0_1 = function(self)
	local _root = self.lwf._root

	if touch_mode == 1 then
		self:gotoAndStop("touch_1")
	else
		self:stop()
	end
end
