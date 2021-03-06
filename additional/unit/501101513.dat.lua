local class = summoner.Bootstrap.createUnitClass({label="ばるふぁるく（仮）", version=1.3, id=501101513});
class:inheritFromUnit("bossBase");

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS = {
    ATTACK1 = 50,
    ATTACK2 = 50,
    ATTACK3 = 50,
    ATTACK9 = 20
}


class.ATTACK_WEIGHTS_BACK = {
    ATTACK4 = 50,
    ATTACK5 = 50,
    ATTACK10 = 10
}


--使用する奥義とその確率
class.SKILL_WEIGHTS = {
    SKILL1 = 100
}

class.SKILL_WEIGHTS_BACK = {
    SKILL2 = 100
}

--攻撃や奥義に設定されるスキルの番号
class.ACTIVE_SKILLS = {
    ATTACK1 = 1,
    ATTACK2 = 2,
    ATTACK3 = 3,
    ATTACK4 = 4,
    ATTACK5 = 5,
    ATTACK6 = 6,
    ATTACK7 = 7,
    ATTACK8 = 8,
    ATTACK9 = 9,
    ATTACK10 = 10,
    SKILL1 = 11,
    SKILL2 = 12
}

class.ANIMATION_STATES = {
    ATTACK1 = "attack1",
    ATTACK2 = "attack2",
    ATTACK3 = "attack3",
    ATTACK4 = "attack4",
    ATTACK5 = "attack5",
    ATTACK6 = "attack6",
    ATTACK7 = "attack7",
    ATTACK8 = "attack8",
    ATTACK9 = "attack9",
    ATTACK10 = "attack10",
    BACK = "back",
    DAMAGE = "damage",
    IDLE = "idle",
    SKILL1 = "skill1",
    SKILL2 = "skill2"
}

class.BREAK_STATES = {
    NORMAL = 0,
    HEAD_BREAK = 2,
    WING_BREAK = 3
}

class.STATES = {
    START = 0,
    FIRST_RAGE = 1,
    NORMAL = 2,
    SECOND_RAGE = 3,
    NORMAL2 = 4
}

class.TRIGGER_HP = {
    FIRST = 0.7,
    SECOND = 0.3
}

class.RAGE_TIME = 90;

class.BUFF_ARGS = {
    BREAKBUFF_ID = 501081,
    BREAKBUFF_EFID = 27,
    BREAKBUFF_VAUE = 15,
    BREAKBUFF_DURATION = 99999,
    BREAKBUFF_ICON = 0,

    BREAKBUFF2_ID = 501081,
    BREAKBUFF2_EFID = 27,
    BREAKBUFF2_VAUE = 300,
    BREAKBUFF2_DURATION = 10,
    BREAKBUFF2_ICON = 0,

    SPEEDBUFF_ID = 501082,
    SPEEDBUFF_EFID = 28,
    SPEEDBUFF_VAUE = 20,
    SPEEDBUFF_DURATION = 99999,
    SPEEDBUFF_ICON = 0,

    ATTACKBUFF_ID = 501083,
    ATTACKBUFF_EFID = 17,
    ATTACKBUFF_VAUE = 40,
    ATTACKBUFF_DURATION = 99999,
    ATTACKBUFF_ICON = 0

}


--======================================================================================================================================
--デフォルトのイベント//
------------------

function class:start(event)
    event.unit:setSPGainValue(0);

    self.spValue = 20;
    self.attackCheckFlg = false;
    self.skillCheckFlg = false;
    self.state = self.STATES.START;
    self.breakCounter = 0;
    self.breakState = self.BREAK_STATES.NORMAL;
    self.isFirstAttack = true;
    self.isTarget = false;
    self.telopTimer = 1;
    self.telopTimerDelay = 30;
    self.isFront = true;
    self.isShootDown = false;
    self.isSpecialDown = false;
    self.attack6Count = 0;
    
    --------------シングル時のみ利用する変数--------------------
    self.rageStartTime1 = 999999;
    self.rageStartTime2 = 999999;
    self.timeCount = 0;
    --------------------------------------------------------
    
    event.unit:setSkin("normal");
    event.unit:getTeamUnitCondition():addCondition(501084,33,90,999999,0);--ヒットバック防止用の重さバフ
    megast.Battle:getInstance():setClearBGMName("MH_BGM_QUEST_CLEAR");
    megast.Battle:getInstance():setClearSpinePath("effect/mh_quest.json")
    megast.Battle:getInstance():setLoseSpinePath("effect/mh_quest.json")
    
    return 1;
end


function class:update(event)
    if RaidControl:get() == nil then
        self.timeCount = self.timeCount + event.deltaTime;
    end
    self:checkTelop(event.deltaTime);
    event.unit:setReduceHitStop(2,1);
    return 1;
end

function class:takeIdle(event)
    self:animationSwitcher(event.unit,self.ANIMATION_STATES.IDLE);
    return 1;
end

function class:excuteAction(event)
    self.isShootDown = false;
    self:rageCheck(event.unit);
    self:checkTarget();
    self:sendBreakCount();
    self:checkBreakState(event.unit);
    return 1;
end


function class:takeBack(event)
    self:animationSwitcher(event.unit,self.ANIMATION_STATES.BACK);
    return 1;
end

function class:takeDamage(event)
    if summoner.Utility.getUnitHealthRate(event.unit) <= 0 then
        return 1;
    end
    if self.isShootDown then
        return 0;
    end
    self:animationSwitcher(event.unit,self.ANIMATION_STATES.DAMAGE);
    self:checkBreakState(event.unit);
    return 1;
end

function class:takeBreake(event)
    if self.attack6Count < 3 then
        self.attack6Count = 0;
    end
    return 1;
end

function class:attackDamageValue(event)
    if self.isTarget then
        event.value = event.value * 2.5;
    end
    return event.value;
end

function class:attackBranch(unit)
    local attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS);

    if not self.isFront then
        attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS_BACK);
        attackIndex = string.gsub(attackStr,"ATTACK","");
    end

    local attackIndex = string.gsub(attackStr,"ATTACK","");
    self.isSpecialDown = false;
    if self.attack6Count > 0 then
        if not self.isFront then
            attackIndex = "10";
        else
            self.attack6Count = self.attack6Count - 1;
            attackIndex = "6";
        end
    end

    if self.isFirstAttack then
        attackIndex = "7"
        self.isFirstAttack = false;
    elseif self.state == self.STATES.START and summoner.Utility.getUnitHealthRate(unit) < self.TRIGGER_HP.FIRST then
        if self.isFront then
            attackIndex = "7";
        else
            attackIndex = "8";
        end
        self:getRage(unit);
    elseif self.state == self.STATES.NORMAL and summoner.Utility.getUnitHealthRate(unit) < self.TRIGGER_HP.SECOND then
        if self.isFront then
            attackIndex = "7";
        else
            attackIndex = "8";
        end
        self:getRage(unit);
    end

    --翼を戻す時は先にセットアップポーズを切り替える必要があったためこっちで
    if attackIndex == "10" then
        unit:setSetupAnimationName("");
    end

    -- --距離判定　相手が近い時はattack4の火球の代わりにattack9を使う
    -- if unit:getTargetUnit() ~= nil and attackIndex == "4" then
    --     local distance = self:getTargetDistance(unit,unit:getTargetUnit());
    --     if distance < 400 then
    --         attackIndex = "9";
    --     end
    -- end


    unit:takeAttack(tonumber(attackIndex));
    return 0;
end

function class:takeAttack(event)
    if not self.attackCheckFlg and megast.Battle:getInstance():isHost() then
        self.attackCheckFlg = true;
        return self:attackBranch(event.unit);
    end
    self.attackCheckFlg = false;
    self:attackActiveSkillSetter(event.unit,event.index);

    
    self:animationSwitcher(event.unit,self.ANIMATION_STATES["ATTACK"..event.index]);
    
    return 1
end

function class:skillBranch(unit)
    local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
    if not self.isFront then
        skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS_BACK);
    end
    local skillIndex = string.gsub(skillStr,"SKILL","");
    unit:takeSkill(tonumber(skillIndex));
    return 0;
end

function class:takeSkill(event)
    if not self.skillCheckFlg and megast.Battle:getInstance():isHost() then
        self.skillCheckFlg = true;
        return self:skillBranch(event.unit);
    end
    self.skillCheckFlg = false;
    self:skillActiveSkillSetter(event.unit,event.index);
    event.unit:setBurstState(kBurstState_active);
    self:animationSwitcher(event.unit,self.ANIMATION_STATES["SKILL"..event.index]);
    return 1
end

function class:dead(event)
    event.unit:setSetupAnimationName("");
    return 1;
end

function class:run (event)
    if event.spineEvent == "addSP" then self:addSP(event.unit) end
    if event.spineEvent == "breakStateInit" then self:breakStateInit(event.unit) end
    if event.spineEvent == "turnBack" then self:turnBack(event.unit) end
    if event.spineEvent == "turnFront" then self:turnFront(event.unit) end
    if event.spineEvent == "shootDown" then self:shootDown(event.unit) end
    if event.spineEvent == "airIntake" then self:airIntake(event.unit) end
    return 1;
end

--======================================================================================================================================
--怒り周りのギミック//
----------------

function class:getRage(unit)
    if self.state == self.STATES.START then
        self.state = self.STATES.FIRST_RAGE;
        self.rageStartTime1 = self:sendRageStartTime();
        self:sendState();
    elseif self.state == self.STATES.NORMAL then
        self.state = self.STATES.SECOND_RAGE;
        self.rageStartTime2 = self:sendRageStartTime();
        self:sendState();  
    end
    self.attack6Count = 0;
    self:addRageBuff(unit);
    self:setRageSkin(unit);
end

function class:addRageBuff(unit)
    unit:getTeamUnitCondition():addCondition(
        self.BUFF_ARGS.ATTACKBUFF_ID,
        self.BUFF_ARGS.ATTACKBUFF_EFID,
        self.BUFF_ARGS.ATTACKBUFF_VAUE,
        self.BUFF_ARGS.ATTACKBUFF_DURATION,
        self.BUFF_ARGS.ATTACKBUFF_ICON
    );

    unit:getTeamUnitCondition():addCondition(
        self.BUFF_ARGS.SPEEDBUFF_ID,
        self.BUFF_ARGS.SPEEDBUFF_EFID,
        self.BUFF_ARGS.SPEEDBUFF_VAUE,
        self.BUFF_ARGS.SPEEDBUFF_DURATION,
        self.BUFF_ARGS.SPEEDBUFF_ICON
    );
end

function class:setRageSkin(unit)
    if self.breakState == self.BREAK_STATES.HEAD_BREAK then
        unit:setSkin("anger-break1");
    elseif self.breakState == self.BREAK_STATES.WING_BREAK then
        unit:setSkin("anger-break2");
    else
        unit:setSkin("anger");
    end
end


function class:rageCheck(unit)
    local started = self:fetchRageStartTime();
    if self:getRaidTime() - started > self.RAGE_TIME and (self.state == self.STATES.FIRST_RAGE or self.state == self.STATES.SECOND_RAGE) then
        self:rageEnd(unit);
    end
end

function class:rageEnd(unit)
    if self.state == self.STATES.FIRST_RAGE then
        self.state = self.STATES.NORMAL;
        self:sendState();
    elseif self.state == self.STATES.SECOND_RAGE then
        self.state = self.STATES.NORMAL2;
        self:sendState();  
    end
    self.attack6Count = 3;
    self:removeRageBuff(unit);
    self:setNormalSkin(unit);
end

function class:setNormalSkin(unit)
    if self.breakState == self.BREAK_STATES.HEAD_BREAK then
        unit:setSkin("normal-break1");
    elseif self.breakState == self.BREAK_STATES.WING_BREAK then
        unit:setSkin("normal-break2");
    else
        unit:setSkin("normal");
    end
end

function class:removeRageBuff(unit)
    local buff = unit:getTeamUnitCondition():findConditionWithID(self.BUFF_ARGS.SPEEDBUFF_ID);
    if buff ~= nil then
        unit:getTeamUnitCondition():removeCondition(buff);
    end

    local buff2 = unit:getTeamUnitCondition():findConditionWithID(self.BUFF_ARGS.ATTACKBUFF_ID);
    if buff2 ~= nil then
        unit:getTeamUnitCondition():removeCondition(buff2);
    end
end

--======================================================================================================================================
--部位破壊周りのギミック//
--------------------

function class:breakStateInit(unit)
    self.state = self:fetchState();
    if self.state == self.STATES.FIRST_RAGE or self.state == self.STATES.SECOND_RAGE then
        self:addRageBuff(unit);
    end
    
    self.breakCounter = self:fetchBreakCount();
    if self.breakCounter >= self.BREAK_STATES.WING_BREAK then
        if self.state ~= self.STATES.FIRST_RAGE and self.state ~= self.STATES.SECOND_RAGE then
            unit:setSkin("normal-break2");
        else
            unit:setSkin("anger-break2");
        end
        self.breakState = self.BREAK_STATES.WING_BREAK;
        self:addBreakBuff(unit,2);
    elseif self.breakCounter >= self.BREAK_STATES.HEAD_BREAK then
        if self.state ~= self.STATES.FIRST_RAGE and self.state ~= self.STATES.SECOND_RAGE then
            unit:setSkin("normal-break1");
        else
            unit:setSkin("anger-break1");
        end
        self.breakState = self.BREAK_STATES.HEAD_BREAK;
        self:addBreakBuff(unit,1);
    end
end

function class:checkBreakState(unit)
    self.breakCounter = self:fetchBreakCount();
    if self.breakCounter > self.breakState then
        if self.breakCounter >= self.BREAK_STATES.WING_BREAK and self.breakState < self.BREAK_STATES.WING_BREAK then
            if self.state ~= self.STATES.FIRST_RAGE and self.state ~= self.STATES.SECOND_RAGE then
                unit:setSkin("normal-break2");
            else
                unit:setSkin("anger-break2");
            end
            self.breakState = self.BREAK_STATES.WING_BREAK;
            unit:addOrbitSystem("wingBreak");
            self:addBreakBuff(unit,2);
        elseif self.breakCounter >= self.BREAK_STATES.HEAD_BREAK and self.breakState < self.BREAK_STATES.HEAD_BREAK then
            if self.state ~= self.STATES.FIRST_RAGE and self.state ~= self.STATES.SECOND_RAGE then
                unit:setSkin("normal-break1");
            else
                unit:setSkin("anger-break1");
            end
            self.breakState = self.BREAK_STATES.HEAD_BREAK;
            unit:addOrbitSystem("headBreak");
            self:addBreakBuff(unit,1);
        end
    end
end

function class:addBreakBuff(unit,rank)
    unit:getTeamUnitCondition():addCondition(
        self.BUFF_ARGS.BREAKBUFF_ID,
        self.BUFF_ARGS.BREAKBUFF_EFID,
        self.BUFF_ARGS.BREAKBUFF_VAUE * rank,
        self.BUFF_ARGS.BREAKBUFF_DURATION,
        self.BUFF_ARGS.BREAKBUFF_ICON
    );
end

--======================================================================================================================================
--変形周りのギミック//
-----------------

function class:turnBack(unit)
    self.isFront = false;
    unit:setSetupAnimationName("setUpBack");
end

function class:turnFront(unit)
    self.isFront = true;
    unit:setSetupAnimationName("");
end

function class:shootDown(unit)
    self.isShootDown = true;
end

function class:airIntake(unit)
    self.isSpecialDown = true;
    unit:getTeamUnitCondition():addCondition(
        self.BUFF_ARGS.BREAKBUFF2_ID,
        self.BUFF_ARGS.BREAKBUFF2_EFID,
        self.BUFF_ARGS.BREAKBUFF2_VAUE,
        self.BUFF_ARGS.BREAKBUFF2_DURATION,
        self.BUFF_ARGS.BREAKBUFF2_ICON
    );
end


--==============================================================================================================
--レイド特有のギミック周り/
--////////////////////

function class:getIsTarget()
    if RaidControl:get() == nil then
        return false;
    end
    return RaidControl:get():getRanking() <= 3 and RaidControl:get():getTotalBattlePoint() > 1000000;
end

function class:checkTarget()
    if not self.isTarget and self:getIsTarget() then
        summoner.Utility.messageByEnemy(self.TEXT.mess1,5,summoner.Color.red);
        BattleControl:get():showHateAll();
    elseif self.isTarget and not self:getIsTarget() then
        BattleControl:get():hideHateAll();     
    end
    self.isTarget = self:getIsTarget();
end

function class:checkTelop(deltatime)
    if RaidControl:get() == nil then
        return;
    end

    --テロップ表示のチェック
    self.telopTimer = self.telopTimer - deltatime;
    if self.telopTimer < 0 then
        self.telopTimer = self.telopTimerDelay;                
        local rand = LuaUtilities.rand(0,4)
        if rand == 0 then
            if self.isTarget then
                RaidControl:get():addPauseMessage(self.TEXT.telop3 , 2.2);
            else
                RaidControl:get():addPauseMessage(self.TEXT.telop1 , 2.2);
            end
        elseif rand == 1 then
            if self.state == self.STATES.rage then
                RaidControl:get():addPauseMessage(self.TEXT.telop4 , 2.2);
            else
                RaidControl:get():addPauseMessage(self.TEXT.telop2 , 2.2);
            end
        elseif rand == 2 then
            RaidControl:get():addPauseMessage(self.TEXT.telop5 , 2.2);
        elseif rand == 3 then
            RaidControl:get():addPauseMessage(self.TEXT.telop6 , 2.2);
        end
    end
end



--======================================================================================================================================
--部屋の同期//
-----------

function class:sendRageStartTime()
    if RaidControl:get() ~= nil then
        local t = tonumber(RaidControl:get():getCustomValue("startTime1"));

        if self.state >= self.STATES.SECOND_RAGE then
            t = tonumber(RaidControl:get():getCustomValue("startTime2"));
        end
        
        if t ~= "" and t ~= "error" and t ~= nil then
            return t;
        else
            if self.state >= self.STATES.SECOND_RAGE then
                RaidControl:get():setCustomValue("startTime2",""..RaidControl:get():getCurrentRaidTime());
            else
                RaidControl:get():setCustomValue("startTime1",""..RaidControl:get():getCurrentRaidTime());
            end
            return RaidControl:get():getCurrentRaidTime();
        end
        
    else
        return self.timeCount;
    end
end

function class:fetchRageStartTime()
    if RaidControl:get() ~= nil then
        local t = tonumber(RaidControl:get():getCustomValue("startTime1"));

        if self.state >= self.STATES.SECOND_RAGE then
            t = tonumber(RaidControl:get():getCustomValue("startTime2"));
        end
        
        if t ~= "" and t ~= "error" and t ~= nil then
            return t;
        else
            return RaidControl:get():getCurrentRaidTime();
        end
    else
        if self.state >= self.STATES.SECOND_RAGE then
            return self.rageStartTime2;
        end
        return self.rageStartTime1;
    end
    return nil;
end

function class:getRaidTime()
    return RaidControl:get() ~= nil and RaidControl:get():getCurrentRaidTime() or self.timeCount;
end

function class:sendBreakCount()
    if RaidControl:get() == nil then
        return;
    end

    local t = tonumber(RaidControl:get():getCustomValue("breakCnt"));
    local tmp = RaidControl:get():getRaidBreakCount();
    
    if t ~= "" and t ~= "error" and t ~= nil then
        tmp = RaidControl:get():getRaidBreakCount() > 0 and RaidControl:get():getRaidBreakCount() or t;
    end
    
    RaidControl:get():setCustomValue("breakCnt",""..tmp);
    
end

function class:fetchBreakCount()
    if RaidControl:get() == nil then
        return self.breakCounter;
    end

    local t = tonumber(RaidControl:get():getCustomValue("breakCnt"));
    local tmp = RaidControl:get():getRaidBreakCount();
    
    if t ~= "" and t ~= "error" and t ~= nil then
        tmp = RaidControl:get():getRaidBreakCount() > 0 and RaidControl:get():getRaidBreakCount() or t;
    end

    --breakCounterは一方通行にしたいので大きい方を返す
    return self.breakCounter < tmp and tmp or self.breakCounter;
end

function class:sendState()
    if RaidControl:get() ~= nil then
       local roomState =  self:fetchState();
       if roomState <= self.state then
            RaidControl:get():setCustomValue("state",""..self.state);
       end
    end
end

function class:fetchState()
    if RaidControl:get() ~= nil then
        local t = tonumber(RaidControl:get():getCustomValue("state"));
        
        if t ~= "" and t ~= "error" and t ~= nil then
            return t;
        else
            return self.state; 
        end
    else
        return self.state;
    end
end

--======================================================================================================================================

function class:animationSwitcher(unit,animState)
    if self.state ~= self.STATES.FIRST_RAGE and self.state ~= self.STATES.SECOND_RAGE then
        if animState == self.ANIMATION_STATES.DAMAGE and self.isSpecialDown then
            unit:setNextAnimationName("damage3");
            unit:takeAnimationEffect(0,"damage3",false);
        elseif animState == self.ANIMATION_STATES.IDLE and not self.isFront then
            unit:setNextAnimationName("zcloneNidle2");
        elseif animState == self.ANIMATION_STATES.DAMAGE and not self.isFront then
            unit:setNextAnimationName("zcloneNdamage2");
        elseif animState == self.ANIMATION_STATES.BACK and not self.isFront then
            unit:setNextAnimationName("zcloneNback2");
        elseif animState == self.ANIMATION_STATES.ATTACK6 then
            return;
        else
            unit:setNextAnimationName("zcloneN"..animState);
        end
    else
        if animState == self.ANIMATION_STATES.DAMAGE and self.isSpecialDown then
            unit:setNextAnimationName("damage3");
            unit:takeAnimationEffect(0,"damage3",false);
        elseif animState == self.ANIMATION_STATES.IDLE and not self.isFront then
            unit:setNextAnimationName("idle2");
        elseif animState == self.ANIMATION_STATES.DAMAGE and not self.isFront then
            unit:setNextAnimationName("damage2");
        elseif animState == self.ANIMATION_STATES.BACK and not self.isFront then
            unit:setNextAnimationName("back2");
        end
    end
end


function class:getTargetDistance(unit,target)
    return target:getPositionX() - unit:getPositionX();
end



class:publish();

return class;