function new(id)
    print("10000 new ");
    local instance = {
        thisID = id,
        attackChecker = false,
        skillChecker = false,
        fromHost = false,
        myself = nil,
        spValue = 20,
        recastTimer = 0,
        isRage = false,
        itemSkill =nil,
        attackTimeDefault = 0,
        forceAttackIndex = 0,
        skillCount = -1,
        skillIncrementValue = 50,


        --通常時の行動重み　合計１００じゃなくても正規化されます
        weightsNormal = {
            {key = 1,value = 20},
            {key = 2,value = 20},
            {key = 3,value = 20},
            {key = 4,value = 20}
        },

        --アイテムリキャストが溜まった時の　合計１００じゃなくても正規化されます
        weightsNormalWithItemRecast = {
            {key = 1,value = 20},
            {key = 2,value = 20},
            {key = 3,value = 20},
            {key = 4,value = 30}
            --{key = 6,value = 60}
        },

        --スキルの行動重み　合計１００じゃなくても正規化されます
        weightsSkill = {
            {key = 2,value = 30}
        },

        consts = {
            itemRecast = 30,
            itemDamageRate = 3
        },

        colors = {
            red = {r = 255,g = 0,b = 28},
            yellow = {r = 220,g = 255,b = 0},
            green = {r = 50,g = 255,b = 0},
            cyan = {r = 0,g = 255,b = 255},
            magenta = {r = 255,g = 0,b = 255},
            white = {r = 255,g = 255,b = 255}
        },

        messages = summoner.Text:fetchByEnemyID(200080028),


        initialize = function (this,unit)
            this.myself = unit;
            unit:setSPGainValue(0);
            this.spValue = 20;
            this.itemSkill = unit:setItemSkill(0,100662504);
            this.recastTimer = this.consts.itemRecast;
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

            if this.forceAttackIndex ~= 0 then
                unit:takeAttack(this.forceAttackIndex);
                this.utill.sendEvent(this,1,this.forceAttackIndex);
                this.forceAttackIndex = 0;
                return 0;
            end

            if this.recastTimer <= 0 then
                attackTable = this.utill.randomPickItem(this,this.weightsNormalWithItemRecast);
                if attackTable.key == 6 then
                    this.takeItem(this,unit);
                    this.utill.sendEvent(this,5,1);
                    return 0;
                end
            end

            unit:takeAttack(attackTable.key);
            this.utill.sendEvent(this,1,attackTable.key);
            return 0;
        end,

        skillBranch = function (this,unit)
            this.spValue = 20;
            
            local skillTable = this.utill.randomPickItem(this,this.weightsSkill);

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
                unit:setActiveSkill(6);
            end
        end,

        getRage = function (this,unit)
            
            this.utill.showMessage(this.messages.mess2,this.colors.yellow,5,7);
            unit:getTeamUnitCondition():addCondition(-11,0,1,2000,7,17);
            this.attackTimeDefault = unit:getAttackDelay();
            unit:setAttackDelay(0);

            this.isRage = true;
            return 1;
        end,

        takeItem = function (this,unit)
            
            unit:takeItemSkill(0);
            this.itemSkill:setCoolTimer(0);
            this.utill.showMessage(this.messages.mess3,this.colors.magenta,5);
            this.recastTimer = this.consts.itemRecast;
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

            debugKill = function (this)
                local resultTable = {};
                for i = 0,7 do
                    local target = megast.Battle:getInstance():getTeam(false):getTeamUnit(i);
                    if target ~= nil and target ~= this.myself then
                        target:setHP(0);
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
            this.skillCount = intparam;
            this.utill.showMessage(this.messages.mess4..(100+this.skillCount*this.skillIncrementValue).."%",this.colors.red,5,3);
            return 1;
        end,

        receive4 = function (this , intparam)
            return 1;
        end,

        receive5 = function (this , intparam)
            this.takeItem(this,this.myself);
            return 1;
        end,

        --run scriptで呼ばれる。引数と文字列だけが渡ってくるので文字列を見て内部で何を呼び出すのか分岐させてください。
        --共通処理以外のものを書いたらここに登録して分岐
        -- 例：test1というメソッドを書いてそれをspineから呼び出す場合 if str == "test1" then return this.test1(this,unit) end のような感じです。
        --分岐先でのreturnは必須です。
        run = function (this , unit , str)
            if str == "addSP" then return this.addSP(this,unit) end
            if str == "getRage" then return this.getRage(this,unit) end
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
            
            this.utill.showMessage(this.messages.mess1,this.colors.green,5,3);
            -- this.utill.debugKill(this);
            return 1;
        end,

        --version1.1
        update = function (this , unit , deltatime)
            if this.isRage then
                this.recastTimer = this.recastTimer - deltatime;
            end

            return 1;
        end,

        attackDamageValue = function (this , unit , enemy , value)
            if unit:getBurstState() == kBurstState_active then
                value = value * (1 + this.skillCount * 0.25);
            end
            return value;
        end,

        takeDamageValue = function (this , unit , enemy , value)
            local skillType = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
            if skillType ==3 or skillType == 6 then
                return value*this.consts.itemDamageRate;
            end

            return value;
        end,

        --version1.0
        start = function (this , unit)
            this.initialize(this,unit);
            return 1;
        end,

        excuteAction = function (this , unit)
            if this.utill.getHPParcent(unit) <= 50 and not this.isRage and this.utill.isHost() then
                this.forceAttackIndex = 5;
            end
            
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
            this.utill.removeCondition(unit,-15);

            if this.utill.isHost() and not this.skillChecker then
                this.skillChecker = true;
                return this.skillBranch(this,unit);
            end
            this.skillChecker = false;

            if not this.utill.isHost and not this.fromHost then
                unit:takeIdle();
                return 0;
            end
            if this.utill.isHost() then
                this.skillCount = this.skillCount + 1;
                this.utill.sendEvent(this,3,this.skillCount);
                this.utill.showMessage(this.messages.mess4..(100 + this.skillCount*this.skillIncrementValue).."%",this.colors.red,5,3);
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

