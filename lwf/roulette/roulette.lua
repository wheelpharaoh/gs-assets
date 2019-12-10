if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.roulette then LWF.Script.roulette={} end

LWF.Script.roulette._black_18_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.roulette._container_28_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	
	if _root.vars.current_status_index == _root.vars.STATUS_BEGINNING then
		_root.vars.current_status_index = _root.vars.STATUS_WAITING;
	end
end

LWF.Script.roulette._container_29_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.roulette._last_0_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("_ren" .. _G.cpp_result_number);
end

LWF.Script.roulette._last_115_1 = function(self)
	local _root = self.lwf._root

	playCommon("SE_SYSTEM_053_STAMP");
end

LWF.Script.roulette._last_135_1 = function(self)
	local _root = self.lwf._root

	playCommon("SE_SYSTEM_053_STAMP");
end

LWF.Script.roulette._last_152_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_BELL_TREE_04")
end

LWF.Script.roulette._last_167_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	_root.vars.current_status_index = _root.vars.STATUS_FINISHED;
end

LWF.Script.roulette._last_16_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_BELL_TREE_04")
end

LWF.Script.roulette._last_33_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	_root.vars.current_status_index = _root.vars.STATUS_FINISHED;
end

LWF.Script.roulette._last_49_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_BELL_TREE_04")
end

LWF.Script.roulette._last_66_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	_root.vars.current_status_index = _root.vars.STATUS_FINISHED;
end

LWF.Script.roulette._last_82_1 = function(self)
	local _root = self.lwf._root

	playSE("SE_BATTLE_BELL_TREE_04")
end

LWF.Script.roulette._last_99_1 = function(self)
	local _root = self.lwf._root

	self:stop();
	_root.vars.current_status_index = _root.vars.STATUS_FINISHED;
end

LWF.Script.roulette._light_0_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.roulette._light_10_2 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("_flash");
end

LWF.Script.roulette._light_1_2 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.roulette._panel_flash_0_1 = function(self)
	local _root = self.lwf._root

	self:stop();
end

LWF.Script.roulette._panel_flash_31_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("_flash");
end

LWF.Script.roulette._root_0_2 = function(self)
	local _root = self.lwf._root

	if not _root.vars then _root.vars = {} end
	if not _root.fn then _root.fn = {} end
	
	if not _root.fn.initialized then
	
	    --当たった数
	    --C++から受け取る値
	    --10 or 20 or 30 or 100
	    print("[LWF] _G.cpp_result_number: " .. _G.cpp_result_number)
	    _G.cpp_result_number = _G.cpp_result_number or 20
	    
	    --開始日時
	    _G.start_time = _G.start_time or ""
	    
	    --終了日時
	    _G.end_time = _G.end_time or ""
	    
	    -- 状態
	    _root.vars.STATUS_BEGINNING = 0;
	    _root.vars.STATUS_WAITING   = 1;
	    _root.vars.STATUS_RUNNING   = 2;
	    _root.vars.STATUS_STOPPING  = 3;
	    _root.vars.STATUS_STOPPED   = 4;
	    _root.vars.STATUS_ENDED     = 5;
	    _root.vars.STATUS_FINISHED  = 6;
	    
	    -- ライトの数
	    _root.vars.NUM_LIGHTS = 24;
	    
	    -- ライトのインスタンス名の接頭語
	    _root.vars.LIGHT_PREFIX = "_ins_light_";
	    
	    -- ライトのラベル
	    _root.vars.LIGHT_LABELS = {
	        OFF = "_off",
	        ON =  "_on",
	        FLASH = "_flash"
	    };
	    
	    -- パネルのラベル
	    _root.vars.PANEL_LABELS = {
	        FLASH = "_flash"
	    };
	    
	    -- 当たった数 => ライト番号の配列
	    _root.vars.LIGHT_SUMMON_NUMBERS = {
	        N10 = {2, 3, 4, 5, 11, 12, 13, 14, 21, 22, 23, 24},
	        N20 = {15, 16, 17, 18, 19, 20},
	        N30 = {6, 7, 8, 9, 10},
	        N100 = {1}
	    };
	    
	    -- ライト番号 => パネル番号
	    _root.vars.PANEL_NUMBERS = {
	        [ 1] = 1,
	        [ 2] = 2,
	        [ 3] = 2,
	        [ 4] = 2,
	        [ 5] = 2,
	        [ 6] = 3,
	        [ 7] = 3,
	        [ 8] = 3,
	        [ 9] = 3,
	        [10] = 3,
	        [11] = 4,
	        [12] = 4,
	        [13] = 4,
	        [14] = 4,
	        [15] = 5,
	        [16] = 5,
	        [17] = 5,
	        [18] = 5,
	        [19] = 5,
	        [20] = 5,
	        [21] = 6,
	        [22] = 6,
	        [23] = 6,
	        [24] = 6,
	    };
	    
	    --回転を始めてから止まり始めるまでのフレーム数
	    _root.vars.RUNNING_FRAMES = 200;
	    
	    --止まるときのスピード
	    _root.vars.TRIGGER_TO_STOP = 15;
	    
	    --経過フレーム数
	    _root.vars.num_frames = 0;
	    
	    --現在の状態
	    _root.vars.current_status_index = _root.vars.STATUS_BEGINNING;
	    
	    --1から始まる点灯中のライトの番号
	    --点灯中のライトがない場合は0
	    _root.vars.lit_index = 0;
	    
	    --次にライトを動かすフレーム数
	    _root.vars.next_num_frames = 0;
	    
	    --ライトを動かす遅さ
	    _root.vars.slowly = 1;
	    
	    --ルーレットが回転し始めたフレーム数
	    _root.vars.started_frames = 0;
	    
	    --止まり始めたフレーム数
	    _root.vars.begin_to_stop = 0;
	    
	    --日時をセットする
	    _root.fn.set_datetime = function(mc, datetime_str, right_align)
	        if (right_align == nil) then
	            right_align = false;
	        end
	    
	        local chars = {};
	        local i;
	        local child_mc;
	        local c;
	
	        for i = 1, #datetime_str do
	            local ins = datetime_str:sub(i,i);
	            table.insert(chars,ins);
	        end
	    
	        for i = 1, 16 do
	            if (right_align == true) then
	                child_mc = mc["_ins_c" .. (15 - i)];    
	                c = chars[table.maxn(chars) - i - 1];
	            else
	                child_mc = mc["_ins_c" .. i];
	                c = chars[i];
	            end
	    
	            if c == nil or c == ' ' then
	                child_mc:gotoAndStop("_char_space");
	            elseif c == '/' then
	                child_mc:gotoAndStop("_char_slash");
	            elseif c == ':' then
	                child_mc:gotoAndStop("_char_colon");
	            elseif c:match("%d") then
	                child_mc:gotoAndStop("_char_" .. c);
	            else
	                child_mc:gotoAndStop("_char_space");
	            end
	        end
	    end
	
	    --任意のライトを消す
	    _root.fn.turn_off_light = function(light_index)
	        local mc = _root._ins_container._ins_roulette[_root.vars.LIGHT_PREFIX .. light_index];
	        mc:gotoAndStop(_root.vars.LIGHT_LABELS.OFF);
	        if _root.vars.lit_index == light_index then
	            _root.vars.lit_index = 0;
	        end
	    end
	
	    --任意のライトを点ける
	    --@param {Number} light_index 1から始まる点けるライトの番号
	    _root.fn.turn_on_light = function(light_index)
	        local mc = _root._ins_container._ins_roulette[_root.vars.LIGHT_PREFIX .. light_index];
	        mc:gotoAndStop(_root.vars.LIGHT_LABELS.ON);
	        _root.vars.lit_index = light_index;
	    end
	
	    --あたったパネルとライトを点滅させる
	    --@param {Number} light_index 1から始まる点けるライトの番号
	    _root.fn.flash = function(light_index)
	        local mc = _root._ins_container._ins_roulette[_root.vars.LIGHT_PREFIX .. light_index];
	        local panel_number = _root.vars.PANEL_NUMBERS[light_index];
	        local i;
	        mc:gotoAndPlay(_root.vars.LIGHT_LABELS.FLASH);
	        _root._ins_container._ins_roulette._ins_panel_flash:gotoAndPlay(_root.vars.PANEL_LABELS.FLASH);
	        for i = 1, 6 do
	            _root._ins_container._ins_roulette._ins_panel_flash._ins_panel["_ins_panel_" .. i].visible = false;
	        end
	        _root._ins_container._ins_roulette._ins_panel_flash._ins_panel["_ins_panel_" .. panel_number].visible = true;
	    end
	
	    --毎フレーム実行される処理
	    _root.fn.on_enter_frame = function()
	    
	        _root.vars.num_frames = _root.vars.num_frames + 1;
	        
	        --ルーレット回転中
	        if _root.vars.current_status_index == _root.vars.STATUS_RUNNING then
	            _root.fn.on_running();
	        end
	        --ルーレット停止中
	        if _root.vars.current_status_index == _root.vars.STATUS_STOPPING then
	            _root.fn.on_stopping();
	        end
	        --ルーレット停止
	        if _root.vars.current_status_index == _root.vars.STATUS_STOPPED then
	            if _root.vars.num_frames >= (_root.vars.begin_to_stop + (_root.vars.slowly * 2)) then
	                _root.fn.flash(_root.vars.lit_index);
	                _root._ins_container:gotoAndStop("_last");
	                _root.vars.current_status_index = _root.vars.STATUS_ENDED;
					playCommon("SE_SYSTEM_072_ROOM_IN");
	            end
	        end
	    end
	
	    --ルーレット回転中の処理
	    _root.fn.on_running = function()
	        local next_light_index = _root.vars.lit_index % _root.vars.NUM_LIGHTS + 1;
	        if _root.vars.lit_index ~= 0 then
	            _root.fn.turn_off_light(_root.vars.lit_index);
	        end
	        _root.fn.turn_on_light(next_light_index);
			playCommon("SE_SYSTEM_009_GAUGE");
	        if _root.vars.num_frames - _root.vars.started_frames >= _root.vars.RUNNING_FRAMES then
	            _root.vars.current_status_index = _root.vars.STATUS_STOPPING;
	        end
	    end
	
	    --ルーレット停止中の処理
	    _root.fn.on_stopping = function()
	        if _root.vars.begin_to_stop == 0 then
	            _root.vars.begin_to_stop = _root.vars.num_frames;
	        end
	        if _root.vars.slowly >= _root.vars.TRIGGER_TO_STOP and _root.vars.target_light_index == _root.vars.lit_index then
	            print("[LWF] cpp_result_number: " .. _G.cpp_result_number)
	            print("[LWF] target_light_index: " .. _root.vars.target_light_index)
	            _root.vars.current_status_index = _root.vars.STATUS_STOPPED;
	            _root.vars.begin_to_stop = _root.vars.num_frames;
	        elseif _root.vars.num_frames >= _root.vars.next_num_frames then
	            local next_light_index = _root.vars.lit_index % _root.vars.NUM_LIGHTS + 1;
	            if _root.vars.lit_index ~= 0 then
	                _root.fn.turn_off_light(_root.vars.lit_index);
	            end
	            _root.fn.turn_on_light(next_light_index);
				playCommon("SE_SYSTEM_009_GAUGE");
	            _root.vars.next_num_frames = _root.vars.num_frames + _root.vars.slowly;
	            if _root.vars.num_frames >= _root.vars.begin_to_stop + _root.vars.slowly then
	                _root.vars.slowly = _root.vars.slowly + math.floor(math.random(2));
	                _root.vars.begin_to_stop = _root.vars.num_frames;
	            end
	        end
	    end
	
	    -- C++のイベントハンドラ
	    LWF.Script.roulette.cpp_event = function(event_name)
	        print("[LWF] called `cpp_event` with `" .. event_name .. "`")
	        if event_name == "TOUCH_ENDED" then
	            -- 待機中
	            if _root.vars.current_status_index == _root.vars.STATUS_WAITING then
	                --止まるライトの番号
	                math.randomseed(os.time());
	                _root.vars.target_light_index = _root.vars.LIGHT_SUMMON_NUMBERS["N" .. _G.cpp_result_number][ math.random(table.maxn(_root.vars.LIGHT_SUMMON_NUMBERS["N" .. _G.cpp_result_number])) ];
	                
	                _root._ins_container._ins_touch:gotoAndStop("_hidden");
	                _root.vars.started_frames = _root.vars.num_frames;
	                _root.vars.current_status_index = _root.vars.STATUS_RUNNING;
	            end
	
	            -- 演出終了後
	            if _root.vars.current_status_index == _root.vars.STATUS_FINISHED then
	                if _G.cpp_unload then
	                    _G.cpp_unload()
	                end
	            end
	        end
	    end
	
	    _root.fn.initialized = true;
	end
	
	_root.fn.on_enter_frame();
end

LWF.Script.roulette._root_1_2 = function(self)
	local _root = self.lwf._root

	_root.fn.on_enter_frame()
	self:gotoAndPlay("_start")
end

LWF.Script.roulette._touch_69_1 = function(self)
	local _root = self.lwf._root

	self:gotoAndPlay("_shown");
end
