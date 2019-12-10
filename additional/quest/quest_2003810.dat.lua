--[[
    クエストに紐づくスクリプト
    メリアイベント　quest5    
  ]]
    
--初期化
function quest_init()
    print("init");
    skilltimer = 20;
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
function quest_takeIn(wave,unit)
 
    print("Lua:takeIn");
    return 1;
end

--バトルのセットアップ時
function questStart()
    print("Lua:questStart");
    addGuest();
    
    return 1;
end


function addGuest()
    local unit = megast.Battle:getInstance():getPlayerTeam():addTeamUnit(101076511,5,4);--覚醒メリア
    unit:setEvolutionStage(3);
    unit:setBaseHP(100000);
    unit:setHP(100000);
    unit:setPosition(30,20);
    unit:setDefaultPosition(30,20);
    unit:setBasePower(500);
    unit:takeIn();
    return 1;
end

function runGuestSkill()
    if skilltimer <= 0 then
        skilltimer = 30;
        megast.Battle:getInstance():getPlayerTeam():getTeamUnit(4):takeSkillWithCutin(3,1);
    end
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
function quest_update(wave , delta ,time)
    
    if skilltimer < 0 then
        runGuestSkill();
    end
    skilltimer = skilltimer - delta;
    
    return 1;
end

function waveRestart()

    return 1;
end

--ユニットが倒れた時
function deadUnit(wave , unit)

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

function quest_castItem(index, itemNo, targetIndex)
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
