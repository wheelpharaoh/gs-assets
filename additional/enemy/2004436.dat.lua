local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createEnemyClass({label="", version=1.3, id=2004436});
class:inheritFromUnit("bossBase");

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS = {
    ATTACK1 = 50,
    ATTACK2 = 50,
    ATTACK3 = 50,
    ATTACK4 = 50
}

--使用する奥義とその確率
class.SKILL_WEIGHTS = {
    SKILL2 = 100,
    SKILL3 = 100
}

class.ACTIVE_SKILLS = {
    ATTACK1 = 1,
    ATTACK2 = 2,
    ATTACK3 = 3,
    ATTACK4 = 4,
    SKILL1 = 5,
    SKILL2 = 6,
    SKILL3 = 7
}

class.START_BUFF_ARGS = {
    {
        ID = 400754,
        EFID = 97,         --燃焼
        VALUE = 1,        --効果量
        DURATION = 9999999,
        ICON = 87,
        GROUP_ID = 96,
        PRIORITY = 0
    }
}

--怒り時にかかるバフ内容
class.RAGE_BUFF_ARGS_ENEMY = {
    {
        ID = 400753,
        EFID = 21,         --被ダメージ増加
        VALUE = 50,        --効果量
        DURATION = 9999999,
        ICON = 43,
        SCRIPT = 14,
        SCRIPTVALUE1 = 1
    }
}

class.RAGE_BUFF_ARGS2 = {
    {
        ID = 400752,
        EFID = 0,         --加速
        VALUE = 1,        --効果量
        DURATION = 9999999,
        ICON = 36
    }
}


class.BUFF_VALUE = 30;


function class:start(event)
    self.fromHost = false;
    self.gameUnit = nil;
    self.spValue = 20;
    self.attackCheckFlg = false;
    self.skillCheckFlg = false;
    self.skillCheckFlg2 = false;
    self.isRage = false;
    self.forceSkillIndex = 0;
    event.unit:setSkillInvocationWeight(0);
    self.HP_TRIGGERS = {
        [60] = "getRage",
        [30] = "lastSpart"
    }

    --怒り時のメッセージ
    self.SPEED_UP_MESSAGES = {
        [0] = {
            MESSAGE = self.TEXT.SPEED_UP_MESSAGE1 or "奥義ゲージ速度アップ",
            COLOR = Color.yellow,
            DURATION = 15
        }
    }

    self.RAGE_MESSAGES = {
        [0] = {
            MESSAGE = self.TEXT.RAGE_MESSAGE2 or "味方の炎属性耐性ダウン",
            COLOR = Color.red,
            DURATION = 15,
            PLAYER_SIDE = true
        }
    }

    self.START_MESSAGES = {
        [0] = {
            MESSAGE = self.TEXT.START_MESSAGE1 or "魔族キラー",
            COLOR = Color.yellow,
            DURATION = 15
        },
        [1] = {
            MESSAGE = self.TEXT.START_MESSAGE2 or "クリティカルダメージ吸収",
            COLOR = Color.red,
            DURATION = 15
        },
        [2] = {
            MESSAGE = self.TEXT.START_MESSAGE3 or "燃焼時行動速度アップ",
            COLOR = Color:new(255,110,0),
            DURATION = 15
        },
        [3] = {
            MESSAGE = self.TEXT.START_MESSAGE4 or "燃焼中の相手に対して奥義クリティカル",
            COLOR = Color:new(255,110,0),
            DURATION = 15
        }
    }

    self.gameUnit = event.unit;
    event.unit:setSPGainValue(0);
    return 1;
end

function class:startWave(event)
    self:showMessages(unit,self.START_MESSAGES);
    return 1;
end

function class:update(event)
    self:HPTriggersCheck(event.unit);
    event.unit:setReduceHitStop(2,1);--ヒットストップ無効Lv2　完全無効
    return 1;
end

function class:run (event)
    if event.spineEvent == "addSP" then return self:addSP(event.unit) end
    if event.spineEvent == "InTheBurst" then
      self:addBuffs(event.unit,self.START_BUFF_ARGS);
   end
    return 1;
end

--===================================================================================================================
--通常攻撃分岐//
--///////////


function class:attackBranch(unit)
    local attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS);
    local attackIndex = string.gsub(attackStr,"ATTACK","");
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
    return 1
end

function class:attackActiveSkillSetter(unit,index)
    unit:setActiveSkill(self.ACTIVE_SKILLS["ATTACK"..index]);
end
--===================================================================================================================


--===================================================================================================================
--スキル分岐//
--//////////

function class:skillBranch(unit)
    local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
    local skillIndex = string.gsub(skillStr,"SKILL","");
    if self.forceSkillIndex ~= 0 then
        skillIndex = self.forceSkillIndex;
    end
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
    return 1
end

function class:skillActiveSkillSetter(unit,index)
    unit:setActiveSkill(self.ACTIVE_SKILLS["SKILL"..index]);
end
--===================================================================================================================




function class:addSP(unit)
  
    unit:addSP(self.spValue);
    
    return 1;
end

--===================================================================================================================
--HPトリガー
function class:HPTriggersCheck(unit)
    if not self:getIsHost() then
        return;
    end

    local hpRate = summoner.Utility.getUnitHealthRate(unit) * 100;

    for i,v in pairs(self.HP_TRIGGERS) do

        if i >= hpRate and self.HP_TRIGGERS[i] ~= nil then
            self:excuteTrigger(unit,self.HP_TRIGGERS[i]);
            self.HP_TRIGGERS[i] = nil;
        end
    end

end

function class:excuteTrigger(unit,trigger)
    if trigger == "getRage" then
        self:getRage(unit);
        megast.Battle:getInstance():sendEventToLua(self.scriptID,3,0);
    end

    if trigger == "lastSpart" then
        self:lastSpart(unit);
        megast.Battle:getInstance():sendEventToLua(self.scriptID,4,0);
    end

end

--===================================================================================================================
--怒り関係

function class:getRage(unit)
    for i=0,7 do
        local targetUnit = self:getUnitByIndex(i);
        if targetUnit ~= nil then
            self:addBuffs(targetUnit,self.RAGE_BUFF_ARGS_ENEMY);
        end
    end
    self.isRage = true;
    self:showMessages(unit,self.RAGE_MESSAGES);
end


function class:addBuffs(unit,buffs)
    for k,v in pairs(buffs) do
        self:addBuff(unit,v);
    end
end

function class:lastSpart(unit)
    self.spValue = self.spValue * 2;
    self:addBuffs(unit,self.RAGE_BUFF_ARGS2);
    self:showMessages(unit,self.SPEED_UP_MESSAGES);
    self.forceSkillIndex = 1;
end

--===================================================================================================================
function class:showMessages(unit,messages)
    for k,v in pairs(messages) do
        if v.PLAYER_SIDE then
            summoner.Utility.messageByPlayer(v.MESSAGE,v.DURATION,v.COLOR);
        else
            summoner.Utility.messageByEnemy(v.MESSAGE,v.DURATION,v.COLOR);
        end
    end
end

function class:addBuff(unit,args)
    local buff  = nil;
    if args.EFFECT ~= nil then
        buff = unit:getTeamUnitCondition():addCondition(args.ID,args.EFID,args.VALUE,args.DURATION,args.ICON,args.EFFECT);
    else
        buff = unit:getTeamUnitCondition():addCondition(args.ID,args.EFID,args.VALUE,args.DURATION,args.ICON);
    end
    if args.SCRIPT ~= nil then
        buff:setScriptID(args.SCRIPT);
    end
    if args.SCRIPTVALUE1 ~= nil then
        buff:setValue1(args.SCRIPTVALUE1);
    end
    if args.GROUP_ID ~= nil then
        local cond = unit:getTeamUnitCondition():findConditionWithGroupID(args.GROUP_ID);
        if cond ~= nil and cond:getPriority() <= args.PRIORITY then
            unit:getTeamUnitCondition():removeCondition(cond);
            buff:setGroupID(args.GROUP_ID);
            buff:setPriority(args.PRIORITY);
        elseif cond == nil then
            buff:setGroupID(args.GROUP_ID);
            buff:setPriority(args.PRIORITY);
        end
    end
end


--=====================================================================================================================================
function class:receive3(args)
    self:getRage(self.gameUnit);
    return 1;
end

function class:receive3(args)
    self:lastSpart(self.gameUnit);
    return 1;
end

function class:getUnitByIndex(index)
    return megast.Battle:getInstance():getTeam(true):getTeamUnit(index);
end

function class:getIsHost()
    return megast.Battle:getInstance():isHost();
end


class:publish();

return class;