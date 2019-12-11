if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.change_rune then LWF.Script.change_rune={} end

LWF.Script.change_rune.__Symbols_Symbol_Main_101_2 = function(self)
    local _root = self.lwf._root

    playSE("SE_SYSTEM_RUNE_GET")
end

LWF.Script.change_rune.__Symbols_Symbol_Main_9_2 = function(self)
    local _root = self.lwf._root

    self.RuneIconSizuku:gotoAndPlay("PlayRuneSizuku")
end

LWF.Script.change_rune.__Symbols_Symbol_RuneIcon_0_2 = function(self)
    local _root = self.lwf._root

    if var_value == 1 then
        self:gotoAndStop("Level_1");
    elseif var_value == 2 then
        self:gotoAndStop("Level_1_Plus");
    elseif var_value == 3 then
        self:gotoAndStop("Level_2");
    elseif var_value == 4 then
        self:gotoAndStop("Level_2_Plus");
    elseif var_value == 5 then
        self:gotoAndStop("Level_3");
    elseif var_value == 6 then
        self:gotoAndStop("Level_3_Plus");
    elseif var_value == 7 then
        self:gotoAndStop("Level_4");
    elseif var_value == 8 then
        self:gotoAndStop("Level_4_Plus");
    else
        self:gotoAndStop("Level_1");
    end
end

LWF.Script.change_rune.__Symbols_Symbol_RuneIcon_Anime_57_2 = function(self)
    local _root = self.lwf._root

    --self:gotoAndPlay("PlayRuneSizuku")
end

LWF.Script.change_rune.__Symbols_eff_kirakira_0_1 = function(self)
    local _root = self.lwf._root

    self:gotoAndStop("p_" .. item_pattern)
end

LWF.Script.change_rune.__Symbols_eff_kirakira_tween_0_1 = function(self)
    local _root = self.lwf._root

    self.rotation = math.random(360)
    ran = math.random(5) + 1
    self.eff:gotoAndStop("r_" .. ran)
end

LWF.Script.change_rune.__Symbols_eff_kirakira_tween_599_1 = function(self)
    local _root = self.lwf._root

    if ran == 1 then
        self:gotoAndPlay("start")
    end
end

LWF.Script.change_rune.__Symbols_eff_kirakira_tween_619_1 = function(self)
    local _root = self.lwf._root

    if ran == 2 then
        self:gotoAndPlay("start")
    end
end

LWF.Script.change_rune.__Symbols_eff_kirakira_tween_639_1 = function(self)
    local _root = self.lwf._root

    if ran == 3 then
        self:gotoAndPlay("start")
    end
end

LWF.Script.change_rune.__Symbols_eff_kirakira_tween_659_1 = function(self)
    local _root = self.lwf._root

    if ran == 4 then
        self:gotoAndPlay("start")
    end
end

LWF.Script.change_rune.__Symbols_eff_kirakira_tween_679_1 = function(self)
    local _root = self.lwf._root

    self:gotoAndPlay("start")
end

LWF.Script.change_rune._eff_eff_07_all_0_1 = function(self)
    local _root = self.lwf._root

    if rare_max == 4 then
        self:gotoAndStop(2)
    elseif rare_max > 4 then
        self:gotoAndStop(3)
    end
end

LWF.Script.change_rune._kira_kira_0_1 = function(self)
    local _root = self.lwf._root

    if rare_max == 4 then
        self:gotoAndStop(2)
    elseif rare_max > 4 then
        self:gotoAndStop(3)
    end
end

LWF.Script.change_rune._kira_kira_move_2_0_1 = function(self)
    local _root = self.lwf._root

    -- 角度をランダムでつける
    self.rotation = math.random(360)
    
    -- ランダムに値を取得
    ran2 = math.random(5) + 1
end

LWF.Script.change_rune._kira_kira_move_2_50_1 = function(self)
    local _root = self.lwf._root

    if ran2 == 1 then
        self:gotoAndPlay(1)
    end
end

LWF.Script.change_rune._kira_kira_move_2_58_1 = function(self)
    local _root = self.lwf._root

    if ran2 == 2 then
        self:gotoAndPlay(1)
    end
end

LWF.Script.change_rune._kira_kira_move_2_66_1 = function(self)
    local _root = self.lwf._root

    if ran2 == 3 then
        self:gotoAndPlay(1)
    end
end

LWF.Script.change_rune._kira_kira_move_2_74_1 = function(self)
    local _root = self.lwf._root

    if ran2 == 4 then
        self:gotoAndPlay(1)
    end
end

LWF.Script.change_rune._kira_kira_move_2_82_1 = function(self)
    local _root = self.lwf._root

    if ran2 == 5 then
        self:gotoAndPlay(1)
    end
end

LWF.Script.change_rune._root_19_1 = function(self)
    local _root = self.lwf._root

    self.Symbol_Main_Root:gotoAndPlay("Play")
end

