local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createEnemyClass({label="No.2", version=1.3, id=2000661});
class:inheritFromUnit("unitBossBase");

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS = {
    ATTACK1 = 50
}

--使用する奥義とその確率
class.SKILL_WEIGHTS = {
    SKILL1 = 100,
    SKILL2 = 100
}

class.ACTIVE_SKILLS = {
    ATTACK1 = 1,
    SKILL1 = 2,
    SKILL2 = 3
}




function class:start(event)
    self.fromHost = false;                  --ユニットボスは攻撃が自動同期されないためゲスト側が攻撃を待つためのフラグ
    self.gameUnit = nil;
    self.spValue = 20;
    self.attackCheckFlg = false;
    self.skillCheckFlg = false;
    self.skillCheckFlg2 = false;            --真奥義の際に真奥義用カットインをいれるためのフラグ
    event.unit:setSkillInvocationWeight(0);



    self.gameUnit = event.unit;
    return 1;
end

function class:update(event)
    event.unit:setReduceHitStop(2,1);--ヒットストップ無効Lv2　100%軽減
    return 1;
end


function class:attackBranch(unit)
    local attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS);
    local attackIndex = string.gsub(attackStr,"ATTACK","");
    
    unit:takeAttack(tonumber(attackIndex));
 
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
    self:attackActiveSkillSetter(event.unit,event.index)
    return 1
end

function class:skillBranch(unit)
    local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
    local skillIndex = string.gsub(skillStr,"SKILL","");

    unit:takeSkill(tonumber(skillIndex));
    megast.Battle:getInstance():sendEventToLua(self.scriptID,2,tonumber(skillIndex));
    return 0;
end


function class:takeSkill(event)
    if not self.skillCheckFlg and megast.Battle:getInstance():isHost() then
        self.skillCheckFlg = true;
        return self:skillBranch(event.unit);
    end
    self.skillCheckFlg = false;
    if not megast.Battle:getInstance():isHost() and not self.fromHost then
        event.unit:takeIdle();
        return 0;
    end
    if event.index == 3 and not self.skillCheckFlg2 then
        self.skillCheckFlg2 = true;
        event.unit:takeSkillWithCutin(3,1);
        return 0;
    end
    self:skillActiveSkillSetter(event.unit,event.index);
    self.skillCheckFlg2 = false;
    self.fromHost = false;

    return 1
end







class:publish();

return class;