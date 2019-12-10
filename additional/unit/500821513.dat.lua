local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createUnitClass({label="ギアベール", version=1.6, id=500821513});
class:inheritFromUnit("bossBase");

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS = {
    ATTACK1 = 50,
    ATTACK2 = 50,
    ATTACK3 = 50,
    ATTACK4 = 50,
    ATTACK5 = 50
}

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS_RAGE = {
    ATTACK6 = 50,
    ATTACK7 = 50,
    ATTACK8 = 50,
    ATTACK9 = 50
}

--使用する奥義とその確率
class.SKILL_WEIGHTS = {
    SKILL1 = 50
}


--攻撃や奥義に設定されるスキルの番号
class.ACTIVE_SKILLS = {
    ATTACK1 = 1,
    ATTACK2 = 1,
    ATTACK3 = 1,
    ATTACK4 = 2,
    ATTACK5 = 3,
    ATTACK6 = 4,
    ATTACK7 = 5,
    ATTACK8 = 6,
    ATTACK9 = 7,
    ATTACK10 = 8,
    SKILL1 = 9,
    SKILL2 = 10
}

class.ANIMSTATE = {
    IDLE = "idle",
    DAMAGE = "damage"
}


--怒り時にかかるバフ内容
class.RAGE_BUFF_ARGS = {
    {
        ID = 40001174,
        EFID = 27,         --ブレイク耐性
        VALUE = -50,        --効果量
        DURATION = 9999999,
        ICON = 0
    },
    {
        ID = 40001173,
        EFID = 17,         --攻撃アップ
        VALUE = 100,        --効果量
        DURATION = 9999999,
        ICON = 26
    }
}

--怒り時のメッセージ
class.RAGE_MESSAGES = {
    {
        MESSAGE = class.TEXT.mess1 or "ブレイク耐性アップ",
        COLOR = Color.red,
        DURATION = 5
    },
    {
        MESSAGE = class.TEXT.mess2 or "与ダメージアップ",
        COLOR = Color.red,
        DURATION = 5
    }
};

--===============================================================================================================================================
function class:start(event)
    event.unit:setSPGainValue(0);
    self.isRage = false;
    event.unit:setNeedSP(100);
    self.spValue = 20;
    self.attackCheckFlg = false;
    self.skillCheckFlg = false;
    self.gameUnit = event.unit;
    self.attack10Flag = false;
    self.HP_TRIGGERS = {
        [60] = "getRage"
    };
    event.unit:takeAnimation(1,"under_idle",true);

    return 1;
end

function class:update(event)
    self:HPTriggersCheck(event.unit);
    event.unit:setReduceHitStop(2,1);--ヒットストップ無効Lv2　100%軽減
    self:fixPosition(event.unit);
    return 1;
end


function class:takeIdle(event)
    self:switchAnimation(event.unit,self.ANIMSTATE.IDLE);
    return 1;
end

function class:takeDamage(event)
    self:switchAnimation(event.unit,self.ANIMSTATE.DAMAGE);
    return 1;
end

function class:takeDamageValue(event)
    if self.attack10Flag then
        return math.sqrt(event.value);
    end
    return event.value;
end

function class:excuteAction(event)
    if self.startPositionX == nil then
        self.startPositionX = event.unit:getPositionX();
        self.startPositionY = event.unit:getPositionY();
    end
    return 1;
end

function class:dead(event)
    event.unit:takeAnimation(1,"out",false);
    return 1;
end

function class:run (event)
    if event.spineEvent == "addSP" then return self:addSP(event.unit) end
    if event.spineEvent == "rage" then return self:rage(event.unit) end
    return 1;
end

function class:attackBranch(unit)
    local attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS);
    if self.isRage then
        attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS_RAGE);
    end
    
    local attackIndex = string.gsub(attackStr,"ATTACK","");

    if attackIndex == 1 then
        local target = unit:getTargetUnit();
        local distance = 0;
        if taeget ~= nil then
            distance = BattleUtilities.getUnitDistance(unit,target);
        end
        if distance >= 400 then
            unit:takeAttack(3);
        elseif distance >= 200 then
            unit:takeAttack(2);
        else
            unit:takeAttack(1);
        end
        return 0;
    end


    if self.attack10Flag and not self.isRage then
        attackIndex = 10;
    end
    unit:takeAttack(tonumber(attackIndex));
    return 0;
end

function class:skillBranch(unit)
    local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
    local skillIndex = string.gsub(skillStr,"SKILL","");
    if self.isRage then
        skillIndex = 2;
    end
    unit:takeSkill(tonumber(skillIndex));
    return 0;
end
--===================================================================================================================

function class:fixPosition(unit)
    unit:getSkeleton():setPosition(0,0);
    if self.startPositionX ~= nil then
        unit:setPositionX(self.startPositionX);
        unit:setPositionY(self.startPositionY);
    end
end

--===================================================================================================================
--HPトリガー
function class:HPTriggersCheck(unit)
    if not self:getIsHost() then
        return;
    end

    local hpRate = Utility.getUnitHealthRate(unit) * 100;

    for i,v in pairs(self.HP_TRIGGERS) do

        if i >= hpRate and self.HP_TRIGGERS[i] ~= nil then
            if self:excuteTrigger(unit,self.HP_TRIGGERS[i]) then
                self.HP_TRIGGERS[i] = nil;
            end
        end
    end

end

function class:excuteTrigger(unit,trigger)

    if trigger == "getRage" then
        self.attack10Flag = true;
  
        if unit.m_breaktime > 0 then
            unit:setInvincibleTime(5);
        end

        return true;
    end
    return false;
end

--===================================================================================================================
--怒り関係

function class:rage(unit)
    if self:getIsHost() then
        self:getRage(unit);
        megast.Battle:getInstance():sendEventToLua(self.scriptID,3,0);
        self.attack10Flag = false;
    end
    return 1;
end

function class:getRage(unit)
    self:addRageBuff(unit);
    self.isRage = true;
    self:showMessages(unit,self.RAGE_MESSAGES);
    unit:setAttackDelay(0);
    unit:setSetupAnimationName("idle2");
    return 1;
end

function class:addRageBuff(unit)
    for i, v in ipairs(self.RAGE_BUFF_ARGS) do
        self:addBuff(unit, v);
    end
end

function class:addBuff(unit,args)
    if args.EFFECT ~= nil then
        unit:getTeamUnitCondition():addCondition(args.ID,args.EFID,args.VALUE,args.DURATION,args.ICON,args.EFFECT);
    else
        unit:getTeamUnitCondition():addCondition(args.ID,args.EFID,args.VALUE,args.DURATION,args.ICON);
    end
end

function class:showMessages(unit, messages)
    for i, v in ipairs(messages) do
        Utility.messageByEnemy(v.MESSAGE, v.DURATION, v.COLOR);
    end
end

--===============================================================================================================================================

function class:switchAnimation(unit,state)
    if self.isRage then
        unit:setNextAnimationName(state.."2");
    end
    return 1;
end

--===============================================================================================================================================

function class:getIsHost()
    return megast.Battle:getInstance():isHost();
end

--=====================================================================================================
function class:receive3(args)
    self:getRage(self.gameUnit);
    return 1;
end


class:publish();

return class;
