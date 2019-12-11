------
-- 汎用ユーティリティモジュール
------
local table = table
local unpack = unpack

local Color = require("summoner.Color")

local BattleControl = BattleControl
local megast = megast

local _NAME = "summoner.Utility"
local _M = {}
local _G = _G

------
-- ユニットの残りHPの割合を返す
-- 最小は0、最大は1
-- @param Unit unit
-- @return number
------
function _M.getUnitHealthRate(unit)
   return unit:getHP()/unit:getCalcHPMAX()
end

------
-- ユニットのバフ、デバフを返す
-- @param Unit unit
-- @param number id
-- @return Condition
------
function _M.getUnitBuffByID(unit, id)
    return unit:getTeamUnitCondition():findConditionWithID(id)
end

------
-- ユニットのバフ、デバフを返す
-- @param Unit unit
-- @param number type_
-- @return Condition
------
function _M.getUnitBuffByType(unit, type_)
    return unit:getTeamUnitCondition():findConditionWithType(type_)
end

------
-- ユニットのバフ、デバフを削除する
-- @param Unit unit
-- @param number id
-- @return boolean
------
function _M.removeUnitBuffByID(unit, id)
    local buff = unit:getTeamUnitCondition():findConditionWithID(id)
    if buff ~= nil then
        unit:getTeamUnitCondition():removeCondition(buff)
        return true
    end
    return false
end

------
-- ユニットのバフ、デバフを削除する
-- @param Unit unit
-- @param number type_
-- @return boolean
------
function _M.removeUnitBuffByType(unit, type_)
    local buff = unit:getTeamUnitCondition():findConditionWithType(type_)
    if buff ~= nil then
        unit:getTeamUnitCondition():removeCondition(buff)
        return true
    end
    return false
end

------
-- パーティ、または敵ユニットからコールバック関数が真を返すユニットのリストを返す
-- @param function callback
-- @param boolean(optional, true) isPlayerSide
-- @param number(optional, 3 or 6) lastIndex
-- @return list of Unit
------
function _M.findUnitsByCallBack(callback, isPlayerSide, lastIndex)
    if isPlayerSide == nil then
        isPlayerSide = true
    end
    if lastIndex == nil then
        if isPlayerSide then
            lastIndex = 3
        else
            lastIndex = 6
        end
    end
    local units = megast.Battle:getInstance():getTeam(isPlayerSide)
    local found = {}
    for index = 0, lastIndex do
        local unit = units:getTeamUnit(index)
        if unit ~= nil and callback(unit, index) then
            table.insert(found, unit)
        end
    end
    return unpack(found)
end

------
-- プレイヤー側にメッセージを表示する
-- @param string text
-- @param number(optional, 5) time
-- @param summoner.Color(optional, summoner.Color.white) color
-- @param number(optional) icon
------
function _M.messageByPlayer(text, time, color, icon)
    if time == nil then
        time = 5
    end
    if color == nil then
        color = Color.white
    end
    if icon == nil then
        BattleControl:get():pushInfomation(text, color.r, color.g, color.b, time)
    else
        BattleControl:get():pushInfomationWithConditionIcon(text, icon, color.r, color.g, color.b, time)
    end
end

------
-- 敵側にメッセージを表示する
-- @param string text
-- @param number(optional, 5) time
-- @param summoner.Color(optional, summoner.Color.white) color
-- @param number(optional) icon
------
function _M.messageByEnemy(text, time, color, icon)
    if time == nil then
        time = 5
    end
    if color == nil then
        color = Color.white
    end
    if icon == nil then
        BattleControl:get():pushEnemyInfomation(text, color.r, color.g, color.b, time)
    else
        BattleControl:get():pushEnemyInfomationWithConditionIcon(text, icon, color.r, color.g, color.b, time)
    end
end

_G.package.loaded[_NAME] = _M
return _M
