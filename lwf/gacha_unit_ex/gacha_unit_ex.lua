if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.gacha_unit_ex then LWF.Script.gacha_unit_ex={} end

LWF.Script.gacha_unit_ex._root_0_1 = function(self)
	local _root = self.lwf._root

	--キャラタイプ 1:レイアス  2:ロイ
	--chara_type = -1;
	
	--カットインタイプ 0:出さない 1:出す 2:昇格する(レイアス時のみ有効)
	--chara_cutin_type = -1;
	
	--コロックさん出現 0:しない 1:する
	--chara_in_korokku = -1;
	
	--ガナンさん出現 0:しない 1:する
	--chara_in_ganan = -1;
	
	--最後におめでとう出現 0:しない 1:する
	--is_omedetou_drawing = -1;
	
	--後半のお空タイプ 0:雷ちょっとだけ 1:雷まぁまぁ 2:雷すごい
	--sky_thunder_type = -1;
	
	--最初の TOUCH の色 0:黄色 1:虹色
	--start_touch_type = -1;
	
	
	chara_no = 1
	other_chara_1 = 0
	other_chara_2 = 0
	chara_extend = 0
	sky_mode = 0
	touch_mode = 0
	congrats = 0
	extend_wait_ran = 0; --昇格させる(レイアス時のみ有効)演出ないデフォルトは 0
	
	
	--なんで三回 math.random() やっているかは不明
	math.randomseed(os.time());
	math.random();
	math.random();
	math.random();
	
	--どのキャラを出すか
	if chara_type == 1 then
		chara_no = 1; --レイアス
	elseif chara_type == 2 then
		chara_no = 2; --ロイ
	end
	
	--カットイン出すか
	if chara_cutin_type == 0 then
		chara_extend = 0; --出さない
	elseif chara_cutin_type == 1 then
		chara_extend = 1; --出す
	elseif chara_cutin_type == 2 then
		chara_extend = 2; --昇格させる(レイアス時のみ有効)
		extend_wait_ran = 1;
	end
	
	--コログランさん出すか
	if chara_in_korokku == 0 then
		other_chara_1 = 0; --出さない
	elseif chara_in_korokku == 1 then
		other_chara_1 = 1; --出す
	end
	
	--ガナンさん出すか
	if chara_in_ganan == 0 then
		other_chara_2 = 0; --出さない
	elseif chara_in_ganan == 1 then
		other_chara_2 = 1; --出す
	end
	
	--演出後半のおめでとう出すか
	if is_omedetou_drawing == 0 then
		congrats = 0; --出さない
	elseif is_omedetou_drawing == 1 then
		congrats = 1; --出す
	end
	
	--後半のお空のタイプ設定
	if sky_thunder_type == 0 then
		sky_mode = 0; --雷ちょっとだけ
	elseif sky_thunder_type == 1 then
		sky_mode = 1; --雷まぁまぁ
	elseif sky_thunder_type == 2 then
		sky_mode = 2; --雷すごい
	end
	
	--最初の TOUCH の色設定
	if start_touch_type == 0 then
		touch_mode = 0; --黄色
	elseif start_touch_type == 1 then
		touch_mode = 1; --虹色
	end
	
	
	--[[
	******
			以下はメモである
	******
	]]
	
	--これで普通のロイがでる。
	--[[
	chara_no = 2
	chara_extend = 1
	touch_mode = 1
	sky_mode = 2
	]]
	--これでレイアスがでる。
	--[[
	chara_no = 1
	chara_extend = 1
	touch_mode = 1
	sky_mode = 2
	]]
	
	-- chara_no = 1 は (1 だったら レイアス) (2 だったら ロイ)が出る
	-- chara_extend = 0 にしたら　カットインなくなった、 １になったら出た。
	--                ロイも０にしたらカットインなくなった、１になったら出た。
	--                ※レイアス時に 2 にすると、昇格演出流れるが、その場合は、extend_wait_ran を 1 にしないとおかしくなる。
	--                ※ソレ以外では extend_wait_ran は 0 でOK。
	-- touch_mode = 1にしたら touch の表示が 虹色になった、 ０は黄色になった
	-- sky_mode = 1にしたら 雷まぁまぁ、 ０にしたら雷ホンマ少しだけ、
	--            2にすると雷めっちゃたくさん
	
	-- other_chara_1 は   0だとコログランさんでない。 1だとコログランさんでる。
	-- other_chara_2 は   0だとガナンさんでない。 1だとガナンさん出現
	-- extend_wait_ran は chara_extend と連動しているっぽい
	-- congrats は 0だと最後の全員集合めでたいがでない。1だとでる。
end

LWF.Script.gacha_unit_ex._root_1_1 = function(self)
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

LWF.Script.gacha_unit_ex._root_214_1 = function(self)
	local _root = self.lwf._root

	self.main_set:gotoAndStop("none")
	self.conc_set:gotoAndStop("none")
end

LWF.Script.gacha_unit_ex._root_234_1 = function(self)
	local _root = self.lwf._root

	self.main_set.main:gotoAndPlay("result")
	
	setSkipLabel("skip0")
end

LWF.Script.gacha_unit_ex._root_276_1 = function(self)
	local _root = self.lwf._root

	setSkipLabel("")
end

LWF.Script.gacha_unit_ex._root_337_1 = function(self)
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

LWF.Script.gacha_unit_ex.beam_set_set_0_1 = function(self)
	local _root = self.lwf._root

	if chara_extend <= 1 then
		self.beam:gotoAndStop("chara_" .. chara_no)
	else
		self.beam:gotoAndStop("chara_" .. chara_no .. "_2")
	end
end

LWF.Script.gacha_unit_ex.chara_1_skill2_1_100_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent.parent:gotoAndPlay("zoome_in_extend")
end

LWF.Script.gacha_unit_ex.chara_1_skill2_1_1_1 = function(self)
	local _root = self.lwf._root

	playVoice("101", "101_VOICE_SKILL_C")
end

LWF.Script.gacha_unit_ex.chara_1_skill2_1_1_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
end

LWF.Script.gacha_unit_ex.chara_1_skill2_1_69_1 = function(self)
	local _root = self.lwf._root

	playVoice("101", "101_VOICE_FULLARTS_RANK4")
end

LWF.Script.gacha_unit_ex.chara_1_skill2_1_69_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent.parent:gotoAndPlay("zoome_out")
	self.parent.parent.parent.parent.parent:gotoAndStop("none")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("none")
end

LWF.Script.gacha_unit_ex.chara_1_skill2_1_99_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
	
	self.parent.parent.parent.parent:gotoAndPlay("chance")
end

LWF.Script.gacha_unit_ex.chara_1_skill2_effect_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE")
end

LWF.Script.gacha_unit_ex.chara_1_skill_effect_comp_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE_COMPLETION")
end

LWF.Script.gacha_unit_ex.chara_1_skill_effect_comp_set_2_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE_COMPLETION")
end

LWF.Script.gacha_unit_ex.chara_2_idol_12_1 = function(self)
	local _root = self.lwf._root

	playVoice("3103", "3103_VOICE_PARTY")
end

LWF.Script.gacha_unit_ex.chara_2_skill2_1_1 = function(self)
	local _root = self.lwf._root

	playVoice("103", "103_VOICE_FULLARTS_RANK5")
end

LWF.Script.gacha_unit_ex.chara_2_skill2_1_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
end

LWF.Script.gacha_unit_ex.chara_2_skill2_69_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent.parent:gotoAndPlay("zoome_out")
	self.parent.parent.parent.parent.parent:gotoAndStop("none")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("none")
end

LWF.Script.gacha_unit_ex.chara_2_skill2_99_2 = function(self)
	local _root = self.lwf._root

	self.parent.parent.parent.parent.parent:gotoAndPlay("shake")
	self.parent.parent.parent.parent.parent.parent.conc_set:gotoAndStop("show")
	
	self.parent.parent.parent.parent:gotoAndPlay("chance")
end

LWF.Script.gacha_unit_ex.chara_2_skill2_effect_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_CHARGE")
end

LWF.Script.gacha_unit_ex.cutin_all_set_125_2 = function(self)
	local _root = self.lwf._root

	self.parent.main_set.main:play()
end

LWF.Script.gacha_unit_ex.cutin_all_set_19_1 = function(self)
	local _root = self.lwf._root

	playVoice("3102", "3102_VOICE_PRAISE")
end

LWF.Script.gacha_unit_ex.cutin_all_set_1_1 = function(self)
	local _root = self.lwf._root

	playCommon("SE_SYSTEM_074_QUEST_MISSION_COMP")
end

LWF.Script.gacha_unit_ex.cutin_chara_set_1_1_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_012_FULLARTS_SHOOT2")
	playVoice("101", "101_VOICE_FULLARTS_NOW")
end

LWF.Script.gacha_unit_ex.cutin_chara_set_2_1_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_053_BREAK")
end

LWF.Script.gacha_unit_ex.cutin_chara_set_3_1_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_053_BREAK")
end

LWF.Script.gacha_unit_ex.ganan_idol_76_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SWORD_SWISH_HEAVY")
end

LWF.Script.gacha_unit_ex.lightning_group_set_0_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 1 then
		self.l3.visible = false
	end
end

LWF.Script.gacha_unit_ex.lightning_group_set_25_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 1 then
		self.l2.visible = false
	end
end

LWF.Script.gacha_unit_ex.lightning_group_set_34_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 2 then
		self.l5.visible = false
	end
end

LWF.Script.gacha_unit_ex.lightning_group_set_46_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 2 then
		self.l4.visible = false
	end
end

LWF.Script.gacha_unit_ex.lightning_group_set_55_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 1 then
		self.l6.visible = false
	end
end

LWF.Script.gacha_unit_ex.lightning_group_set_9_1 = function(self)
	local _root = self.lwf._root

	if sky_mode < 2 then
		self.l1.visible = false
	end
end

LWF.Script.gacha_unit_ex.main_163_1 = function(self)
	local _root = self.lwf._root

	self:stop()
end

LWF.Script.gacha_unit_ex.main_164_1 = function(self)
	local _root = self.lwf._root

	playCommon("SE_SYSTEM_002_DECISION")
	
	self.daiza_set.chara_set.chara:gotoAndStop("skill2")
	self.parent.parent:gotoAndPlay("zoome_in")
	self.touch_set:gotoAndPlay("released")
end

LWF.Script.gacha_unit_ex.main_1_1 = function(self)
	local _root = self.lwf._root

	self.daiza_set.chara_set:gotoAndStop("chara_" .. chara_no)
end

LWF.Script.gacha_unit_ex.main_229_1 = function(self)
	local _root = self.lwf._root

	if chara_extend >= 1 then
		self.parent.parent.cutin_set:gotoAndStop("cutin_chara_" .. chara_no)
	end
end

LWF.Script.gacha_unit_ex.main_264_1 = function(self)
	local _root = self.lwf._root

	if chara_extend == 0 then
		self:gotoAndStop("chance_skip")
	end
	
	if other_chara_2 == 1 then
		self.daiza_set.other_chara_2_set:play()
	end
end

LWF.Script.gacha_unit_ex.main_329_1 = function(self)
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

LWF.Script.gacha_unit_ex.main_354_1 = function(self)
	local _root = self.lwf._root

	if chara_no == 1 and chara_extend == 2 and extend_wait_ran == 2 then
		self.parent.parent.cutin_set:gotoAndStop("cutin_chara_" .. chara_no .. "_2")
		self.daiza_set.chara_set.chara.chara:gotoAndPlay("extend")
		self:gotoAndPlay("wait_end")
	end
end

LWF.Script.gacha_unit_ex.main_381_1 = function(self)
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

LWF.Script.gacha_unit_ex.main_471_1 = function(self)
	local _root = self.lwf._root

	self.parent.parent.cutin_set.cutin:gotoAndPlay("end")
end

LWF.Script.gacha_unit_ex.main_479_1 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndStop("none")
	self.parent.parent:gotoAndPlay("scene_change")
end

LWF.Script.gacha_unit_ex.main_480_1 = function(self)
	local _root = self.lwf._root

	self.bg_2.bg_2_2:gotoAndPlay(100)
end

LWF.Script.gacha_unit_ex.main_592_1 = function(self)
	local _root = self.lwf._root

	self.parent.parent:gotoAndPlay("sky_zoome_in")
	self.parent:gotoAndPlay("shake")
	self.parent.parent.conc_set:gotoAndStop("show")
end

LWF.Script.gacha_unit_ex.main_669_1 = function(self)
	local _root = self.lwf._root

	if congrats == 1 then
		setSkipLabel("")
	end
end

LWF.Script.gacha_unit_ex.main_670_1 = function(self)
	local _root = self.lwf._root

	if congrats == 1 then
		self:stop()
		self.parent.parent.cutin_all:gotoAndPlay("show")
	end
end

LWF.Script.gacha_unit_ex.main_671_1 = function(self)
	local _root = self.lwf._root

	self.parent:gotoAndStop("none")
	self.parent.parent.conc_set:gotoAndStop("none")
	self.beam_set.beam.beam:gotoAndPlay("end")
end

LWF.Script.gacha_unit_ex.main_701_1 = function(self)
	local _root = self.lwf._root

	self.parent.parent:gotoAndPlay("sky_zoome_out")
	self.bg_2:gotoAndPlay("open")
end

LWF.Script.gacha_unit_ex.main_9_1 = function(self)
	local _root = self.lwf._root

	if other_chara_1 == 1 then
		self.daiza_set.other_chara_1_set:play()
	end
end

LWF.Script.gacha_unit_ex.other_chara_1_set_39_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_POP_LANDING")
end

LWF.Script.gacha_unit_ex.other_chara_1_set_64_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_POP_LANDING")
end

LWF.Script.gacha_unit_ex.other_chara_1_set_67_1 = function(self)
	local _root = self.lwf._root

	self.chara:gotoAndPlay("damage")
end

LWF.Script.gacha_unit_ex.other_chara_2_set_21_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_LANDING")
end

LWF.Script.gacha_unit_ex.other_chara_2_set_24_1 = function(self)
	local _root = self.lwf._root

	self.chara:gotoAndPlay("idol")
end

LWF.Script.gacha_unit_ex.other_chara_2_set_59_1 = function(self)
	local _root = self.lwf._root

	self.chara:gotoAndPlay("skill1")
end

LWF.Script.gacha_unit_ex.other_chara_2_set_60_2 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_JUMP")
end

LWF.Script.gacha_unit_ex.other_chara_2_set_7_1 = function(self)
	local _root = self.lwf._root

	playVoice("111", "111_VOICE_ITEM")
end

LWF.Script.gacha_unit_ex.rayus_beam_eff_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SKILL_ELXPLOSION")
	playSE("SE_BATTLE_036_EXPLOSION_ELEMENT_04")
end

LWF.Script.gacha_unit_ex.rayus_beam_eff_set_2_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SKILL_ELXPLOSION")
	playSE("SE_BATTLE_036_EXPLOSION_ELEMENT_04")
end

LWF.Script.gacha_unit_ex.rayus_beam_eff_set_2_2_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_LIGHTNING")
end

LWF.Script.gacha_unit_ex.roi_beam_eff_set_0_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_HARD_HIT")
	playSE("SE_BATTLE_EXPLOSION_WATER_01")
end

LWF.Script.gacha_unit_ex.roi_beam_eff_set_2_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_SKILL_ELXPLOSION")
end

LWF.Script.gacha_unit_ex.touch_0_1 = function(self)
	local _root = self.lwf._root

	if touch_mode == 1 then
		self:gotoAndStop("touch_1")
	else
		self:stop()
	end
end
