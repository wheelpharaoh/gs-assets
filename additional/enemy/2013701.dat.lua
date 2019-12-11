local Bootstrap, Color, Random, Utility = summoner.import("Bootstrap", "Color", "Random", "Utility")
local class = summoner.Bootstrap.createEnemyClass({label="エイシス", version=1.3, id=2013701});
class:inheritFromUnit("unitBossBase");

--使用する通常攻撃とその確率
class.ATTACK_WEIGHTS = {
    ATTACK1 = 50,
    ATTACK2 = 50
}

--使用する奥義とその確率
class.SKILL_WEIGHTS = {
   SKILL2 = 1,
   SKILL3 = 0,
   SKILL5 = 0
}

class.ACTIVE_SKILLS = {
    ATTACK1 = 1,
    SKILL1 = 2, -- スキル
    SKILL2 = 3, -- 奥義
    SKILL3 = 4, -- 真奥義
    SKILL4 = 6, -- 最終真奥義
    SKILL5 = 5  -- 特殊真奥義
}

function class:setBuffBoxList()
   self.BUFF_BOX_LIST = {
      [0] = {
         ID = 20131431,
         BUFF_ID = 13, -- 攻撃力
         VALUE = 200,
         DURATION = 999999,
         ICON = 3
      },
      [1] = {
         ID = 20131432,
         BUFF_ID = 28, -- 行動速度
         VALUE = 30,
         DURATION = 999999,
         ICON = 7
      },
      [2] = {
         ID = 20131433,
         BUFF_ID = 110, -- 回復量
         VALUE = -120,
         DURATION = 999999,
         ICON = 162
      },
      [3] = {
         ID = 20131434,
         BUFF_ID = 1, -- Effectだけほしい
         VALUE = 0,
         DURATION = 999999,
         ICON = 0,
         EFFECT = 9
      },
      [4] = {
         ID = 20131435,
         BUFF_ID = 21, -- ダメージ軽減
         VALUE = -60,
         DURATION = 60,
         ICON = 5,
         EFFECT = 1
      },
      [5] = {
         ID = 20131436,
         BUFF_ID = 17, -- ダメージUP
         VALUE = 100,
         DURATION = 999999,
         ICON = 26
      },
      [6] = {
         ID = 20131437,
         BUFF_ID = 17, -- ダメージUP
         VALUE = 50,
         DURATION = 999999,
         ICON = 26
      }
   }

   self.TIME_UP_BUFF_LIST = {
      [1] = {
         ID = 20131438,
         BUFF_ID = 17, -- ダメージUP
         VALUE = 1000,
         DURATION = 999999,
         ICON = 26
      },
      [2] = {
         ID = 20131439,
         BUFF_ID = 7, -- 自然回復
         VALUE = 200000,
         DURATION = 999999,
         ICON = 35,
         EFFECT = 11
      }
   }
end

--------[[メッセージ]]--------
function class:setMessageBoxList()

   self.START_MESSAGE_LIST = {
      [1] = {
         MESSAGE = self.TEXT.START_MESSAGE1 or "被ダメージ軽減・命中率アップ",
         COLOR = Color.yellow,
         DURATION = 6.5,
         isPlayer = false        
      },
      [2] = {
         MESSAGE = self.TEXT.START_MESSAGE2 or "水属性ダメージ無効",
         COLOR = Color.yellow,
         DURATION = 6.5,
         isPlayer = false        
      },
      [3] = {
         MESSAGE = self.TEXT.START_MESSAGE3 or "状態異常の敵にクリティカル率アップ",
         COLOR = Color.yellow,
         DURATION = 6.5,
         isPlayer = false        
      }
   }
   self.HP70_MESSAGE_LIST = {
      [1] = {
         MESSAGE = self.TEXT.HP70_MESSAGE1 or "少し遊んでやるか",
         COLOR = Color.green,
         DURATION = 5,
         isPlayer = false
      },
      [2] = {
         MESSAGE = self.TEXT.HP70_MESSAGE2 or "与ダメージアップ",
         COLOR = Color.yellow,
         DURATION = 5,
         isPlayer = false
      }
   }
   self.HP50_MESSAGE_LIST = {
      [1] = {
         MESSAGE = self.TEXT.HP50_MESSAGE1 or "己の無力さを思い知るがいい",
         COLOR = Color.green,
         DURATION = 6.5,
         isPlayer = false
      },
      [2] = {
         MESSAGE = self.TEXT.HP50_MESSAGE2 or "攻撃力アップ・相手の回復量ダウン",
         COLOR = Color.yellow,
         DURATION = 6.5,
         isPlayer = false
      }
   }
   self.HP30_MESSAGE_LIST = {

      [1] = {
         MESSAGE = self.TEXT.HP30_MESSAGE1 or "真の力…見せてやろう",
         COLOR = Color.green,
         DURATION = 5,
         isPlayer = false
      },
      [2] = {
         MESSAGE = self.TEXT.HP30_MESSAGE2 or "奥義ゲージ・行動速度・与ダメージアップ",
         COLOR = Color.yellow,
         DURATION = 6.5,
         isPlayer = false
      }
   }
   self.LAST_MESSAGE_LIST = {
      [1] = {
         MESSAGE = self.TEXT.LAST_MESSAGE1 or "やるな…だが、これは受けきれまい",
         COLOR = Color.green,
         DURATION = 5,
         isPlayer = false
      },
      [2] = {
         MESSAGE = self.TEXT.LAST_MESSAGE2 or "庇う無効・被ダメージ軽減無効",
         COLOR = Color.yellow,
         DURATION = 5,
         isPlayer = false
      }
   }
   self.END_MESSAGE_LIST = {
      [1] = {
         MESSAGE = self.TEXT.END_MESSAGE1 or "見事だ…",
         COLOR = Color.green,
         DURATION = 5,
         isPlayer = false
      }      
   }
   self.TIME_UP_MESSAGE_LIST = {
      [1] = {
         MESSAGE = self.TEXT.TIMEUP_MESSAGE1 or "そろそろ終わらせるか",
         COLOR = Color.green,
         DURATION = 5,
         isPlayer = false
      }        
   }
   
end

--------[[特殊行動]]--------
function class:setTriggerList()
   self.TRIGGERS = {
      [1] = {
         tag = "HP_FLG",
         action = function (status) self:hp70(status) end,
         HP = 70,
         used = false
      },
      [2] = {
         tag = "HP_FLG",
         action = function (status) self:hp50(status) end,
         HP = 50,
         used = false
      },
      [3] = {
         tag = "HP_FLG",
         action = function (status) self:hp30(status) end,
         HP = 30,
         used = false
      },
      [4] = {
         tag = "OTHER",
         action = function (status) self:lastSkill(status) end,
         used = false
      },
      [5] = {
         tag = "OTHER",
         action = function (status) self:showEndMessage(status) end,
         used = false
      },
      [6] = {
         tag = "OTHER",
         action = function (status) self:extreme(status) end,
         used = false
      }
   }

   self.HP_TRIGGERS = {}
   for index,trigger in pairs(self.TRIGGERS) do
      if trigger.tag == "HP_FLG" then
         self.HP_TRIGGERS[index] = trigger
      end
   end
end

function class:setSkillWeight(skill2,skill3,skill5)
   self.SKILL_WEIGHTS = {
      SKILL2 = skill2,
      SKILL3 = skill3,
      SKILL5 = skill5
   }
end

function class:hp70(status)
   if status == "use3" then
      self:setSkillWeight(3,1,0)
      self.isRage = true
      self.isFury = true
      self:showMessage(self.HP70_MESSAGE_LIST)
      self:execAddBuff(self.gameUnit,self.BUFF_BOX_LIST[6])
      self.gameUnit:addSP(100)
   end
end

function class:hp50(status)
   if status == "use3" then
      self:setSkillWeight(1,1,0)
      self.isRage = true
      self.isFury = true
      self:showMessage(self.HP50_MESSAGE_LIST)
      self:execAddBuff(self.gameUnit,self.BUFF_BOX_LIST[0])
      for i = 0,4 do
         local teamUnit = megast.Battle:getInstance():getTeam(true):getTeamUnit(i)
         if teamUnit ~= nil then
            self:execAddBuff(teamUnit,self.BUFF_BOX_LIST[2])
         end
      end
      self.gameUnit:addSP(100)
   end
end

function class:hp30(status)
   if status == "use3" then
      self:setSkillWeight(0,3,1)
      self.spValue = 40
      self:execAddBuff(self.gameUnit,self.BUFF_BOX_LIST[1])
      self:execAddBuff(self.gameUnit,self.BUFF_BOX_LIST[5])
      self:showMessage(self.HP30_MESSAGE_LIST)
   end
end

function class:lastSkill(status)
   if status == "use3" then
      for i = 0,4 do
         local teamUnit = megast.Battle:getInstance():getTeam(true):getTeamUnit(i)
         if teamUnit ~= nil then
            teamUnit:setHP(1)
         end
      end

      self.lastSkilled = true
      self.gameUnit:setInvincibleTime(8)
      self.gameUnit:setHP(1)
      self.gameUnit:addSP(100)
      self:execAddBuff(self.gameUnit,self.BUFF_BOX_LIST[3])
      self:showMessage(self.LAST_MESSAGE_LIST)
   end
end

function class:showEndMessage(status)
   if status == "use3" then
      self:showMessage(self.END_MESSAGE_LIST)
   end
end

function class:extreme(status)
   if status == "use3" then
      self:showMessage(self.TIME_UP_MESSAGE_LIST)
      self:addBuff(self.gameUnit,self.TIME_UP_BUFF_LIST)
   end
end

---------------------------------------------------------------------------------
-- start
---------------------------------------------------------------------------------
function class:start(event)
   self.fromHost = false;
   self.gameUnit = event.unit;
   self.spValue = 20;
   self.attackCheckFlg = false;
   self.skillCheckFlg = false;
   self.skillCheckFlg2 = false;
   event.unit:setSPGainValue(0);
   event.unit:setSkillInvocationWeight(0);

   self.isRage = false
   self.isFury = false
   self.isDead = false
   self.lastSkilled = false
   self.deadTimer = 0
   self.sliceValue = math.ceil(5000 / 25)

   self.isOver = false
   self.timer = 0
   self.timeUp = 600

   self:setMessageBoxList()
   self:setTriggerList()
   self:setBuffBoxList()

   self:execAddBuff(self.gameUnit,self.BUFF_BOX_LIST[4])
   self:showMessage(self.START_MESSAGE_LIST)
   return 1
end

---------------------------------------------------------------------------------
-- update
---------------------------------------------------------------------------------
function class:update(event)
   self:HPTriggersCheck(event.unit)
   self:timeUpCounter(event.deltaTime)

   if self.lastSkilled then
      if self.deadTimer > 10 then
         self.isDead = true
         event.unit:setHP(0)
      else
         event.unit:setHP(1)
         self.deadTimer = self.deadTimer + event.deltaTime
      end
   end

   if self.isDead then
      megast.Battle:getInstance():sendEventToLua(self.scriptID,4,0)
   end


   return 1
end

function class:receive4(event)
   self.isDead = true
   self:showMessage(self.END_MESSAGE_LIST)
   self.gameUnit:setHP(0)
   return 1
end

function class:timeUpCounter(deltaTime)
   if not self.isOver and self.timer > self.timeUp then
      self:execTrigger(6)
      self.isOver = true
   else 
      self.timer = self.timer + deltaTime
   end
end

---------------------------------------------------------------------------------
-- dead
---------------------------------------------------------------------------------
function class:dead(event)
   if not megast.Battle:getInstance():isHost() then
      if not self.isDead then
         event.unit:setHP(1)
         return 0
      end
   end

   if not self.lastSkilled then
      self:execTrigger(4)
      return 0
   end

   if not self.isDead then
      self.gameUnit:setHP(1)
      return 0
   end
   self:execTrigger(5)
   megast.Battle:getInstance():sendEventToLua(self.scriptID,4,0)
   return 1
end

---------------------------------------------------------------------------------
-- run
---------------------------------------------------------------------------------
function class:run(event)
   if event.spineEvent == "lastAttack" then
      self:sliceHP(event.unit)
   end
   if event.spineEvent == "dead" then
      self.isDead = true
      event.unit:setHP(0)
      -- self:checkAlive(event.unit)
   end
   return 1
end

function class:sliceHP(unit)
   for i = 0,4 do
      local teamUnit = megast.Battle:getInstance():getTeam(true):getTeamUnit(i)
      if teamUnit ~= nil and teamUnit:getHP() >= 1 then
         local minus = teamUnit:getHP() - self.sliceValue

         teamUnit:setHP(minus)
         teamUnit:takeDamagePopup(unit,self.sliceValue)
      end
   end
end

-- function class:checkAlive(unit)
--    for i = 0,4 do
--       local teamUnit = megast.Battle:getInstance():getTeam(true):getTeamUnit(i)
--       if teamUnit ~= nil then
--          self:execTrigger(5)
--          break
--       end
--    end
-- end

---------------------------------------------------------------------------------
-- takeAttack
---------------------------------------------------------------------------------
function class:takeAttack(event)
   if not self.attackCheckFlg and megast.Battle:getInstance():isHost() then
      self.attackCheckFlg = true;
      return self:attackReroll(event.unit);
   end
   self.attackCheckFlg = false;
   if not megast.Battle:getInstance():isHost() and not self.fromHost then
      event.unit:takeIdle();
      return 0;
   end

   self.fromHost = false;
   self:attackActiveSkillSetter(event.unit,event.index);
   self:addSP(event.unit);
   return 1
end

function class:attackReroll(unit)
   local attackStr = summoner.Random.sampleWeighted(self.ATTACK_WEIGHTS);
   local attackIndex = string.gsub(attackStr,"ATTACK","");

   if tonumber(attackIndex) == 1 then
      unit:takeAttack(tonumber(attackIndex));
   else
      self.skillCheckFlg = true;
      unit:takeSkill(1);
      megast.Battle:getInstance():sendEventToLua(self.scriptID,2,tonumber(1));
      return 0;
   end
   megast.Battle:getInstance():sendEventToLua(self.scriptID,1,tonumber(attackIndex));
   return 0;
end

function class:addSP(unit)  
   unit:addSP(self.spValue);
   return 1;
end

---------------------------------------------------------------------------------
-- takeSkill
---------------------------------------------------------------------------------
function class:takeSkill(event)
   if not self.skillCheckFlg and megast.Battle:getInstance():isHost() then
      self.skillCheckFlg = true;
      return self:skillReroll(event.unit);
   end

   if not megast.Battle:getInstance():isHost() and not self.fromHost then
      event.unit:takeIdle();
   return 0;
   end

   if event.index >= 3 and not self.skillCheckFlg2 then
      if event.index == 3 and not self.isFury then
      else
         self.skillCheckFlg2 = true;
         event.unit:takeSkillWithCutin(event.index,1);
         return 0;
      end
   end

   self.skillCheckFlg = false;
   self.skillCheckFlg2 = false;
   self.fromHost = false;

   -- 特殊真奥義のときだけActiveSkillを手動で変える
   if self.isFury then
      self.isFury = false
      event.unit:setActiveSkill(self.ACTIVE_SKILLS.SKILL5)
   else
      self:skillActiveSkillSetter(event.unit,event.index);
   end
   return 1
end


function class:skillReroll(unit)
   local skillStr = summoner.Random.sampleWeighted(self.SKILL_WEIGHTS);
   local skillIndex = string.gsub(skillStr,"SKILL","");

   if skillIndex == "5" then
      self.isFury = true
      skillIndex = 3
      megast.Battle:getInstance():sendEventToLua(self.scriptID,5,0);
   end

   if self.isRage then
      self.isRage = false
      skillIndex = 3
   end

   if self.lastSkilled then
      skillIndex = 4
   end

   unit:takeSkill(tonumber(skillIndex));
   megast.Battle:getInstance():sendEventToLua(self.scriptID,2,tonumber(skillIndex));
   return 0;
end

function class:receive5(event)
   self.isFury = true
   return 1
end

--===================================================================================================================
--トリガー
--===================================================================================================================
function class:HPTriggersCheck(unit)
   if not self:getIsHost() then
      return;
   end

   local hpRate = summoner.Utility.getUnitHealthRate(unit) * 100;

   for index,trigger in pairs(self.HP_TRIGGERS) do
      if trigger.HP >= hpRate and not trigger.used then
         self:execTrigger(index)
      end
   end
end

-- トリガー実行。ホストのみ使用可能
function class:execTrigger(index,receiveNumber)
   if not self:getIsHost() or index == nil or table.maxn(self.TRIGGERS) < index then
      return
   end

   receiveNumber = receiveNumber ~= nil and receiveNumber or 3

   local action = "use" .. receiveNumber

   self.TRIGGERS[index].action(action)
   self.TRIGGERS[index].used = true

   if receiveNumber ~= 0 then
      megast.Battle:getInstance():sendEventToLua(self.scriptID,receiveNumber,index)
   end
end

function class:getIsHost()
   return megast.Battle:getInstance():isHost();
end

--===================================================================================================================
-- メッセージ関係
--===================================================================================================================
function class:showMessage(messageBoxList,index)
   if index == nil then 
      self:showMessageAll(messageBoxList)
   return
   end
   self:execShowMessage(messageBoxList[index])
end

function class:showMessageAll(messageBoxList)
   for i,messageBox in pairs(messageBoxList) do
      self:execShowMessage(messageBox)
   end
end

function class:showMessageRange(messageBoxList,start,finish)
   for i = start,finish do
      self:execShowMessage(messageBoxList[i])
   end
end

function class:execShowMessage(messageBox)
   if messageBox.isPlayer then
      summoner.Utility.messageByPlayer(messageBox.MESSAGE,messageBox.DURATION,messageBox.COLOR);
   else
      summoner.Utility.messageByEnemy(messageBox.MESSAGE,messageBox.DURATION,messageBox.COLOR);
   end
end

---------------------------------------------------------------------------------
-- receive
---------------------------------------------------------------------------------
function class:receive3(args)
   self.TRIGGERS[args.arg].action("use3")
   return 1
end

--===================================================================================================================
-- バフ関係
--===================================================================================================================
-- バフ指定実行。indexがない時はバフボックスの中身を全部実行
function class:addBuff(unit,buffBoxList,index)
    if index == nil then 
        self:addBuffAll(unit,buffBoxList)
        return
    end
    self:execAddBuff(unit,buffBoxList[index])
end

-- startからfinishまでのバフを実行する
function class:addBuffRange(unit,buffBoxList,start,finish)
    for i = start,finish do
        self:execAddBuff(unit,buffBoxList[i])
    end
end

function class:addBuffAll(unit,buffBoxList)
   for i,buffBox in pairs(buffBoxList) do
      self:execAddBuff(unit,buffBox)
   end
end

-- バフ処理実行
function class:execAddBuff(unit,buffBox)
    local buff  = nil;
    if buffBox.EFFECT ~= nil then
        buff = unit:getTeamUnitCondition():addCondition(buffBox.ID,buffBox.BUFF_ID,buffBox.VALUE,buffBox.DURATION,buffBox.ICON,buffBox.EFFECT);
    else
        buff = unit:getTeamUnitCondition():addCondition(buffBox.ID,buffBox.BUFF_ID,buffBox.VALUE,buffBox.DURATION,buffBox.ICON);
    end
    if buffBox.SCRIPT ~= nil then
        buff:setScriptID(buffBox.SCRIPT);
    end
    if buffBox.SCRIPTVALUE1 ~= nil then
        buff:setValue1(buffBox.SCRIPTVALUE1);
    end

    if buffBox.COUNT ~= nil then
        if buffBox.COUNT < buffBox.COUNT_MAX then
            buff:setNumber(buffBox.COUNT)
            megast.Battle:getInstance():updateConditionView()
            buffBox.COUNT = buffBox.COUNT + 1
            buffBox.VALUE = self.ougiBuffValue * buffBox.COUNT
         else
           buff:setNumber(10)
           megast.Battle:getInstance():updateConditionView()
        end
    end
end


class:publish();

return class;