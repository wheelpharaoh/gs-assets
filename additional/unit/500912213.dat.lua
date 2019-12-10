function new(id)
    print("10000 new ");
    local instance = {
        thisID = id,
        attackChecker = false,
        skillChecker = false,
        fromHost = false,
        myself = nil,
        spValue = 20,
        isRage = false,
        isRage2 = false,


        

        --通常時の行動重み　合計１００じゃなくても正規化されます
        weightsNormal = {
            {key = 1,value = 20},
            {key = 2,value = 30}
        },

        weightsRage = {
            {key = 1,value = 20},
            {key = 2,value = 30},
            {key = 4,value = 50}
        },



        --スキルの行動重み　合計１００じゃなくても正規化されます
        weightsSkill = {
            {key = 4,value = 100}
        },

        weightsSkillRage = {
            {key = 2,value = 100}
        },

        consts = {
            CRITICAL_BUFF_ID = 50047,
            CRITICAL_BUFF_EFFECT_ID = 22,
            CRITICAL_BUFF_VALUE = 100,
            CRITICAL_BUFF_DURATION = 9999,
            CRITICAL_BUFF_ICON = 11,

            SPEED_BUFF_ID = 500471,
            SPEED_BUFF_EFFECT_ID = 28,
            SPEED_BUFF_VALUE = 30,
            SPEED_BUFF_DURATION = 9999,
            SPEED_BUFF_ICON = 7,

            SPGAIN_BUFF_ID = 500472,
            SPGAIN_BUFF_EFFECT_ID = 10,
            SPGAIN_BUFF_VALUE = 5,
            SPGAIN_BUFF_DURATION = 9999,
            SPGAIN_BUFF_ICON = 36,

            DEFENSE_BUFF_ID = 500473,
            DEFENSE_BUFF_EFFECT_ID = 21,
            DEFENSE_BUFF_VALUE = -50,
            DEFENSE_BUFF_DURATION = 9999,
            DEFENSE_BUFF_ICON = 20,
        },

        colors = {
            red = {r = 255,g = 0,b = 28},
            yellow = {r = 220,g = 255,b = 0},
            green = {r = 50,g = 255,b = 0},
            cyan = {r = 0,g = 255,b = 255},
            magenta = {r = 255,g = 0,b = 255},
            white = {r = 255,g = 255,b = 255}
        },

        messages = summoner.Text:fetchByUnitID(500912213),


        initialize = function (this,unit)
            this.myself = unit;
            unit:setSPGainValue(0);
            this.spValue = 20;
            -- unit:setRange_Max(1000);
        end,

        takeAttackFromHost = function (this,unit,intparam)
            this.fromHost = true;
            unit:takeAttack(intparam);
        end,

        takeSkillFromHost = function (this,unit,intparam)
            this.fromHost = true;
            unit:takeSkill(intparam);
        end,

        attackBranch = function (this,unit)


            local attackTable = this.utill.randomPickItem(this,this.weightsNormal);

            if this.isRage then
                attackTable = this.utill.randomPickItem(this,this.weightsRage);
            end

            if unit:getPositionX() < -100 then
                attackTable = {key = 3,value = nil};
            end

            if this.utill.getHPParcent(unit) <= 60 and not this.isRage then
                attackTable = {key = 5,value = nil};
                this.getRage(this,unit);
                this.utill.sendEvent(this,3,0);
            end

            if this.utill.getHPParcent(unit) <= 30 and not this.isRage2 then
                attackTable = {key = 5,value = nil};
                this.getRage2(this,unit);
                this.utill.sendEvent(this,4,0);
            end

            unit:takeAttack(attackTable.key);
            this.utill.sendEvent(this,1,attackTable.key);
            return 0;
        end,

        skillBranch = function (this,unit)
            
            local skillTable = this.utill.randomPickItem(this,this.weightsSkill);

            if this.isRage then
                skillTable = this.utill.randomPickItem(this,this.weightsSkillRage);
            end

            unit:takeSkill(skillTable.key);
            this.utill.sendEvent(this,2,skillTable.key);
            return 0;
        end,

        attackActiveSkillSetter = function (this,unit,index)
            if index == 1 then
                unit:setActiveSkill(1);
            elseif index == 2 then
                unit:setActiveSkill(2);
            elseif index == 3 then
                unit:setActiveSkill(3);
            elseif index == 4 then
                unit:setActiveSkill(4);
            elseif index == 5 then
                unit:setActiveSkill(5);
            end
        end,

        skillActiveSkillSetter = function (this,unit,index)
            if index == 2 then
                unit:setActiveSkill(7);
            elseif index == 4 then
                unit:setActiveSkill(6);
            end
        end,

        getTargetDistance = function(this,unit,target)
            return target:getPositionX() - unit:getPositionX();
        end,

        getRage = function(this,unit)
            this.isRage = true;

            this.utill.showMessage(this.messages.mess1,this.colors.red,5);
            this.utill.showMessage(this.messages.mess2,this.colors.cyan,5);

            unit:getTeamUnitCondition():addCondition(
                this.consts.CRITICAL_BUFF_ID,
                this.consts.CRITICAL_BUFF_EFFECT_ID,
                this.consts.CRITICAL_BUFF_VALUE,
                this.consts.CRITICAL_BUFF_DURATION,
                this.consts.CRITICAL_BUFF_ICON
            );

            unit:getTeamUnitCondition():addCondition(
                this.consts.SPEED_BUFF_ID,
                this.consts.SPEED_BUFF_EFFECT_ID,
                this.consts.SPEED_BUFF_VALUE,
                this.consts.SPEED_BUFF_DURATION,
                this.consts.SPEED_BUFF_ICON
            );
        end,

        getRage2 = function(this,unit)
            this.isRage2 = true;
            unit:setAttackDelay(0);

            this.utill.showMessage(this.messages.mess3,this.colors.cyan,5);
            this.utill.showMessage(this.messages.mess4,this.colors.cyan,5);
            this.utill.showMessage(this.messages.mess5,this.colors.cyan,5);

            unit:getTeamUnitCondition():addCondition(
                this.consts.SPGAIN_BUFF_ID,
                this.consts.SPGAIN_BUFF_EFFECT_ID,
                this.consts.SPGAIN_BUFF_VALUE,
                this.consts.SPGAIN_BUFF_DURATION,
                this.consts.SPGAIN_BUFF_ICON
            );

            unit:getTeamUnitCondition():addCondition(
                this.consts.DEFENSE_BUFF_ID,
                this.consts.DEFENSE_BUFF_EFFECT_ID,
                this.consts.DEFENSE_BUFF_VALUE,
                this.consts.DEFENSE_BUFF_DURATION,
                this.consts.DEFENSE_BUFF_ICON
            );

        end,

        utill = {
            isHost = function ()
                return megast.Battle:getInstance():isHost();
            end,

            getHPParcent = function(unit)
                return 100 * unit:getHP() / unit:getCalcHPMAX();
            end,

            -- ランダム選択
            randomPickItem = function (this, ...)
                local total = 0;

                for i, obj in pairs(...) do
                    total = total + obj.value;
                end

                local randv = LuaUtilities.rand(0,total)

                for i, obj in pairs(...) do
                    randv = randv - obj.value;

                    if randv < 0 then
                        return obj;
                    end
                end

                local item = unpack(...);

                return item;
            end,


            findConditionWithType = function (unit,conditionTypeID)
                return unit:getTeamUnitCondition():findConditionWithType(conditionTypeID);
            end,

            removeCondition = function (unit,buffID)
                local buff = unit:getTeamUnitCondition():findConditionWithID(buffID);
                if buff ~= nil then
                    unit:getTeamUnitCondition():removeCondition(buff);
                end
            end,

            
            findUnitByBaseID = function (targetID,isPlayerTeam)
                for i = 0,4 do
                    local target = megast.Battle:getInstance():getTeam(isPlayerTeam):getTeamUnit(i);
                    if target ~= nil and target:getBaseID3() == targetID then
                        return target;
                    end
                end            
            end,

            findAllUnitByBaseID = function (targetID,isPlayerTeam)
                local resultTable = {};
                for i = 0,4 do
                    local target = megast.Battle:getInstance():getTeam(isPlayerTeam):getTeamUnit(i);
                    if target ~= nil and target:getBaseID3() == targetID then
                        table.insert(resultTable,target);
                    end
                end
                return resultTable;          
            end,

            sendEvent = function(this,index,intparam)
                megast.Battle:getInstance():sendEventToLua(this.thisID,index,intparam);
            end,

            showMessage = function(message,rgb,duration,iconid,player)
                if player ~= nil then
                    if iconid ~= nil and iconid ~= 0 then
                        BattleControl:get():pushInfomationWithConditionIcon(message,iconid,rgb.r,rgb.g,rgb.b,duration);
                    else
                        BattleControl:get():pushInfomation(message,rgb.r,rgb.g,rgb.b,duration);
                    end
                    return;
                end
                if iconid ~= nil and iconid ~= 0 then
                    BattleControl:get():pushEnemyInfomationWithConditionIcon(message,iconid,rgb.r,rgb.g,rgb.b,duration);
                else
                    BattleControl:get():pushEnemyInfomation(message,rgb.r,rgb.g,rgb.b,duration);
                end
            end,
        },

        addSP = function (this,unit)
            if this.utill.isHost() then
                unit:addSP(this.spValue);
            end
            return 1;
        end,

        --共通変数
        param = {
          version = 1.3
          ,isUpdate = 1
        },

        --共通処理

        --マルチでキャストされてきたものを受け取るメソッド
        --receive + 番号　という形式で
        --引数にはintが渡る
        receive1 = function (this , intparam)
            this.takeAttackFromHost(this,this.myself,intparam);
            return 1;
        end,

        receive2 = function (this , intparam)
            this.takeSkillFromHost(this,this.myself,intparam);
            return 1;
        end,

        receive3 = function (this , intparam)
            this.getRage(this,this.myself);
            return 1;
        end,

        receive4 = function (this , intparam)
            this.getRage2(this,this.myself);
            return 1;
        end,


        --run scriptで呼ばれる。引数と文字列だけが渡ってくるので文字列を見て内部で何を呼び出すのか分岐させてください。
        --共通処理以外のものを書いたらここに登録して分岐
        -- 例：test1というメソッドを書いてそれをspineから呼び出す場合 if str == "test1" then return this.test1(this,unit) end のような感じです。
        --分岐先でのreturnは必須です。
        run = function (this , unit , str)
            if str == "addSP" then return this.addSP(this,unit) end
            return 1;
        end,

        --version1.3
        takeBreakeDamageValue = function (this,unit,enemy,value)
            return value;
        end,

        takeBreake = function (this,unit)
            return 1;
        end,

        --versiton1.2
        endWave = function (this , unit , waveNum)
            return 1;
        end,

        startWave = function (this , unit , waveNum)
            
            return 1;
        end,

        --version1.1
        update = function (this , unit , deltatime)
            return 1;
        end,

        attackDamageValue = function (this , unit , enemy , value)
            return value;
        end,

        takeDamageValue = function (this , unit , enemy , value)
            return value;
        end,

        --version1.0
        start = function (this , unit)
            this.initialize(this,unit);
            return 1;
        end,

        excuteAction = function (this , unit)            
            return 1;
        end,

        takeIdle = function (this , unit)
            return 1;
        end,

        takeFront = function (this , unit)
          
            return 1;
        end,

        takeBack = function (this , unit)
         
            return 1;
        end,

        takeAttack = function (this , unit , index)

            if this.utill.isHost() and not this.attackChecker then
                this.attackChecker = true;
                return this.attackBranch(this,unit);
            end
            this.attackChecker = false;

            if not this.utill.isHost and not this.fromHost then
                unit:takeIdle();
                return 0;
            end
            this.fromHost = false;
            this.attackActiveSkillSetter(this,unit,index)
            return 1;
        end,

        takeSkill = function (this,unit,index)
            

            if this.utill.isHost() and not this.skillChecker then
                this.skillChecker = true;
                return this.skillBranch(this,unit);
            end
            this.skillChecker = false;

            if not this.utill.isHost and not this.fromHost then
                unit:takeIdle();
                return 0;
            end

            this.fromHost = false;
            unit:setBurstState(kBurstState_active);
            this.skillActiveSkillSetter(this,unit,index);
            return 1;
        end,

        takeDamage = function (this , unit)
            return 1;
        end,

        dead = function (this , unit)
            return 1;
        end
    }
    register.regist(instance,id,instance.param.version);
    return instance.param.isUpdate;
end

