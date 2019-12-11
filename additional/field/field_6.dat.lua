local class = summoner.FieldEventDispatcher.createFieldClass({label="Swamp", version=1.0, id=6});

local json = summoner.Json;

--欲しいjsonはこんな感じ
-- {
--     "spPerSec":（数値）SP増加量毎秒,
--     "spBySkill":（数値）スキル時のSP増加量
-- }


function class:init()
    self.damageTimer = 0;
    self.buffCheckTimer = 0;
    self.fieldArgs = nil;

    self.SPs = {};
    self.skillStates = {};
    self.artsUnits = {};

    self.isInit = false;
    return 1
end

-- event { deltaTime,playerTeam,enemyTeam,customParameter }
function class:update(event)
    if not self.isInit then
        self.fieldArgs = json.parse(event.customParameter);
        self:SPsInit(event.playerTeam);
        self.isInit = true;
    end
    if megast.Battle:getInstance():getBattleState() ~= kBattleState_active then
        return 1;
    end
    self:skillGaze(event.playerTeam);
    self:SPGaze(event.playerTeam,event.deltaTime);

   return 1
end


-- event { playerTeam,enemyTeam,customParameter }
--Wave開始時に呼ばれる
function class:waveRun(event)
    
    return 1
end

-- event { playerTeam,enemyTeam,customParameter }
--Wave終了時に呼ばれる
function class:waveEnd(event)
    print("waveEnd");
   return 1
end


--SPの規定値を管理する部分　規定値を超えていれば規定値に合わせ、それ未満であれば規定値をそこに合わせる。
function class:SPGaze(playerTeam,deltaTime)
    for i = 0, 3 do
        local unit = playerTeam:getTeamUnit(i);
        if unit ~= nil then
            if unit:isMyunit() then
                if unit:getBurstPoint() > self.SPs[i] then
                    unit:setBurstPoint(self.SPs[i]);

                    --規定値よりもSPが少ないということは奥義を発動したのか、何かしらでSPを奪われた、支払ったということなので規定値の方を合わせる
                elseif unit:getBurstPoint() < self.SPs[i] then

                    --奥義を発動して即時（同一フレーム）でSPが回復するユニットに関して無理だったので、SPズレが生じたときに奥義か真奥義を検知したら固定値減らす。
                    local skill = unit:getActiveBattleSkill();
                    if skill ~= nil then
                        local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
                        -- BattleControl:get():pushInfomation(self.SPs[i],1,1,1,1);
                        if unit:getBurstState() == 1 and skill:isBurst2() then
                            unit:setBurstPoint(0);
                        elseif unit:getBurstState() == 1 then
                            local targetSP = self.SPs[i] - unit:getNeedSP() >= 0 and self.SPs[i] - unit:getNeedSP() or 0;
                            unit:setBurstPoint(targetSP);
                        end
                    end
                    self.SPs[i] = unit:getBurstPoint();
                end
                self.SPs[i] = self.SPs[i] + self.fieldArgs.spPerSec * deltaTime;
                unit:setBurstPoint(self.SPs[i] + self.fieldArgs.spPerSec * deltaTime);
            end
        end
    end
end

function class:SPsInit(playerTeam)
    for i = 0, 3 do
        local unit = playerTeam:getTeamUnit(i);
        if unit ~= nil then
            self:SPsRegist(unit,i);
            self.skillStates[i] = 0;
        end
    end
end

function class:skillGaze(playerTeam)
    for i = 0, 3 do
        local unit = playerTeam:getTeamUnit(i);
        if unit ~= nil then
            local skillExcution = self:isSkill(unit);
            if skillExcution and self.skillStates[i] < unit:getSkillCoolTime() then
                self:addSPBySkill(unit,i);
            end
            self.skillStates[i] = unit:getSkillCoolTime();
        end
    end
end

function class:SPsRegist(unit,index)
    self.SPs[index] = 0;
    unit:setBurstPoint(0);
end

function class:isSkill(unit)
    return unit:getBurstState() ~= kBurstState_active and unit:getUnitState() == kUnitState_skill;
end

function class:addSPBySkill(unit,index)
    self.SPs[index] = self.SPs[index] + self.fieldArgs.spBySkill;
    unit:setBurstPoint(self.SPs[index]);
end


class:publish();

return class;