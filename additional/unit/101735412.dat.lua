--[[
    アルシェ
]]

local print = print
local table = table

local register = register
local megast = megast
local LuaUtilities = LuaUtilities
local BattleControl = BattleControl

function new(id)
    local DEBUG = true
    local LOG_LABEL = ""
    local log = function(str, ...) print((("Lua(%s): "):format(LOG_LABEL) .. str):format(...)) end
    local debug = function(...) if DEBUG then log(...) end end

    log("Called `new` with `%s`", id)

    local returnOne = function() return 1 end
    local returnDamage = function(self, unit, enemy, value) return value end
    local cls = {
        param = {
            version = 1.3,
            isUpdate = true
        },

        --====================================================================================================
        --メンバ変数的なものはここて定義する
        --====================================================================================================
        uniqueID = id,
        gameUnit = nil,

        --====================================================================================================
        --定数的なものはここで定義する。全て大文字のスネーク記法で
        --====================================================================================================


        
    }

    -- デフォルトのイベントハンドラに関数を割り当てる
    for i, name in ipairs({
        "receive1",
        "start", "update", "dead", "run",
        "startWave", "endWave",
        "excuteAction",
        "takeIdle", "takeFront", "takeDamage", "takeBack", "takeBreake", "takeAttack", "takeSkill"
    }) do
        cls[name] = returnOne
    end
    for i, name in ipairs({"attackDamageValue", "takeBreakeDamageValue","takeDamageValue"}) do
        cls[name] = returnDamage
    end

    function cls:start(unit)
        self.gameUnit = unit;
        return 1;
    end

    function cls:startWave(unit)
        -- for i = 0,7 do
        --     local teamUnit = unit:getTeam():getTeamUnit(i,true);
        --     if teamUnit ~= nil then  
        --         local baseHP = teamUnit:getCalcHPMAX();      
        --         if unit:getParameter(teamUnit:getIndex().."") == "" then
        --             self:initBaseHP(unit,teamUnit:getIndex(),baseHP);
        --         end                
        --     end
        -- end
        return 1;
    end

    function cls:runRelize(unit)
        local controll = unit:isMyunit() or unit:getisPlayer() == false;
        if controll then
            local index = nil;
            for i = 0,7 do
                local teamUnit = unit:getTeam():getTeamUnit(i,true);
                if teamUnit ~= nil then
                    
                    
                    local controll = teamUnit:isMyunit() or teamUnit:getisPlayer() == false;
                    if teamUnit:getHP() <= 0 then

                        index = i;
                        
                        break;
                        
                    end
                end
            end
            if index ~= nil then
                self:relize(unit,index);
                megast.Battle:getInstance():sendEventToLua(self.uniqueID,1,index);
            end
        end
        return 1;
    end

    function cls:relize(unit,index)
        local teamUnit = unit:getTeam():getTeamUnit(index,true);
        
        if teamUnit ~= nil then
            local controll = teamUnit:isMyunit() or unit:getisPlayer() == false;    
            local counter = 1;

            if teamUnit:getParameter("archeCount") ~= "" then
                counter = tonumber(teamUnit:getParameter("archeCount")) + 1;
            end
            teamUnit:setParameter("archeCount",counter.."");
            if teamUnit ~= unit then
                if teamUnit:getParent() then
                    teamUnit:removeFromParent();
                end
                teamUnit:setBurstPoint(100);
                local cond = teamUnit:getTeamUnitCondition():findConditionWithID(100131);
                if cond ~= nil then
                    cond:setValue(-20*counter);
                else
                    local cond = teamUnit:getTeamUnitCondition():addCondition(100131,2,-20,9999,2);
                    cond:setIsPassive(true);
                end
                teamUnit:getTeamUnitCondition():addCondition(-1,98,9999999,2,0);
                if controll then
                    unit:getTeam():reviveUnit(teamUnit:getIndex());  
                    --teamUnit:setHP(teamUnit:getCalcHPMAX() * 0.3);     
                end
                megast.Battle:getInstance():updateConditionView();
            end
        end
        return 1;
    end

    function cls:initBaseHP(unit,unitIndex,hp)
        unit:setParameter(unitIndex.."",hp.."");
        return 1;
    end



    function cls:run(unit,str)
        if str == "runRelize" then self:runRelize(unit) end
        return 1;
    end

    function cls:receive1(intparam)
        self:relize(self.gameUnit,intparam);
        return 1;
    end
    

    register.regist(cls, id, cls.param.version)
    return 1
end

