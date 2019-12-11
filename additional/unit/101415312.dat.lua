function new(id)
    print("101414312 new ");
    local instance = {

        --ネリムクラス
        Class = 
        {
            --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆

            --Values
            isFirstStepUpdate = false,

            --uniqueID
            ThisUniqueId = id,

            --ThisUnit
            ThisUnit = nil,


            IsReraise = false,

            myself = nil,



            --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆


            --初期化
            Initialize = function(this,unit)
                this.Class.myself = unit;
                return 1;
            end,

            --アップデート最初の一度のみ実行される。
            FirstUpdateInitialize = function(this,unit)

                this.Class.ThisUnit = unit;
                if unit:getParameter("isRinascita") ~= "TRUE" then
                    unit:getTeamUnitCondition():addCondition(-44,0,0,10000,37);
                end
                
                return 1;
            end,

            --アップデート
            Update = function(this,unit,deltatime)

                if this.Class.isFirstStepUpdate == false then

                    this.Class.FirstUpdateInitialize(this,unit);
                    this.Class.isFirstStepUpdate = true;
                
                end

                for i = 0,7 do
                    local teamUnit = unit:getTeam():getTeamUnit(i,true);
                    if teamUnit ~= nil then
                    	
                    	
                        local controll = teamUnit:isMyunit() or teamUnit:getisPlayer() == false;
                        if teamUnit:getHP() > 0 and unit:getTeam():getTeamUnit(i) == nil then
                        		    
                    		if teamUnit:getParent() then
	                    		teamUnit:removeFromParent();
	                    	end
	                    	if controll then
                        		unit:getTeam():reviveUnit(teamUnit:getIndex()); 		
                            	teamUnit:setOpacity(255);
                                local targetHP = teamUnit:getCalcHPMAX()*0.3 >= 1 and teamUnit:getCalcHPMAX()*0.3 or 1;
                                teamUnit:setHP(targetHP);
                            end
                            
                        end
                    end
                end

                return 1;
            end,

            --LunScript
            --if str == "runSkillAttack" then return this.Class.runSkillAttack(this,unit) end
            runScriptUpdate = function(this , unit , str)

                if str == "RunReraise" then return this.Class.RunReraise(this,unit) end
                return 1;
            end,

            --アタック分岐
            takeAttackBranch = function(this,unit,index)
                return 1;
            end,

            --スキル分岐用
            takeSkillBranch = function(this,unit,index)
                return 1;
            end,

            --アイドル分岐用
            takeIdleBranch = function(this,unit)
                return 1;
            end,

            --だめーじ分岐用
            takeDamageBranch = function(this,unit)
                return 1;
            end,

            --死亡分岐用
            takeDeadBranch = function(this,unit)

                if unit:getParameter("isRinascita") ~= "TRUE" then
                    --完全復活
                    if this.Class.isControllTarget(this,unit) then
                        this.Class.Reraise(this,unit);
                        this.Class.RequestSendEventToLua(this,unit,1,0);
                    end
                    return 0;
                end

                return 1;
            end,

            --ブレイク分岐用
            takeBreakeBranch = function(this,unit)
                return 1;
            end,

            --excureAction分岐用
            excuteActionBranch = function(this,unit)
                return 1;
            end,

            --receive分岐用
            receiveBranch_1 = function(this,intparam)
                this.Class.Reraise(this,this.Class.myself);
                return 1;
            end,

            receiveBranch_2 = function(this,intparam)
                return 1;
            end,

            --attackDamageValue分岐用
            attackDamageValueBranch = function(this , unit , enemy , value)
                return value;
            end,

            --takeDamageValue分岐用
            takeDamageValueBranch = function(this , unit , enemy , value)
                return value;
            end,

            --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆

            --Functions
            Reraise = function(this,unit)

                unit:setUnitState(kUnitState_skill);
                unit:setBurstState(kBurstState_active);
                unit:takeAnimation(0,"reraise",false);
                unit:takeAnimationEffect(0,"1_reraise",false);
                unit:setInvincibleTime(1.8);
                unit:setHP(1);
                -- this.Class.RunReraise(this,unit);
                return 1;
            end,

            RunReraise = function(this,unit)
                local ptLength = unit:getTeam():getIndexMax();

                for i = 0,7 do
                    local teamUnit = unit:getTeam():getTeamUnit(i,true);
                    if teamUnit ~= nil then
                    	
                    	
                        local controll = teamUnit:isMyunit() or teamUnit:getisPlayer() == false;
                        if teamUnit:getHP() <= 0 then
                        		    
                            if teamUnit ~= unit then
                        		if teamUnit:getParent() then
		                    		teamUnit:removeFromParent();
		                    	end
		                    	if controll then
	                        		unit:getTeam():reviveUnit(teamUnit:getIndex()); 		
	                            	
	                                local targetHP = teamUnit:getCalcHPMAX()*0.3 >= 1 and teamUnit:getCalcHPMAX()*0.3 or 1;
                                    teamUnit:setHP(targetHP);
	                            end
                            end
    
                            
                        end
                    end
                end
                local buff =  unit:getTeamUnitCondition():findConditionWithID(-44);
                if not(buff == nil) then
                    local conditon = unit:getTeamUnitCondition():findConditionWithID(-44);
                    unit:getTeamUnitCondition():removeCondition(conditon);
                end
                unit:setParameter("isRinascita","TRUE");   --復活！
                unit:setHP(unit:getCalcHPMAX());
                unit:setBurstPoint(100);
                unit:getTeamUnitCondition():addCondition(101413,17,100,10,26);
                

                return 1;
            end,

            --sendEventToLua
            RequestSendEventToLua = function(this,unit,requestIndex,intparam)

              
                print("----------リクエストを受付開始 ID == ",intparam);
                megast.Battle:getInstance():sendEventToLua(this.Class.ThisUniqueId,requestIndex,intparam);
                

                return 1;
            end,

            isControllTarget = function(this,unit)
                if unit:isMyunit() then
                    return true;
                end
                if not unit:getisPlayer() then
                    return megast.Battle:getInstance():isHost();
                end

            end,

            --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
        },




        --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
        --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
        --☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆



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
            return this.Class.receiveBranch_1(this,intparam);
        end,
        receive2 = function (this , intparam)
            return this.Class.receiveBranch_2(this,intparam);
        end,

        --run scriptで呼ばれる。引数と文字列だけが渡ってくるので文字列を見て内部で何を呼び出すのか分岐させてください。
        --共通処理以外のものを書いたらここに登録して分岐
        -- 例：test1というメソッドを書いてそれをspineから呼び出す場合 if str == "test1" then return this.test1(this,unit) end のような感じです。
        --分岐先でのreturnは必須です。
        run = function (this , unit , str)
            return this.Class.runScriptUpdate(this,unit,str);
        end,

        --version1.3
        takeBreakeDamageValue = function (this,unit,enemy,value)
            return value;
        end,

        takeBreake = function (this,unit)
            return this.Class.takeBreakeBranch(this,unit);
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
            return this.Class.Update(this,unit,deltatime);
        end,

        attackDamageValue = function (this , unit , enemy , value)
            return this.Class.attackDamageValueBranch(this,unit,enemy,value);
        end,

        takeDamageValue = function (this , unit , enemy , value)
            return this.Class.takeDamageValueBranch(this,unit,enemy,value);
        end,

        --version1.0
        start = function (this , unit)
            return this.Class.Initialize(this,unit);
        end,

        excuteAction = function (this , unit)
            return this.Class.excuteActionBranch(this,unit);
        end,

        takeIdle = function (this , unit)
            return this.Class.takeIdleBranch(this,unit);

        end,

        takeFront = function (this , unit)
          
            return 1;
        end,

        takeBack = function (this , unit)
         
            return 1;
        end,

        takeAttack = function (this , unit , index)
            return this.Class.takeAttackBranch(this,unit,index);
        end,

        takeSkill = function (this,unit,index)
            return this.Class.takeSkillBranch(this,unit,index);
        end,

        takeDamage = function (this , unit)
            return this.Class.takeDamageBranch(this,unit);
        end,

        dead = function (this , unit)
            return this.Class.takeDeadBranch(this,unit);
        end
    }
    register.regist(instance,id,instance.param.version);
    return 1;
end

