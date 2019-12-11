local class = summoner.Bootstrap.createUnitClass({label="ミリム", version=1.3, id=107166112});

--真奥義バフ内容
class.BUFF_ARGS = {
    [0] = {
       ID = 107176112,
       BUFF_ID = 22,
       VALUE =100,
       DURATION = 15,
       ICON = 11,
       GROUP_ID = 1024,
       PRIORITY = 100
   }
}

function class:start(event)
   self.damage = 0
   self.rate = 5
   self.spGainTime = math.floor(event.unit:getCalcHPMAX() * 0.1)
   return 1
end

function class:takeDamageValue(event)
   if event.unit:getTeamUnitCondition():findConditionWithType(98) == nil then
      self.damage = self.damage + event.value
      event.unit:addSP((math.floor(self.damage/self.spGainTime)) * self:getCalcRate(event.unit))
      self.damage = self.damage % self.spGainTime
   end
   return event.value
end

function class:getCalcRate(unit)
   if unit:getLevel() < 70 then
      return 3;
   elseif unit:getLevel() < 80 then
      return 4;
   else
      return 5;
   end
end

function class:run(event)
   if event.spineEvent == "addBuff" then
      self:execAddBuff(event.unit,self.BUFF_ARGS[0]);
   end
   return 1;
end
-- バフ処理実行
function class:execAddBuff(unit,buffBox)
  if buffBox.GROUP_ID ~= nil then
    local cond = unit:getTeamUnitCondition():findConditionWithGroupID(buffBox.GROUP_ID);
    if cond ~= nil then
        if cond:getPriority() > buffBox.PRIORITY then
            return;
        end
        unit:getTeamUnitCondition():removeCondition(cond);
    end
    self:addConditionWithGroup(unit,buffBox);
    return;
  end

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

--グループIDつきバフ
function class:addConditionWithGroup(unit,buffBox)
  
    local newCond = nil;
    if buffBox.EFFECT ~= nil then
        newCond = unit:getTeamUnitCondition():addCondition(buffBox.ID,buffBox.BUFF_ID,buffBox.VALUE,buffBox.DURATION,buffBox.ICON,buffBox.EFFECT);
    else
        newCond = unit:getTeamUnitCondition():addCondition(buffBox.ID,buffBox.BUFF_ID,buffBox.VALUE,buffBox.DURATION,buffBox.ICON);
    end
    newCond:setGroupID(buffBox.GROUP_ID);
    newCond:setPriority(buffBox.PRIORITY);
    if buffBox.SCRIPT ~= nil then
       newCond:setScriptID(buffBox.SCRIPT)
    end
    if buffBox.SCRIPTVALUE1 ~= nil then
        buff:setValue1(buffBox.SCRIPTVALUE1);
    end
 
end

class:publish();

return class;