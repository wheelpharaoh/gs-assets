--[[
    スキル効果に紐づくスクリプト
    
    getTeamUnitCondition():getDamageAffectInfo()
    int otherElementType;
    int otherAttribute;
    int skillAttribute;
    int skillElementType;
    int distance;
    bool critical;
    TeamUnit* other;
  ]]
  
--condition付与時のスクリプト。return 0で付与自体をキャンセルできる。
function addCondition(script_id,caster,target,condition,value,value1,value2,value3,value4,value5)  
    if script_id == 9 then
        local losthp =  caster:getHP() * (value1 / 100);
        if value2 == 1 then
            losthp =  caster:getCalcHPMAX() * (value1 / 100);
        end

        local result = caster:getHP() - losthp;

        --計算結果が小数点になる場合、支払い前のHPが１より大きいなら１残す
        if result <= 1 and caster:getHP() > 1 then
            result = 1;
        elseif result < 1 and caster:getHP() <= 1 then --HPが１以下の時に支払いをしようとした時は殺すがHPが負の値になられては困るので０チェック
            result = 0;
        end
        caster:setHP(result);
        return 0;
    end
      
    if script_id == 12 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end
 
    if script_id == 16 then
        local value = id_16(target, target,condition,value,value1,value2,value3);
        if value == 0 then
            return 0;
        end
        return value;
    end
    
    if script_id == 22 and value1 == 1 then
        local critical = caster:getTeamUnitCondition():getDamageAffectInfo().critical;
        if critical == false then
            return 0;
        end
        return value;
    end
    
    if script_id == 23 then
        if caster:getElementType() == value1 then
            return value;
        end  
        return 0;
    end
    
    if script_id == 24 then
        if caster:getRaceType() == value1 then
            return value;
        end  
        return 0;
    end
    
    if script_id == 26 then
        if caster:getIsLeader() then
            return value;
        end  
        return 0;
    end
    
    if script_id == 29 then
        local cond = target:getTeamUnitCondition():findConditionWithID(value1);
        if cond ~= nil then
            return 0;
        end  
        return value;
    end
    
    if script_id == 39 then
        local cond = target:getTeamUnitCondition():findConditionWithType(value1);
        if cond == nil then
            return 0;
        end  
        return value;
    end
    
    if script_id == 929 then
        local cond = target:getTeamUnitCondition():findConditionWithID(value1);
        if cond ~= nil then
            return 0;
        end  
        return value;
    end
    
    if script_id == 35 then
        if target:getBaseID3() == value1  or target:getBaseID3() == value2  or target:getBaseID3() == value3 then
            return value;
        end
        return 0;
    end
    
    if script_id == 41 then
        local cond = target:getTeamUnitCondition():findConditionWithID(value2);
        if cond ~= nil then
            local stage = cond:getValue3();
            if stage == 0 then
                 stage = 1;
            end
            stage = stage + 1;
            if stage > value1 then
                stage = value1;
            end
            if stage == value1 then
                cond:setValue(value * stage * 2);            
            else
                cond:setValue(value * stage);
            end
            cond:setValue3(stage);
            return 0;
        end  
        return value;
    end
    
    --自分以外対象
    if script_id == 46 then
        if caster == target then
            return 0;
        end
    end
    
    --交互に付与
    if script_id == 48 then
        local key = "change_buff"..tostring(value2);
        local key2 = "beforebuff"..tostring(value2);
        local before = tonumber(target:getParameter(key2));
        target:setParameter(key2, tostring(value1));  

        local countstr = target:getParameter(key);
        local cond = target:getTeamUnitCondition():findConditionWithGroupID(value2);

        if countstr == "" then
            if value1 ~= 1 then
                countstr = "3";
                target:setParameter(key,"3");  
                return 0;
            end
            countstr = "1";
            target:setParameter(key,"1");            
            return value;
        end
        local count = tonumber(countstr);   
        count = count + 1;
        if before == value1 then
            print("重複")
            count = count + 2;
        end
        target:setParameter(key,tostring(count));
        count = math.floor(count / 2);
        
        local floor = count % 2;
        
        if floor == 1 then
            --かけない
            return 0;
        else 
            --かける　
            if cond ~= nil then
                target:getTeamUnitCondition():removeCondition(cond);
            end
        end
            
        return value;
    end
     
    --竜族一時退避用
    if script_id == 50 then
        if target:getRaceType() == value1 then
            return value;
        end
        
        return 0;
    end
    
     --魔族一時退避用
    if script_id == 52 then
        if target:getRaceType() == value1 then
            return value;
        end
        
        return 0;
    end
    
    --回数制限付き重複あり
    if script_id == 61 then
        local cond = target:getTeamUnitCondition():findConditionWithGroupID(value2);
        if cond ~= nil then
            local sum = cond:getValue() + value;
            if sum >= value1 then
                sum = value1;
            end
            cond:setValue(sum);
            return 0;
        else
            return value;
        end
    end
     
     
    if script_id == 69 then
        if caster:getBaseID3() == value1 then
            return value;
        end
        return 0;
    end
     
    --ボスがブレイク中じゃないときに付与
    if script_id == 72 then
        local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();     
        if boss ~= nil and boss:getBreakPoint() <= 0 then
            return 0;
        else
            return value;
        end
    end
    
    --ボスがブレイク中のときに付与
    if script_id == 73 then
        local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();     
        if boss ~= nil and boss:getBreakPoint() <= 0 then
            return value;
        else
            return 0;
        end
    end
    
    --購読速度FIX
    if script_id == 74 then
        local rate = 1 + ((target:getTeamUnitCondition():findConditionValue(28) + value) / 100);
        target:setAnimationTimeScale(rate);
        return value;
    end
    
    --グループIDを上書き
    if script_id == 77 then
        if condition ~= nil then
            condition:setGroupID(value1);
            condition:setPriority(value2);
        end
        return value;
    end
    
    
    if script_id == 79 then
        local value = id_79(target, target,condition,value,value1,value2,value3);
        if value == 0 then
            return 0;
        end
        return value;
    end
    
    if script_id == 80 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end
    
    if script_id == 81 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end
    
    if script_id == 82 then
        if target:getRaceType() == value1 then
            return value;
        end
        return 0;
    end
    
    --ボスのブレイク値がvalue1％以下のとき付与
    if script_id == 83 then
        local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();   
        if boss == nil then
            return 0;
        end
        
        local per = boss:getBreakPoint() / boss:getBaseBreakCapacity() * 100;  
        if per <= value1 then
            return value;
        else
            return 0;
        end
    end
    
    --自分のHPが◯％〜◯％の時に付与
    if script_id == 85 then
        if (caster:getHPPercent() * 100) >= value1 and (caster:getHPPercent() * 100) <= value2 then
            return value;
        end
        return 0;
    end
    
    if script_id == 93 then
        if target:getElementType() == value1 then
            return value;
        end  
        return 0;
    end
    
    if script_id == 95 then
        local cond = target:getTeamUnitCondition():findConditionWithID(value1);
        if cond ~= nil then
            return value;
        end
        return 0;
    end
    
    --獣双槌オルトロスのFIX用
    if script_id == 1033 then
        local point = target:getBurstPoint() * value * 0.01;
        
        caster:addSP(point);
        target:setBurstPoint(target:getBurstPoint() - point);
        
        return 0;
    end

    
    if script_id == 98 or script_id == 99 then
        local israid = megast.Battle:getInstance():isRaid();
        if israid then
            return value;
        end
        return 0;
    end
    
    
    if script_id == 103 then
        local team = megast.Battle:getInstance():getTeam(not caster:getisPlayer());
        for i = 0,7 do
             local teamUnit = team:getTeamUnit(i);
             if teamUnit ~= nil then  
                    if teamUnit:getRaceType() == value1 or teamUnit:getRaceType() == value2 or teamUnit:getRaceType() == value3 then
                        return value;
                    end
             end
        end
        return 0;
    end

    if script_id == 104 then

        if (value1 == 0 or value1 == nil) and (value2 == 0 or value2 == nil) then
            return value;
        end

        if target:getElementType() == value1 or target:getElementType() == value2 then
            return value;
        end
            
        return 0;
    end
    
    if script_id == 114 then
        if target:getElementType() == value1 then
            return value;
        else
            return 0;
        end
    end
        
    if script_id == 115 then
        if target:getSexuality() == value1 then
            return value;
        else
            return 0;
        end
    end
    
    if script_id == 116 then
        local count = 0;
        for i = 0,7 do
            local teamUnit = caster:getTeam():getTeamUnit(i);
            if teamUnit ~= nil then  
                if teamUnit:getSexuality() == value1 then
                    count = count + 1;
                end
            end
        end
        value = value * count;
        return value;
    end
        
    --ニーア専用
    if script_id == 10110 then
        for i = 0,7 do
            local teamUnit = caster:getTeam():getTeamUnit(i);
            if teamUnit ~= nil then
                --HEAL_POWER_PERCENT
                local heal_power_percent = 1 + (teamUnit:getTeamUnitCondition():findConditionValue(115) / 100);
                local heal_value = (value * heal_power_percent);
                teamUnit:takeHeal(heal_value);
            end
        end
        caster:setSkillEffectEnabled(false);
        return 0;
    end
    
    if script_id == 200260029 then
        if target:getBurstPoint() > value then
            caster:addSP(value);
            target:setBurstPoint(target:getBurstPoint() - value);       
        else
            caster:addSP(target:getBurstPoint());
            target:setBurstPoint(0);       
        end
        return 0;
    end
    
    if script_id == 20182700 then
        local critical = caster:getTeamUnitCondition():getDamageAffectInfo().critical;
        if critical then
            caster:addSP(value1);
        end
        return 0;
    end
    
    if script_id == 1097 then
        local val = target:getTeamUnitCondition():findConditionValue(131);
        val = val + target:getTeamUnitCondition():findConditionValue(89);
        val = val + target:getTeamUnitCondition():findConditionValue(90);
        val = val + target:getTeamUnitCondition():findConditionValue(91);
        val = val + target:getTeamUnitCondition():findConditionValue(92);
        val = val + target:getTeamUnitCondition():findConditionValue(93);
        val = val + target:getTeamUnitCondition():findConditionValue(94);
        val = val + target:getTeamUnitCondition():findConditionValue(95);
        val = val + target:getTeamUnitCondition():findConditionValue(96);
        val = val + target:getTeamUnitCondition():findConditionValue(97);

        if val == 0 then
            return 0;
        end
    
        if target:getBurstPoint() > value then
            caster:addSP(value);
            target:setBurstPoint(target:getBurstPoint() - value);       
        else
            caster:addSP(target:getBurstPoint());
            target:setBurstPoint(0);       
        end
        return 0;
    end
        
    --アビリティ重複防止用命令
    if script_id >= 900 then
        local cond = target:getTeamUnitCondition():findConditionWithType(value3);
        if cond ~= nil and cond: getScriptID() == script_id then
        
            if value > 0 then
                if cond:getValue() < value then
                    cond:setValue(value);
                    print("効果が上書きされました")
                    return 0;
                else
                    print("効果が無視されました")
                return 0;
                end
            else
                if cond:getValue() > value then
                    cond:setValue(value);
                    print("効果が上書きされました")
                    return 0;
                else
                    print("効果が無視されました")
                return 0;
                end
            end 

        else                
        
        end
        print("効果が付与されます")
    end
    
    
    if script_id == 111 then
        local cond = target:getTeamUnitCondition():findConditionWithID(value2);
        if cond ~= nil then
            local stage = cond:getValue3();
            if stage == 0 then
                 stage = 1;
            end            
            stage = stage + 1;
            cond:setNumber(stage);
            if stage > value1 then
                stage = value1;
                cond:setNumber(10);
            end
            cond:setValue(value * stage);
            cond:setValue3(stage);
            return 0;
        end  
        return value;
    end
    
    if script_id == 113 then
        if caster == target then
            return 0;
        end
    end

    if script_id == 123 then
        if caster:getRaceType() == value1 then
            return value;
        end
        return 0;
    end

    --カテミラ専用　炎、水、樹属性のうち何種類がPT内に存在するかによって効果変動　光闇には効果なし
    if script_id == 124 then
        if target:getElementType() == kElementType_Light or target:getElementType() == kElementType_Dark then
            return 0;
        end
        return value;
    end

    if script_id == 125 then
        if caster:getElementType() == value1 or caster:getElementType() == value2 then
            return value;
        end  
        return 0;
    end

    --HPにより効果変動かつ自分以外対象
    if script_id == 128 then
        if caster == target then
            return 0;
        end
    end

    --対象のHP消費かつ自分以外
    if script_id == 134 then
        if caster == target then
            return 0;
        end
        local losthp =  target:getHP() * (value1 / 100);
        if value2 == 1 then
            losthp =  target:getCalcHPMAX() * (value1 / 100);
        end
        local result = target:getHP() - losthp;
        if result <= 0 then
            result = 1;
        end
        target:setHP(result);
    end


    if script_id == 138 then
        local cond1 = target:getTeamUnitCondition():findConditionValue(value1);
        local cond2 = target:getTeamUnitCondition():findConditionValue(value2);
        local cond3 = target:getTeamUnitCondition():findConditionValue(value3);
        local cond4 = target:getTeamUnitCondition():findConditionValue(value4);

        if cond1 > 0 and cond2 > 0 and cond3 > 0 and cond4 > 0 and target:getElementType() == value5 then     
            return value;
        end
        return 0;
    end


    if script_id == 139 then
        local losthp =  target:getHP() * (value1 / 100);
        if value2 == 1 then
            losthp =  target:getCalcHPMAX() * (value1 / 100);
        end
        local result = target:getHP() - losthp;
        --計算結果が小数点になる場合、支払い前のHPが１より大きいなら１残す
        if result <= 1 and target:getHP() > 1 then
            result = 1;
        elseif result < 1 and target:getHP() <= 1 then --HPが１以下の時に支払いをしようとした時は殺すがHPが負の値になられては困るので０チェック
            result = 0;
        end
        target:setHP(result);
    end

    if script_id == 140 then
        if target:getBaseID3() == value1  or target:getBaseID3() == value2  or target:getBaseID3() == value3 then
            return value;
        end
        return 0
    end

    --自分のHPが◯％〜◯％かつ奥義の時で行動終了時に削除
    if script_id == 141 then
        condition:setRemoveOnResetState(true);
        if (target:getHPPercent() * 100) >= value1 and (target:getHPPercent() * 100) <= value2 then
            return value;
        end
        
        return 0;
    end

    --自分のHPが◯％〜◯％　付与判定で弾くバージョン
    if script_id == 142 then
        if (target:getHPPercent() * 100) >= value1 and (target:getHPPercent() * 100) <= value2 then
            return value;
        end
        
        return 0;
    end

    --攻撃相手もしくは、攻撃してきた相手が有利属性(付与時に属性判定)かつvalue1の効果が自身にかかっている場合のみ発動
    if script_id == 144 then
        if target:getElementType() == value2 then
            return value;
        end
        return 0;
    end

    --value1属性のユニットに対して付与　HP回復量アップを強制適用
    if script_id == 145 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end

    --セティス専用
    if script_id == 146 then
        if caster == target then
            -- local cond = caster:getTeamUnitCondition():findConditionWithID(condition:getID());
            local cond = caster:getTeamUnitCondition():findConditionWithGroupID(1031);
            if cond ~= nil then
                caster:getTeamUnitCondition():removeCondition(cond);
            end
           
            local casterbuff = caster:getTeamUnitCondition():addCondition(20250702,0,90,200,0);
            casterbuff:setGroupID(1031);
            casterbuff:setPriority(200);
            
            return 0;
        end
        condition:setValue3(caster:getIndex());
        return value;
    end


    if script_id == 147 then
        local cond = target:getTeamUnitCondition():findConditionWithID(value2);
        if cond ~= nil then
            local stage = cond:getValue3();
            if stage == 0 then
                 stage = 1;
            end
            stage = stage + 1;
            if stage > value1 then
                stage = value1;
            end
            if stage == value1 then
                cond:setValue(value * stage * 2);          
            else
                cond:setValue(value * stage);
            end
            cond:setNumber(stage);
            megast.Battle:getInstance():updateConditionView();
            cond:setValue3(stage);
            return 0;
        end
        condition:setID(value2); 
        condition:setNumber(1);
        megast.Battle:getInstance():updateConditionView();
        return value;
    end

    if script_id == 150 then
        if target:getBaseID3() == value1  or target:getBaseID3() == value2  or target:getBaseID3() == value3 then
            return value;
        end
        return 0;
    end

    if script_id == 151 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end

    if script_id == 152 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end

    if script_id == 153 then
        condition:setRemoveOnResetState(true);
    end

    if script_id == 155 then
        return value;
    end

    if script_id == 156 then 
        return value;
    end

    if script_id == 158 then 
        
        local pay = value1 * target:getCalcHPMAX()/100;
        if target:getHP() < pay then
            pay = target:getHP() -1;
            target:setHP(1);
        else
            target:setHP(target:getHP() - pay);
        end
        condition:setValue(pay * value2);--一応明示的にセットしておく
        return pay * value2;
    end

    --闇フェン 専用
    --例：SP即時増加は重複関係を持たないが、２個同時装備してても片方しか発動しないようにしたい時。
    --このアビリティはクエストの開幕時以外には発動できない。（蘇生時やレイド入れ替え時は無効となる）
    if script_id == 159 then
        if megast.Battle:getInstance():getBattleState() == kBattleState_active then
            return 0;
        end
        local cond = target:getTeamUnitCondition():findConditionWithID(value1);
        if cond ~= nil then
            if cond:getValue() >= value then
                return 0;
            end
            target:getTeamUnitCondition():addCondition(value1,0,value,999999,0);
            target:setBurstPoint(target:getBurstPoint() - cond:getValue());
        else

            target:getTeamUnitCondition():addCondition(value1,0,value,999999,0);
        end

        return value;
    end

    if script_id == 160 then
        if (target:getHPPercent() * 100) >= value1 and (target:getHPPercent() * 100) <= value2 then
            return value;
        else
            return 0;
        end
    end

    if script_id == 161 then
        
        if target:getElementType() ~= value3 and value3 ~= 0 and value3 ~= nil then
            return 0;
        end

        local cond = target:getTeamUnitCondition():findConditionWithID(value2);
        if cond ~= nil then
            local stage = cond:getValue4();
            if stage == 0 then
                 stage = 1;
            end
            stage = stage + 1;
            if stage > value1 then
                stage = value1;
            end
            if stage == value1 then
                cond:setValue(value * stage); 
                cond:setNumber(10);     
            else
                cond:setValue(value * stage);
                cond:setNumber(stage);
            end
            
            megast.Battle:getInstance():updateConditionView();
            cond:setValue4(stage);
            return 0;
        end
        condition:setID(value2); 
        condition:setNumber(1);
        megast.Battle:getInstance():updateConditionView();
        return value;
    end

    if script_id == 163 then
        local team = megast.Battle:getInstance():getTeam(not caster:getisPlayer());
        
        for i = 0,7 do
             local teamUnit = team:getTeamUnit(i);
             if teamUnit ~= nil then  
                local cond = teamUnit:getTeamUnitCondition():findConditionWithType(128);
                if cond ~= nil then
                    if cond:getProtectTarget() == target:getIndex() then
                        return value;
                    end
                end 
             end
        end 
        return 0;
    end

    if script_id == 165 then
        local team = megast.Battle:getInstance():getTeam(caster:getisPlayer());
        for i = 0,7 do
             local teamUnit = team:getTeamUnit(i);
             if teamUnit ~= nil and teamUnit ~= caster then
                    if teamUnit:getRaceType() == value1 or teamUnit:getRaceType() == value2 or teamUnit:getRaceType() == value3 then
                        return value;
                    end
             end
        end
        return 0;
    end

    if script_id == 167 then
        
        if target:getElementType() ~= value3 and value3 ~= 0 and value3 ~= nil then
            return 0;
        end

        local cond = target:getTeamUnitCondition():findConditionWithID(value2);
        if cond ~= nil then
            local stage = cond:getValue5();
            if stage == 0 then
                 stage = 1;
            end
            stage = stage + 1;
            if stage > value1 then
                stage = value1;
            end
            if stage == value1 then
                cond:setValue(value * stage); 
                cond:setNumber(10);     
            else
                cond:setValue(value * stage);
                cond:setNumber(stage);
            end
            
            megast.Battle:getInstance():updateConditionView();
            cond:setValue5(stage);
            return 0;
        end
        condition:setID(value2); 
        condition:setNumber(1);
        megast.Battle:getInstance():updateConditionView();
        return value;
    end

    if script_id == 168 then
        local team = megast.Battle:getInstance():getTeam(caster:getisPlayer());


        for i = 0,7 do
            local teamUnit = team:getTeamUnit(i);
            if teamUnit ~= nil then 
                local cond = teamUnit:getTeamUnitCondition():findConditionWithGroupID(value2);
                if cond ~= nil then
                    if cond:getPriority() <= condition:getPriority() then
                        teamUnit:getTeamUnitCondition():removeCondition(cond);
                        local buff = teamUnit:getTeamUnitCondition():addCondition(value3,condition:getConditionType(),condition:getValue(),condition:getTime(),value1);
                        buff:setGroupID(value2);
                        buff:setPriority(condition:getPriority());
                    end 
                else
                    local buff = teamUnit:getTeamUnitCondition():addCondition(value3,condition:getConditionType(),condition:getValue(),condition:getTime(),value1);
                    buff:setGroupID(value2);
                    buff:setPriority(condition:getPriority());
                end
            end
        end 
        return 0;
    end

    --value1 属性に対して付与　value2属性に対して発動　物理か魔法か全部か選べる
    if script_id == 169 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end

    if script_id == 1469 then
        if target:getBaseID3() == value2 then
            return value;
        end
        return 0;
    end

    if script_id == 170 then
        local cond = target:getTeamUnitCondition():findConditionWithGroupID(value1);
        if cond ~= nil then
            return value;
        end  
        return 0;
    end

    if script_id == 173 then

        local cond = target:getTeamUnitCondition():findConditionWithID(value2);
        if cond ~= nil then
            local stage = cond:getValue5();
            if stage == 0 then
                 stage = 1;
            end
            stage = stage + 1;
            if stage > value1 then
                stage = value1;
            end
            if stage == value1 then
                cond:setValue(value * stage); 
                cond:setNumber(10);     
            else
                cond:setValue(value * stage);
                cond:setNumber(stage);
            end
            
            megast.Battle:getInstance():updateConditionView();
            cond:setValue5(stage);
            return 0;
        end
        condition:setID(value2); 
        condition:setNumber(1);
        megast.Battle:getInstance():updateConditionView();
        return value;
    end

    if script_id == 172 then
        if target:getElementType() == value1 then
            return value;
        end
        return 0;
    end

    --発動者のPTにvalue1~3族のユニットがいれば付与
    if script_id == 175 then
        local team = megast.Battle:getInstance():getTeam(caster:getisPlayer());
        for i = 0,7 do
             local teamUnit = team:getTeamUnit(i);
             if teamUnit ~= nil and teamUnit ~= caster then
                    if teamUnit:getRaceType() == value1 or teamUnit:getRaceType() == value2 or teamUnit:getRaceType() == value3 then
                        return value;
                    end
             end
        end
        return 0;
    end

    if script_id == 176 then
        if target:getRaceType() ~= value1 then
            return 0;
        end
    end

    if script_id == 177 then
        if caster:getRaceType() ~= value1 then
            return 0;
        end
    end
    
    if script_id == 178 then
        target:setDeadDropSp(value1);
    end

    if script_id == 180 then
            local val = target:getTeamUnitCondition():findConditionValue(131);
            val = val + target:getTeamUnitCondition():findConditionValue(89);
            val = val + target:getTeamUnitCondition():findConditionValue(90);
            val = val + target:getTeamUnitCondition():findConditionValue(91);
            val = val + target:getTeamUnitCondition():findConditionValue(92);
            val = val + target:getTeamUnitCondition():findConditionValue(93);
            val = val + target:getTeamUnitCondition():findConditionValue(94);
            val = val + target:getTeamUnitCondition():findConditionValue(95);
            val = val + target:getTeamUnitCondition():findConditionValue(96);
            val = val + target:getTeamUnitCondition():findConditionValue(97);

            if val == 0 then
                return 0;
            end
    end

    if script_id == 181 then

        local isControll = false;
        if caster ~= nil then
            isControll = caster:isMyunit() or (caster:getisPlayer() == false and megast.Battle:getInstance():isHost());
        end
        if not isControll then
            return 0;
        end
        local condID = caster:getParentTeamUnit():getParameter("targetID");
        condID = tonumber(condID);
        if condID ~= value1 then
            return 0;
        end
        condition:setValue2(caster:getParentTeamUnit():getIndex());
        -- local weaponBuff = caster:getParentTeamUnit():getTeamUnitCondition():findConditionWithID(50225400);
        -- if weaponBuff ~= nil then

        --     condition:setTime(condition:getTime() + 20000000);
        -- end
    end

    if script_id == 182 then
        local cond = target:getTeamUnitCondition():findConditionWithType(value1);
        if cond ~= nil then
            return value;
        end

        if value2 == 0 then
            return 0;
        end
        local cond2 = target:getTeamUnitCondition():findConditionWithType(value2);
        if cond2 ~= nil then
            return value;
        end
        return 0;
    end

    if script_id == 183 then
        condition:setRemoveOnResetState(true);
    end

    if script_id == 184 then
        local cnt = 0;
        local team = megast.Battle:getInstance():getTeam(not caster:getisPlayer());
        

        for i = 0 , 7 do
           local uni = team:getTeamUnit(i);
           if uni ~= nil then
               cnt = cnt + 1;
           end
        end
        if cnt > value1 then
            cnt = value1;
        end
        condition:setValue3(cnt);

    end

    --相手がブレイク中
    if script_id == 185 then
        if target:getBreakPoint() > 0 then
            return 0;
        end
    end

    if script_id == 2094 then

        --相手PTにブレイク中のvalue1サイズのユニットがいれば付与
        
        local team = megast.Battle:getInstance():getTeam(not caster:getisPlayer());
        for i = 0,7 do
             local teamUnit = team:getTeamUnit(i);
             if teamUnit ~= nil and teamUnit ~= caster then
                    if teamUnit:getBreakPoint() <= 0 and teamUnit:getSize() == value1 then
                        return value;
                    end
             end
        end
        return 0;
        
    end

    if script_id == 186 then

        if caster == nil then
            return value;
        end
        if caster:getParentTeamUnit() == nil then
            return value;
        end
        local cond = caster:getParentTeamUnit():getTeamUnitCondition():findConditionWithID(value1);
        if cond == nil then
            
            local cond2 = caster:getParentTeamUnit():getTeamUnitCondition():addCondition(value1,129,1,9999,0);
            cond2:setScriptID(187);
            cond2:setValue1(value1);
            cond2:setValue2(value2);
            cond2:setValue3(condition:getID());
            cond2:setValue4(0);
            cond2:setValue5(megast.Battle:getInstance().m_wave);
        end

    end

        
    return value;
end



--condition付与成功失敗の判断が出来る。
--isSuccessful が true で 成功。 isSuccessful が false で失敗。 基本的に 成功しても失敗しても通る。
-- return する 値によって、クライアント側でなにかするということはない
function isSuccessfulCondition(script_id,caster,target,condition,value,value1,value2,value3,value4,value5,isSuccessful)

    if script_id == 155 and isSuccessful then
        local cond = target:getTeamUnitCondition():findConditionWithGroupID(value5);
        if cond ~= nil then
            if cond:getPriority() > value2 then
                return value;
            end
            target:getTeamUnitCondition():removeCondition(cond);
        end

        local buff = target:getTeamUnitCondition():addCondition(value1,21,value2,value3,value4);
        buff:setGroupID(value5);
        buff:setPriority(value2);
    end

    if script_id == 156 and isSuccessful then
        local cond = target:getTeamUnitCondition():findConditionWithGroupID(value5);
        if cond ~= nil then
            if cond:getPriority() > value2 then
                return value;
            end
            target:getTeamUnitCondition():removeCondition(cond);
        end

        local buff = target:getTeamUnitCondition():addCondition(value1,21,value2,value3,value4);
        buff:setScriptID(3);
        buff:setGroupID(value5);
        buff:setPriority(value2);
    end


    if script_id == 157 then

        if isSuccessful then

            --１度の行動中に何回も出ないようにする場合　コンディションを付与しておいて見つけたら拒否る
            local cond = caster:getTeamUnitCondition():findConditionWithID(value1);
            if cond ~= nil then
                return value;
            end

            if value3 == 1 then
                local buff = caster:getTeamUnitCondition():addCondition(value1,0,1,999,0);
                buff:setRemoveOnResetState(true);
            end

            --===============================================================================
            --回数制限

            local countCond = caster:getTeamUnitCondition():findConditionWithID(157);
            if value4 ~= 0 then
                if countCond ~= nil then
                    local count = countCond:getValue3();
                    if count >= value4 then
                        caster:getTeamUnitCondition():removeCondition(countCond);
                        return value;
                    else
                        countCond:setValue3(count + 1);
                        countCond:setValue2(1);
                    end
                end
            end

            if value4 ~= 0 and countCond == nil then
                local countBuff = caster:getTeamUnitCondition():addCondition(157,0,1,9999,0);
                countBuff:setValue3(1);
                countBuff:setValue2(1);
            end
            --===============================================================================

            caster:addSP(value2);
        else
            --外した場合　回数制限リセット
            local countCond = caster:getTeamUnitCondition():findConditionWithID(157);
            if value4 ~= 0 then
                if countCond ~= nil then
                    caster:getTeamUnitCondition():removeCondition(countCond);
                    return 0;
                    
                end
            end
        end
    end

    if script_id == 162 and isSuccessful then
        local cond = target:getTeamUnitCondition():findConditionWithGroupID(value5);
        if cond ~= nil then
            if cond:getPriority() > value2 then
                return value;
            end
            target:getTeamUnitCondition():removeCondition(cond);
        end

        local buff = target:getTeamUnitCondition():addCondition(value1,21,value2,value3,value4);
        buff:setScriptID(4);
        buff:setGroupID(value5);
        buff:setPriority(value2);
    end

    if script_id == 181 then

        local weaponBuff = caster:getParentTeamUnit():getTeamUnitCondition():findConditionWithID(50225400);
        if weaponBuff ~= nil then

            condition:setTime(condition:getTime() + 2);
        end
        return value;
    end

    -- if script_id == 186 then

    --     if caster ~= nil then
    --         if isSuccessful then

    --             local buff = caster:getParentTeamUnit():getTeamUnitCondition():findConditionWithID(value1);
    --             buff:setValue4(1);
    --         end    
    --     end
        
    -- end

    return 0;
end



function id_900(unit,other,condition,value,value1,value2,value3)
    return value;
end
      
--対象のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量]
function id_1(unit,other,condition,value,value1,value2,value3)
    if other == null then
        return value;
    end
    
    local per =  other:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end


    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--受けるダメージが物理のとき
function id_902(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 1 then
        return value;
    end
    
    return 0;
end

--受けるダメージが魔法のとき
function id_903(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 2 then
        return value;
    end
    
    return 0;
end

--特定の属性（相手）
function id_914(unit,other,condition,value,value1,value2,value3)
    if other:getElementType() == value1 then
        return value;
    end    
    return 0;
end

--自分のHPが◯％〜◯％の時
function id_921(unit,other,condition,value,value1,value2,value3)
    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 then
        return value;
    end
    
    return 0;
end

-- 
function id_929(unit,other,condition,value,value1,value2,value3)

    return value;
end


--受けるダメージが物理のとき
function id_2(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 1 then
        return value;
    end
    
    return 0;
end

--受けるダメージが魔法のとき
function id_3(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 2 then
        return value;
    end
    
    return 0;
end

--物理攻撃の時
function id_4(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 1 then
        return value;
    end
    
    return 0;
end

--魔法攻撃の時
function id_5(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 2 then
        return value;
    end
    
    return 0;
end

--自分のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量]
function id_6(unit,other,condition,value,value1,value2,value3,value4)
    if unit == nil then
        return value;
    end
    local skill = unit:getActiveBattleSkill();
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value4 ~= 0 and value4 ~= type and value4 ~= 7 then
        return 0;
    end 
    
    if skill == nil and value4 == 7 then
        return 0;
    end

    if value4 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    
    local per =  unit:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--スキル・奥義中のみ
function id_8(unit,other,condition,value,value1,value2,value3)
    condition:setRemoveOnResetState(true);
    local skill = unit:getActiveBattleSkill();

    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value1 ~= 0 and value1 ~= type and value1 ~= 7 then
        return 0;
    end 

    if skill == nil and value1 == 7 then
        return 0;
    end
    
    if value1 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
    return value;
end


--自身のHP割合消費で味方回復
function id_9(unit,other,condition,value,value1,value2,value3)
    return value;
end

--次に使用するスキルに効果
function id_10(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if type == 1 then
        condition:setRemoveOnResetState(true);
        return value;
    end    
    return 0;
end

--通常攻撃のみ
function id_11(unit,other,condition,value,value1,value2,value3)
    if unit:getUnitState() == kUnitState_attack then
        return value;
    end    
    return 0;
end

--特定の属性（自分）
function id_12(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;    
    if value2 ~= 0 and type ~= value2 then
        return 0;
    end

    if unit:getElementType() == value1 then
        return value;
    end    
    return 0;
end

--エンチャント
function id_13(unit,other,condition,value,value1,value2,value3)

    return value;
end

--特定の属性（相手）
function id_14(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 

    if skill == nil and value2 == 7 then
        return 0;
    end
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    if other:getElementType() == value1 then
        return value;
    end    
    return 0;
end

--攻撃装備
function id_15(unit,other,condition,value,value1,value2,value3)
    return value;
end


--自分が◯族だったら
function id_16(unit,other,condition,value,value1,value2,value3)
    if unit:getRaceType() == value1 or unit:getRaceType() == value2 or unit:getRaceType() == value3 then
        return value;
    end
    
    return 0;
end

--相手が◯族だったら
function id_17(unit,other,condition,value,value1,value2,value3)
    if other:getRaceType() == value1 then
        return value;
    end
    
    return 0;
end

--自分が◯状態だったら
function id_18(unit,other,condition,value,value1,value2,value3)
    local cond = unit:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil then
        return value;
    end

    if value2 == 0 then
        return 0;
    end
    local cond2 = unit:getTeamUnitCondition():findConditionWithType(value2);
    if cond2 ~= nil then
        return value;
    end
    
    return 0;
end

--相手が◯状態だったら
function id_19(unit,other,condition,value,value1,value2,value3)
    local cond = other:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil then
        return value;
    end
    if value2 == 0 then
        return 0;
    end
    local cond2 = unit:getTeamUnitCondition():findConditionWithType(value2);
    if cond2 ~= nil then
        return value;
    end
    
    return 0;
end

--相手がブレイク状態
function id_20(unit,other,condition,value,value1,value2,value3)
    if other:getBreakPoint() <= 0 then
        return value;
    end
    
    return 0;
end

--自分のHPが◯％〜◯％の時
function id_21(unit,other,condition,value,value1,value2,value3)
    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 then
        return value;
    end
    
    return 0;
end

--クリティカル発動時
function id_22(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
    if value1 == 1 then
        return value;
    end

    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 

    if skill == nil and value2 == 7 then
        return 0;
    end
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical then
        return value;
    end
    
    return 0;
end

--クリティカル発動時(カティロ用)
function id_1022(unit,other,condition,value,value1,value2,value3)
    condition:setRemoveOnResetState(true);
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical and unit:getUnitState() == kUnitState_skill then
        return value;
    end
    
    return 0;
end

--特定の属性(使用者)
function id_23(unit,other,condition,value,value1,value2,value3)

    return value;
end

--特定の種族(使用者)
function id_24(unit,other,condition,value,value1,value2,value3)
    --addconditionでも判定
    if unit:getRaceType() ~= value1 then
         return 0;
    end  
    return value;
end

--属性の上書き
function id_25(unit,other,condition,value,value1,value2,value3)
    unit:getTeamUnitCondition():getActiveBattleSkill():setElementType(value1);
    return value;
end

--効果発動者がリーダー
function id_26(unit,other,condition,value,value1,value2,value3)
    if not unit:getIsLeader() then
         return 0;
    end  
    return value;
end

--攻撃相手もしくは、攻撃してきた相手が有利属性
function id_27(unit,other,condition,value,value1,value2,value3)
    local element = other:getTeamUnitCondition():getDamageAffectInfo().skillElementType;

    if other:getElementType() == 1 and element == 2 then
        return value;
    end
    
    if other:getElementType() == 2 and element == 3 then
        return value;
    end
    
    if other:getElementType() == 3 and element == 1 then
        return value;
    end
    
    if other:getElementType() == 4 and element == 5 then
        return value;
    end
    
    if other:getElementType() == 5 and element == 4 then
        return value;
    end

    return 0;
end

--攻撃相手もしくは、攻撃してきた相手が不利属性
function id_28(unit,other,condition,value,value1,value2,value3)
    local element = other:getTeamUnitCondition():getDamageAffectInfo().skillElementType;

    if unit:getElementType() == 1 and element == 2 then
        return value;
    end
    
    if unit:getElementType() == 2 and element == 3 then
        return value;
    end
    
    if unit:getElementType() == 3 and element == 1 then
        return value;
    end
    
    if unit:getElementType() == 4 and element == 5 then
        return value;
    end
    
    if unit:getElementType() == 5 and element == 4 then
        return value;
    end
    
    return 0;
end

-- 
function id_29(unit,other,condition,value,value1,value2,value3)

    return value;
end


-- 被ダメージ時消費（バリア用）
function id_30(unit,other,condition,value,value1,value2,value3)
    return value;
end

--対象のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量]
function id_31(unit,other,condition,value,value1,value2,value3)
    if other == null then
        return value;
    end
    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if not (skill:getSkillType() == 1 or skill:getSkillType() == 2) then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
    condition:setRemoveOnResetState(true);

    local per =  other:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end
       print(per);
       print(rate); 
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--自分のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量]
function id_32(unit,other,condition,value,value1,value2,value3)
    if unit == null then
        return value;
    end
    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if not (skill:getSkillType() == 1 or skill:getSkillType() == 2) then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
    condition:setRemoveOnResetState(true);

    local per =  unit:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end
       print(per);
       print(rate);
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--受けたダメージに対する割合
function id_33(unit,other,condition,value,value1,value2,value3)
    local power = other:getCalcPower();
    local skill  = other:getActiveBattleSkill();
    local animRate = other:getAnimationDamageRateSum();
    if animRate > 50 then
        animRate = 50;
    end
    local dealdamage = 0;
    local cond = other:getTeamUnitCondition():findConditionValue(17);
    if cond ~= 0 then
        dealdamage = (cond / 100);
    end
            
    if skill ~= nil then
        power = skill:getDamageRate() * power;
    end
    if dealdamage > 0 then
        power =  power + (power * dealdamage);
    end
    power = power / animRate;
    
    return value + (power * value1 / 100)
end

--相手が奥義発動中
function id_34(unit,other,condition,value,value1,value2,value3)
    local team = megast.Battle:getInstance():getTeam(not unit:getisPlayer());
    condition:setRemoveOnResetState(true);

    for i = 0 , team:getIndexMax() do
       local target = team:getTeamUnit(i);
       if target ~= nil then
           if target:getBurstState() == kBurstState_active then
               return value;
           end
       end
    end

    return 0;
end

--特定のユニット
function id_35(unit,other,condition,value,value1,value2,value3)
    if unit:getBaseID3() == value1  or unit:getBaseID3() == value2  or unit:getBaseID3() == value3 then
        return value;
    end
    return 0;
end

--効果対象が◯状態かつスキル・奥義のみ
function id_36(unit,other,condition,value,value1,value2,value3)    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if not (skill:getSkillType() == 1 or skill:getSkillType() == 2) then
        return 0;
    end
    
    if skill:getSkillType() ~= value2 then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
    condition:setRemoveOnResetState(true);

    local cond = unit:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil then
        return value;
    end
    
    return 0;
end

--スキル・奥義のみ
function id_37(unit,other,condition,value,value1,value2,value3)    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if not (skill:getSkillType() == 1 or skill:getSkillType() == 2) then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
   return value;
end

--攻撃力依存
function id_38(unit,other,condition,value,value1,value2,value3)    
    local v = unit:getCalcPower() * 10;
    v = v * value1 / 100;

    return value + v;    
end


function id_39(unit,other,condition,value,value1,value2,value3)    
    return value; 
end

--HPの割合千分率
function id_40(unit,other,condition,value,value1,value2,value3)    
    local v = unit:getHP() * value1
    v = v / 1000;
    v = v + value;
    if v > value2 then
        v = value2;
    end

    return v;    
end

--段階的に効果アップ
function id_41(unit,other,condition,value,value1,value2,value3)   
    condition:setID(value2); 
    return value;    
end

--攻撃相手が◯状態かつスキル・奥義のみ
function id_42(unit,other,condition,value,value1,value2,value3)    
    if value2 ~= 0 then
        condition:setRemoveOnResetState(true);
    end

    local skill = unit:getActiveBattleSkill();
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 

    if skill == nil and value2 == 7 then
        return 0;
    end
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
    

    local cond = other:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil then
        return value;
    end
    
    return 0;
end

--相手の誰かが◯状態
function id_43(unit,other,condition,value,value1,value2,value3)
    local team = megast.Battle:getInstance():getTeam(not unit:getisPlayer());
    condition:setRemoveOnResetState(true);

    for i = 0 , team:getIndexMax() do
       local target = team:getTeamUnit(i);
       if target ~= nil then
           local cond = target:getTeamUnitCondition():findConditionWithType(value1);
           if cond ~= nil then
               return value;
           end
       end
    end

    return 0;
end

--回復量修正用
function id_44(unit,other,condition,value,value1,value2,value3)
    return value;
end

--自分のHPが◯％〜◯％の時 かつ回復量修正用
function id_45(unit,other,condition,value,value1,value2,value3)
    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 then
        return value;
    end
    
    return 0;
end

--自分以外
function id_46(unit,other,condition,value,value1,value2,value3)
    return value;
end

--割合回復用
function id_47(unit,other,condition,value,value1,value2,value3)
    return other:getCalcHPMAX() * value / 100;
end

--交互に付与
function id_48(unit,other,condition,value,value1,value2,value3)
    return value;
end

function id_49(unit,other,condition,value,value1,value2,value3)
    if other:getBreakPoint() <= 0 and unit:getTeamUnitCondition():getDamageAffectInfo().skillElementType == value1 then
        return value;
    end

    return 0;
end

--竜族一時退避用
function id_50(unit,other,condition,value,value1,value2,value3)

    return value;
end

--攻撃相手のHPが◯%以下
function id_51(unit,other,condition,value,value1,value2,value3)
    local per =  other:getHPPercent() * 100;
    if per <= value1 then
        return value;
    end

    return 0;
end

--魔族が神族に攻撃した時
function id_52(unit,other,condition,value,value1,value2,value3)
   

    return value;
end

--パーティに特定のユニット
function id_53(unit,other,condition,value,value1,value2,value3)
    
    for i = 0 , 6 do
        teamunit = unit:getTeam():getTeamUnit(i);
        if teamunit ~= nil then
            if teamunit:getBaseID3() == value1 or teamunit:getBaseID3() == value2 or teamunit:getBaseID3() == value3 then
                return value;
            end
        end
    end

    return 0;
end

--物理攻撃の時
function id_54(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 1 and other:getElementType() == value1 then
        return value;
    end
   
    return 0;
end

--魔法攻撃の時
function id_55(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 2 then
        return value;
    end
    
    return 0;
end

--相手が巨大ボス
function id_56(unit,other,condition,value,value1,value2,value3)    
    if other:getSize() == 3 then
        return value;
    end
    
    return 0;
end

--奥義ゲージが最大
function id_57(unit,other,condition,value,value1,value2,value3)    
    if unit:getBurstPoint() >= 100 then
        return value;
    end
    
    return 0;
end

--奥義攻撃
function id_58(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 2 then
        return value;
    end
    
    return 0;
end

--装備攻撃
function id_59(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 3 or type == 6 then
        return value;
    end
    
    return 0;
end

--ボスブレイク中
function id_60(unit,other,condition,value,value1,value2,value3)   
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();       
    if boss ~= nil and boss:getBreakPoint() <= 0 then
        return value;
    end
    
    return 0;
end

--開封制限付き重複あり
function id_61(unit,other,condition,value,value1,value2,value3)        
    return value;
end
 
 
 --制限時間付きパッシヴ
function id_62(unit,other,condition,value,value1,value2,value3)     
    if condition:getIsPassive() == true then
        condition:setIsPassive(false);    
    end
    return value;
end

 --時間で効果上昇
function id_63(unit,other,condition,value,value1,value2,value3)     
    local time = BattleControl:get():getTime();
    if time > value1 then
        time = value1;
    end
    value = value * time / value1;
    return value;
end

--次に使用する奥義に効果
function id_64(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if type == 2 then
        condition:setRemoveOnResetState(true);
        return value;
    end    
    return 0;
end
 
 --HP以上奥義に効果
function id_65(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    local per = unit:getHPPercent() * 100;
    if type == 2 and per >= value1 then
        return value;
    end    
    return 0;
end

 --ヘイトターゲットに効果
function id_66(unit,other,condition,value,value1,value2,value3)
    local target = unit:getHateTarget();
    if target == other then
        return value;
    end    
    return 0;
end
 
 --クリティカル発動時かつエンチャント
function id_67(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical then
        return value;
    end
    
    return 0;
end
 
--相手の奥義ゲージがvalue1以下
function id_68(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    local per = other:getBurstPoint() / other:getNeedSP() * 100;
    if type == value2 and per <= value1 then
        return value;
    end    
    
    return 0;
end

function id_69(unit,other,condition,value,value1,value2,value3)
   
    return value;
end

--属性ダメージ
function id_70(unit,other,condition,value,value1,value2,value3)
    if unit:getTeamUnitCondition():getDamageAffectInfo().skillElementType == value1 then
        return value;
    end

    return 0;
end

--相手が○状態かつ、その効果が特定のscriptidのとき
function id_71(unit,other,condition,value,value1,value2,value3)
    local cond = other:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil and cond:getScriptID() == value2 then
         return value;
    end  

    return 0;
end

--ボスがブレイク中じゃないときに付与
function id_72(unit,other,condition,value,value1,value2,value3)
    return value;
end

--ボスがブレイク中のときに付与
function id_73(unit,other,condition,value,value1,value2,value3)
    return value;
end

--行動速度FIX
function id_74(unit,other,condition,value,value1,value2,value3)
    return value;
end

--自身がブレイク
function id_75(unit,other,condition,value,value1,value2,value3)   
    if unit:getBreakPoint() <= 0 then
        return value;
    end
    
    return 0;
end

--スキルのみ
function id_76(unit,other,condition,value,value1,value2,value3)   
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 1 then
        return value;
    end
    
    return 0;
end

--グループIDを上書き
function id_77(unit,other,condition,value,value1,value2,value3)   
    condition:setGroupID(value1);
    return value;
end

--特定の属性以外
function id_79(unit,other,condition,value,value1,value2,value3)
    if unit:getElementType() ~= value1 then
        return value;
    end    
    return 0;
end

--覚醒ロイの絶氷判断用 (覚醒ロイのユニットID)
function id_101036211(unit,other,condition,value,value1,value2,value3)
    return 1;
end

--奥義ゲージ自然減少FIX
function id_1043(unit,other,condition,value,value1,value2,value3)
    unit:setBurstPoint(unit:getBurstPoint() + value);
    if unit:getBurstPoint() < 0 then
        unit:setBurstPoint(0);
    end
    return 0;
end
 
--効果対象が◯属性かつクリティカル
function id_80(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if unit:getElementType() == value1 and critical == true then
        return value;
    end    
    return 0;
end

--効果対象が◯属性かつ受けた攻撃が奥義
function id_81(unit,other,condition,value,value1,value2,value3)
    if other:getBurstState() ~= kBurstState_active then
         return 0;
    end
    
    if unit:getElementType() == value1 then
        return value;
    end    
    return 0;
end

--１回だけ発動 かつValue1族
function id_82(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    condition:setRemoveOnResetState(true);
    return value;
end

--ボスのブレイク値がvalue1％以下
function id_83(unit,other,condition,value,value1,value2,value3)

    return value;
end

--特定のIndexの相手に対してかつ奥義のとき
function id_84(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if type == 2 and other:getIndex() == value1 then
        condition:setRemoveOnResetState(true);
        return value;
    end    
    return 0;
end
 
--自分のHPが◯％〜◯％の時に付与
function id_85(unit,other,condition,value,value1,value2,value3)   
    return value;
end
 

--ボスのHPがvalue1％以下のとき
function id_86(unit,other,condition,value,value1,value2,value3)   
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();  
    if boss == nil then
        return 0;
    end   
    local per = boss:getHPPercent() * 100;
    if per <= value1 then
        return value;
    else
        return 0;
    end
end

 
--特定のユニットかつ、クリティカル発生時
function id_2235(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical == false then
        return 0;
    end

    if unit:getBaseID3() ~= value1 then
        return 0;
    end

    if value2 == nil then
        return value;
    end

    local skill = unit:getActiveBattleSkill();

    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 

    if skill == nil and value2 == 7 then
        return 0;
    end
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    return value;
end
 
--相手がブレイク中かつクリティカル発生時
function id_2022(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical == false then
        return 0;
    end

    if other:getBreakPoint() > 0 then
        return 0;
    end
    return value;
end

--自分がブレイク中かつ被クリティカル発生時
function id_2023(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical == false then
        return 0;
    end

    if unit:getBreakPoint() > 0 then
        return 0;
    end
    return value;
end

--相手がブレイク時かつスキル・奥義中のみ
function id_2024(unit,other,condition,value,value1,value2,value3)
    condition:setRemoveOnResetState(true);
    if other:getBreakPoint() > 0 then
        return 0;
    end
    local skill = unit:getActiveBattleSkill();

    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value1 ~= 0 and value1 ~= type and value1 ~= 7 then
        return 0;
    end 

    if skill == nil and value1 == 7 then
        return 0;
    end
    
    if value1 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
    return value;
end

--ブレイク中かつサイズがvalue1の相手がいる時に付与
function id_2094(unit,other,condition,value,value1,value2,value3)
    
    return value;
end

--リアンのコンボカウント用
function id_10179(unit,other,condition,value,value1,value2,value3)
    if value1 == 0 then

        local param = 0;
    
        for i = 0,7 do
           local teamUnit = unit:getTeam():getTeamUnit(i);
           if teamUnit ~= nil then  
                local tmp = teamUnit:getParameter("hitCounter");
                if tmp ~= "" then
                    tmp = tonumber(tmp);
                        if tmp > param then
                        param = tmp;
                    end
                end
           end
        end
    
        if param >= 99 then
            return value;
        else
            return param * (value / 100) ;
        end
    elseif value1 == 1 then
        local count = unit:getParameter("hitCounter");
        if count ~= "" then
            count = tonumber(count) + 1;
            if count >= 99 then
                return value;
            else
                return value * count / 100  ;
            end
        else
            return 0;
        end        
    end
end

--特定のユニットかつHP以下
function id_87(unit,other,condition,value,value1,value2,value3)
    local per =  unit:getHPPercent() * 100;
    if unit:getBaseID3() == value1 and per <= value2 then
        return value;
    end
    return 0;
end

--ボスがブレイク中かつ奥義のとき
function id_88(unit,other,condition,value,value1,value2,value3)
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();       
    if boss == nil or boss:getBreakPoint() > 0 then
        return 0;
    end

    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if type == 2 then
        return value;
    end    
    return 0;
end
 
--value1属性かつ、HPで効果変動
function id_89(unit,other,condition,value,value1,value2,value3)
    if unit:getElementType() ~= value1 then
        return 0;
    end 

    local per =  unit:getHPPercent() * 100;
    local _per = per - value2;
    local rate = _per / (value3 - value2);
    if rate > 1 then
        rate = 1;
    end
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate;
    return value;
end

--value1属性かつ、奥義に一回だけ
function id_90(unit,other,condition,value,value1,value2,value3)
    if other:getElementType() ~= value1 then
        return 0;
    end 
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if type == 2 then
        condition:setRemoveOnResetState(true);
        return value;
    end   
    return 0;
end

--HPが1以上あるとき
function id_91(unit,other,condition,value,value1,value2,value3)
    if unit:getHP() >= 1 then
        return value;
    end  
    return 0;
end

--HP回復量アップを強制適用
function id_92(unit,other,condition,value,value1,value2,value3)
    local rate = 1 + unit:getTeamUnitCondition():findConditionValue(110) / 100;
    value = value * rate
    
    if unit:getHP() >= 1 then
        return value;
    end  
    
    return 0;
end

--value1属性に対して付与、かつ有利属性に対して発動
function id_93(unit,other,condition,value,value1,value2,value3)
    local element = other:getTeamUnitCondition():getDamageAffectInfo().skillElementType;

    if other:getElementType() == 1 and element == 2 then
        return value;
    end
    
    if other:getElementType() == 2 and element == 3 then
        return value;
    end
    
    if other:getElementType() == 3 and element == 1 then
        return value;
    end
    
    if other:getElementType() == 4 and element == 5 then
        return value;
    end
    
    if other:getElementType() == 5 and element == 4 then
        return value;
    end

    return 0;
end

--大型ボスでかつ、装備ダメージ
function id_94(unit,other,condition,value,value1,value2,value3)
    if other:getSize() ~= 3 then
        return 0;
    end
    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 3 or type == 6 then
        return value;
    end
    
    return 0;
end

--value1のIDをもつ効果が付与されているとき付与
function id_95(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
    
    if value3 == 1 then
        condition:setRemoveOnResetState(true);
    end

    return value;
end

--ボス以外のHPがvalue1％以下のとき
function id_96(unit,other,condition,value,value1,value2,value3) 
    local isarena = megast.Battle:getInstance():isArena();
    if isarena then
        return 0;
    end
    
    -- local skill = unit:getActiveBattleSkill();
    -- if skill == nil then
    --     return 0;
    -- end
      
    -- local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    -- if value2 ~= type and value2 ~= 7 then
    --     return 0;
    -- end 
    
    -- if value2 == 7 and skill:getIndex() ~= 2 then
    --     return 0;
    -- end

    local skill = unit:getActiveBattleSkill();

    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 

    if skill == nil and value2 == 7 then
        return 0;
    end
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
      
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();  
    if boss == other then
        return 0;
    end       
    local per = other:getHPPercent() * 100;
    if per <= value1 then
        return value;
    else
        return 0;
    end
end

--相手が状態異常のとき
function id_97(unit,other,condition,value,value1,value2,value3)
    local val = other:getTeamUnitCondition():findConditionValue(131);
    val = val + other:getTeamUnitCondition():findConditionValue(89);
    val = val + other:getTeamUnitCondition():findConditionValue(90);
    val = val + other:getTeamUnitCondition():findConditionValue(91);
    val = val + other:getTeamUnitCondition():findConditionValue(92);
    val = val + other:getTeamUnitCondition():findConditionValue(93);
    val = val + other:getTeamUnitCondition():findConditionValue(94);
    val = val + other:getTeamUnitCondition():findConditionValue(95);
    val = val + other:getTeamUnitCondition():findConditionValue(96);
    val = val + other:getTeamUnitCondition():findConditionValue(97);

    if val == 0 then
        return 0;
    end
    
    return value;
end

--レイドバトルのとき付与
function id_98(unit,other,condition,value,value1,value2,value3)
    local israid = megast.Battle:getInstance():isRaid();
    if israid then
        return value;
    end
    
    return 0;
end

--レイドバトルのとき付与 装備攻撃
function id_99(unit,other,condition,value,value1,value2,value3)
    local israid = megast.Battle:getInstance():isRaid();
    if israid == false then
        return 0;
    end
    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if type == 3 or type == 6 then
        return value;
    end

    return 0;
end

--レイドバトルの場合装備ダメージをValue3に変更
function id_501(unit,other,condition,value,value1,value2,value3)
    local israid = megast.Battle:getInstance():isRaid();
    if israid then
        return value3;
    end
    
    return value;    
end

--クリティカル時に奥義アップ
function id_20182700(unit,other,condition,value,value1,value2,value3)    
    return 0;
end

--特定のユニットかつ自分が状態異常のとき
function id_100(unit,other,condition,value,value1,value2,value3)
    local val = unit:getTeamUnitCondition():findConditionValue(131);
    val = val + unit:getTeamUnitCondition():findConditionValue(89);
    val = val + unit:getTeamUnitCondition():findConditionValue(90);
    val = val + unit:getTeamUnitCondition():findConditionValue(91);
    val = val + unit:getTeamUnitCondition():findConditionValue(92);
    val = val + unit:getTeamUnitCondition():findConditionValue(93);
    val = val + unit:getTeamUnitCondition():findConditionValue(94);
    val = val + unit:getTeamUnitCondition():findConditionValue(95);
    val = val + unit:getTeamUnitCondition():findConditionValue(96);
    val = val + unit:getTeamUnitCondition():findConditionValue(97);

    if val == 0 then
        return 0;
    end

    if unit:getBaseID3() == value1 then
        return value;
    end
    
    return 0;
end

--奥義攻撃時かつ相手の種族がvalue1~3のいずれかのとき
function id_101(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type ~= 2 then
        return 0;
    end
    
    if other:getRaceType() == value1 or other:getRaceType() == value2 or other:getRaceType() == value3 then
        return value;
    end
    
    return 0;
end

--防御力依存
function id_102(unit,other,condition,value,value1,value2,value3)    
    local v = unit:getCalcDefence();
    v = v * value1 / 100;

    if v > value2 then
        v = value2;
    end

    return v;    
end

--相手パーティの誰かがValue1~3族のいずれかのとき付与
function id_103(unit,other,condition,value,value1,value2,value3)    
    if other:getRaceType() == value1 or other:getRaceType() == value2 or other:getRaceType() == value3 then
        return value;
    end
    return value;    
end

function id_104(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type ~= 2 then
        return 0;
    end 

    if unit:getElementType() == value1 or unit:getElementType() == value2 then
        return value;
    else
        return 0;
    end
end

--value1のスキルタイプにのみ発動。かつ自動削除
function id_105(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value1 ~= 0 and value1 ~= type and value1 ~= 7 then
        return 0;
    end 
    
    if value1 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
    
    if value2 == 1 then
        condition:setRemoveOnResetState(true);
    end
    
    return value;
end

--レイドバトルのとき奥義・真奥義に発動
function id_106(unit,other,condition,value,value1,value2,value3)
    local israid = megast.Battle:getInstance():isRaid();
    if israid == false then
        return 0;
    end
    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if type == 2 then
        return value;
    end   
    
    return 0;
end

--レイドボスにたいして
function id_107(unit,other,condition,value,value1,value2,value3)
    local israid = megast.Battle:getInstance():isRaid();
    if israid == false then
        return 0;
    end
    
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();     
    if other == boss then
        return value;
    end
    
    return 0;
end

--相手がvalue2or3の種族の場合装備ダメージをValue1に変更
function id_502(unit,other,condition,value,value1,value2,value3)  
    if other:getRaceType() == value1 or other:getRaceType() == value2 then
        return value3;
    end
    
    return value;
end

--相手がvalue1属性の場合装備ダメージをValue3に変更
function id_503(unit,other,condition,value,value1,value2,value3)  
    if other:getElementType() == value1 then
        return value3;
    end
    
    return value;
end


--モンハンボスに対して
function id_901(unit,other,condition,value,value1,value2,value3)
    local id = other:getBaseID3();
    if id == 40106 or id == 40107 or id == 40108 or id == 40109 or id == 40110 then
        return value;
    end
    
    return 0;    
end

--特定のユニットかつ、受ける攻撃がValue2タイプの時
function id_335(unit,other,condition,value,value1,value2,value3)
    if unit:getBaseID3() ~= value1 then
        return 0;
    end
    
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    if attribute ~= value2 then
        return 0;
    end
    
    return value;
end


--特定のユニットかつ、value2のスキルタイプの時
function id_10535(unit,other,condition,value,value1,value2,value3)
    if unit:getBaseID3() ~= value1 then
        return 0;
    end

    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value2 ~= 0 and value2 ~= type and value2 ~= 7 then
        return 0;
    end 
    
    if value2 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end
    
    return value;
end

--効果対象がvalue1族、自身が奥義・真奥義の時
function id_108(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type ~= 2 then
        return 0;
    end
    
    if unit:getRaceType() == value1 then
        return value;
    end
    
    return 0;
end

--効果対象がvalue1族、 相手が奥義・真奥義の時
function id_109(unit,other,condition,value,value1,value2,value3)
    if unit:getRaceType() ~= value1 then
        return 0;
    end

    local type = other:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 2 then
        return value;
    end
    
    --ボスの場合はスキルも対象
    if other:getParentTeamUnit() ~= nil then
        if other:getParentTeamUnit():getIsBoss() == true and type == 1 then
            return value;
        end
    else
        if other:getIsBoss() == true and type == 1 then
            return value;
        end
    end
   
    return 0;
end

--相手がvalue1族以外だったら
function id_110(unit,other,condition,value,value1,value2,value3)
    if other:getRaceType() ~= value1 then
        return value;
    end
    
    return 0;
end

function id_111(unit,other,condition,value,value1,value2,value3)    
    return value;
end

--特定のアビリティが自身についていれば発動かつ、対象者がvalue2属性
function id_112(unit,other,condition,value,value1,value2,value3)
    if unit:getElementType() ~= value2 then
        return 0;
    end 
    
    local cond = unit:getTeamUnitCondition():findConditionWithID(value1);
    if cond == nil then
         return 0;
    end
    
    return value;
end

--自分以外に付与かつ魔法ダメージ
function id_113(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 2 then
        return value;
    end
    
    return 0;
end

--対象がvalue1属性の時付与。スキルタイプが奥義またはvalue2のとき
function id_114(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if value2 ~= 0 and type == value2 then
        return value;
    end

    --後からスキルにも対応できるように改造したためvalue2が空かどうかを確認する必要がある
    if type == 2 and value2 == 0 then
        return value;
    end
    return 0;
end

--対象がvalue1の性別の時付与。
function id_115(unit,other,condition,value,value1,value2,value3)

    return value;
end

--味方のvalue1性別ユニットの人数分効果量倍加
function id_116(unit,other,condition,value,value1,value2,value3)

    return value;
end

--対象のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量] スキル限定版
function id_117(unit,other,condition,value,value1,value2,value3)
    if other == null then
        return value;
    end
    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if not (skill:getSkillType() == 1) then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
    condition:setRemoveOnResetState(true);

    local per =  other:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end
       print(per);
       print(rate); 
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--対象のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量] スキル限定版
function id_118(unit,other,condition,value,value1,value2,value3)
    if other == null then
        return value;
    end
    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if not (skill:getSkillType() == 2) then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
    condition:setRemoveOnResetState(true);

    local per =  other:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end
       print(per);
       print(rate); 
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--攻撃相手もしくは、攻撃してきた相手がvalue1 の性別
function id_119(unit,other,condition,value,value1,value2,value3)
    if other:getSexuality() == value1 then
        return value;
    end  

    return 0;
end

 --制限時間付きパッシヴかつ特定ユニット
function id_120(unit,other,condition,value,value1,value2,value3)     
    if condition:getIsPassive() == true then
        condition:setIsPassive(false);    
    end
    if unit:getBaseID3() == value1  or unit:getBaseID3() == value2  or unit:getBaseID3() == value3 then
        return value;
    end
    return 0;
end

function id_121(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    local element = unit:getTeamUnitCondition():getDamageAffectInfo().skillElementType;
    if (type == 3 or type == 6) and element == value1 then
        return value;
    end

    
    return 0;
end

--自分が◯状態かつスキル・奥義が終わると削除
function id_122(unit,other,condition,value,value1,value2,value3)
    condition:setRemoveOnResetState(true);
    local cond = unit:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil then
        return value;
    end
    
    return 0;
end

--特定の種族（全体用）
function id_123(unit,other,condition,value,value1,value2,value3)

    return value;
end

--カテミラ専用　炎、水、樹属性のうち何種類がPT内に存在するかによって効果変動　光闇には効果なし
function id_124(unit,other,condition,value,value1,value2,value3) 
    local lastIndex = 6;
    local units = unit:getTeam()
    local found = 0;
    local attributes = {
        kElementType_Fire,
        kElementType_Aqua,
        kElementType_Earth
    }
    for index = 0, lastIndex do
        local unit = units:getTeamUnit(index,true)--死んでいても取得する
        if unit ~= nil then
            for i=1,table.maxn(attributes) do
                if unit:getElementType() == attributes[i] then
                    --PTを構成する属性の種類を数えるので、一度判定を行ったものについてはそれ以降判断しない。
                    attributes[i] = nil;
                    found = found + 1;
                    break
                end
            end
        end
    end

    return value * found;
end


--使用者が特定の属性かつ奥義攻撃
function id_125(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 2 then
        return value;
    end
    
    return 0;
end

--使用者のレベル
function id_126(unit,other,condition,value,value1,value2,value3)    
    local lv = unit:getLevel();
    if value1 == 0 then
        return value1;
    end
    for i=1,value1-1 do
        lv = lv * lv;
    end
    return value * lv;
end

--自分のHPが◯％〜◯％かつ奥義の時
function id_127(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;

    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 and  type == 2 then
        return value;
    end
    
    return 0;
end

--スキル・奥義が終了すると削除かつ自分以外
function id_128(unit,other,condition,value,value1,value2,value3)
    condition:setRemoveOnResetState(true);
    return value;
end

--パーティに特定のユニットがいない
function id_129(unit,other,condition,value,value1,value2,value3)
    
    for i = 0 , 6 do
        teamunit = unit:getTeam():getTeamUnit(i);
        if teamunit ~= nil then
            if teamunit:getBaseID3() == value1 or teamunit:getBaseID3() == value2 or teamunit:getBaseID3() == value3 then
                return 0;
            end
        end
    end

    return value;
end

--自身がブレイク
function id_130(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == value1 and unit:getBreakPoint() <= 0 then
        return value;
    end
    
    
    return 0;
end

--特定の状態異常の時効果延長
function id_131(unit,other,condition,value,value1,value2,value3)
    if unit:getTeamUnitCondition():findConditionWithType(value1) ~= nil and condition:getValue3() == 0 then
        condition:setTime(condition:getTime() + value2);
        condition:setValue3(1);
        return value;
    end
    return value;
end

--敵が特定の状態異常の時効果増幅
function id_132(unit,other,condition,value,value1,value2,value3)
    if other:getTeamUnitCondition():findConditionWithType(value1) ~= nil then
        
        return value + value2;
    end
    return value;
end

--特定の状態異常かつクリティカル
function id_133(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if other:getTeamUnitCondition():findConditionWithType(value1) ~= nil and critical then       
        return value;
    end
    return 0;
end

--自分以外かつHP消費
function id_134(unit,other,condition,value,value1,value2,value3)
    return value;
end


 --特定ユニットかつ対象がvalue2属
function id_135(unit,other,condition,value,value1,value2,value3)
    if unit:getBaseID3() == value1 and other:getRaceType() == value2 then
        return value;
    end
    return 0;
end

--自分が特定の状態異常かつ特定の属性
function id_136(unit,other,condition,value,value1,value2,value3)
    if unit:getTeamUnitCondition():findConditionWithType(value1) ~= nil and other:getElementType() == value2 then       
        return value;
    end
    return 0;
end

--指定したバフが自身にかかっていれば
function id_138(unit,other,condition,value,value1,value2,value3,value4,value5)
    local cond1 = unit:getTeamUnitCondition():findConditionValue(value1);
    local cond2 = unit:getTeamUnitCondition():findConditionValue(value2);
    local cond3 = unit:getTeamUnitCondition():findConditionValue(value3);
    local cond4 = unit:getTeamUnitCondition():findConditionValue(value4);

    if cond1 > 0 and cond2 > 0 and cond3 > 0 and cond4 and unit:getElementType() == value5 then    
        return value;
    end
    return 0;
end

--対象のHP消費
function id_139(unit,other,condition,value,value1,value2,value3)
    return value;
end

function id_140(unit,other,condition,value,value1,value2,value3)
    if other:getSize() ~= 3 then
        return 0;
    end
    return value
end

--自分のHPが◯％〜◯％かつ奥義の時かつ行動終了時に削除
function id_141(unit,other,condition,value,value1,value2,value3)
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    condition:setRemoveOnResetState(true);
    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 and  type == 2 then
        return value;
    end
    
    return 0;
end

--自分のHPが◯％〜◯％　付与時に弾くバージョン
function id_142(unit,other,condition,value,value1,value2,value3)

    return value;
end

--自分のHPが◯％〜◯％かつクリティカル
function id_143(unit,other,condition,value,value1,value2,value3)
    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 and  critical then
        return value;
    end
    
    return 0;
end

--攻撃相手もしくは、攻撃してきた相手が有利属性(付与時に属性判定)かつvalue1の効果が自身にかかっている場合のみ発動
function id_144(unit,other,condition,value,value1,value2,value3)
    local element = unit:getTeamUnitCondition():getDamageAffectInfo().skillElementType;
    local cond = unit:getTeamUnitCondition():findConditionWithID(value1);
    
    if cond == nil then
         return 0;
    end

    if unit:getElementType() == 1 and element == 3 then
        return value;
    end
    
    if unit:getElementType() == 2 and element == 1 then
        return value;
    end
    
    if unit:getElementType() == 3 and element == 2 then
        return value;
    end
    
    if unit:getElementType() == 4 and element == 5 then
        return value;
    end
    
    if unit:getElementType() == 5 and element == 4 then
        return value;
    end

    return 0;
end

--value1属性のユニットに対して付与　HP回復量アップを強制適用
function id_145(unit,other,condition,value,value1,value2,value3)
    local rate = 1 + unit:getTeamUnitCondition():findConditionValue(110) / 100;
    value = value * rate
    
    if unit:getHP() >= 1 then
        return value;
    end  
    
    return 0;
end


--セティス専用
function id_146(unit,other,condition,value,value1,value2,value3)
    return value;
end

--段階的に効果アップ(アイコンの数字も変わる版)
function id_147(unit,other,condition,value,value1,value2,value3)   

    return value;    
end

--パーティに特定のユニットかつ奥義中かつクリティカル
function id_148(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end

    if skill:getSkillType() == 2 then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end

    local critical = unit:getTeamUnitCondition():getDamageAffectInfo().critical;
    if critical == false then
        return 0;
    end

    for i = 0 , 6 do
        teamunit = unit:getTeam():getTeamUnit(i);
        if teamunit ~= nil then
            if teamunit:getBaseID3() == value1 or teamunit:getBaseID3() == value2 or teamunit:getBaseID3() == value3 then
                return value;
            end
        end
    end

    return 0;
end


--１回だけ発動
function id_149(unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
      
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value1 ~= 0 and value1 ~= type and value1 ~= 7 then
        return 0;
    end 
    
    if value1 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    condition:setRemoveOnResetState(true);
    return value;
end

--ボスブレイク中　かつ特定のユニット
function id_150(unit,other,condition,value,value1,value2,value3)   
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();       
    if boss ~= nil and boss:getBreakPoint() <= 0 then
        return value;
    end
    
    return 0;
end


--value1属性のみに付与　受けるダメージが魔法のとき
function id_151(unit,other,condition,value,value1,value2,value3)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == 2 then
        return value;
    end
    return 0;
end

--value１属性にのみ付与　装備攻撃
function id_152(unit,other,condition,value,value1,value2,value3)    
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    
    if type == 3 or type == 6 then
        return value;
    end
    
    return 0;
end

--ボスの奥義ゲージ
function id_153(unit,other,condition,value,value1,value2,value3)    
    local boss = megast.Battle:getInstance():getEnemyTeam():getBoss();       
    if boss == nil then 
        return 0;
    end
    local rate = boss:getBurstPoint() * 100 / boss:getNeedSP();

    if boss:getBurstState() == kBurstState_active then
        rate = 100;
    end

    local rank = rate/value1;
    return value * math.floor(rank);
end


--受けたダメージに対する割合
function id_154(unit,other,condition,value,value1,value2,value3)
    local power = other:getCalcPower();
    local skill  = other:getActiveBattleSkill();
    local animRate = other:getAnimationDamageRateSum();
    if animRate > 50 then
        animRate = 50;
    end
    local dealdamage = 0;
    local cond = other:getTeamUnitCondition():findConditionValue(17);
    if cond ~= 0 then
        dealdamage = (cond / 100);
    end
            
    if skill ~= nil then
        power = skill:getDamageRate() * power;
    end
    if dealdamage > 0 then
        power =  power + (power * dealdamage);
    end
    power = power / animRate;

    local isarena = megast.Battle:getInstance():isArena();
    if isarena then
        return (value + (power * value1 / 100))/100;
    end
    
    return value + (power * value1 / 100)
end


function id_155(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

function id_156(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

function id_157(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

function id_158(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

--自分のHPが◯％〜◯％の時
function id_160(unit,other,condition,value,value1,value2,value3)
    if (unit:getHPPercent() * 100) >= value1 and (unit:getHPPercent() * 100) <= value2 then
        return value;
    end
    
    return 0;
end

function id_161(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

function id_162(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

function id_163(unit,other,condition,value,value1,value2,value3,value4,value5)
    return value;
end

function id_164(unit,other,condition,value,value1,value2,value3,value4,value5)
    
    local team = megast.Battle:getInstance():getTeam(other:getisPlayer());
    local isTarget = false;
    for i = 0,7 do
         local teamUnit = team:getTeamUnit(i);
         if teamUnit ~= nil then  
                local cond = teamUnit:getTeamUnitCondition():findConditionWithType(128);
                if cond ~= nil then
                    if cond:getProtectTarget() == other:getIndex() then
                        isTarget = true;
                    end
                end 
         end
    end 

    if isTarget then
        return value;
    end
    
    return 0;
end

--自分のパーティの誰かがValue1~3族のいずれかのとき付与
function id_165(unit,other,condition,value,value1,value2,value3)    
    return value;
end

--対象のHPが〇〇ほど効果上昇 value1[最小効果量%] value2[最大効果量%] value3[固定追加量] 真奥義限定
function id_166(unit,other,condition,value,value1,value2,value3)
    if other == null then
        return value;
    end
    
    local skill = unit:getActiveBattleSkill();
    if skill == nil then
        return 0;
    end
        
    if skill:getSkillType() ~= 2 or skill:isBurst2() == false then
        return 0;
    end
        
    if unit:getUnitState() ~= kUnitState_skill then
        return 0;
    end    
  
    condition:setRemoveOnResetState(true);

    local per =  other:getHPPercent() * 100;
    local _per = per - value1;
    local rate = _per / (value2 - value1);
    if rate > 1 then
        rate = 1;
    end
       print(per);
       print(rate); 
    if rate < 0 then
        rate = 0;
    end
    
    value = value * rate + value3;
    return value;
end

--受けるダメージが物理のとき
function id_167(unit,other,condition,value,value1,value2,value3,value4)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == value4 then
        return value;
    end
    
    return 0;
end

--本来単体の効果を全体化する
function id_168(unit,other,condition,value,value1,value2,value3,value4)
    
    return value;
end

--value1 属性に対して付与　value2属性に対して発動　物理か魔法か全部か選べる
function id_169(unit,other,condition,value,value1,value2,value3,value4)
    if other:getElementType() ~= value2 then       
        return 0;
    end
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute ~= value3 and value3 ~= 0 then
        return 0;
    end

    return value;
end

function id_170(unit,other,condition,value,value1,value2,value3,value4)

    local cond = unit:getTeamUnitCondition():findConditionWithGroupID(value1);
    if cond ~= nil then
        return value;
    end  
    return 0;

end

function id_171(unit,other,condition,value,value1,value2,value3,value4)
    local val = unit:getTeamUnitCondition():findConditionValue(value3);

    local cond = unit:getTeamUnitCondition():findConditionWithType(value1);
    if cond ~= nil then
        return val;
    end

    if value2 == 0 then
        return 0;
    end
    local cond2 = unit:getTeamUnitCondition():findConditionWithType(value2);
    if cond2 ~= nil then
        return val;
    end

    return 0;
    
end

--段階的効果上昇　決定版
function id_173(unit,other,condition,value,value1,value2,value3,value4)

    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute ~= value4 and value4 ~= 0 then
        return 0;
    end

    --unitがなければエラーを避けるためにこの時点でもうOKしちゃう
    if unit == nil then
        return value;
    end

    local skill = unit:getActiveBattleSkill();
    local type = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
    if value3 ~= 0 and value3 ~= type and value3 ~= 7 then
        return 0;
    end 
    
    if skill == nil and value3 == 7 then
        return 0;
    end

    if value3 == 7 and (skill:isBurst2() == false or type ~= 2) then
        return 0;
    end

    
    return value;
end

function id_172(unit,other,condition,value,value1,value2,value3,value4)
    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute == value2 then
        return value;
    end

    return 0;
    
end

 --時間で効果上昇
function id_174(unit,other,condition,value,value1,value2,value3)     
    local time = BattleControl:get():getTime();
    if time > value1 then
        time = value1;
    end
    value = value * time / value1;
    local stage = math.floor(value3 * time/value1);
    if stage == 0 then
         return value;
    end

    if stage > value1 then
        stage = value1;
    end
    if stage == value3 then
        condition:setNumber(10);     
    else
        condition:setNumber(stage);
    end
    
    megast.Battle:getInstance():updateConditionView();

    return value;
end

--特定の種族がいるとき　物理・魔法に対して発動
function id_175(unit,other,condition,value,value1,value2,value3,value4)

    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute ~= value4 and value4 ~= 0 then
        return 0;
    end

    
    return value;
end


--特定の属性（相手）
function id_1469 (unit,other,condition,value,value1,value2,value3)
    local skill = unit:getActiveBattleSkill();

    if other:getElementType() == value1 then
        return value;
    end    
    return 0;
end


--対象が特定の種族かつ物理・魔法判断
function id_176(unit,other,condition,value,value1,value2,value3,value4)

    local attribute = unit:getTeamUnitCondition():getDamageAffectInfo().skillAttribute;
    
    if attribute ~= value2 and value2 ~= 0 then
        return 0;
    end

    
    return value;
end


--発動者が特定の種族かつ属性ダメージ
function id_177(unit,other,condition,value,value1,value2,value3)
    if unit:getTeamUnitCondition():getDamageAffectInfo().skillElementType == value2 then
        return value;
    end

    return 0;
end


function id_178(unit,other,condition,value,value1,value2,value3)

    return value;
end


--敵を撃破した時にSP回復　ただしluaと併用する前提なので単体では機能せず
function id_179(unit,other,condition,value,value1,value2,value3)
    local index = unit:getIndex();
    local keyStr = "lastAttackChecker"
    local keyStr2 = "index"

    local parentUnit = other:getParentTeamUnit();

    local attackerIndex = parentUnit ~= nil and parentUnit:getIndex() or other:getIndex();

    
    local paramName = keyStr..value1..keyStr2..index;

    local buffParent = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(value1,true);

    if buffParent == nil then
        return 0;
    end
    
    buffParent:setParameter(paramName,attackerIndex); 

    
    return 0;
end

--相手が状態異常のとき
function id_180(unit,other,condition,value,value1,value2,value3)
    
    return value;
end


function id_181(unit,other,condition,value,value1,value2,value3)

    return value;
end

function id_183(unit,other,condition,value,value1,value2,value3)
    if other:getSize() ~= value1 then
        return 0;
    end
    return value
end

function id_184(unit,other,condition,value,value1,value2,value3)

    return value * value3;
end

function id_185(unit,other,condition,value,value1,value2,value3)

    return value;
end

function id_186(unit,other,condition,value,value1,value2,value3)

    return value;
end

function id_187(unit,other,condition,value,value1,value2,value3)
    if condition:getValue5() ~= megast.Battle:getInstance().m_wave then
        unit:getTeamUnitCondition():removeCondition(condition);
        return 0;
    end

    local team = megast.Battle:getInstance():getTeam(not unit:getisPlayer());


    for i = 0 , team:getIndexMax() do
       local target = team:getTeamUnit(i);
       if target ~= nil then
           local buff = target:getTeamUnitCondition():findConditionWithID(condition:getValue3());
           if buff ~= nil then
                unit:getTeamUnitCondition():removeCondition(condition);
                return 0;
           end
       end
    end


    local buffid = condition:getID();
    local duration = condition:getValue2();
    unit:getTeamUnitCondition():removeCondition(condition);
    unit:getTeamUnitCondition():addCondition(buffid,89,100,duration,79)
    -- BattleControl:get():pushEnemyInfomation(""..duration,100,100,100,1);
    return 0;
end
