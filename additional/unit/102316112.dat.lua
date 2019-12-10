local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createUnitClass({label="パルラミシア", version=1.3, id=102316112});

class.INVINCIBLE_TIME = 5

class.COUNTER_NM = "skill2counter"
class.CANCEL_NM = "skill2Failed"

class.COUNTER_EF = "2skill2counter"
class.CANCEL_EF = "2skill2Failed"

-- ブレイクポイントを削る割合
class.REDUCE_BREAKPOINT_RATE = 0.9

function class:setBuffBoxList()
  self.BUFF_BOX_LIST = {
    [0] = {
      ID = 40075,
      BUFF_ID = 22,     --クリティカルアップ
      VALUE = 100,      --効果量
      DURATION = 10,
      ICON = 11
    }
  }
end

---------------------------------------------------------------------------------
-- start 
---------------------------------------------------------------------------------
function class:start(event)
  self.myUnit = event.unit
  self.isTwice = false
  self.isCounterSuccess = false
  self.isCounter = false
  self:setBuffBoxList()
  return 1
end

---------------------------------------------------------------------------------
-- run
---------------------------------------------------------------------------------
function class:run(event)
  if "counter" == event.spineEvent and self:isControll(event.unit) then
    self.isCounter = true
  end
  if "cancel" == event.spineEvent and self:isControll(event.unit) then
    self.isCounter = false
    self:cancelImpl(event.unit)
    megast.Battle:getInstance():sendEventToLua(self.scriptID,2,1)
  end
  return 1
end

function class:isControll(unit)
  return unit:isMyunit() or self:isEnemyHost(unit)
end

function class:isEnemyHost(unit)
  return not unit:getisPlayer() and megast.Battle:getInstance():isHost()
end

---------------------------------------------------------------------------------
-- takeDamage
---------------------------------------------------------------------------------
function class:takeDamage(event)
  self.isCounter = false
  return 1 
end

---------------------------------------------------------------------------------
-- attackDamageValue
---------------------------------------------------------------------------------
function class:attackDamageValue(event)
  if self.isCounterSuccess and self.isTwice then
    self.isCounterSuccess  = false
    self.isTwice = false
    return event.value * 2
  end
  self.isCounterSuccess = false

  return event.value
end

---------------------------------------------------------------------------------
-- takeDamageValue
---------------------------------------------------------------------------------
function class:takeDamageValue(event)
  if self.isCounter and self:isControll(event.unit) then
    self.isCounter = false
    self.isCounterSuccess = true
    self:counterImpl(event.unit)
    self:reduceBreakPoint(event.enemy)
    megast.Battle:getInstance():sendEventToLua(self.scriptID,1,1)
    return 0
  end
  return event.value
end

function class:counterImpl(unit)
  unit:setInvincibleTime(self.INVINCIBLE_TIME)
  unit:setAnimation(0,self.COUNTER_NM,false)
  unit:takeAnimationEffect(0,self.COUNTER_EF,false)
  self:addBuff(unit,self.BUFF_BOX_LIST)
end

function class:cancelImpl(unit)
  unit:setInvincibleTime(self.INVINCIBLE_TIME)
  unit:setAnimation(0,self.CANCEL_NM,false)
  unit:takeAnimationEffect(0,self.CANCEL_EF,false)
end

function class:reduceBreakPoint(unit)
  unit:setBreakPoint(unit:getBreakPoint() * self.REDUCE_BREAKPOINT_RATE)
end

---------------------------------------------------------------------------------
-- takeSkill
---------------------------------------------------------------------------------
function class:takeSkill(event)
  if 3 == event.index then
    self.isTwice = true
  end
  return 1
end

---------------------------------------------------------------------------------
-- recieve
---------------------------------------------------------------------------------
function class:recieve1(args)
  self:counterImpl(self.myUnit)
  return 1
end

function class:recieve2(args)
  self:cancelImpl(self.myUnit)
  return 1
end

--===================================================================================================================
-- バフ関係
--===================================================================================================================
-- バフ指定実行。indexがない時はバフボックスの中身を全部実行
function class:addBuff(unit,buffBoxList,index)
    if index == nil then 
        self:addBuffRange(unit,buffBoxList,0,table.maxn(buffBoxList))
        return
    end
    self:execAddBuff(unit,buffBoxList[index])
end

-- startからfinishまでのバフを実行する
function class:addBuffRange(unit,buffBoxList,start,finish)
    for i = start,finish do
        self:execAddBuff(unit,buffBoxList[i])
    end
end

-- バフ処理実行
function class:execAddBuff(unit,buffBox)
    local buff  = nil;
    if buffBox.EFFECT ~= nil then
        buff = unit:getTeamUnitCondition():addCondition(buffBox.ID,buffBox.BUFF_ID,buffBox.VALUE,buffBox.DURATION,buffBox.ICON,buffBox.EFFECT);
    else
        buff = unit:getTeamUnitCondition():addCondition(buffBox.ID,buffBox.BUFF_ID,buffBox.VALUE,buffBox.DURATION,buffBox.ICON);
    end
    if buffBox.SCRIPT ~= nil then
        buff:setScriptID(buffBox.SCRIPT);
    end
    if buffBox.SCRIPTVALUE1 ~= nil then
        buff:setValue1(buffBox.SCRIPTVALUE1);
    end

end


class:publish();

return class;