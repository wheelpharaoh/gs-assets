function new(id)
    --このスクリプトは　ユニットボス　ロイのluaです
    print("500331293 new ");
    local instance = {
        thisID = id, --生成時に渡されたidを保持しておく（マルチの同期に使う）
        unitinfo = {
            new = function (_bullet,_targetUnit,_otherparam)
                return {
                    bullet = _bullet,
                    targetUnit = _targetUnit,
                    otherParam = _otherparam,
                    frame = 0,
                    angle = 0,
                    posx = 0,
                    posy = 0,
                    speedkeisuu = 1,
                    state = 0
                }
            end
        },
        allEnemys = {},
        attackChecker = false,
        skillChecker = false,
        selfBullet = nil,
        moveFlag = false,
        muki = 1,
        isPlayerUnit = true,
        myself = nil,
        counterTimer = 0,
        counterTargetIndex = nil,
        coolTimes = {},
        coolTimeMemory = {},
        skill3Counter = 0,
        chargePhase = 1,
        chargeSkillHP = {50,20,10},
        chargeSkillFlag = false,
        chargeTimer     = 0,
        skillCT         = 7,
        buff            = false,



        attackMove = function (this,bulletinstance)
            print("move");
            local framecnt = bulletinstance.frame;
            if framecnt == 0 then
                bulletinstance.posx = bulletinstance.bullet:getPositionX();
                bulletinstance.posy = bulletinstance.bullet:getPositionY();
            end
            local framecnt = bulletinstance.frame;
            local currentbullet = bulletinstance.bullet;
            local sp = 25;
            local speedOrigin = 25;
            local bullettarget = megast.Battle:getInstance():getTeam(not this.isPlayerUnit):getTeamUnit(bulletinstance.targetUnit);
            if bullettarget == nil then
                this.moveFlag = false;
                this.selfBullet = nil;
                this.myself:resumeUnit();
                return 0;
            end
            local bulletx = bulletinstance.bullet:getPositionX() + this.muki * (bulletinstance.bullet:getSkeleton():getBoneWorldPositionX("MAIN"));
            local bullety = bulletinstance.bullet:getPositionY();
            local targetx = -350 + bullettarget:getPositionX() - this.muki * (bullettarget:getSkeleton():getBoneWorldPositionX("MAIN"));
            local targety = bullettarget:getPositionY();

            local targetxM = bullettarget:getPositionX() - this.muki * bullettarget:getSkeleton():getBoneWorldPositionX("MAIN");

            bulletinstance.angle = getDeg(bulletx,bullety,targetx,targety);
            local distance = math.sqrt((bulletx - targetx)*(bulletx - targetx) + (bullety - targety)*(bullety - targety));

            local skeleton = this.myself:getSkeleton();
            local scale = skeleton:getScaleX();
            -- if framecnt == 0 then
                if this.isPlayerUnit then
                    if bulletx < targetxM then
                        --skeleton:setScaleX(-1);
                    else
                        skeleton:setScaleX(1);
                    end
                else
                    if bulletx > targetxM  then
                        --skeleton:setScaleX(-1);
                    else
                        skeleton:setScaleX(1);
                    end
                end
            -- end
            

            if math.abs(bulletx - targetx) > 200 then
                sp = speedOrigin * unitManagerDeltaTime/0.016666667;
                if sp > distance then
                    sp = distance;
                end
                moveByFloat(bulletinstance,calcXDir(degToRad(bulletinstance.angle),sp),calcYDir(degToRad(bulletinstance.angle),sp));
            else
                this.moveFlag = false;
                this.selfBullet = nil;
                this.myself:resumeUnit();
            end
            return 1;
        end,

        pause = function (this,unit)
            this.moveFlag = true;

            --ターゲットユニットを狙う。　スキルカウンターの対象がいればそれを狙う
            local index = nil;
            if unit:getTargetUnit() ~= nil then
                index = unit:getTargetUnit():getIndex();
            end
            if this.counterTargetIndex ~= nil then
                index = this.counterTargetIndex;
            end


            this.selfBullet = this.unitinfo.new(unit,index,0);
            unit:pauseUnit();
            return 1;
        end,

        skill1End = function (this,unit)
            this.counterFlag = false;
            return 1;
        end,

        askCounter = function(this,unit)
            local state = unit:getUnitState();
            if state ~= kUnitState_attack and state ~= kUnitState_skill then
                return true;
            end
            return false;
        end,

        addSP = function (this,unit)
            if this.buff == true then 
                unit:addSP(20);
            else
                unit:addSP(10);
            end
            return 1;
        end,

        --共通変数
        param = {
          version = 1.2
          ,isUpdate = 1
        },

        --共通処理

        --マルチでキャストされてきたものを受け取るメソッド
        --receive + 番号　という形式で
        --引数にはintが渡る
        receive1 = function (this , intparam)
        --スキルの使用
            if intparam == 1 then
                this.myself:takeSkill(1);
            elseif intparam == 2 then
                this.myself:takeAttack(2);
            elseif intparam == 3 then
                this.myself:takeAttack(3);
            elseif intparam == 4 then
                this.myself:takeAttack(4);
            elseif intparam == 5 then
                this.myself:takeAttack(5);
            end
                
            return 1;
        end,
        receive2 = function (this , intparam)
        --スキルの使用
            this.chargeSkill();    
        
            return 1;
        end,

        --run scriptで呼ばれる。引数と文字列だけが渡ってくるので文字列を見て内部で何を呼び出すのか分岐させてください。
        --共通処理以外のものを書いたらここに登録して分岐
        -- 例：test1というメソッドを書いてそれをspineから呼び出す場合 if str == "test1" then return this.test1(this,unit) end のような感じです。
        --分岐先でのreturnは必須です。
        run = function (this , unit , str)
            if str == "pause" then return this.pause(this,unit) end
            if str == "skill1End" then return this.skill1End(this,unit) end
            if str == "addSP" then return this.addSP(this,unit) end
            if str == "chargeEnd" then return this.chargeEnd(this,unit) end    
            if str == "skillcheck" then return this.skillcheck(this,unit) end                        
            return 1;
        end,

        chargeEnd = function (this,unit)
            unit:takeAnimation(0,"charge",true);
            unit:takeAnimationEffect(0,"charge",true);

            return 1;
        end,

        skillcheck = function (this,unit)
            
            local ishost = megast.Battle:getInstance():isHost();
            if ishost then               
                   -- チャージ技分岐
                    this.chargeSkillFlag = false;  
                    local max = table.maxn(this.chargeSkillHP);
                    if max >= this.chargePhase and this.chargeTimer > 5 then
                        local targetHP = this.chargeSkillHP[this.chargePhase];
                        local hp = unit:getHPPercent() * 100;
                        if targetHP > hp then
                            this.chargeskill(this,unit);
                            this.chargePhase = this.chargePhase + 1;
                            return 0;
                        end            
                    end                
                
                    --特殊技分岐
                    if this.chargeTimer > this.skillCT then
                        if this.buff == true then
                           this.chargeTimer = LuaUtilities.rand(5);
                        else
                           this.chargeTimer = 0;
                        end
                        this.attackChecker = true;
                                                                        
                        local target = unit:getTargetUnit();
                        if target == nil then
                            return 0;
                        end
                       
                        if target:getPositionX() > 280 then
                            unit:takeAttack(5);
                            megast.Battle:getInstance():sendEventToLua(this.thisID,1,5);
                        else 
                            local rand = LuaUtilities.rand(0,100);
                            if rand <= 30 then
                                unit:takeAttack(2);
                                megast.Battle:getInstance():sendEventToLua(this.thisID,1,2);
                            elseif rand <= 60 then
                                unit:takeAttack(3);
                                megast.Battle:getInstance():sendEventToLua(this.thisID,1,3);
                            elseif rand <= 80 then
                                unit:takeSkill(1);
                                megast.Battle:getInstance():sendEventToLua(this.thisID,1,1);
                            else
                                unit:takeAttack(4);
                                megast.Battle:getInstance():sendEventToLua(this.thisID,1,4);
                            end
                        end
                    return 0;
                    end
                end
            return 1;
        end,

        --versiton1.2
        endWave = function (this , unit , waveNum)
            return 1;
        end,

        startWave = function (this , unit , waveNum)
            unit:setSize(3);
            return 1;
        end,

        --version1.1
        update = function (this , unit , deltatime)
            this.chargeTimer = this.chargeTimer + deltatime;
            if this.moveFlag then
                this.attackMove(this,this.selfBullet);
            end
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
            unit:setAttackDelay(0);
            this.myself = unit;
            this.isPlayerUnit = unit:getisPlayer();
            unit:setSPGainValue(0);
            --自分から見て敵側のユニットを全部取得(ユニットは最大でも６体までなので６回)
            for i = 0,6 do
                --指定されたインデックスでユニットを取得
                local uni = megast.Battle:getInstance():getTeam(not unit:getisPlayer()):getTeamUnit(i);
                if uni ~= nil then
                    table.insert(this.allEnemys,uni);
                end
            end
            unit:setItemSkill(0,100071199);
            table.insert(this.coolTimeMemory,os.time() -15);
            table.insert(this.coolTimeMemory,os.time() -15);
            table.insert(this.coolTimes,15);
            table.insert(this.coolTimes,15);

            return 1;
        end,

        excuteAction = function (this , unit)                    
            unit:setSetupAnimationName("");
            skeleton = unit:getSkeleton();
            
            skeleton:setScaleX(1);
            
           if this.buff == false and unit:getHPPercent() < 0.4 then
                this.buff = true;
                BattleControl:get():pushEnemyInfomationWithConditionIcon("HP自然回復",35,0,255,0,6);
                --BattleControl:get():pushEnemyInfomationWithConditionIcon("行動速度アップ",7,220,220,0,6);
                
                unit:getTeamUnitCondition():addCondition(-1,7,500,60,35,11);
                --unit:getTeamUnitCondition():addCondition(-1,28,20,999,7,9);
           end
            
            return 1;
        end,

        takeIdle = function (this , unit)
            local rand = LuaUtilities.rand(0,100);
            if rand <= 100 and unit:getPositionX() > 180 then
                unit:takeBack();
                return 0;
            end
            unit:setSetupAnimationName("");
            this.chargeSkillFlag = false;
                        
            return 1;
        end,

        takeFront = function (this , unit)
          
            return 1;
        end,

        takeBack = function (this , unit)
         
            return 1;
        end,

        takeAttack = function (this , unit , index)   
            unit:setSize(1);    
            if this.chargeTimer > this.skillCT then
                this.skillcheck(this,unit);
                return 0;
            end
            if index == 1 then
                unit:setActiveSkill(1);
            elseif index == 2 then
                unit:setActiveSkill(2);
            elseif index == 3 then
                unit:setActiveSkill(3);
            elseif index == 4 then
                unit:setActiveSkill(4);            
            elseif index == 5 then
                unit:setActiveSkill(6);            
            end
            return 1;
        end,

        takeSkill = function (this,unit,index)
            local ishost = megast.Battle:getInstance():isHost();
            if ishost and this.skillChecker == false then
                this.skillChecker = true;
                if this.chargeSkillFlag == true then
                    unit:setSetupAnimationName("chargeset");
                    unit:takeSkill(5);
                    unit:setSize(1);    
                    this.chargeTimer = 5;
                    return 0;
                end
            end
            
            if index == 1 then
                unit:setActiveSkill(5);
            elseif index == 2 then
                unit:setActiveSkill(7);
            elseif index == 5 then
                unit:setActiveSkill(8);       
            end

            this.skillChecker = false;
            return 1;
        end,

        takeDamage = function (this , unit)
            unit:setSetupAnimationName("");
            skeleton = unit:getSkeleton();
          
            skeleton:setScaleX(1);
             
            this.counterFlag = false;
            
            this.chargeSkillFlag = false;
            this.skillChecker = false;
            return 1;
        end,

        dead = function (this , unit)
            return 1;
        end,
        
        chargeskill = function (this , unit)
            if megast.Battle:getInstance():isHost() == true then
                megast.Battle:getInstance():sendEventToLua(this.thisID,2,0);
            end
            unit:setBurstPoint(0);
            unit:takeAnimation(0,"skill4",true);
            unit:takeAnimationEffect(0,"none",true);
            this.chargeSkillFlag = true;
            unit:setUnitState(kUnitState_attack);
            
            BattleControl:get():pushEnemyInfomation("蒼竜水翔剣『改式』の構え",0,128,255,4);
            return 1;
        end
    }
    register.regist(instance,id,instance.param.version);
    return instance.param.isUpdate;
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

function calcXDir(rad,speed)
    return math.cos(rad)*speed;
end

function calcYDir(rad,speed)
    return math.sin(rad)*speed;
end

function move(node,movex,movey)
    node:setPosition(node:getPositionX()+movex,node:getPositionY()+movey);
    return 1;
end

function moveByFloat(_bulletinstance,xdistance,ydistance)
    _bulletinstance.bullet:setPosition(_bulletinstance.posx+xdistance,_bulletinstance.posy+ydistance);
    _bulletinstance.posx = _bulletinstance.posx+xdistance;
    _bulletinstance.posy = _bulletinstance.posy+ydistance;
    return true;
end
