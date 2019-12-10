local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createEnemyClass({label="", version=1.3, id=2010144});
class:inheritFromUnit("unitBossBase");

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS = {
    ATTACK1 = 50,
    ATTACK2 = 50
}

--使用する奥義とその確率
class.SKILL_WEIGHTS = {
    SKILL2 = 100
}

class.ACTIVE_SKILLS = {
    ATTACK1 = 1,
    SKILL1 = 2,
    SKILL2 = 3,
    SKILL3 = 4
}

--怒り時にかかるバフ内容
class.RAGE_BUFF_ARGS = {
    {
        ID = 40075,
        EFID = 17,         --ダメージアップ
        VALUE = 100,        --効果量
        DURATION = 9999999,
        ICON = 26
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
    self.forceSkillIndex = 0;
    self.isRage = false;
    self.allUnits = {};
    self.isStop = false;
    event.unit:setSkillInvocationWeight(0);
    self.HP_TRIGGERS = {
        [50] = "getRage",
    }

    --怒り時のメッセージ
    self.START_MESSAGES = {
        [0] = {
            MESSAGE = self.TEXT.START_MESSAGE1 or "不意打ちされる気分はどうかしら？",
            COLOR = Color.magenta,
            DURATION = 5
        }
    }

    self.gameUnit = event.unit;
    event.unit:setSPGainValue(0);
    return 1;
end

function class:startWave(event)
    -- summoner.Utility.messageByEnemy(self.TEXT.mess1,5,summoner.Color.magenta);
    self:showMessages(unit,self.START_MESSAGES);
    event.unit:addSP(event.unit:getNeedSP());
    self.forceSkillIndex = 3;
    return 1;
end

function class:update(event)
    self:HPTriggersCheck(event.unit);
    return 1;
end

function class:attackBranch(unit)
    local attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS);
    local attackIndex = string.gsub(attackStr,"ATTACK","");
    if tonumber(attackIndex) == 1 then
        unit:takeAttack(tonumber(attackIndex));
    else
        self.skillCheckFlg = true;
        unit:takeSkill(1);
        megast.Battle:getInstance():sendEventToLua(self.scriptID,2,tonumber(1));
        return 0;
    end
    megast.Battle:getInstance():sendEventToLua(self.scriptID,1,tonumber(attackIndex));
    return 0;
end

function class:takeAttack(event)

    if not self.attackCheckFlg and megast.Battle:getInstance():isHost() then
        self.attackCheckFlg = true;
        return self:attackBranch(event.unit);
    end
    self.attackCheckFlg = false;
    if not megast.Battle:getInstance():isHost() and not self.fromHost then
        event.unit:takeIdle();
        return 0;
    end
    self.fromHost = false;
    self:attackActiveSkillSetter(event.unit,event.index);
    self:addSP(event.unit);
    return 1
end

function class:skillBranch(unit)
    local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
    local skillIndex = string.gsub(skillStr,"SKILL","");

    if self.forceSkillIndex ~= 0 then
        skillIndex = self.forceSkillIndex;
        self.forceSkillIndex = 0;
    end
    
    unit:takeSkill(tonumber(skillIndex));
    megast.Battle:getInstance():sendEventToLua(self.scriptID,2,tonumber(skillIndex));
    return 0;
end


function class:takeSkill(event)
    if not self.skillCheckFlg and megast.Battle:getInstance():isHost() then
        self.skillCheckFlg = true;
        return self:skillBranch(event.unit);
    end
    if not megast.Battle:getInstance():isHost() and not self.fromHost then
        event.unit:takeIdle();
        return 0;
    end
    if event.index == 3 and not self.skillCheckFlg2 then
        self.skillCheckFlg2 = true;
        event.unit:takeSkillWithCutin(3,1);
        return 0;
    end
    self.skillCheckFlg = false;
    self.skillCheckFlg2 = false;
    self.fromHost = false;
    self:skillActiveSkillSetter(event.unit,event.index);
    return 1
end


function class:run (event)
    if event.spineEvent == "theWorld" then return self:theWorld(event.unit) end
    if event.spineEvent == "worldEnd" then return self:worldEnd(event.unit) end
    if event.spineEvent == "move" then return self:move(event.unit) end
    if event.spineEvent == "callForceSkill" then return self:callForceSkill(event.unit) end
    return 1;
end

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
end

--===================================================================================================================
--怒り関係

function class:getRage(unit)
    self:addBuffs(unit,self.RAGE_BUFF_ARGS);
    self.isRage = true;
end


function class:addBuffs(unit,buffs)
    for k,v in pairs(buffs) do
        self:addBuff(unit,v);
    end
end

--===================================================================================================================
function class:showMessages(unit,messages)
    for k,v in pairs(messages) do
        summoner.Utility.messageByEnemy(v.MESSAGE,v.DURATION,v.COLOR);
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

end
--=========================================================================================================================================
--時止め周りの処理

function  class:theWorld(unit)
    for i = 1,table.maxn(self.allUnits) do
        local uni = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(self.allUnits[i],true);
        if uni ~= nil then
            uni:takeGrayScale(0.01);
        end
    end
 
    self.isStop = true;
    
    return 1;
end

function class:move(unit)
    for i = 1,table.maxn(self.allUnits) do
        local uni = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(self.allUnits[i],true);
        if uni ~= nil and uni:getisPlayer() ~= unit:getisPlayer() then
            uni:getSkeleton():setPosition(0,uni:getPositionY() + 300);
            uni:setPosition(unit:getPositionX() + math.random(350)*-1 - 250,uni:getPositionY());
        end
    end
    return 1;
end

function class:worldEnd(unit)
    for i = 1,table.maxn(self.allUnits) do
        local uni = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(self.allUnits[i],true);
        if uni ~= nil then
            uni:takeGrayScale(0.99);
        end
    end
    self.allUnits = {};

    self.isStop = false;
    return 1;
end
--=====================================================================================================================================
--連携部分

function class:callForceSkill(unit)
    unit:takeIdle();
    self.forceSkillIndex = 3;
    unit:addSP(unit:getNeedSP());
    unit:excuteAction();
    return 1;
end

--=====================================================================================================================================
function class:receive3(args)
    self:getRage(self.gameUnit);
    return 1;
end

function class:getIsHost()
    return megast.Battle:getInstance():isHost();
end


class:publish();

return class;