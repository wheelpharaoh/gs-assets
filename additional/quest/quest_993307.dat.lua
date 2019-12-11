--[[
    クエストに紐づくスクリプト
    
  ]]
    
--初期化
function init()
    print("init");

    return 1;
end

--プレイヤーのチームの初期化
function initPlayerTeam(team)
    print("initPlayerTeam");
    
    return 1;
end

--エネミーのチームの初期化
function initEnemyTeam(team, wave)
    print("initEnemyTeam");

    return 1;
end

--ユニットが生成された時
function takeIn(wave,unit)
    print("Lua:takeIn");
    
    return 1;
end

--バトルのセットアップ時
function questStart()
    print("Lua:questStart");
    
    return 1;
end

--戦闘開始の準備ができた時
function battleReady(wave)
    print("Lua:battleReady");
    
    return 1;
end

--戦闘の開始命令 注意 return 0している限り毎フレーム呼ばれます。
function waveRun(wave)
    return 1;
end

--戦闘中のupdate
function update(wave , delta ,time)
    
    return 1;
end

--ユニットが倒れた時
function deadUnit(wave , unit)
    if wave == megast.Battle:getInstance():getWaveMax() then
        if unit:getEnemyID() == 500111539 then
            dragon500111539_index = unit:getIndex();
            --ドラゴンはしばらくしたら消す
            BattleControl:get():callLuaMethod(993307,"fadeoutDragon" , 4);
       end
    end
    
    return 1;
end

function fadeoutDragon()
    local boss = megast.Battle:getInstance():getEnemyTeam():getTeamUnit(dragon500111539_index,true);
    BattleControl:get():callLuaMethod(993307,"removeDragon" , 2);
    boss:runAction(cc.FadeOut:create(2));
    return 1;
end

function removeDragon()
    local boss = megast.Battle:getInstance():getEnemyTeam():removeUnit(dragon500111539_index);
    return 1;
end

--戦闘が終了した時
function waveEnd(wave,iswin)
    
    return 1;
end

--画面タッチ時
function onTouchBegan()
    
    return 1;
end

--画面タッチ終了時
function onTouchEnded(x , y)
    
    return 1;
end

--スキルボタンのタッチ終了時
function onTouchSkillEnded(index,isBurst)

    return 1;
end

--アイテムボタンタッチ時
function onTouchItem(index,itemIndex)
    
    return 1;
end

--ユニットのスキル発動時
function useSkill(index, isBurst)

    return 1;
end

function castItem(index, itemNo, targetIndex)
    print("Lua:castItem ".. index .. "," .. itemNo);
    
    return 1;
end

--シナリオのイベントコールバック
function scenarioOnButtonCallback(event)

    return 1;
end

--シナリオの終了時コールバック
function scenarioEndCallback(event)

    return 1;
end
