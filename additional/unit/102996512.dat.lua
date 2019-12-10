local class = summoner.Bootstrap.createUnitClass({label="ラダックテスト用", version=1.3, id=102995312});

function class:addBuff(unit)
	unit:getParentTeamUnit():getTeamUnitCondition():addCondition(10299,22,100,10,11);
end

function class:run(event)
	if event.spineEvent == "addBuff" then
		self:addBuff(event.unit);
	end
	return 1;
end


class:publish();

return class;