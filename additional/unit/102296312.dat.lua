local class = summoner.Bootstrap.createUnitClass({label="ジル", version=1.3, id=102296312});

class.SKILL3 = 3
class.ALIVE_TIME = 20
class.COMPLEMENT_X = 80
class.COMPLEMENT_Y = -70
class.COPY_ANIMATION = "-copy"
class.COPY_ANIMATION_AREA = "-copyArea"
class.ANIMATION_TBL = {
	attack1 = "attack1" .. class.COPY_ANIMATION,
	skill1 = "skill1" .. class.COPY_ANIMATION,
	skill2 = "skill2" .. class.COPY_ANIMATION
}
class.DAMAGEAREA_TBL = {
	attack1 = "attack1" .. class.COPY_ANIMATION_AREA,
	skill1 = "skill1" .. class.COPY_ANIMATION_AREA,
	skill2 = "skill2" .. class.COPY_ANIMATION_AREA
}

function class:start(event)
	self.myUnit = event.unit
	self.orbitInstance = nil
	self.orbitEffectInstance = nil
	self.isAlive = false
	self.aliveTimer = 0
	
	if not event.unit:getisPlayer() then
		self.COMPLEMENT_X = self.COMPLEMENT_X * -1
	end
	return 1
end

function class:update(event)
	if self.isAlive then
		self:updateOrbit(event)
	end
	return 1
end

function class:run(event)
	if "endAnimation" == event.spineEvent and self.orbitInstance ~= nil then
		self.orbitInstance:takeAnimation(0,"idle" .. self.COPY_ANIMATION,true)
		self.orbitEffectInstance:takeAnimation(0,"idle",true)
	end

	-- takeBackで動きを同期させると分身の移動が本体より一瞬はやく終わってチラつくのでSpineからタイミングを調整してる
	if "back" == event.spineEvent and event.unit:getParentTeamUnit() == nil then
		self:sendAnimationToOrbit(event.unit,"back" .. self.COPY_ANIMATION)
	end

	if "attack1" == event.spineEvent and event.unit:getParentTeamUnit() == nil then
		self:sendAnimationToOrbit(event.unit,"attack1")
		self:sendAnimationToOrbitEffect("2-attack1")
	end

	if "skill1" == event.spineEvent and event.unit:getParentTeamUnit() == nil then
		self:sendAnimationToOrbit(event.unit,"skill1")
		self:sendAnimationToOrbitEffect("2-skill1")
	end

	if "skill2" == event.spineEvent and event.unit:getParentTeamUnit() == nil then
		self:sendAnimationToOrbit(event.unit,"skill2")
		self:sendAnimationToOrbitEffect("2-skill2")
	end

	return 1
end

function class:updateOrbit(event)
	self:setOrbitPosition(event.unit)
	self:countUp(event.deltaTime)
end

function class:receive1(arg)
	self:createOrbitInstance(self.myUnit,"skill3" .. self.COPY_ANIMATION)
	return 1
end

function  class:takeIdle(event)
	self:sendAnimationToOrbit(event.unit,"idle" .. self.COPY_ANIMATION)
	return 1
end

function class:takeFront(event)
	self:sendAnimationToOrbit(event.unit,"front" .. self.COPY_ANIMATION)
	return 1
end

function class:takeDamage(event)
	self:sendAnimationToOrbit(event.unit,"damage" .. self.COPY_ANIMATION)
	return 1
end

function class:takeSkill(event)
	if self.SKILL3 == event.index and self:isControll(event.unit) then
		self:createOrbitInstance(event.unit,"skill3")
		megast.Battle:getInstance():sendEventToLua(self.scriptID,1,0)
	end
	return 1
end

-- 分身作成
function class:createOrbitInstance(unit,animationName)
	if self.orbitInstance ~= nil then
		self:destroyOrbit()
	end
	self.orbitInstance = unit:addOrbitSystemWithFile("102296312","copy-admission")
	self.orbitEffectInstance = unit:addOrbitSystemWithFile("10229ef","2-" .. animationName)
    self.orbitInstance:setAutoZOrder(true);
    self.isAlive = true
    self:sendAnimationToOrbit(unit,"copy-admission")
	self:sendAnimationToOrbitEffect("2-" .. animationName)
end

-- 分身削除
function class:destroyOrbit()
	self.orbitInstance:takeAnimation(0,"copy-exit",false)
	self.orbitEffectInstance:takeAnimation(0,"idle",false)
	self.orbitInstance = nil
	self.orbitEffectInstance = nil
	self.aliveTimer = 0
	self.isAlive = false
end

function class:remakeOrbitAnimation(unit,animationName)
	self.orbitInstance:takeAnimation(0,self.ANIMATION_TBL[animationName],true)

	local damageAreaInstance = unit:addOrbitSystemWithFile("102296312",self.DAMAGEAREA_TBL[animationName])
	damageAreaInstance:setPosition(unit:getPositionX() + self.COMPLEMENT_X,unit:getPositionY() + self.COMPLEMENT_Y)
	damageAreaInstance:takeAnimation(0,self.DAMAGEAREA_TBL[animationName],false)
end

function class:sendAnimationToOrbit(unit,animationName)
	if self.orbitInstance == nil then
		return
	end
	if self.DAMAGEAREA_TBL[animationName] ~= nil then
		self:remakeOrbitAnimation(unit,animationName)
		return
	end
	self.orbitInstance:takeAnimation(0,animationName,true)
end

function class:sendAnimationToOrbitEffect(animationName)
	if self.orbitEffectInstance == nil then
		return
	end
	self.orbitEffectInstance:takeAnimation(0,animationName,true)
end

-- 分身の座標更新
function class:setOrbitPosition(unit)
	if self.orbitInstance == nil then
		return
	end
	self.orbitInstance:setPosition(unit:getPositionX() + self.COMPLEMENT_X,unit:getPositionY() + self.COMPLEMENT_Y)
	if self.orbitEffectInstance == nil then
		return
	end
	self.orbitEffectInstance:setPosition(unit:getPositionX() + self.COMPLEMENT_X,unit:getPositionY() + self.COMPLEMENT_Y)
end

-- 分身の生存時間更新
function class:countUp(deltaTime)
	if megast.Battle:getInstance():getBattleState() ~= kBattleState_active then
		return
	end
	self.aliveTimer = self.aliveTimer + deltaTime
	if self.aliveTimer >= self.ALIVE_TIME then
		self:destroyOrbit();
	end
end

function class:isControll(unit)
	if unit:isMyunit() then
		return true
	end
    return unit:getisPlayer() == false and megast.Battle:getInstance():isHost()
end

class:publish();

return class;
