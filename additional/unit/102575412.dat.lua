local class = summoner.Bootstrap.createUnitClass({label="エタニア", version=1.3, id=102575412});

function class:start(event)
   self.damage = 0
   self.rate = 5
   self.spGainTime = math.floor(event.unit:getCalcHPMAX() * 0.1)
   return 1
end

function class:takeDamageValue(event)
   if event.unit:getTeamUnitCondition():findConditionWithType(98) == nil then
      self.damage = self.damage + event.value
      event.unit:addSP((math.floor(self.damage/self.spGainTime)) * self.rate)
      self.damage = self.damage % self.spGainTime
   end
   return event.value
end

class:publish();

return class;