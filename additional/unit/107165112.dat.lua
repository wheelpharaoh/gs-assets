local class = summoner.Bootstrap.createUnitClass({label="ミリム", version=1.3, id=107166112});

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

class:publish();

return class;