local class = summoner.Bootstrap.createUnitClass({label="タマエ様", version=1.3, id=102896112});

class.SPVALUE = 10;


function class:start(event)
	self.checkTimer = 0;
	

	return 1;
end



function class:update(event)
	self:deadCheck(event.unit,event.deltaTime);
	return 1;
end

function class:deadCheck(unit,deltaTime)
	
	self.checkTimer = self.checkTimer + deltaTime;
	
	if self.checkTimer < 0.2 then
		return;
	end

	self.checkTimer = self.checkTimer - 0.2;

	local targetList =  self:getTargetList(unit);

	for k,targetUnitIndex in pairs(targetList) do
		if self:deadOrNew(unit,targetUnitIndex) then
			unit:addSP(self.SPVALUE);
			self:cleanUpTargetParam(unit,targetUnitIndex);
		end
	end

	--一通りのチェックが終わった後にタマエのバフを感染させる
	self:influenceLastAttackChecker(unit);
	
end


--対象が死んでいるかどうか。　対象が生きていても、タマエのバフがかかっていない場合はユニットが入れ替わったと考えられるため死亡扱いに
function class:deadOrNew(unit,targetIndex)
	local target = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(targetIndex,true)

	local buffID = 102890 + unit:getIndex();
	if target ~= nil then
		local buff = target:getTeamUnitCondition():findConditionWithID(buffID);
		if buff == nil then
			return true;
		end
	end

	return target == nil or target:getHP() <= 0;
end

function class:getTargetList(unit)
	local index = unit:getIndex();
	local keyStr = "lastAttackChecker"
	local keyStr2 = "index"
	local attackedList = {};

	for i=0,7 do
		local param = unit:getParameter(keyStr..index..keyStr2..i);
		if param ~= "" and param ~= nil and param ~= "error" then
			local lastAttackerIndex = tonumber(param);
			if lastAttackerIndex == index then
				table.insert(attackedList,i);
			end
		end
	end

	return attackedList;
end

--使用済み（死亡確認済み）のインデックスについては存在しない攻撃者のインデックスを指定して無効化しておかないと万が一タマエが反応する前（0.2秒以内）に連続で敵が死んだ時にバグる可能性がある
--次殴られた時にちゃんと有効化するので、ここでしっかり無効化
function class:cleanUpTargetParam(unit,targetIndex)
	local index = unit:getIndex();
	local keyStr = "lastAttackChecker"
	local keyStr2 = "index"

	
	local paramName = keyStr..index..keyStr2..targetIndex;
	unit:setParameter(paramName,"-1"); 

end

--タマエの最終攻撃者判断用バフにかかっていないものがいたらそれにバフをかける
function class:influenceLastAttackChecker(unit)
	local buffID = 102890 + unit:getIndex();
	for i=0,7 do
		local target = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(i,true);
		if target ~= nil then
			local buff = target:getTeamUnitCondition():findConditionWithID(buffID);
			if buff == nil and target:getHP() > 0 then
				buff = target:getTeamUnitCondition():addCondition(buffID,21,1,99999,0);
				buff:setScriptID(179);
				buff:setValue1(unit:getIndex());
			end
		end
	end
end


class:publish();

return class;