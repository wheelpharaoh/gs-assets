--光ドラゴン
function new(id)
    print("10000 new ");
    local instance = {
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

        messages = summoner.Text:fetchByEnemyID(2005533),


        rates = {
            --通常攻撃の確率　アタック３は使わない
            attack1 = 20,
            attack2 = 35,
            attack4 = 45,

            --スキルの確率
            skill1 = 50,
            skill2 = 50
        },

        consts = {
            rageHP = 90, --怒り状態に移行するHP １００分率
            rageCoolTurn = 5, --怒りが収まってから次の怒り状態に移行するまでの必要行動数
            rageCoolTurnLast = 3, --怒りが収まってから次の怒り状態に移行するまでの必要行動数[後半]
            rageCoolTurnLastHP = 30 -- rageCoolTurnLastを見るようになるHP割合
        },

        targetLock = function (this,unit)
            this.isLockOn = true;
            this.neckAngle = 321;
            return 1;
        end,

        fire = function (this,unit)
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

        setFire = function (this,unit)
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

        explosion = function (this,unit)
            -- local shot = this.myself:addOrbitSystem("explosion",0)
            -- -- shot:EnabledFollow = true;
            -- local x = unit:getPositionX();
            -- local y = unit:getPositionY();
            -- -- local xb = this.myself:getSkeleton():getBoneWorldPositionX("head");
            -- -- local yb = this.myself:getSkeleton():getBoneWorldPositionY("head");
            
            -- shot:setPosition(x + math.cos(degToRad(this.shotAngle))*321,y + math.sin(degToRad(this.shotAngle))*321);
            -- shot:setActiveSkill(1);
            return 1;
        end,

        attack5ArmControll = function(this,unit)
            this.boneRotation(this,unit,"head");
            return 1;
        end,

        boneRotation = function (this,unit,boneName)
            if not this.isFireEnd then
                unit:getSkeleton():setBoneRotation(boneName,this.calcDeg(this,unit,boneName));
            else
                unit:getSkeleton():setBoneRotation(boneName,this.calcDegForEnd(this,unit,boneName));
            end
            return 1;
        end,

        addSP = function (this , unit)
            print("addSP");
            if this.isRage then
                 unit:addSP(40);
            else
                 unit:addSP(20);            
            end
            return 1;
        end,

        calcDeg = function(this,unit,boneName)
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
            if str == "explosion" then return this.explosion(this,unit) end
            if str == "addSP" then return this.addSP(this,unit) end
            if str == "startFire" then return this.startFire(this,unit) end
            -- if str == "endFire" then return this.endFire(this,unit) end
            return 1;
        end,

                --version 1.3
        takeBreakeDamageValue = function (this,unit,enemy,value)
            return value;
        end,

        takeBreake = function (this,unit)
            if this.isRage then
                this.isRage = false;
                this.rageCoolTurnCount = 0;
                unit:setAttackDelay(this.attackdelayOriginal);
                unit:setSetupAnimationName("setUpNormal");
                local buff =  unit:getTeamUnitCondition():findConditionWithID(-12);
                if not(buff == nil) then
                    local conditon = unit:getTeamUnitCondition():findConditionWithID(-12);
                    unit:getTeamUnitCondition():removeCondition(conditon);
                    local conditon = unit:getTeamUnitCondition():findConditionWithID(-13);
                    unit:getTeamUnitCondition():removeCondition(conditon);
                end
            end
            return 1;
        end,

        --versiton1.2
        endWave = function (this , unit , waveNum)
            return 1;
        end,

        startWave = function (this , unit , waveNum)
            BattleControl:get():pushEnemyInfomation(this.messages.mess1,255,255,0,8);
            return 1;
        end,

        --version1.1
        update = function (this , unit , deltatime)
            if this.isLockOn then
                this.attack5ArmControll(this,unit);
            end
            this:countDownItem(unit,deltatime);
            return 1;
        end,

        attackDamageValue = function (this , unit , enemy , value)
            return value;
        end,

        takeDamageValue = function (this , unit , enemy , value)

            if this.isRage then
                --value = 0;
            end
            
            -- if value == 1 then
            --     return 0;
            -- end

            return value;
        end,

        --version1.0
        start = function (this , unit)
            unit:setSPGainValue(0);
            this.attackdelayOriginal = unit:getAttackDelay();
            this.myself = unit;
            unit:setSetupAnimationName("setUpNormal");
            this.rageCoolTurnCount = this.consts.rageCoolTurn;--初回怒りは５０％切ればスタート直後からでも発動するようにしておく
            unit:setZOderOffset(-100);--若干後ろに表示させたい
            this.itemTimer = 28;

            this.items = {};

            --使うアイテム
            this.items[0] = {
                NAME = "",
                ID = 105162500,
                INVINCIBLE = 0
            }

            this:setItems(unit);
            return 1;
        end,

        excuteAction = function (this , unit)
            this.isLockOn = false;
            this.isFireEnd = false;
            local hpparcent = 100 * unit:getHP()/unit:getCalcHPMAX();

            local rageturn = this.consts.rageCoolTurn;
            
            if hpparcent < this.consts.rageCoolTurnLastHP then
                rageturn = this.consts.rageCoolTurnLast;
            end

            if hpparcent < this.consts.rageHP and not this.isRage and this.rageCoolTurnCount > rageturn and unit.m_breaktime <= 0 then
                this.isRage = true;
                this.attackChecker = true;

                
                unit:setAttackDelay(this.attackdelayOriginal/2);
                unit:takeAttack(5);
                unit:setSetupAnimationName("setUpFire");
                
                -- local cond1 = unit:getTeamUnitCondition():addCondition(-12,21,-100,2000,24); --物理ダメージカット
                -- cond1:setScriptID(2);
                -- local cond2 =unit:getTeamUnitCondition():addCondition(-13,27,50,2000,31); --魔法ダメージのブレイク値増加
                -- cond2:setScriptID(3);

                
                BattleControl:get():pushEnemyInfomationWithConditionIcon(this.messages.mess2,31,255,255,0,8);
                -- BattleControl:get():pushEnemyInfomation(this.messages.mess3,0,255,0,8);

               return 0;
            end
            return 1;
        end,

        takeIdle = function (this , unit)
            if not this.isRage then
                unit:setNextAnimationName("zcloneNidle");
            end
            return 1;
        end,

        takeFront = function (this , unit)
          
            return 1;
        end,

        takeBack = function (this , unit)
            if not this.isRage then
                unit:setNextAnimationName("zcloneNback");
            end
            return 1;
        end,

        takeAttack = function (this , unit , index)
            print("takeAttack");

            local ishost = megast.Battle:getInstance():isHost();
            if ishost then
                this:itemCheck(unit);
                local target = unit:getTargetUnit() 
                local distance = BattleUtilities.getUnitDistance(unit,target)
        
                if distance > 400 and this.attackChecker == false then
                    this.attackChecker = true
                    unit:takeAttack(3)
                    return 0;
                elseif this.attackChecker == false then

                    this.attackChecker = true;
                    local rand = math.random(100);
                    if rand <= this.rates.attack1 then
                        unit:takeAttack(1);
                    elseif  rand <=  this.rates.attack1 + this.rates.attack2 then
                        unit:takeAttack(2);
                    elseif rand <= 100 then
                        unit:takeAttack(4);
                    end
                    return 0;
                end
                this.attackChecker = false;
            end
            
            if index == 1 then
                if not this.isRage then
                    --なぜかsetNextAnimationNameだと角度計算がおかしくなるためここだけtakeAnimationで対処
                    unit:takeAnimation(0,"zcloneNattack1",false);
                    return 0;
                end
            elseif index == 2 then
                if not this.isRage then
                    unit:setNextAnimationName("zcloneNattack2");
                end
                unit:setActiveSkill(2);
            elseif index == 3 then
                if not this.isRage then
                    unit:setNextAnimationName("zcloneNattack3");
                end
                unit:setActiveSkill(3);
            elseif index == 4 then
                if not this.isRage then
                    unit:setNextAnimationName("zcloneNattack4");
                end
                unit:setActiveSkill(4);
            elseif index == 5 then
                if not this.isRage then
                    unit:setNextAnimationName("zcloneNattack5");
                    unit:setActiveSkill(5);
                end
            end

            this.rageCoolTurnCount = this.rageCoolTurnCount + 1;
            return 1;
        end,

        takeSkill = function (this,unit,index)
            if index == 1 then
                unit:setActiveSkill(7);
                if not this.isRage then
                    unit:setNextAnimationName("zcloneNskill1");
                    unit:setActiveSkill(6);
                end
                
            elseif index == 2 then
                if not this.isRage then
                    unit:setNextAnimationName("zcloneNskill2");
                end
                unit:setActiveSkill(8);
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
            return 1;
        end,

        takeDamage = function (this , unit)
            if not this.isRage then
                unit:setNextAnimationName("zcloneNdamage");
            end
            return 1;
        end,

        dead = function (this , unit)
            if not this.isRage then
                unit:setNextAnimationName("zcloneNout");
            end
            return 1;
        end,

        --=====================================================================================================
        --アイテム使用関連のメソッド

        countDownItem = function(this,unit,delta)
            if megast.Battle:getInstance():getBattleState() ~= kBattleState_active then
                return;
            end
            this.itemTimer = this.itemTimer + delta;
            if this.itemTimer >= 30 then
                unit:setReduceHitStop(2,1);--ヒットストップ無効Lv2　9.5割軽減
            end
        end,

        itemCheck = function(this,unit)
            if this.itemTimer >= 30 and megast.Battle:getInstance():isHost() then
                this.itemTimer = 0;
                this:useItem(unit,0);
            end
        end,

        setItems = function(this,unit)
              for i = 0,table.maxn(this.items) do
                unit:setItemSkill(i,this.items[i].ID);
              end
        end,

        useItem = function(this,unit,index)
            unit:takeItemSkill(index);
            unit:takeAttack(0);
            local infoText = this.items[index].NAME;
            -- summoner.Utility.messageByEnemy(infoText,5,this.MESSAGE_COLOR);
            if this.items[index].INVINCIBLE > unit:getInvincibleTime() then
                unit:setInvincibleTime(this.items[index].INVINCIBLE);
            end
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

