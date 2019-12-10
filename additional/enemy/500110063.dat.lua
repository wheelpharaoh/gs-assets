function new(id)
    print("500155513 - ドラゴン闇 new ");
    local instance = {
        uniqueID = id,
        skillChecker = false,
        attackChecker = false,
        isLockOn = false,
        isRage = false,
        isFireEnd = false,
        rageCoolTurnCount = 0,
        neckAngle = 0,
        neckAngleDeffault = 321,
        shotAngle = 0,
        myself = nil,
        attackdelayOriginal = 0,
        rageTimer = 0,
        attack5Counter = 0,
        rageSPUpValue = 20,
        glabTarget = nil,
        currentGlabPhase = 0,
        gravityPower = 200,
        dejyonCounter = 0,
        buffTimer = 0,
        isTalk = false,

        glabTargetPositions = {
            x = 0,
            y = 0
        },


        rates = {
            --通常攻撃の確率　アタック1は使わない
            attack3 = 10,
            attack2 = 45,
            attack4 = 45,

            --スキルの確率
            skill1 = 30,
            skill2 = 70
        },

        consts = {
            rageHP = 75, --怒り状態に移行するHP １００分率
            rageCoolTurn = 10, --怒りが収まってから次の怒り状態に移行するまでの必要行動数
            dejyonDuration = 15, --プレイヤーを除外する時間
            rageDuration = 60 --怒りの時間
        },

        messages = summoner.Text:fetchByEnemyID(500110063),

        colors = {
            red = {r = 255,g = 0,b = 28},
            yellow = {r = 220,g = 255,b = 0},
            green = {r = 50,g = 255,b = 0},
            cyan = {r = 0,g = 255,b = 255},
            magenta = {r = 255,g = 0,b = 255},
            white = {r = 255,g = 255,b = 255}
        },

        HPTriggers = {
            {
              hp = 100,
              index = 1,
              isExecute = false,
              process = function (this,unit)
                unit:getTeamUnitCondition():addCondition(500152,78,100,9999,0);
                unit:addOrbitSystem("weaponShow1",0);
                this.showMessage(this.messages.mess1,this.colors.magenta,5);
                this.showMessage(this.messages.mess2,this.colors.yellow,5,3);
              end
            },
            {
              hp = 80,
              index = 2,
              isExecute = false,
              process = function (this,unit)
                unit:getTeamUnitCondition():addCondition(500153,97,1000,60,87);
                unit:getTeamUnitCondition():addCondition(500158,0,1,9999,0);
                unit:addOrbitSystem("weaponShow2",0);
                this.showMessage(this.messages.mess3,this.colors.magenta,5);
                -- this.showMessage(this.messages.mess4,this.colors.red,5,7);
              end
            },
            {
              hp = 60,
              index = 3,
              isExecute = false,
              process = function (this,unit)
                unit:getTeamUnitCondition():addCondition(500154,113,100,9999,67);
                unit:getTeamUnitCondition():addCondition(5001512,101,-100,9999,0);
                unit:addOrbitSystem("weaponShow3",0);
                this.showMessage(this.messages.mess5,this.colors.magenta,5);
                this.showMessage(this.messages.mess6,this.colors.cyan,5,67);
              end
            },
            {
              hp = 50,
              index = 6,
              isExecute = false,
              process = function (this,unit)
                
                unit:getTeamUnitCondition():addCondition(5001513,0,100,9999,0);
                unit:addOrbitSystem("weaponShow3",0);
                this.showMessage(this.messages.mess13,this.colors.magenta,5);
                this.showMessage(this.messages.mess14,this.colors.cyan,5,67);
              end
            },
            {
              hp = 40,
              index = 4,
              isExecute = false,
              process = function (this,unit)
                BattleControl:get():visibleHateTarget(true);
                -- BattleControl:get():setHateTargetIcon(14);

                unit:setEnableHate(true);

                local ishost = megast.Battle:getInstance():isHost();
                if ishost then
                    unit:updateHateTarget();
                end
                local cond1 = unit:getTeamUnitCondition():addCondition(500155,22,100,9999,14);
                cond1:setScriptID(66);
                local cond2 = unit:getTeamUnitCondition():addCondition(500156,17,50,9999,0);
                cond2:setScriptID(66);
                unit:getTeamUnitCondition():addCondition(5001511,17,-50,9999,0);
                unit:addOrbitSystem("weaponShow4",0);
                this.showMessage(this.messages.mess7,this.colors.magenta,5);
                this.showMessage(this.messages.mess8,this.colors.red,5,14);
              end
            },
            {
              hp = 20,
              index = 5,
              isExecute = false,
              process = function (this,unit)
                unit:getTeamUnitCondition():addCondition(500157,0,100,9999,48);
                unit:getTeamUnitCondition():addCondition(5001511,17,-75,9999,0);
                unit:addOrbitSystem("weaponShow4",0);
                this.showMessage(this.messages.mess10,this.colors.magenta,5);
                this.showMessage(this.messages.mess11,this.colors.yellow,5,48);
              end
            },
        },

        glabPhase = {
            none = 0,
            gravity = 1,
            hold = 2,
            fade = 3,
            finish = 4
        },

        delayItems = {

        },

        showStartBuff = function(this)
           
            this.showMessage(this.messages.mess9,this.colors.yellow,5);
            -- this.showMessage(this.messages.mess16,this.colors.magenta,5);
            this.isTalk = true;
        end,

        setDelayItems = function (this,method,delay)
            table.insert(this.delayItems,{method,delay});
        end,

        updateDelayItems = function (this,deltatime)
            for i = 1,table.maxn(this.delayItems) do
                if this.delayItems[i] ~= nil then
                    this.delayItems[i][2] = this.delayItems[i][2] - deltatime;
                    if this.delayItems[i][2] <= 0 then
                        this.executeDelayItem(this,this.delayItems[i][1]);
                        this.delayItems[i] = nil;
                    end
                end
            end
        end,

        executeDelayItem = function(this,item)
            item(this,this.myself);
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

        checkHPTrigger = function (this,unit)
            if this.buffTimer < 5 then
                return;
            end
            local hpParcent = 100 * unit:getHP() / unit:getCalcHPMAX();
            for i=1,table.maxn(this.HPTriggers) do
                local triggr = this.HPTriggers[i];
                if not triggr.isExecute then
                    if hpParcent <= triggr.hp then
                        triggr.isExecute = true;
                        this.executeHPTrigger(this,unit,triggr.index);
                        megast.Battle:getInstance():sendEventToLua(this.uniqueID,3,triggr.index);
                        this.buffTimer = 0;
                        break;
                    end
                end
            end
        end,

        executeHPTrigger = function (this,unit,index)
            for i=1,table.maxn(this.HPTriggers) do
                local triggr = this.HPTriggers[i];
                if triggr.index == index then
                    triggr.process(this,unit);
                end
            end
        end,

        targetLock = function (this,unit)
            this.isLockOn = true;
            this.neckAngle = 321;
            return 1;
        end,

        fire = function (this,unit)--アニメーションから呼ばれる。弾を飛ばすだけ。
            local shot = unit:addOrbitSystem("fireball",1)
            shot:setActiveSkill(1);
            shot:setHitCountMax(1);
            shot:setEndAnimationName("explosion")
            -- shot:EnabledFollow = true;
            local x = unit:getPositionX();
            local y = unit:getPositionY();
            local xb = unit:getSkeleton():getBoneWorldPositionX("EF_fire_mouth");
            local yb = unit:getSkeleton():getBoneWorldPositionY("EF_fire_mouth");
            shot:setPosition(x+xb,y+yb);
            -- getDeg(x+xb,y+yb,unit:getTargetUnit():getAnimationPositionX(),unit:getTargetUnit():getAnimationPositionY());
            shot:setRotation(-this.neckAngle);
            this.shotAngle = this.neckAngle;
            shot:setZOrder(unit:getZOrder() -1);
            this.isFireEnd = true;

            return 1;
        end,

        setFire = function (this,unit)--怒り時のスキル１で火柱を設置するやつ
            if not this.isRage then
                return 1;
            end
            local shot = unit:addOrbitSystem("firePiller",2)
            shot:setHitCountMax(999);
            shot:setEndAnimationName("fireEnd");
            -- shot:EnabledFollow = true;
            local x = unit:getPositionX();
            local y = unit:getPositionY();
            local xb = 0;
            local yb = 0;

            local rand = math.random(5);

            if rand == 1 then
                xb = 300;
            elseif rand == 2 then
                xb = 350;
                yb = -100;
            elseif rand == 3 then
                xb = 400;
                yb = 50;
            elseif rand == 4 then
                xb = 500;
            elseif rand == 5 then
                xb = 600;
                yb = 100;
            end

            
            shot:setPosition(x+xb,y+yb);
            shot:setAutoZOrder(true);
            shot:setZOderOffset(-5000);

            return 1;
        end,


        attack5ArmControll = function(this,unit)--狙ったユニットを追いかけるように首を動かす
            this.boneRotation(this,unit,"head");
            return 1;
        end,

        boneRotation = function (this,unit,boneName)--指定したボーンの回転を制御する
            if not this.isFireEnd then
                unit:getSkeleton():setBoneRotation(boneName,this.calcDeg(this,unit,boneName));
            else
                unit:getSkeleton():setBoneRotation(boneName,this.calcDegForEnd(this,unit,boneName));
            end
            return 1;
        end,

        addSP = function (this , unit)
            print("addSP");
            unit:addSP(this.rageSPUpValue);
            local ishost = megast.Battle:getInstance():isHost();
            if ishost then
                unit:updateHateTarget();
            end
            return 1;
        end,

        calcDeg = function(this,unit,boneName)--首の動きの計算
            local target = unit:getTargetUnit();
            if target ~= nil then
                local x = unit:getPositionX();
                local y = unit:getPositionY();
                local xb = unit:getSkeleton():getBoneWorldPositionX(boneName);
                local yb = unit:getSkeleton():getBoneWorldPositionY(boneName);
                local tx = target:getPositionX();
                local ty = target:getPositionY();
                local txb = target:getSkeleton():getBoneWorldPositionX("MAIN");
                local tyb = target:getSkeleton():getBoneWorldPositionY("MAIN");
                local targetangle = getDeg(x+xb,y+yb,tx+txb,ty+tyb) + 18;

                if targetangle < 0 then
                    targetangle = 360 + targetangle;
                end


                local dir = targetangle - this.neckAngle;

                if dir > 180 then
                    dir = -(360 - dir);
                end

                if dir < -180 then
                    dir = (360 + dir);
                end

                if dir ~= 0 then
                    local maxdir = 1 * unitManagerDeltaTime/0.016666667;
                    if dir > maxdir then
                        dir = maxdir;
                    elseif dir < -maxdir then
                        dir = -maxdir;
                    end
                end
                this.neckAngle = this.neckAngle + dir;

                if this.neckAngle > 360 then
                    this.neckAngle = this.neckAngle % 360;
                end

                if this.neckAngle < 0 then
                    this.neckAngle = 360 - this.neckAngle;
                end

                if this.neckAngle < 270  and this.neckAngle > 180 then
                    this.neckAngle = 270;
                elseif this.neckAngle > 90 and this.neckAngle <= 180 then
                    this.neckAngle = 90;
                end

                return this.neckAngle;
            end
            return 0;
        end,

        calcDegForEnd = function(this,unit,boneName)

            local targetangle = this.neckAngleDeffault;
            -- local angle = unit:getSkeleton():getBoneRotation(boneName);
        
            --local angle = this.neckAngle;
            if targetangle < 0 then
                targetangle = 360 + targetangle;
            end


            local dir = targetangle - this.neckAngle;

            if dir > 180 then
                dir = -(360 - dir);
            end

            if dir < -180 then
                dir = (360 + dir);
            end

            if dir ~= 0 then
                local maxdir = 1 * unitManagerDeltaTime/0.016666667;
                if dir > maxdir then
                    dir = maxdir;
                elseif dir < -maxdir then
                    dir = -maxdir;
                end
            end
            this.neckAngle = this.neckAngle + dir;

            if this.neckAngle > 360 then
                this.neckAngle = this.neckAngle % 360;
            end

            if this.neckAngle < 0 then
                this.neckAngle = 360 - this.neckAngle;
            end

            -- if this.neckAngle < 270  and this.neckAngle > 180 then
            --     this.neckAngle = 270;
            -- elseif this.neckAngle > 90 and this.neckAngle <= 180 then
            --     this.neckAngle = 90;
            -- end
            print(dir);
            return this.neckAngle;
        end,

        startFire = function(this,unit)
            local headangle = unit:getSkeleton():getBoneRotation("head");

            this.neckAngle = headangle;
            this.neckAngleDeffault = headangle;
            print("start fire");
            return 1;
        end,

        gravityStart = function(this,unit)
            local ishost = megast.Battle:getInstance():isHost();

            if not ishost then 
                return 0; 
            end


            local units = {};
            local tgt = nil;

            --生きてるユニットだけテーブルに突っ込む
            for i = 0,3 do
                local uni = megast.Battle:getInstance():getTeam(true):getTeamUnit(i);
                if uni ~= nil and uni:getHP() > 0 then
                    table.insert(units,uni);
                end
            end

            --生きてるユニットのテーブルからランダムで１体選ぶ　PTが一人しかいない場合でも容赦なく殺すように変更
            if table.maxn(units) >= 1 then
                local rand = LuaUtilities.rand(table.maxn(units)) + 1;--luaのテーブルは１からスタート
                tgt = units[rand];
            end

            --吸引対象に設定
            if tgt ~= nil then
                this.glabTarget = tgt;
                megast.Battle:getInstance():sendEventToLua(this.uniqueID,2,tgt:getIndex());
                tgt:resumeUnit();

                this.addStanBuff(this,unit,tgt);
                this.currentGlabPhase = this.glabPhase.gravity;
                this.dejyonCounter = 0;
                this.glabTargetPositions.x = tgt:getPositionX();
                this.glabTargetPositions.y = tgt:getPositionY();
            end

            return 1;
        end,

        addStanBuff = function(this,unit,target)
            local buffArgs = {
                number = -99,
                effectId = 89,
                parcentage = 100,
                duration = 1,
                iconID = 0
            };
            target:getTeamUnitCondition():addCondition(buffArgs.number,buffArgs.effectId,buffArgs.parcentage,buffArgs.duration,buffArgs.iconID);
        end,

        gravityEnd = function(this,unit)
            this.currentGlabPhase = this.glabPhase.hold;
            return 1;
        end,

        hideUnit = function(this,unit)
            this.currentGlabPhase = this.glabPhase.fade;

            return 1;
        end,

        glabControll = function(this,unit,deltatime)
            --闇ドラゴンの吸引対象ユニットの吸引とデジョン中の動きの制御　この制御を受けるユニットは0.1秒のスタンを毎フレーム受ける
            this.dejyonCounter = this.dejyonCounter + deltatime;
            
            if this.glabTarget ~= nil then
                if this.glabTarget:getTeamUnitCondition():findConditionWithID(500151) == nil then
                    this.glabTarget:getTeamUnitCondition():addCondition(500151,114,this.glabTarget:getCalcHPMAX()/(this.consts.dejyonDuration -1),35,2);
                    this.glabTarget:getTeamUnitCondition():addCondition(500152,10,-30,15);
                    this.glabTarget:playSummary(this.messages.mess17,true);
                end
            end

            if this.dejyonCounter > this.consts.dejyonDuration then
                print("闇ドラゴン　除外時間終了");
                this.currentGlabPhase = this.glabPhase.finish;
            end

            if this.currentGlabPhase == this.glabPhase.gravity then
                this.gravityWork(this,unit,deltatime);
                this.addStanBuff(this,unit,this.glabTarget);
            elseif this.currentGlabPhase == this.glabPhase.fade then
                this.gravityWork(this,unit,deltatime);
                this.fadeOutUpdate(this,unit);
                this.addStanBuff(this,unit,this.glabTarget);
            elseif this.currentGlabPhase == this.glabPhase.hold then
                if this.glabTarget == nil then
                    return;
                end
                this.addStanBuff(this,unit,this.glabTarget);
                this.glabTarget:setPosition(this.glabTarget:getPositionX(),-1000);--バトルから除外されている間はとりあえず地面に埋めておく
            end



            if this.currentGlabPhase == this.glabPhase.finish then
                local buff = this.glabTarget:getTeamUnitCondition():findConditionWithID(500151);
                if buff ~= nil then
                    this.glabTarget:getTeamUnitCondition():removeCondition(buff);
                end
                local buff2 = this.glabTarget:getTeamUnitCondition():findConditionWithID(500152);
                if buff2 ~= nil then
                    this.glabTarget:getTeamUnitCondition():removeCondition(buff2);
                end
                this.glabTarget:getSkeleton():setPosition(0,1000);--解放するときは上空から落とす
                this.glabTarget:setOpacity(255);
                this.glabTarget:resumeUnit();
                this.currentGlabPhase = this.glabPhase.none;
                if this.glabTarget:getBurstPoint() < 0 then
                    this.glabTarget:setBurstPoint(0);
                end

                this.glabTarget = nil;
            end

            return 1;
        end,

        gravityWork = function(this,unit,deltatime)
            if this.glabTarget == nil then
                return;
            end
            local tgt = this.glabTarget;
            local bonePosition = {
                x = unit:getPositionX() + unit:getSkeleton():getBoneWorldPositionX("DAMAGEAREA"),
                y = unit:getPositionY() + unit:getSkeleton():getBoneWorldPositionY("DAMAGEAREA")
            }
            local tgtx = this.glabTargetPositions.x;
            local tgty = this.glabTargetPositions.y;


            local rad = getRad(tgtx,tgty,bonePosition.x,bonePosition.y);
            local moveSpeed = this.gravityPower * deltatime;
            

            if this.getDistance(tgtx,tgty,bonePosition.x,bonePosition.y) < moveSpeed then
                tgt:setPosition(bonePosition.x,bonePosition.y);
            else
                tgt:setPosition(tgtx + math.cos(rad) * moveSpeed,tgty + math.sin(rad) * moveSpeed);
                this.glabTargetPositions.x = tgtx + math.cos(rad) * moveSpeed;
                this.glabTargetPositions.y = tgty + math.sin(rad) * moveSpeed;
            end
            
        end,

        fadeOutUpdate = function(this,unit)
            frameRate = unitManagerDeltaTime/0.016666667;
            
            local uni = this.glabTarget;
            if uni ~= nil then
                opa = uni:getOpacity() - 10 * frameRate;
                if opa < 0 then--アンダーフローさせないため
                    opa = 0;
                end
                uni:setOpacity(opa);
            end
            
            return 1;
        end,

        getDistance = function(x1,y1,x2,y2)
            local squareResult = (x1 - x2) * (x1 - x2) + (y1 - y2)*(y1 - y2);
            return math.sqrt(squareResult);
        end,

        getRage = function(this,unit)
            
            unit:getTeamUnitCondition():addCondition(-11,25,10,2000,9);
            unit:getTeamUnitCondition():addCondition(-12,24,20,2000,0);
            this.rageSPUpValue = 40;
            this.isRage = true;
            local message1 = this.messages.mess18;

            local mess1Color = {
                r = 255,
                g = 255,
                b = 255
            };
            

            local messageDuration = 4;

            BattleControl:get():pushEnemyInfomation(message1,mess1Color.r,mess1Color.g,mess1Color.b,messageDuration);
            return 1;
        end,

        rageEnd = function(this,unit)
            
            if this.isRage then
                this.isRage = false;
                this.rageTimer = 0;
                this.rageSPUpValue = 20;
                unit:setAttackDelay(this.attackdelayOriginal);
                unit:takeAnimation(1,"setUpNormal",true);
                

                local randomRange = 2;
                local hpRivision = 5 - (5 * unit:getHP()/unit:getCalcHPMAX());

                this.rageCoolTurnCount = hpRivision + math.random(randomRange) - randomRange/2 ;

                local buff =  unit:getTeamUnitCondition():findConditionWithID(-12);
                if not(buff == nil) then
                    local conditon = unit:getTeamUnitCondition():findConditionWithID(-12);
                    unit:getTeamUnitCondition():removeCondition(conditon);
                end
                
                local buff2 =  unit:getTeamUnitCondition():findConditionWithID(-11);
                if not(buff2 == nil) then
                    local conditon = unit:getTeamUnitCondition():findConditionWithID(-11);
                    unit:getTeamUnitCondition():removeCondition(conditon);
                end
                
            end

            local message1 = this.messages.mess19;

            local mess1Color = {
                r = 255,
                g = 255,
                b = 255
            };
            

            local messageDuration = 4;

            BattleControl:get():pushEnemyInfomation(message1,mess1Color.r,mess1Color.g,mess1Color.b,messageDuration);

            return 1;
        end,

        -- endFire = function(this,unit)
        --     this.isFireEnd = true;
            
        --     return 1;
        -- end,

        --共通変数
        param = {
          version = 1.3
          ,isUpdate = true
        },

        --共通処理

        --マルチでキャストされてきたものを受け取るメソッド
        --receive + 番号　という形式で
        --引数にはintが渡る
        receive1 = function (this , intparam)
            this.rageEnd(this,this.myself);
            return 1;
        end,

        receive2 = function (this , intparam)
            this.glabTarget = megast.Battle:getInstance():getTeam(true):getTeamUnit(intparam);
            if this.glabTarget == nil then
                return 1;
            end
            this.currentGlabPhase = this.glabPhase.gravity;
            this.dejyonCounter = 0;
            this.glabTargetPositions.x = this.glabTarget:getPositionX();
            this.glabTargetPositions.y = this.glabTarget:getPositionY();
            return 1;
        end,
        
        receive3 = function (this , intparam)
            this.executeHPTrigger(this,this.myself,intparam);
            return 1;
        end,

        --run scriptで呼ばれる。引数と文字列だけが渡ってくるので文字列を見て内部で何を呼び出すのか分岐させてください。
        --共通処理以外のものを書いたらここに登録して分岐
        -- 例：test1というメソッドを書いてそれをspineから呼び出す場合 if str == "test1" then return this.test1(this,unit) end のような感じです。
        --分岐先でのreturnは必須です。
        run = function (this , unit , str)
            if str == "targetLock" then return this.targetLock(this,unit) end
            if str == "fire" then return this.fire(this,unit) end
            if str == "setFire" then return this.setFire(this,unit) end

            if str == "addSP" then return this.addSP(this,unit) end
            if str == "startFire" then return this.startFire(this,unit) end
            if str == "gravityStart" then return this.gravityStart(this,unit) end
            if str == "gravityEnd" then return this.gravityEnd(this,unit) end
            if str == "hideUnit" then return this.hideUnit(this,unit) end
            -- if str == "getRage" then return this.getRage(this,unit) end
            -- if str == "endFire" then return this.endFire(this,unit) end
            return 1;
        end,

        --version 1.3
        takeBreakeDamageValue = function (this,unit,enemy,value)
            return value;
        end,

        takeBreake = function (this,unit)
            if this.isRage then
                this.rageEnd(this,unit);
                unit:takeAnimation(1,"setUpNormal",true);
                if this.glabTarget ~= nil then
                    this.currentGlabPhase = this.glabPhase.finish;
                end
            end
            return 1;
        end,

        --versiton1.2
        endWave = function (this , unit , waveNum)
            return 1;
        end,

        startWave = function (this , unit , waveNum)
            this.showMessage(this.messages.mess9,this.colors.yellow,5);
            return 1;
        end,

        --version1.1
        update = function (this , unit , deltatime)
            this.buffTimer = this.buffTimer + deltatime;
            this.attack5Counter = this.attack5Counter + deltatime;
            this.updateDelayItems(this,deltatime);
            if this.targetUnits ~= nil then
                local targetCnt = table.maxn(this.targetUnits);
                if targetCnt > 0 then
                    for i = 1,targetCnt do
                        if this.targetUnits[i]:getHP() > 0 and this.targetUnits[i]:getTeamUnitCondition():findConditionWithID(-14) == nil then
                            this.targetUnits[i]:getTeamUnitCondition():addCondition(-14,17,50,9999,26,9);
                            this.targetUnits[i]:getTeamUnitCondition():addCondition(-15,21,-20,9999,20);
                            this.targetUnits[i]:getTeamUnitCondition():addCondition(-16,101,100,9999,58);
                        end
                    end
                end
            end


            local burn = unit:getTeamUnitCondition():findConditionWithType(97);
            local burnbuff =  unit:getTeamUnitCondition():findConditionWithID(500158);
            if burnbuff ~= nil and burn ~= nil then
                if unit:getTeamUnitCondition():findConditionWithID(500159) == nil then
                    unit:getTeamUnitCondition():addCondition(500159,28,50,9999,7);
                    this.showMessage(this.messages.mess4,this.colors.red,5,7);
                    unit:setAttackDelay(0);
                end
            elseif burnbuff ~= nil and burn == nil then
                if unit:getTeamUnitCondition():findConditionWithID(500159) ~= nil then
                    local conditon = unit:getTeamUnitCondition():findConditionWithID(500159);
                    unit:getTeamUnitCondition():removeCondition(conditon);
                    this.showMessage(this.messages.mess12,this.colors.red,5);
                    unit:setAttackDelay(this.attackdelayOriginal);
                end
            end

            if this.isLockOn then
                this.attack5ArmControll(this,unit);
            end
            if this.glabTarget ~= nil then
                this.glabControll(this,unit,deltatime);
            end

            local ishost = megast.Battle:getInstance():isHost();

            if this.isRage and ishost then
                this.rageTimer = this.rageTimer + deltatime;
                if this.rageTimer > this.consts.rageDuration then
                    this.rageEnd(this,unit);
                    megast.Battle:getInstance():sendEventToLua(this.uniqueID,1,1);
                end
            end
            return 1;
        end,

        attackDamageValue = function (this , unit , enemy , value)
            local stanBuff =  unit:getTeamUnitCondition():findConditionWithID(500157);
            if stanBuff ~= nil then
                enemy:getTeamUnitCondition():addCondition(5001510,89,100,3,79);
            end
            return value;
        end,

        takeDamageValue = function (this , unit , enemy , value)
            local buff =  unit:getTeamUnitCondition():findConditionWithID(5001513);
            if buff ~= nil then
                local skillType = unit:getTeamUnitCondition():getDamageAffectInfo().skillType;
                if skillType ==3 or skillType == 6 or skillType == 2 then
                    return value*0.5;
                end
            end

            return value;
        end,

        --version1.0
        start = function (this , unit)
            unit:setSPGainValue(0);
            this.attackdelayOriginal = unit:getAttackDelay();
            this.myself = unit;
            unit:takeAnimation(1,"setUpNormal",true);
            this.attack5Counter = 30;
        --    unit:takeAnimation(1,"setUpNormal",true);
            this.rageCoolTurnCount = this.consts.rageCoolTurn;--初回怒りは５０％切ればスタート直後からでも発動するようにしておく
            unit:setZOderOffset(-100);--若干後ろに表示させたい
            return 1;
        end,

        excuteAction = function (this , unit)
           
            this.isLockOn = false;
            this.isFireEnd = false;
            local ishost = megast.Battle:getInstance():isHost();
            if ishost then
                this.checkHPTrigger(this,unit);
            end

            return 1;
        end,

        takeIdle = function (this , unit)
            if not this.isRage then
                --unit:setNextAnimationName("zcloneNidle");
            end
            return 1;
        end,

        takeFront = function (this , unit)
          
            return 1;
        end,

        takeBack = function (this , unit)
            if not this.isRage then
                --unit:setNextAnimationName("zcloneNback");
            end
            return 1;
        end,

        takeAttack = function (this , unit , index)
            print("takeAttack");
            local ishost = megast.Battle:getInstance():isHost();
            if ishost then
                local target = unit:getTargetUnit() 
                local distance = BattleUtilities.getUnitDistance(unit,target)

                -- local hpparcent = 100 * unit:getHP()/unit:getCalcHPMAX();

                -- if this.attackChecker == false and hpparcent < this.consts.rageHP and not this.isRage and this.rageCoolTurnCount > this.consts.rageCoolTurn then
                --     this.attackChecker = true;
                --     this.getRage(this,unit);
                --     unit:takeAttack(5);
                --    return 0;
                -- end

                if this.attack5Counter > 45 and unit:getTeamUnitCondition():findConditionWithID(500155) == nil then
                    this.attackChecker = true;
                    this.attack5Counter = 0;
                    unit:takeAttack(5);
                   return 0;
                end
        
                if distance > 400 and this.attackChecker == false then
                    this.attackChecker = true
                    unit:takeAttack(3)
                    return 0;
                elseif this.attackChecker == false then

                    this.attackChecker = true;
                    local rand = math.random(100);
                    if rand <= this.rates.attack3 then
                        unit:takeAttack(3);
                    elseif  rand <=  this.rates.attack3 + this.rates.attack2 then
                        unit:takeAttack(2);
                    elseif rand <= 100 then
                        unit:takeAttack(4);
                    end
                    return 0;
                end
                this.attackChecker = false;
            end

            this.rageCoolTurnCount = this.rageCoolTurnCount + 1;
            
            if index == 1 then
                if not this.isRage then
                    --なぜかsetNextAnimationNameだと角度計算がおかしくなるためここだけtakeAnimationで対処
                    --unit:takeAnimation(0,"zcloneNattack3",false);
                    -- return 0;
                end
            elseif index == 2 then
                if not this.isRage then
                    --unit:setNextAnimationName("zcloneNattack2");
                end
                unit:setActiveSkill(2);
            elseif index == 3 then
                if not this.isRage then
                    --unit:setNextAnimationName("zcloneNattack3");
                end
                unit:setActiveSkill(3);
            elseif index == 4 then
                if not this.isRage then
                    --unit:setNextAnimationName("zcloneNattack4");
                end
                unit:setActiveSkill(4);
            elseif index == 5 then
                if not this.isRage then
                    --unit:setNextAnimationName("zcloneNattack5");
                    unit:setActiveSkill(5);
                end
            end

            return 1;
        end,

        takeSkill = function (this,unit,index)
            if index == 1 then
                unit:setActiveSkill(6);
                if not this.isRage then
                    --unit:setNextAnimationName("zcloneNskill1");
                    unit:setActiveSkill(6);
                end
                
            elseif index == 2 then
                if not this.isRage then
                    --unit:setNextAnimationName("zcloneNskill2");
                end
                unit:setActiveSkill(7);
            elseif index == 3 then
                unit:setActiveSkill(4);
            elseif index == 4 then
                unit:setActiveSkill(5);
            end
            local ishost = megast.Battle:getInstance():isHost();
            if ishost then
                if this.skillChecker == false then
                    this.skillChecker = true;
                    local rand = math.random(100);
                    if rand <= this.rates.skill1 then
                        unit:takeSkill(1);
                    elseif rand <= 100 then
                        unit:takeSkill(2);
                    end
                    return 0;
                end
                this.skillChecker = false;
            end
            unit:setBurstState(kBurstState_active);               
            return 1;
        end,

        takeDamage = function (this , unit)
            if not this.isRage then
                --unit:setNextAnimationName("zcloneNdamage");
            end
            if this.glabTarget ~= nil then
                this.currentGlabPhase = this.glabPhase.finish;
            end
            return 1;
        end,

        dead = function (this , unit)
            if not this.isRage then
                --unit:setNextAnimationName("zcloneNout");
            end
            return 1;
        end
    }
    register.regist(instance,id,instance.param.version);
    return 1;
end


function getDeg(startx,starty,targetx,targety)
    return radToDeg(getRad(startx,starty,targetx,targety))

end

function getRad(startx,starty,targetx,targety)
    return math.atan2(targety-starty,targetx-startx)
end

function degToRad(deg)
    return deg * 3.14/180;
end

function radToDeg(rad)
    return rad * 180/3.14;
end
