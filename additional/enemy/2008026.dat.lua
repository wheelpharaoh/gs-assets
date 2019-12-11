local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createEnemyClass({label="ボロス", version=1.3, id=2008026});
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

class.INVINCIBLE_TIME = 10
class.HITSTOP = 1

---------------------------------------------------------------------------------
-- start 
---------------------------------------------------------------------------------
function class:start(event)
  self.fromHost = false;
  self.gameUnit = nil;
  self.spValue = 20;
  self.attackCheckFlg = false;
  self.skillCheckFlg = false;
  self.skillCheckFlg2 = false;
  self.takeSkill3Flg = false;
  event.unit:setSkillInvocationWeight(0);
  self.HP_TRIGGERS = {
      [50] = "HP_FLG_50"
  }

  self.isDead = false
  self.time_limit = 10

  self.gameUnit = event.unit;
  event.unit:setSPGainValue(0);
    return 1;
end

---------------------------------------------------------------------------------
-- update
---------------------------------------------------------------------------------
function class:update(event)
  self:HPTriggersCheck(event.unit);

  if self.isDead then
    event.unit:setReduceHitStop(999,self.HITSTOP)

    self.time_limit = self.time_limit - event.deltaTime
    if self.time_limit < 0 then
      event.unit:setHP(0)
    else
      event.unit:setHP(1)
    end
  end

  return 1
end

---------------------------------------------------------------------------------
-- dead
---------------------------------------------------------------------------------
function class:dead(event)
  if not self.isDead and self:getIsHost() then
    self:execDead(event.unit)
    megast.Battle:getInstance():sendEventToLua(self.scriptID,4,1);
    return 0
  end
  if self.time_limit > 0 then
    event.unit:setHP(1)
    return 0
  end
  return 1
end

function class:execDead(unit)
  self.isDead = true
  unit:setHP(1)
  unit:setInvincibleTime(self.INVINCIBLE_TIME)
  self:removeAllBadstatus(unit)
  unit:takeIdle()
  unit:addSP(unit:getNeedSP())
end

function class:removeAllBadstatus(unit)
  local badStatusIDs = {89,91,96};
  for i=1,table.maxn(badStatusIDs) do
    local targetID = badStatusIDs[i];
    local flag = true;--whileを出るためだけのフラグ　これ以上同種のバッドステータスが取れなければfalseになります
    while flag do
      local cond = unit:getTeamUnitCondition():findConditionWithType(targetID);
      if cond ~= nil then
        unit:getTeamUnitCondition():removeCondition(cond);
      else
        flag = false;
      end
    end
  end
end

---------------------------------------------------------------------------------
-- run
---------------------------------------------------------------------------------
function class:run(event)
  if "volosDeath" == event.spineEvent then
    self.time_limit = 0
    event.unit:setHP(0)
  end
  return 1  
end

---------------------------------------------------------------------------------
-- takeAttack
---------------------------------------------------------------------------------
function class:takeAttack(event)
  if not self.attackCheckFlg and megast.Battle:getInstance():isHost() then
      self.attackCheckFlg = true;
      return self:attackReroll(event.unit);
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

function class:attackReroll(unit)
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

---------------------------------------------------------------------------------
-- takeSkill
---------------------------------------------------------------------------------
function class:takeSkill(event)
  if not self.skillCheckFlg and megast.Battle:getInstance():isHost() then
      self.skillCheckFlg = true;
      return self:skillReroll(event.unit);
  end

  if not megast.Battle:getInstance():isHost() and not self.fromHost then
      event.unit:takeIdle();
      return 0;
  end

  if event.index == 2 and not self.skillCheckFlg2 then
    self.skillCheckFlg2 = true;
    event.unit:takeSkillWithCutin(2);
    return 0;    
  end

  if event.index == 3 and not self.skillCheckFlg2 then
    self.skillCheckFlg2 = true;
    if self.takeSkill3Flg == false then
      self.takeSkill3Flg = true;
      event.unit:takeSkillWithCutin(3,1);
    end
      event.unit:takeSkill(3);
    return 0;
  end

  self.skillCheckFlg = false;
  self.skillCheckFlg2 = false;
  self.fromHost = false;
  self:skillActiveSkillSetter(event.unit,event.index);
  return 1
end

function class:skillReroll(unit)
  local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
  local skillIndex = string.gsub(skillStr,"SKILL","");

  if self.isDead then
    skillIndex = 3;
  end
  unit:takeSkill(tonumber(skillIndex));
  megast.Battle:getInstance():sendEventToLua(self.scriptID,2,tonumber(skillIndex));
  return 0;
end

--===================================================================================================================
--HPトリガー
--===================================================================================================================
function class:HPTriggersCheck(unit)

    if not self:getIsHost() then
        return;
    end

    local hpRate = summoner.Utility.getUnitHealthRate(unit) * 100;

    for i,v in pairs(self.HP_TRIGGERS) do
        if i >= hpRate and self.HP_TRIGGERS[i] ~= nil then
            if self:excuteTrigger(unit,self.HP_TRIGGERS[i]) then
                self.HP_TRIGGERS[i] = nil;
            end
        end
    end
end

function class:excuteTrigger(unit,trigger)
    if trigger == "HP_FLG_50" then
        self:hp_50(unit)
        megast.Battle:getInstance():sendEventToLua(self.scriptID,3,0);
        return true
    end
    return false
end

function class:hp_50(unit)
  unit:addSP(unit:getNeedSP())
end


---------------------------------------------------------------------------------
-- receive
---------------------------------------------------------------------------------
function class:receive3(args)
  self:hp_50(self.gameUnit)
  return 1
end

function class:receive4(args)
  self:execDead(self.gameUnit)
  return 1
end

function class:getIsHost()
    return megast.Battle:getInstance():isHost();
end

class:publish();

return class;