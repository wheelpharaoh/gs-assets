------
-- 英語の定数群
------
local _NAME = "summoner.locale.en_us"
local _M = {}
local _G = _G

_M.UNITS = {
    [100616112] = {
        mess1 = "Emperor Flames"
    },
    --エスト
    [101144211] = {
        mess1 = "Intimidation Effect Activated"
    },
    [101145211] = {
        mess1 = "Intimidation Effect Activated"
    },
    [101146211] = {
        mess1 = "Intimidation Effect Activated"
    },

    --レム
    [101164511] = {
        mess1 = "VS Fire Elemental Bonus",
        mess2 = "VS Water Elemental Bonus",
        mess3 = "VS Earth Elemental Bonus",
        mess4 = "VS Light Elemental Bonus",
        mess5 = "VS Dark Elemental Bonus",
        mess6 = "No Elemental Bonus",
        mess7 = "Astrology: ",
        mess8 = "％"
    },

    [101165511] = {
        mess1 = "VS Fire Elemental Bonus",
        mess2 = "VS Water Elemental Bonus",
        mess3 = "VS Earth Elemental Bonus",
        mess4 = "VS Light Elemental Bonus",
        mess5 = "VS Dark Elemental Bonus",
        mess6 = "No Elemental Bonus",
        mess7 = "Astrology: ",
        mess8 = "％"
    },

    [102275112] = {
        mess1 = "Radiant Flora Itto-Ryu"
    },

    [102276112] = {
        mess1 = "Radiant Flora Itto-Ryu"
    },

    [102486112] = {
        BEFORE_MD = "Magia Drive",
        AFTER_MD = "EX Procyon Blast"
    },

    [102496312] = {
        BEFORE_MD = "Magia Drive",
        AFTER_MD = "Giga Grand Slam"
    },

    [102506212] = {
        BEFORE_MD = "Magia Drive",
        AFTER_MD = "Great Atem"
    },

    [102666112] = {
        BEFORE_MD = "Magia Drive",
        AFTER_MD = "Arcana: Sonic Flame Vortex"
    },

    [102676212] = {
        BEFORE_MD = "Magia Drive",
        AFTER_MD = "Raging Blaster"
    },

    [102525512] = {
        BEFORE_MD = "Magia drive",
        AFTER_MD = "Absolute Culling",
        MESSAGE1 = "Intimidation Effect Activated"
    },

    [102526512] = {
        BEFORE_MD = "Magia drive",
        AFTER_MD = "Absolute Culling",
        MESSAGE1 = "Intimidation Effect Activated"
    },

    [102686412] = {
        BEFORE_MD = "Demonic True Eclipse",
        AFTER_MD = "Crimson Blood"
    },

    [102516212] = {
        BEFORE_MD = "Magia Drive",
        AFTER_MD = "Arcana: Sonic Polar Vortex"
    },
    [107246112] = {
        mess1 = "I'm not gonna back down!"
    },

    --フレイダル
    [500081213] = {
        messageWind1 = "Storm Status: Evasion Rate UP",
        messageWind2 = "Storm Status: Arts Gauge Increase Speed UP",
        messageWindEnd = "Clear Storm Status"
    },

    --フレイダルコラボ用
    [501221213] = {
        messageWind1 = "Storm Status: Evasion Rate UP",
        messageWind2 = "Storm Status: Arts Gauge Increase Speed UP",
        messageWindEnd = "Clear Storm Status",
        messageCritical = "Critical when Freeze"
    },

    --緑命龍エルプネウマス
    [500133313] = {
        mess1 = "Rage Status: HP regen",
        mess2 = "Rage Status: Break Gauge regen",
        mess3 = "Rage Status: Burning Resistance DOWN",
        mess4 = "Clear Angry Status",
        mess5 = "Resume regen",
        mess6 = "Stop regen"
    },

    --フォスラディウス
    [500144413] = {
        mess1 = "Physical Damage Negated",
        mess2 = "Arts Gauge Boost UP",
        mess3 = "Break Gauge Restored"
    },

    --マヴロスキア
    [500155513] = {
        mess1 = "Rage Status: Break Power UP",
        mess2 = "Clear Angry Status"
    },

    -- 猛餓獣樹ゴロンドーラ
    [500201313] = {
        RAGE = "Rage Status"
    },

    --ミラ
    [500362193] = {
        mess1 = "Demon Killer",
        mess2 = "Earth Elemental Killer",
        mess3 = "Guts EX: Damage Inflicted UP",
        mess4 = "Guts EX: Movement Speed UP",
        mess5 = "Burning Critical",
        mess6 = "Phoenix EX: Won't fall & regen",
        mess7 = "Phoenix EX: Arts Gauge Speed UP",
        mess8 = "Phoenix EX: HP regen",
        mess9 = "Clear Phoenix Status"
    },

    --フェン
    [500382393] = {
        mess1 = "Ice Magic Sword \"Almas\"",
        mess2 = "Drakkeus Bolt",
        mess3 = "Underking Spear \"Hellfire\"",
        mess4 = "Demonsickle Evilscythe",
        mess5 = "Conquering Dragon Sword \"Gelmed\"",
        mess6 = "Relic「Force Keratos」",
        mess7 = "Heals Status Ailment",
        mess8 = "Sacred Crown「Raaz」EX",
        mess9 = "Status Ailment Resistance UP",
        mess10 = "Ru「I won't let you!!!」",
        mess11 = "Cruze's Pocket Watch EX",
        mess12 = "Enemy's Skill CT Speed DOWN",
        mess13 = "Monster Summon Stone EX",
        mess14 = "Inflict Paralyze & HP regenerates",
        mess15 = "Divine Glowing Arrow Cycnus",
        talk1 = "Rayas「I'm going all in, Fen!」",
        talk2 = "Fen「Hmph, as if you'd stand a chance.」",
        talk3 = "Rayas「I'll show you my powers!」"
    },

    --ゼイオルグ
    [500402493] = {
        mess1 = "Reduces Damage Taken by 50%",
        mess2 = "Damage 50% UP & Attack Speed UP",
        mess3 = "Last Stand"
    },

    --ガナン
    [500431193] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },

    [500442193] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },

    --ギリアム
    [500451393] = {
        mess1 = "Equipment Takes 3x Damage",
        mess2 = "Attack Speed UP",
        mess3 = "Activated Item for Giliam",
        mess4 = "Arts Damage"
    },

    [500462393] = {
        mess1 = "Equipment Takes 3x Damage",
        mess2 = "Attack Speed UP",
        mess3 = "Activated Item for Giliam",
        mess4 = "Arts Damage"
    },

    --イフリート
    [500641113] = {
        mess1 = "Water Elemental Magic Damage x2",
        mess2 = "Burning: Attack Speed UP",
        mess3 = "Clear Attack Speed UP"
    },

    --パルラミシア
    [500651213] = {
        mess1 = "Earth Elemental Resistance -40%",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP regen",
        mess5 = "HP regen amount UP"
    },

    --焔神官カロン
    [500681113] = {
        mess1 = "You must protect me!"
    },

    --黒ヴァル
    [500711513] = {
        mess1 = "Negates Status Ailment",
        mess2 = "Shadow Lightning Stance"
    },

    --CODE XTF : ERASER
    [500721013] = {
        mess1 = "Attack mode: Attack Speed UP",
        mess2 = "Normal mode: Stores Elemental Damage",
        mess3 = "Significant Decrease of DEF",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Elemental Energy",
        mess6 = "Water Elemental Energy",
        mess7 = "Earth Elemental Energy",
        mess8 = "Light Elemental Energy",
        mess9 = "Dark Elemental Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire Elemental Resistance UP",
        mess12 = "Water Elemental Resistance UP",
        mess13 = "Earth Elemental Resistance UP",
        mess14 = "Light Elemental Resistance UP",
        mess15 = "Dark Elemental Resistance UP",
        mess16 = "Clear Elemental Resistance",
        mess17 = "％"
    },

    --ラグシェルムファントム
    [500731513] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance",
        mess3 = "Sureshot"
    },

    --絶望ラグシェルムファントム
    [500741513] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance",
        mess3 = "Sureshot"
    },

    --被験体β
    [500771013] = {
        mess1 = "Attack Speed UP",
        mess2 = "Negates Magic Damage",
        mess3 = "Damage Inflicted UP",
        mess4 = "Critical Rate UP"
    },

    [500821513] = {
        mess1 = "ブレイク耐性アップ",
        mess2 = "DMG UP"
    },

    --クオン
    [500871413] = {
        mess1 = "3x DMG during Break"
    },

    [500872413] = {
        mess1 = "3x DMG during Break"
    },

    --エスト
    [500912213] = {
        mess1 = "Critical Rate 100%",
        mess2 = "Movement Speed UP",
        mess3 = "Arts Gauge regen",
        mess4 = "Movement Speed UP",
        mess5 = "50% less Damage"
    },

    --トニトゥルス（樹怪鳥）
    [500921313] = {
        messageWind1 = "Storm Status: Evasion Rate UP",
        messageWind2 = "Storm Status: HP regen",
        messageWindEnd = "Clear Storm Status"
    },

    --銀ヴァル
    [500931513] = {
        mess1 = "Shadow Lightning Stance [Evolved]",
        mess2 = "Damage Resistance DOWN",
        mess3 = "Fallen Cells Reactivated",
        mess4 = "Boss has targeted you!",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking."
    },

    --エドラム
    [500961412] = {
        mess1 = "Charge Speed UP",
        mess2 = "Damage x3 during Freezing"
    },

    [500962412] = {
        mess1 = "Charge Speed UP",
        mess2 = "Damage x3 during Freezing"
    },

    [501005213] = {
        mess1 = "Earth Damage x3"
    },

    [101715211] = {
        mess1 = "Negates Certain Damage"
    },

    --魔獣レイド用
    [501021113] = {
        mess1 = "Targeted by Boss!",
        mess2 = "+%d pt",
        mess3 = "Rage mode",
        mess4 = " defeated %d enemies",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking."
    },
  
    [500122213] = {
        mess1 = "Rage mode: Continous Damage",
        mess2 = "Clear Angry Status",
        mess3 = "Damage Resistance during Freeze",
        mess4 = "Break Damage Resistance during Freeze",
        mess5 = "HP regen during Freeze",
        mess6 = "Dragonic Cocytus",
        mess7 = "Physical Resistance"
    },

    --リシュリー
    [101846112] = {
        mess1 = "All Status UP"
    },

    --グロール
    [101825412] = {
        mess1 = "CRI rate %d％"
    },
    [101826412] = {
        mess1 = "CRI rate %d％"
    },

    [101945312] = {
        mess1 = "Critical%d％"
    },
    [101946312] = {
        mess1 = "Critical%d％"
    },

    [102176312] = {
        mess1 = "奥義ゲージアップ"
    },

    --メリア
    [101074511] = {
        text1 = "Skill Usable\nBE frequency UP",
        text2 = "Auto-barrier"
    },

    [101075511] = {
        text1 = "Skill Usable\nBE frequency UP",
        text2 = "Auto-barrier"
    },

    [101076511] = {
        text1 = "Skill Usable\nBE frequency UP",
        text2 = "Auto-barrier"
    },

    [101205412] = {
        text1 = "Reduces Damage",
    },

    --ミレニア
    [101725112] = {
        text1 = "Evasion Rate UP",
        text2 = "Critical%s",
        text3 = "Combo"
    },

    [101724112] = {
        text1 = "Evasion Rate UP",
        text2 = "Critical%s",
        text3 = "Combo"
    },

    --グランブレイブ
    [101754111] = {
        text1 = "Skill Recovery Speed UP"
    },
    [101755111] = {
        text1 = "Skill Recovery Speed UP"
    },

    --ナンバーツー
    [101785512] = {
        text1 = "Arts Gauge Absorb",
        text2 = "Blood Rage LV"
    },
    [101786512] = {
        text1 = "Arts Gauge Absorb",
        text2 = "Blood Rage LV",
        text3 = "God Rage LV"
    },

    --リアン
    [101796112] = {
        text1 = "Arts Damage UP",
        text2 = "Skill Recovery Speed UP"
    },
    [101795112] = {
        text1 = "Arts Damage UP",
        text2 = "Skill Recovery Speed UP"
    },

    --XTF CODE:SEEKER
    [500161013] = {
        text1 = "Attack Mode",
        text2 = "Barrier Mode"
    },

    --レグルス　ユニットボス
    [500941513] = {
        mess1 = "Critical Rate 100%",
    },

    [500971513] = {
        mess1 = "Damage towards Target UP",
        mess2 = "Halloween Nightmare",
        mess3 = "Sureshot"
    },

    [500981313] = {
        RAGE = "Rage Mode",
        ANTIDAMAGE = "Negates All DMG (except CRI DMG)",
        ANTICRITICAL = "Negates All DMG (except while Burning)",
        ANTIWATER = "Drain Water DMG",
        BARRIEREND = "Cancel DMG Negating",
        REGENATION = "HP Auto-recovery",
        BURN = "Stop Auto-recovery",
        RESTART = "Restart Auto-recovery",
        ANTIBURN = "Burn Resistance",
        TALK1 = "Welcome! Get ready!",
        TALK2 = "Not bad... But I ain't gonna lose!",
        TALK3 = "No, no way... Here's my last hope!",
        TALK4 = "NO WAAAAAAAAAAAAY!"
    },

    [501061113] = {
        mess1 = "ボスに狙われている！",
        telop1 = "ボスに狙われると被ダメージが増加します。",
        telop2 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop3 = "ボスに狙われています！",
        telop4 = "ランキングの結果によって、撃破時の報酬の個数が変化します。",
        telop5 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop6 = "ランキングの結果によって、撃破時の報酬の個数が変化します。"
    },

    [501071113] = {
        mess1 = "ボスに狙われている！",
        telop1 = "ボスに狙われると被ダメージが増加します。",
        telop2 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop3 = "ボスに狙われています！",
        telop4 = "ランキングの結果によって、撃破時の報酬の個数が変化します。",
        telop5 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop6 = "ランキングの結果によって、撃破時の報酬の個数が変化します。"
    },

    [501081113] = {
        mess1 = "ボスに狙われている！",
        telop1 = "ボスに狙われると被ダメージが増加します。",
        telop2 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop3 = "ボスに狙われています！",
        telop4 = "ランキングの結果によって、撃破時の報酬の個数が変化します。",
        telop5 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop6 = "ランキングの結果によって、撃破時の報酬の個数が変化します。"
    },

    [501091113] = {
        mess1 = "ボスに狙われている！",
        telop1 = "ボスに狙われると被ダメージが増加します。",
        telop2 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop3 = "ボスに狙われています！",
        telop4 = "ランキングの結果によって、撃破時の報酬の個数が変化します。",
        telop5 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop6 = "ランキングの結果によって、撃破時の報酬の個数が変化します。"
    },

    [501101513] = {
        mess1 = "ボスに狙われている！",
        telop1 = "ボスに狙われると被ダメージが増加します。",
        telop2 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop3 = "ボスに狙われています！",
        telop4 = "ランキングの結果によって、撃破時の報酬の個数が変化します。",
        telop5 = "ユニットが倒れた時は、入れ替えて戦いましょう。",
        telop6 = "ランキングの結果によって、撃破時の報酬の個数が変化します。"
    },

    [500071113] = {
        messageWind1 = "Storm Status: Evasion Rate UP",
        messageWindEnd = "Clear Storm Status",
        burn = "HP recovery while burning",
        burn2 = "Increases DMG while burning",
        burnEnd = "Stop HP recovery",
        critical = "Negates Critical"
    },
    [101885512] = {
        mess1 = "Insta-Kill"
    },
    [101886512] = {
        mess1 = "Insta-Kill"
    },

    --オージュレイド用
    [501111413] = {
        mess1 = "Targeted by Boss!",
        mess2 = "Fallen Cells Activated.",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking."
    },

    [101905412] = {
        mess1 = "Future Vision"
    },

    [101906412] = {
        mess1 = "Future Vision"
    },

    [501171513] = {
        mess1 = "Dark Elemental Resistance"
    },

    [501181313] = {
        mess1 = "Attack Speed UP",
        mess2 = "Negates Magic Damage",
        mess3 = "Damage Inflicted UP",
        mess4 = "Critical Rate UP",
        mess5 = "Earth Elemental Resistance",
        mess6 = "DEF UP during Break"
    },

    [501191413] = {
        mess1 = "Negates all DMG except Fire & Non-Elemental",
        mess2 = "HP Auto-recovery",
        mess3 = "Negates all DMG except Water & Non-Elemental",
        mess4 = "CRI rate UP",
        mess5 = "Negates all DMG except Earth & Non-Elemental",
        mess6 = "Freeze Attack",
        mess7 = "Negates DMG"
    },
    [501121513] = {
        mess1 = "Hgyuuu... Hngaah...",
        mess2 = "Greeegh... Gyuugh...",
        mess3 = "Skraaa... Skaaaargh..."
    },
    [501131513] = {
        mess1 = "Hgyuuu... Hngaah...",
        mess2 = "Greeegh... Gyuugh...",
        mess3 = "Skraaa... Skaaaargh..."
    },
    [501141513] = {
        mess1 = "Hgyuuu... Hngaah...",
        mess2 = "Greeegh... Gyuugh...",
        mess3 = "Skraaa... Skaaaargh..."
    },
    [501151513] = {
        mess1 = "Hgyuuu... Hngaah...",
        mess2 = "Greeegh... Gyuugh...",
        mess3 = "Skraaa... Skaaaargh..."
    },
    [501161513] = {
        mess1 = "Hgyuuu... Hngaah...",
        mess2 = "Greeegh... Gyuugh...",
        mess3 = "Skraaa... Skaaaargh..."
    },

    [107116112]={
        mess1 = "Sugimoto the Immortal"
    },

    [501251513] = {
        START_MESSAGE1 = "CRI rate UP to Poisoned enemy",
        START_MESSAGE2 = "CRI DMG UP to Blinded enemy",
        START_MESSAGE3 = "Accuracy rate UP",
        RAGE_MESSAGE1 = "Anger mode : CRI rate UP",
        DEAD_MESSAGE1 = "Villakurz' Praise",
        ATTACK4 = "Prize Mist"
    },
    [501311413] = {
        HP_REDUCE_MESSAGE = "MAX HP DOWN",
        START_MESSAGE = "Negate Light Unit DMG & Break",
        BUFF_MESSAGE1 = "Negate DMG end",
        BUFF_MESSAGE2 = "DMG UP",
        BUFF_MESSAGE3 = "CRI Rate UP"
    },
    [501461513] = {
        mess1 = "Targeted by Boss!",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Rewards will vary according to your ranking."
    },
    [501471113] = {
        DEAD_MESSAGE1 = "Red Pumpkin defeated+%dpt"
    },
    [501471213] = {
        DEAD_MESSAGE1 = "Blue Pumpkin defeated+%dpt"
    },
    [501471313] = {
        DEAD_MESSAGE1 = "Green Pumpkin defeated+%dpt"
    },
    [501471413] = {
        DEAD_MESSAGE1 = "Yellow Pumpkin defeated+%dpt"
    },
    [501471513] = {
        DEAD_MESSAGE1 = "Purple Pumpkin defeated+%dpt"
    },
    [501472413] = {
        DEAD_MESSAGE1 = "Lucky Pumpkin defeated+%dpt"
    },
    [501472013] = {
        DEAD_MESSAGE1 = "Skull Pumpkin defeated+%dpt"
    }
    
}

_M.ENEMIES = {
    --クランチロール姫
    [200410014] = {
        START_MESSAGE1 = "I'm not gonna back down!"
    },

    --緑命龍エルプネウマス
    [49923] = {
        mess1 = "Rage Status: HP regen",
        mess2 = "Rage Status: Break Gauge regen",
        mess3 = "Rage Status: Burning Resistance DOWN",
        mess4 = "Clear Angry Status",
        mess5 = "Resume regen",
        mess6 = "Stop regen"
    },

    [2000592] = {
        mess1 = "Rage Status: HP regen",
        mess2 = "Rage Status: Break Gauge regen",
        mess3 = "Rage Status: Burning Resistance DOWN",
        mess4 = "Clear Angry Status",
        mess5 = "Resume regen",
        mess6 = "Stop regen"
    },

    [500133905] = {
        mess1 = "Rage Status: HP regen",
        mess2 = "Rage Status: Break Gauge regen",
        mess3 = "Rage Status: Burning Resistance DOWN",
        mess4 = "Clear Angry Status",
        mess5 = "Resume regen",
        mess6 = "Stop regen"
    },

    [500133915] = {
        mess1 = "Rage Status: HP regen",
        mess2 = "Rage Status: Break Gauge regen",
        mess3 = "Rage Status: Burning Resistance DOWN",
        mess4 = "Clear Angry Status",
        mess5 = "Resume regen",
        mess6 = "Stop regen"
    },

    [500133925] = {
        mess1 = "Rage Status: HP regen",
        mess2 = "Rage Status: Break Gauge regen",
        mess3 = "Rage Status: Burning Resistance DOWN",
        mess4 = "Clear Angry Status",
        mess5 = "Resume regen",
        mess6 = "Stop regen"
    },

    --黒ヴァル覚醒級
    [50023] = {
        mess1 = "Shadow Lightning Stance",
        mess2 = "Invincible Status",
        mess3 = "Status Ailment Negated"
    },

    --黒ヴァル
    [500711109] = {
        mess1 = "Shadow Lightning Stance"
    },

    [500711209] = {
        mess1 = "Shadow Lightning Stance"
    },

    --黒ヴァル超級
    [500711409] = {
        mess1 = "Negates Status Ailment",
        mess2 = "Shadow Lightning Stance",
        mess3 = "Status Ailment Negated"
    },

    --フォスラディウス覚醒級
    [50123] = {
        mess1 = "Physical Damage Negated",
        mess2 = "Arts Gauge Boost UP",
        mess3 = "Negates Critical Damage"
    },


    --フォスラディウス
    [500144109] = {
        mess1 = "Physical Damage Negated",
        mess2 = "Arts Gauge Boost UP"
    },

    [500144209] = {
        mess1 = "Physical Damage Negated",
        mess2 = "Arts Gauge Boost UP"
    },

    [500144409] = {
        mess1 = "Physical Damage Negated",
        mess2 = "Arts Gauge Boost UP"
    },

    --ラ＝リズ魔導研究所のフェン
    [70614] = {
        mess1 = "Fen: Human Killer",
        mess2 = "Fen: Freezing Resistance"
    },

    --ラ＝リズ魔導研究所のゼイオルグ
    [70615] = {
        mess1 = "Zeorg: Stun Resistance",
        mess2 = "Zeorg: Damage inflicted UP",
        mess3 = "Zeorg: Attack Speed UP",
        mess4 = "Zeorg: Critical Rate UP"
    },

    --焔神官カロン
    [1001089] = {
        mess1 = "You must protect me!"
    },

    [1001094] = {
        mess1 = "You must protect me!"
    },

    [500681509] = {
        mess1 = "You must protect me!"
    },

    [500681539] = {
        mess1 = "You must protect me!"
    },

    --修行の間　ヨミ
    [1001507] = {
        mess1 = "ATK UP"
    },

    --修行の間　ゾルダス
    [1001508] = {
        mess1 = "Magic Resistance UP"
    },


	-- 猛餓獣樹ゴロンドーラ ルゥイベント真Ex
    [200320048] = {
        RAGE = "Rage Status",
        REGENATION = "HP regen",
        BURN = "Stop regen",
        RESTART = "Resume regen"
    },

    --CODE XTF : ERASER
    [2000569] = {
        mess1 = "Attack mode: Attack Speed UP",
        mess2 = "Normal mode: Stores Elemental Damage",
        mess3 = "Significant Decrease of DEF",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Elemental Energy",
        mess6 = "Water Elemental Energy",
        mess7 = "Earth Elemental Energy",
        mess8 = "Light Elemental Energy",
        mess9 = "Dark Elemental Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire Elemental Resistance UP",
        mess12 = "Water Elemental Resistance UP",
        mess13 = "Earth Elemental Resistance UP",
        mess14 = "Light Elemental Resistance UP",
        mess15 = "Dark Elemental Resistance UP",
        mess16 = "Clear Elemental Resistance",
        mess17 = "％"
    },

    [500080123] = {
        mess1 = "Attack mode: Attack Speed UP",
        mess2 = "Normal mode: Stores Elemental Damage",
        mess3 = "Significant Decrease of DEF",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Elemental Energy",
        mess6 = "Water Elemental Energy",
        mess7 = "Earth Elemental Energy",
        mess8 = "Light Elemental Energy",
        mess9 = "Dark Elemental Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire Elemental Resistance UP",
        mess12 = "Water Elemental Resistance UP",
        mess13 = "Earth Elemental Resistance UP",
        mess14 = "Light Elemental Resistance UP",
        mess15 = "Dark Elemental Resistance UP",
        mess16 = "Clear Elemental Resistance",
        mess17 = "％"
    },

    [500721935] = {
        mess1 = "Attack mode: Attack Speed UP",
        mess2 = "Normal mode: Stores Elemental Damage",
        mess3 = "Significant Decrease of DEF",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Elemental Energy",
        mess6 = "Water Elemental Energy",
        mess7 = "Earth Elemental Energy",
        mess8 = "Light Elemental Energy",
        mess9 = "Dark Elemental Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire Elemental Resistance UP",
        mess12 = "Water Elemental Resistance UP",
        mess13 = "Earth Elemental Resistance UP",
        mess14 = "Light Elemental Resistance UP",
        mess15 = "Dark Elemental Resistance UP",
        mess16 = "Clear Elemental Resistance",
        mess17 = "％"
    },

    [500721945] = {
        mess1 = "Attack mode: Attack Speed UP",
        mess2 = "Normal mode: Stores Elemental Damage",
        mess3 = "Significant Decrease of DEF",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Elemental Energy",
        mess6 = "Water Elemental Energy",
        mess7 = "Earth Elemental Energy",
        mess8 = "Light Elemental Energy",
        mess9 = "Dark Elemental Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire Elemental Resistance UP",
        mess12 = "Water Elemental Resistance UP",
        mess13 = "Earth Elemental Resistance UP",
        mess14 = "Light Elemental Resistance UP",
        mess15 = "Dark Elemental Resistance UP",
        mess16 = "Clear Elemental Resistance",
        mess17 = "％"
    },

    [500721955] = {
        mess1 = "Attack Mode: Attack Speed UP",
        mess2 = "Normal Mode: Stores Elemental Damage",
        mess3 = "Major DEF DOWN",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Energy",
        mess6 = "Water Energy",
        mess7 = "Earth Energy",
        mess8 = "Light Energy",
        mess9 = "Dark Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire resistance UP",
        mess12 = "Water resistance UP",
        mess13 = "Earth resistance UP",
        mess14 = "Light resistance UP",
        mess15 = "Dark resistance UP",
        mess16 = "Elemental resistance End",
        mess17 = "％"
    },

    [200210071] = {
        mess1 = "Attack Mode: Attack Speed UP",
        mess2 = "Normal Mode: Stores Elemental Damage",
        mess3 = "Major DEF DOWN",
        mess4 = "Finis Machina Activated",
        mess5 = "Fire Energy",
        mess6 = "Water Energy",
        mess7 = "Earth Energy",
        mess8 = "Light Energy",
        mess9 = "Dark Energy",
        mess10 = "No Elemental Energy",
        mess11 = "Fire resistance UP",
        mess12 = "Water resistance UP",
        mess13 = "Earth resistance UP",
        mess14 = "Light resistance UP",
        mess15 = "Dark resistance UP",
        mess16 = "Elemental resistance End",
        mess17 = "％"
    },

    --ミラ
    [2000617] = {
        mess1 = "Demon Killer",
        mess2 = "Earth Elemental Killer",
        mess3 = "Guts EX: Damage Inflicted UP",
        mess4 = "Guts EX: Movement Speed UP",
        mess5 = "Burning Critical",
        mess6 = "Phoenix EX: Won't fall & regen",
        mess7 = "Phoenix EX: Arts Gauge Speed UP",
        mess8 = "Phoenix EX: HP regen",
        mess9 = "Clear Phoenix Status"
    },

    [200030036] = {
        mess1 = "Demon Killer",
        mess2 = "Earth Elemental Killer",
        mess3 = "Guts EX: Damage Inflicted UP",
        mess4 = "Guts EX: Movement Speed UP",
        mess5 = "Burning Critical",
        mess6 = "Phoenix EX: Won't fall & regen",
        mess7 = "Phoenix EX: Arts Gauge Speed UP",
        mess8 = "Phoenix EX: HP regen",
        mess9 = "Clear Phoenix Status"
    },

    [200030073] = {
        mess1 = "Demon Killer",
        mess2 = "Earth Elemental Killer",
        mess3 = "Guts EX: Damage Inflicted UP",
        mess4 = "Guts EX: Movement Speed UP",
        mess5 = "Burning Critical",
        mess6 = "Phoenix EX: Won't fall & regen",
        mess7 = "Phoenix EX: Arts Gauge Speed UP",
        mess8 = "Phoenix EX: HP regen",
        mess9 = "Clear Phoenix Status"
    },

    [200030075] = {
        mess1 = "Demon Killer",
        mess2 = "Earth Elemental Killer",
        mess3 = "Guts EX: Damage Inflicted UP",
        mess4 = "Guts EX: Movement Speed UP",
        mess5 = "Burning Critical",
        mess6 = "Phoenix EX: Won't fall & regen",
        mess7 = "Phoenix EX: Arts Gauge Speed UP",
        mess8 = "Phoenix EX: HP regen",
        mess9 = "Clear Phoenix Status"
    },

    --ソフィ
    [2000622] = {
        mess1 = "Special Butter Brioche",
        mess2 = "HP regen",
        mess3 = "Special Dragon Steak",
        mess4 = "Damage inflicted 30% UP",
        mess5 = "Special Hot Dog",
        mess6 = "Attack Speed UP",
        mess7 = "Special Paella",
        mess8 = "Arts Gauge Speed UP",
        mess9 = "I'll show you my passionate cooking!"
    },
    [500511005] = {
        mess1 = "Special Butter Brioche",
        mess2 = "HP regen",
        mess3 = "Special Dragon Steak",
        mess4 = "Damage inflicted 30% UP",
        mess5 = "Special Hot Dog",
        mess6 = "Attack Speed UP",
        mess7 = "Special Paella",
        mess8 = "Arts Gauge Speed UP",
        mess9 = "I'll show you my passionate cooking!"
    },
    [500522015] = {
        mess1 = "Special Butter Brioche",
        mess2 = "HP regen",
        mess3 = "Special Dragon Steak",
        mess4 = "Damage inflicted 30% UP",
        mess5 = "Special Hot Dog",
        mess6 = "Attack Speed UP",
        mess7 = "Special Paella",
        mess8 = "Arts Gauge Speed UP",
        mess9 = "I'll show you my passionate cooking!"
    },
    [500522025] = {
        mess1 = "Special Butter Brioche",
        mess2 = "HP regen",
        mess3 = "Special Dragon Steak",
        mess4 = "Damage inflicted 30% UP",
        mess5 = "Special Hot Dog",
        mess6 = "Attack Speed UP",
        mess7 = "Special Paella",
        mess8 = "Arts Gauge Speed UP",
        mess9 = "I'll show you my passionate cooking!"
    },
    [500522035] = {
        mess1 = "Special Butter Brioche",
        mess2 = "HP regen",
        mess3 = "Special Dragon Steak",
        mess4 = "Damage inflicted 30% UP",
        mess5 = "Special Hot Dog",
        mess6 = "Attack Speed UP",
        mess7 = "Special Paella",
        mess8 = "Arts Gauge Speed UP",
        mess9 = "I'll show you my passionate cooking!"
    },
    [500522045] = {
        mess1 = "Special Butter Brioche",
        mess2 = "HP regen",
        mess3 = "Special Dragon Steak",
        mess4 = "Damage inflicted 30% UP",
        mess5 = "Special Hot Dog",
        mess6 = "Attack Speed UP",
        mess7 = "Special Paella",
        mess8 = "Arts Gauge Speed UP",
        mess9 = "I'll show you my passionate cooking!"
    },

    --ガナン
    [2000630] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },
    [500431100] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },
    [500442100] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },
    [500442200] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },
    [500442300] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },
    [500442400] = {
        mess1 = "Arts Gauge Charge & Speed UP",
        mess2 = "Attack Frequency further increases",
        mess3 = "Damage Taken 50% UP",
        mess4 = "Damage Inflicted 50% UP",
        mess5 = "Negates Stun & Freeze",
        mess6 = "Arts Gauge Charge Speed UP",
        mess7 = "Critical Occurrence Rate UP",
        mess8 = "Attack Frequency UP"
    },

    --グラード
    [2000631] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Damage Inflicted UP",
        mess3 = "Arts Gauge Increase Speed UP",
        mess4 = "Increases Roy's Damage",
        mess5 = "Lifesteal",
        mess6 = "Attack Speed UP",
        mess7 = "Summon Evil Death Wings",
        mess8 = "Light & Dark Elemental Killer",
        talk1 = "Roy...I'm gonna be the one who defeats you!",
        talk2 = "Go ahead and try if you think you can beat me.",
        talk3 = "Yeah...I will...I'll do it!",
        talk4 = "Today's the day we end this.",
        talk5 = "Sorry, but I just don't sense that I'll lose.",
        talk6 = "Tsk...That attitute...",
        talk7 = "I can't stand you!",
        talk8 = "Well...Let's have some fun then!",
        talk9 = "I have no time to waste with you.",
        talk10 = "Ha! I'll make you regret it soon!"
    },

    [200040028] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Damage Inflicted UP",
        mess3 = "Arts Gauge Increase Speed UP",
        mess4 = "Increases Roy's Damage",
        mess5 = "Lifesteal",
        mess6 = "Attack Speed UP",
        mess7 = "Summon Evil Death Wings",
        mess8 = "Light & Dark Elemental Killer",
        talk1 = "Roy...I'm gonna be the one who defeats you!",
        talk2 = "Go ahead and try if you think you can beat me.",
        talk3 = "Yeah...I will...I'll do it!",
        talk4 = "Today's the day we end this.",
        talk5 = "Sorry, but I just don't sense that I'll lose.",
        talk6 = "Tsk...That attitute...",
        talk7 = "I can't stand you!",
        talk8 = "Well...Let's have some fun then!",
        talk9 = "I have no time to waste with you.",
        talk10 = "Ha! I'll make you regret it soon!"
    },
    [200040024] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Damage Inflicted UP",
        mess3 = "Arts Gauge Increase Speed UP",
        mess4 = "Increases Roy's Damage",
        mess5 = "Lifesteal",
        mess6 = "Attack Speed UP",
        mess7 = "Summon Evil Death Wings",
        mess8 = "Light & Dark Elemental Killer",
        talk1 = "Roy...I'm gonna be the one who defeats you!",
        talk2 = "Go ahead and try if you think you can beat me.",
        talk3 = "Yeah...I will...I'll do it!",
        talk4 = "Today's the day we end this.",
        talk5 = "Sorry, but I just don't sense that I'll lose.",
        talk6 = "Tsk...That attitute...",
        talk7 = "I can't stand you!",
        talk8 = "Well...Let's have some fun then!",
        talk9 = "I have no time to waste with you.",
        talk10 = "Ha! I'll make you regret it soon!"
    },
    [200040020] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Damage Inflicted UP",
        mess3 = "Arts Gauge Increase Speed UP",
        mess4 = "Increases Roy's Damage",
        mess5 = "Lifesteal",
        mess6 = "Attack Speed UP",
        mess7 = "Summon Evil Death Wings",
        mess8 = "Light & Dark Elemental Killer",
        talk1 = "Roy...I'm gonna be the one who defeats you!",
        talk2 = "Go ahead and try if you think you can beat me.",
        talk3 = "Yeah...I will...I'll do it!",
        talk4 = "Today's the day we end this.",
        talk5 = "Sorry, but I just don't sense that I'll lose.",
        talk6 = "Tsk...That attitute...",
        talk7 = "I can't stand you!",
        talk8 = "Well...Let's have some fun then!",
        talk9 = "I have no time to waste with you.",
        talk10 = "Ha! I'll make you regret it soon!"
    },
    [200040000] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Human Killer",
        mess3 = "Arts Gauge  Speed UP",
        mess4 = "Increases Roy's Damage"
    },
    [200040006] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Human Killer",
        mess3 = "Arts Gauge  Speed UP",
        mess4 = "Increases Roy's Damage"
    },
    [200040012] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Human Killer",
        mess3 = "Arts Gauge  Speed UP",
        mess4 = "Increases Roy's Damage"
    },
    [200040018] = {
        mess1 = "Damage against Roy increases",
        mess2 = "Human Killer",
        mess3 = "Arts Gauge  Speed UP",
        mess4 = "Increases Roy's Damage"
    },

    --試練の回廊　オグナード
    [2000638] = {
        mess1 = "Heheh...",
        mess2 = "It's time that I show you the results of my research.",
        mess3 = "You continue to amuse me.",
        mess4 = "I shall completely take you in!",
        mess5 = "Dark Elemental Resistance",
        mess6 = "Burning Resistance",
        mess7 = "Stun Resistance",
        mess8 = "Freezing Resistance"
    },

    --ラグシェルムファントム
    [2000645] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance",
        mess3 = "Sureshot"
    },

    [200070036] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance"
    },

    [200070069] = {
        mess1 = "Damage towards Target UP"
    },

    [200070073] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance"
    },

    [200070075] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance"
    },
    
    [49201] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance",
        mess3 = "Sure Shot",
        mess4 = "Reduce DMG",
        mess5 = "Clear Reduced DMG"
    },
    
    --試練の回廊の被験体
    [2000646] = {
        mess1 = "Human Killer",
        mess2 = "Gods Killer",
        mess3 = "Negates Status Ailment",
        mess4 = "DMG UP",
        mess5 = "Reduces DMG",
        mess6 = "Attack Speed UP"
    },

    --試練の回廊　ゴル猫ゴッド
    [2000648] = {
        mess1 = "Cat-cha later♪"
    },

    --ギリアム
    [200080019] = {
        mess1 = "Equipment Takes 3x Damage",
        mess2 = "Attack Speed UP",
        mess3 = "Activated Item for Giliam",
        mess4 = "Arts Damage"
    },

    [200080020] = {
        mess1 = "Equipment Takes 3x Damage",
        mess2 = "Attack Speed UP",
        mess3 = "Activated Item for Giliam",
        mess4 = "Arts Damage"
    },

    [200080024] = {
        mess1 = "Equipment Takes 3x Damage",
        mess2 = "Attack Speed UP",
        mess3 = "Activated Item for Giliam",
        mess4 = "Arts Damage"
    },

    [200080028] = {
        mess1 = "Equipment Takes 3x Damage",
        mess2 = "Attack Speed UP",
        mess3 = "Activated Item for Giliam",
        mess4 = "Arts Damage"
    },

    --ゼイオルグ
    [200140036] = {
        mess1 = "Reduces Damage Taken by 50%",
        mess2 = "Damage 50% UP & Attack Speed UP",
        mess3 = "Last Stand"
    },

    [200140073] = {
        mess1 = "Reduces Damage Taken by 50%",
        mess2 = "Damage 50% UP & Attack Speed UP",
        mess3 = "Last Stand"
    },

    [200140076] = {
        mess1 = "Reduces Damage Taken by 50%",
        mess2 = "Damage 50% UP & Attack Speed UP",
        mess3 = "Last Stand"
    },

    --闇ドラ
    [200140083] = {
        mess1 = "Remnants of Relic「End Times Ring」",
        mess2 = "Gods Killer",
        mess3 = "Remnants of Relic「Volkans」",
        mess4 = "Attack Speed UP during Burning",
        mess5 = "Remnants of Relic「Force Keratos」",
        mess6 = "Status Ailment Resistance",
        mess7 = "Remnants of Magic Armor「Geshpenst」",
        mess8 = "Critical against Target",
        mess9 = "Light Elemental Resistance DOWN",
        mess10 = "Remanants of Treasure Sword「Lyude Magus」",
        mess11 = "Inflicts Faint",
        mess12 = "Clear Attack Speed UP",
        mess13 = "Remnants of Relic「White Holy Wings」",
        mess14 = "Reduces Damage taken on Equipment & Arts",
        mess15 = "Slaying dragons is an honor for us warriors! Let's go!",
        mess16 = "Zeorg Extreme Enhancement",
        mess17 = "Reduces MAX HP",
        mess18 = "Rage Status: Break Power UP",
        mess19 = "Clear Angry Status"
    },

    [200140093] = {
        mess1 = "Rage Status: Break Power UP",
        mess2 = "Clear Angry Status",
        mess3 = "Gods Killer",
        mess4 = "Faint Evasion Rate DOWN"
    },

    [500110040] = {
        mess1 = "Rage Status: Break Power UP",
        mess2 = "Clear Angry Status",
        mess3 = "Gods Killer",
        mess4 = "Faint Evasion Rate DOWN"
    },

    [500110020] = {
        mess1 = "Rage Status: Break Power UP",
        mess2 = "Clear Angry Status",
        mess3 = "Gods Killer",
        mess4 = "Faint Evasion Rate DOWN"
    },

    [500110000] = {
        mess1 = "Rage Status: Break Power UP",
        mess2 = "Clear Angry Status",
        mess3 = "Gods Killer",
        mess4 = "Faint Evasion Rate DOWN"
    },


    --フェン
    [200210037] = {
        mess1="Ice Magic Sword \"Almas\"",
        mess2="Drakkeus Bolt",
        mess3="Underking Spear \"Hellfire\"",
        mess4="Demonsickle Evilscythe",
        mess5="Conquering Dragon Sword \"Gelmed\"",
        mess6="Relic \"Force Keratos\"",
        mess7="Heals Status Ailments",
        mess8="Sacred Crown \"Raaz\" EX",
        mess9="Status Ailments Resistance UP",
        mess10="Ru「I won't let you!!!」",
        mess11="Cruze's Pocket Watch EX",
        mess12="Enemy's Skill CT UP",
        mess13="Monster Summon Stone EX",
        mess14="Inflict Paralyze & HP Auto-recovery",
        mess15="God Flicker Bow Kyuknoth",
        talk1="Rayas「I'm going all in, Fen!」",
        talk2="Fen「Hmph, as if you'd stand a chance.」",
        talk3="Rayas「I'll show you my power!」"
    },
    [200210075] = {
        mess1="Ice Magic Sword \"Almas\"",
        mess2="Drakkeus Bolt",
        mess3="Underking Spear \"Hellfire\"",
        mess4="Demonsickle Evilscythe",
        mess5="Conquering Dragon Sword \"Gelmed\"",
        mess6="Relic \"Force Keratos\"",
        mess7="Heals Status Ailments",
        mess8="Sacred Crown \"Raaz\" EX",
        mess9="Status Ailments Resistance UP",
        mess10="Ru「I won't let you!!!」",
        mess11="Cruze's Pocket Watch EX",
        mess12="Enemy's Skill CT UP",
        mess13="Monster Summon Stone EX",
        mess14="Inflict Paralyze & HP Auto-recovery",
        mess15="God Flicker Bow Kyuknoth",
        talk1="Rayas「I'm going all in, Fen!」",
        talk2="Fen「Hmph, as if you'd stand a chance.」",
        talk3="Rayas「I'll show you my power!」"
    },
    [200210080] = {
        mess1="Ice Magic Sword \"Almas\"",
        mess2="Drakkeus Bolt",
        mess3="Underking Spear \"Hellfire\"",
        mess4="Demonsickle Evilscythe",
        mess5="Conquering Dragon Sword \"Gelmed\"",
        mess6="Relic \"Force Keratos\"",
        mess7="Heals Status Ailments",
        mess8="Sacred Crown \"Raaz\" EX",
        mess9="Status Ailments Resistance UP",
        mess10="Ru「I won't let you!!!」",
        mess11="Cruze's Pocket Watch EX",
        mess12="Enemy's Skill CT UP",
        mess13="Monster Summon Stone EX",
        mess14="Inflict Paralyze & HP Auto-recovery",
        mess15="God Flicker Bow Kyuknoth",
        talk1="Rayas「I'm going all in, Fen!」",
        talk2="Fen「Hmph, as if you'd stand a chance.」",
        talk3="Rayas「I'll show you my power!」"
    },

    --ニーア
    [200260022] = {
        mess1 = "Negates Critical",
        mess2 = "Light Elemental Resistance -50%",
        mess3 = "Attack Speed UP",
        mess4 = "Poison & Sick Attack",
        mess5 = "Arts Gauge Absorb Attack",
        mess6 = "Magic Resistance -50%"
    },

    [200260023] = {
        mess1 = "Negates Critical",
        mess2 = "Light Elemental Resistance -50%",
        mess3 = "Attack Speed UP",
        mess4 = "Poison & Sick Attack",
        mess5 = "Arts Gauge Absorb Attack",
        mess6 = "Magic Resistance -50%"
    },

    [200260024] = {
        mess1 = "Negates Critical",
        mess2 = "Light Elemental Resistance -50%",
        mess3 = "Attack Speed UP",
        mess4 = "Poison & Sick Attack",
        mess5 = "Arts Gauge Absorb Attack",
        mess6 = "Magic Resistance -50%"
    },

    [200260029] = {
        mess1 = "Negates Critical",
        mess2 = "Light Elemental Resistance -50%",
        mess3 = "Attack Speed UP",
        mess4 = "Poison & Sick Attack",
        mess5 = "Arts Gauge Absorb Attack",
        mess6 = "Magic Resistance -50%"
    },

    --エスト
    [200280037] = {
        mess1 = "Critical Rate 100%",
        mess2 = "Movement Speed UP",
        mess3 = "Arts Gauge regen",
        mess4 = "Movement Speed UP",
        mess5 = "50% less Damage"
    },

    [200280080] = {
        mess1 = "Reduces Damage taken from Gods"
    },

    [200310008] = {
        mess1 = "Charge Speed UP",
        mess2 = "Damage x3 during Freezing"
    },

    --モルドーラ
    [200320013] = {
        mess1 = "Rage Status"
    },

    [200320028] = {
        mess1 = "Rage Status"
    },

    [200320033] = {
        mess1 = "Rage Status"
    },

    [200320039] = {
        mess1 = "Rage Status"
    },

    [200320045] = {
        mess1 = "Rage Status"
    },

    --パルラミシア
    [49501] = {
        mess1 = "Earth Elemental Resistance -40%",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP regen",
        mess5 = "HP regen amount UP"
    },


    [500200000] = {
        mess1 = "Earth Elemental Resistance -40%",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP regen",
        mess5 = "HP regen amount UP"
    },

    [500200020] = {
        mess1 = "Earth Elemental Resistance -40%",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP regen",
        mess5 = "HP regen amount UP"
    },

    [500200041] = {
        mess1 = "Earth Elemental Resistance -40%",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP regen",
        mess5 = "HP regen amount UP"
    },

    --ロイ
    [500342865] = {
        mess1 = "Lightning Fast: Movement Speed UP",
        mess2 = "Lightning Fast: Arts Gauge Increase Speed UP",
        mess3 = "Blue Dragon Sword「Alternative」Stance"
    },

    [500342885] = {
        mess1 = "Clear Impregnable Status",
        mess2 = "Wolf Stance: Movement Speed UP",
        mess3 = "Wolf Stance: Damage inflicted 50% UP",
        mess4 = "Lightning Fast: Movement Speed UP",
        mess5 = "Lightning Fast: Arts Gauge Increase Speed UP",
        mess6 = "Impregnable: Significant decrease of Damage inflicted",
        mess7 = "Impregnable: Break Resistance DOWN",
        mess8 = "Blue Dragon Sword「Alternative」Stance"
    },

    [500342895] = {
        mess1 = "Clear Impregnable Status",
        mess2 = "Wolf Stance: Movement Speed UP",
        mess3 = "Wolf Stance: Damage inflicted 50% UP",
        mess4 = "Lightning Fast: Movement Speed UP",
        mess5 = "Lightning Fast: Arts Gauge Increase Speed UP",
        mess6 = "Impregnable: Significant decrease of Damage inflicted",
        mess7 = "Impregnable: Break Resistance DOWN",
        mess8 = "Blue Dragon Sword「Alternative」Stance"
    },

    [2000626] = {
        mess1 = "Clear Impregnable Status",
        mess2 = "Wolf Stance: Movement Speed UP",
        mess3 = "Wolf Stance: Damage inflicted 50% UP",
        mess4 = "Lightning Fast: Movement Speed UP",
        mess5 = "Lightning Fast: Arts Gauge Increase Speed UP",
        mess6 = "Impregnable: Significant decrease of Damage inflicted",
        mess7 = "Impregnable: Break Resistance DOWN",
        mess8 = "Blue Dragon Sword「Alternative」Stance"
    },

    -- 試練の回廊 ２０階/霹翠トニトゥルス
    [2000659] = {
        START_MESSAGE1 = "Light Elemental Killer",
        START_MESSAGE2 = "Negates Light Damage",
        START_MESSAGE3 = "Status Ailment Negated",
        START_MESSAGE4 = "Negates Critical",
        BUFF_MESSAGE1 = "Damage Inflicted UP",
        BUFF_MESSAGE2 = "Attack Speed UP",
    },

    -- 試練の回廊 ２０階/猛餓獣樹ゴロンドーラ
    [2000660] = {
        START_MESSAGE1 = "Dark Elemental Killer",
        START_MESSAGE2 = "Negates Dark Damage",
        START_MESSAGE3 = "Status Ailment Negated",
        START_MESSAGE4 = "Negates Critical",
        BUFF_MESSAGE1 = "HP Absorption UP",
        BUFF_MESSAGE2 = "Attack Speed UP",
    },

    -- 試練の回廊 23階/冥蟲姫ラドアクネ
    [2000666] = {
        SKILL_MESSAGE1 = "Oh, Creature of Darkness... Ah... Destruction...",
        SKILL_MESSAGE2 = "The living shall die, the dead shall go on...",
        SKILL_MESSAGE3 = "Like a candle flickering in the wind...",
        SUMMON_MESSAGE1 = "Oh, my darlings... I love you so...",
        START_MESSAGE1 = "Beast & Human Killer",
        START_MESSAGE2 = "Critical Resistance",
        START_MESSAGE3 = "HP Auto-recovery",
        RAGE_MESSAGE1 = "DMG UP",
        RAGE_MESSAGE2 = "Movement Speed UP",
        RAGE_MESSAGE3 = "Negates Hit Stop",
        RAGE_MESSAGE4 = "Break Resistance DOWN"
    },

    --闇ドラ覚醒級
    [500110063] = {
        mess1 = "Remnants of Relic \"End Times Ring\"",
        mess2 = "Gods Killer",
        mess3 = "Remnants of Relic \"Volkans\"",
        mess4 = "ATK Speed UP while Burning",
        mess5 = "Remnants of Relic \"Force Keratos\"",
        mess6 = "Altered State Resistance",
        mess7 = "Remnants of Magic Sword \"Geshpenst\"",
        mess8 = "Critical DMG towards Target",
        mess9 = "Light Elemental Resistance DOWN",
        mess10 = "Remnants of Treasure Blade \"Ryude Magus\"",
        mess11 = "Adds Faint Effect",
        mess12 = "Clear ATK Speed UP",
        mess13 = "Remnants of Holy Shield of Wings",
        mess14 = "Reduce Equipment/Arts DMG",
        mess15 = "Defeating a dragon is a warrior's honor! Here I go!",
        mess16 = "All Elemental Resistance (except Light)",
        mess17 = "MAX HP DOWN",
        mess18 = "Rage mode：Break Power UP",
        mess19 = "Clear Rage mode"
    },

    --ラグ外伝ヴァルザン
    [604037] = {
        mess1 = "Arts gauge regeneration"
    },

    --銀ヴァル
    [600000002] = {
        mess1 = "Shadow Lightning Stance V",
        mess2 = "Damage Resistance DOWN",
        mess3 = "Fallen Cells Reactivated",
        mess4 = "Boss has targeted you!",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking."
    },

    --レグルスフィーナイベ　フィーナ
    [200370046] = {
        mess1 = "Arts gauge increase UP",
        mess2 = "Damage Inflicted UP"
    },

    --レグルスフィーナイベ　レグルス
    [200370043] = {
        mess1 = "Arts gauge increase UP",
        mess2 = "Damage Inflicted UP"
    },

    --大型イベント用メリア
    [200380033] = {
        mess1 = "Auto-barrier",
        mess2 = "Arts Gauge Increase Speed UP"
    },
    [200380039] = {
        mess1 = "Auto-barrier",
        mess2 = "Arts Gauge Increase Speed UP"
    },
    [200380047] = {
        mess1 = "Auto-barrier",
        mess2 = "Arts Gauge Increase Speed UP"
    },

    [200430034] = {
        ITEM1 = "Coercion of the Guardian",
        ITEM2 = "Blue Dragon Blade",
        ITEM3 = "Wrath of the Guardian",
        SUMMON1 = "I never expected one to arrive here...",
        SUMMON2 = "It is my duty to protect this place...",
        SUMMON3 = "What is it that you seek...?",
        SUMMON4 = "Just how...committed are you?!"
    },
    [200440031] = {
        ITEM1 = "Coercion of the Guardian",
        ITEM2 = "Green Dragon Blade",
        ITEM3 = "Wrath of the Guardian",
        SUMMON1 = "You who threaten this land...",
        SUMMON2 = "Leave here at once...",
        SUMMON3 = "Your arrogance will one day destroy you...",
        SUMMON4 = "You cannot withstand the powers of the Earth!"
    },
    [200450031] = {
        ITEM1 = "Coercion of the Guardian",
        ITEM2 = "Blaze Dragon Blade",
        ITEM3 = "Wrath of the Guardian",
        SUMMON1 = "Hmm... It’s been a while since I had a visitor...",
        SUMMON2 = "So you wish to be reduced to ashes, too...",
        SUMMON3 = "You do not yet know true fear...",
        SUMMON4 = "Very well, be reduced to ashes!"
    },
    [2005432] = {
        ITEM1 = "Guardian's Coercion",
        ITEM2 = "Shadow Dragon Blade",
        ITEM3 = "Imperial Wrath",
        SUMMON1 = "Are you... the one... challenging me...?",
        SUMMON2 = "Are... you the one... who wanders the shadows...?",
        SUMMON3 = "Should you... be the one... to recive... the power of Light...?",
        SUMMON4 = "SHOW ME YOUR STRENGTH!"
    },
    [2005532] = {
        ITEM1 = "Guardian's Coercion",
        ITEM2 = "Luminous Dragon Blade",
        ITEM3 = "Imperial Wrath",
        SUMMON1 = "Do you... wish for... power...?",
        SUMMON2 = "Let me measure your values...",
        SUMMON3 = "What sleeps here... is beyond human strength...",
        SUMMON4 = "Prove that you are worthy enough to possess this relic!"
    },
    [2005645] = {
        mess1 = "魔族キラー",
        mess2 = "ブレイク耐性アップ",
        mess3 = "クリティカル無効",
        mess4 = "ちっと本気でやるとするか！",
        mess5 = "フェン「何を遊んでいるのだ貴様は！？」",
        mess6 = "大型・機族に変化"
    },
    [200460032] = {
        mess1 = "Negates Critical Damage",
        mess2 = "Arts Gauge Increase Speed UP"
    },
    [200460043] = {
        mess1 = "Lapleh：Negates Critical Damage",
        mess2 = "Arts Gauge Increase Speed UP"
    },
    [200460038] = {
        mess1 = "All Status UP",
        mess2 = "Arts Gauge Increase Speed UP"
    },
    [200460046] = {
        mess1 = "All Status UP",
        mess2 = "Arts Gauge Increase Speed UP"
    },

    [200510048] = {
        mess1 = "All Status UP",
        mess2 = "Arts gauge increase speed UP"
    },
    [200510045] = {
        mess1 = "CRI rate %d％",
        mess2 = "Arts gauge increase speed UP"
    },

    [2005339] = {
        mess1 = "Dark Resistance５０％"
    },
    [2005344] = {
        mess1 = "Dark Resistance８０％"
    },

    --回廊ギリアム
    [1001510] = {
        mess1 = "Equipment Takes 3x Damage"
    },

    [200100007] = {
        mess1 = "Damage towards Target UP",
        mess2 = "True Nightmare Stance",
        mess3 = "Sureshot"
    },

    [200210086] = {
        mess1 = "Ice Magic Sword \"Almas\"",
        mess2 = "Drakkeus Bolt",
        mess3 = "Underking Spear \"Hellfire\"",
        mess4 = "Demonsickle Evilscythe",
        mess5 = "Conquering Dragon Sword \"Gelmed\"",
        mess6 = "Relic「Force Keratos」",
        mess7 = "Heals Status Ailment",
        mess8 = "Sacred Crown「Raaz」EX",
        mess9 = "Status Ailment Resistance UP",
        mess10 = "Ru「I won't let you!!!」",
        mess11 = "Cruze's Pocket Watch EX",
        mess12 = "Enemy's Skill CT Speed DOWN",
        mess13 = "Monster Summon Stone EX",
        mess14 = "Inflict Paralyze & HP regenerates",
        mess15 = "Head of General Staff",
        mess16 = "The Lone Tactician",
        mess17 = "Human Killer",
        mess18 = "The Beast within",
        mess19 = "Arts gauge regeneration",
        mess20 = "Divine Glowing Arrow Cycnus",
        talk1 = "Rayas「I'm going all in, Fen!」",
        talk2 = "Fen「Hmph, as if you'd stand a chance.」",
        talk3 = "Rayas「I'll show you my powers!」"
    },
    [200490047] = {
        mess1 = "Luminous Barrier"
    },
    [2005243] = {
        mess1 = "ミラージュソードの構え"
    },
    [2005248] = {
        mess1 = "ミラージュソードの構え"
    },

    --ロスト覚醒級
    [200570009] = {
        mess1 = "Light Resistance DOWN during Break"
    },
    --ロスト覚醒級のジェラルド
    [200570013] = {
        mess1 = "Gerald \"I will support you!\""
    },

    --神殿女神　初級
    [4000117] = {
        BARRIER_MESSAGE1 = "Wyrm's Shell: Negate certain DMG % Evasion rate UP",
        RAGE_MESSAGE1 = "DMG UP & ATK Speed UP",
        SKILL_MESSAGE = "Be covered in Light... and disappear...",
        SKILL_MESSAGE2 = "Be embraced by Darkness... and vanish..."
    },
    --神殿女神　中級
    [4000127] = {
        BARRIER_MESSAGE1 = "Wyrm's Shell: Negate certain DMG % Evasion rate UP",
        RAGE_MESSAGE1 = "DMG UP & ATK Speed UP",
        SKILL_MESSAGE = "Be covered in Light... and disappear...",
        SKILL_MESSAGE2 = "Be embraced by Darkness... and vanish..."
    },
    --神殿女神　上級
    [4000137] = {
        BARRIER_MESSAGE1 = "Wyrm's Shell: Negate certain DMG % Evasion rate UP",
        RAGE_MESSAGE1 = "DMG UP & ATK Speed UP",
        SKILL_MESSAGE = "Be covered in Light... and disappear...",
        SKILL_MESSAGE2 = "Be embraced by Darkness... and vanish..."
    },
    --神殿女神　超級
    [4000147] = {
        BARRIER_MESSAGE1 = "Wyrm's Shell: Negate certain DMG % Evasion rate UP",
        RAGE_MESSAGE1 = "DMG UP & ATK Speed UP",
        SKILL_MESSAGE = "Be covered in Light... and disappear...",
        SKILL_MESSAGE2 = "Be embraced by Darkness... and vanish..."
    },

    --紋章宮月曜リリー
    [4000213] = {
        mess1 = "Give death... to those who live...",
        mess2 = "The lights of Life... will not... disappear..."
    },
    [4000223] = {
        mess1 = "Give death... to those who live...",
        mess2 = "The lights of Life... will not... disappear..."
    },
    [4000233] = {
        mess1 = "Give death... to those who live...",
        mess2 = "The lights of Life... will not... disappear..."
    },
    [4000243] = {
        mess1 = "Give death... to those who live...",
        mess2 = "The lights of Life... will not... disappear..."
    },
    --紋章宮月曜アルシェ
    [4000214] = {
        mess1 = "Oh no... we have a problem!",
        mess2 = "To cure a bad illness, you'll need lots of healing♪"
    },
    [4000224] = {
        mess1 = "Oh no... we have a problem!",
        mess2 = "To cure a bad illness, you'll need lots of healing♪"
    },
    [4000234] = {
        mess1 = "Oh no... we have a problem!",
        mess2 = "To cure a bad illness, you'll need lots of healing♪"
    },
    [4000244] = {
        mess1 = "Oh no... we have a problem!",
        mess2 = "To cure a bad illness, you'll need lots of healing♪"
    },

    --紋章宮月曜死神
    [4000217] = {
        mess1 = "Carve... death...",
        mess2 = "Do not struggle...",
        mess3 = "Light Killer",
        mess4 = "Dark Resistance",
        mess5 = "Break Resistance"
    },
    [4000227] = {
        mess1 = "Carve... death...",
        mess2 = "Do not struggle...",
        mess3 = "Light Killer",
        mess4 = "Dark Resistance",
        mess5 = "Break Resistance"
    },
    [4000237] = {
        mess1 = "Carve... death...",
        mess2 = "Do not struggle...",
        mess3 = "Light Killer",
        mess4 = "Dark Resistance",
        mess5 = "Break Resistance"
    },
    [4000247] = {
        mess1 = "Carve... death...",
        mess2 = "Do not struggle...",
        mess3 = "Light Killer",
        mess4 = "Dark Resistance",
        mess5 = "Break Resistance"
    },

    
    [2004335] = {
        mess1 = "Rage mode: Continous Damage",
        mess2 = "Clear Angry Status",
        mess3 = "Damage Resistance during Freeze",
        mess4 = "Break Damage Resistance during Freeze",
        mess5 = "HP regen during Freeze",
        mess6 = "Dragonic Cocytus",
        mess7 = "Physical Resistance",
        mess8 = "DMG Invaild (Except during Burn)"
    },
    [2004432] = {
        mess1 = "DMG Invaild (Except during Freeze)"
    },
    [2004532] = {
        mess1 = "DMG Invaild (Except during Poison)"
    },

    [2006133] = {
        mess1 = "人族キラー",
        mess2 = "魔族キラー"
    },

    [2006139] = {
        mess1 = "人族キラー",
        mess2 = "魔族キラー"
    },

    [2006144] = {
        mess1 = "人族キラー",
        mess2 = "魔族キラー",
        mess3 = "てめぇは俺を怒らせた…",
        mess4 = "奥義ゲージ増加速度アップ",
        mess5 = "死んで詫びろ…！"
    },

    [2006305] = {
        mess1 = "Reduce DMG",
        mess2 = "Cancel Reduce DMG",
        mess3 = "Metal Chicken: Reduce DMG (Except CRI)"
    },

    [2006309] = {
        mess1 = "Reduce DMG",
        mess2 = "Cancel Reduce DMG",
        mess3 = "Metal Chicken: Reduce DMG (Except CRI)"
    },

    --紋章植物
    [4000317] = {
        mess1 = "Guys! Go get them!",
        mess2 = "You're doing better than I thought!",
        mess3 = "Arrrgh! Come on! You guys can do better!",
        mess4 = "I'm gonna eat you!",
        mess5 = "You're nothing!",
        mess6 = "DMG UP",
        mess7 = "Reduce DMG"
    },
    [4000327] = {
        mess1 = "Guys! Go get them!",
        mess2 = "You're doing better than I thought!",
        mess3 = "Arrrgh! Come on! You guys can do better!",
        mess4 = "I'm gonna eat you!",
        mess5 = "You're nothing!",
        mess6 = "DMG UP",
        mess7 = "Reduce DMG"

    },
    [4000338] = {
        mess1 = "Guys! Go get them!",
        mess2 = "You're doing better than I thought!",
        mess3 = "Arrrgh! Come on! You guys can do better!",
        mess4 = "I'm gonna eat you!",
        mess5 = "You're nothing!",
        mess6 = "DMG UP",
        mess7 = "Reduce DMG"
    },
    [4000352] = {
        mess1 = "Guys! Go get them!",
        mess2 = "You're doing better than I thought!",
        mess3 = "Arrrgh! Come on! You guys can do better!",
        mess4 = "I'm gonna eat you!",
        mess5 = "You're nothing!",
        mess6 = "DMG UP",
        mess7 = "Reduce DMG"
    },
    [2000662] = {
        mess1 = "DMG UP",
        mess2 = "ATK SPEED UP"
    },
    [2006531] = {
        mess1 = "人族キラー"
    },
    [2006537] = {
        mess1 = "人族キラー"
    },

    [2006543] = {
        mess1 = "Human & God Killer",
        mess2 = "水属性耐性ダウン",
        mess3 = "ブレイク中以外ダメージ軽減",
        mess4 = "ブレイク中以外クリティカル無効",
        mess5 = "いいねいいねぇ…！",
        mess6 = "DMG UP"
    },

    [2006731] = {
        mess1 = "Aren't you gorgeous!",
        mess2 = "DMG from Women units 20% UP"
    },
    [2006737] = {
        mess1 = "奥義ダメージ軽減",
        mess2 = "装備被ダメージアップ"
    },
    [2006744] = {
        mess1 = "ロッズ「いい女じゃねぇか！」",
        mess2 = "ロッズ：女性からのダメージ20％アップ",
        mess3 = "ロッズ：防御力ダウン",
        mess4 = "ロッズ：攻撃力ダウン"
    },
    [2006743] = {
        mess1 = "タリス：奥義ダメージ軽減",
        mess2 = "タリス：装備被ダメージアップ"
    },
    [2006905] = {
        mess1 = "God Killer",
        mess2 = "Reduce Physical DMG",
        mess3 = "Weapons are with battle...",
        mess4 = "Movement Speed UP"
    },
    [2006909] = {
        mess1 = "God Killer",
        mess2 = "Reduce Physical DMG",
        mess3 = "Weapons are with battle...",
        mess4 = "Movement Speed UP"
    },

    --マヴロスキア
    [2012430] = {
        mess1 = "RageStatus:BreakPowerUP",
        mess2 = "ClearAngryStatus",
        mess3 = "Paralyze & Faint Valid",
        mess4 = "God Killer"
    },
    --マヴロスキア
    [2012436] = {
        mess1 = "RageStatus:BreakPowerUP",
        mess2 = "ClearAngryStatus",
        mess3 = "Paralyze & Faint Valid",
        mess4 = "God Killer"
    },

    --マヴロスキア
    [2012442] = {
        mess1 = "RageStatus:BreakPowerUP",
        mess2 = "ClearAngryStatus",
        mess3 = "Paralyze & Faint Valid",
        mess4 = "God Killer"
    },

    [2013131] = {
        START_MESSAGE1 = "Action Speed UP, CRI resistance UP",
        START_MESSAGE2 = "Light & Dark resistance",
        HP40_MESSAGE1 = "Extra Action Speed UP"
    },
    [2013137] = {
        START_MESSAGE1 = "Action Speed UP, CRI resistance UP",
        START_MESSAGE2 = "Light & Dark resistance",
        HP40_MESSAGE1 = "Extra Action Speed UP"
    },
    [2013143] = {
        START_MESSAGE1 = "Action Speed UP, CRI resistance UP",
        START_MESSAGE2 = "Light & Dark resistance",
        HP40_MESSAGE1 = "Extra Action Speed UP"
    },        
    [2013149] = {
        START_MESSAGE1 = "Magic DMG resistance",
        START_MESSAGE2 = "Light & Dark resistance",
        START_MESSAGE3 = "earth Killer & Accuracy UP",
        HP60_MESSAGE1 = "Magia Drive!",
        HP60_MESSAGE2 = "Action Speed UP",
        HP40_MESSAGE1 = "You're good...",
        HP20_MESSAGE1 = "Action Speed DMG UP"
    },

    [2013429] = {
        START_MESSAGE1 = "Action speed UP",
        RAGE_MESSAGES1_1 = "Negates 300000 DMG",
        RAGE_MESSAGES1_2 = "DMG UP during DMG negation",
        RAGE_MESSAGES2_1 = "ATK UP",
        RAGE_MESSAGES2_2 = "Action speed UP"
    },

    [2013431] = {
        START_MESSAGE1 = "Action speed UP",
        RAGE_MESSAGES1_1 = "Negates 300000 DMG",
        RAGE_MESSAGES1_2 = "DMG UP during DMG negation",
        RAGE_MESSAGES2_1 = "ATK UP",
        RAGE_MESSAGES2_2 = "Action speed UP"
    },

    [2013437] = {
        START_MESSAGE1 = "Action speed UP",
        RAGE_MESSAGES1_1 = "Negates 300000 DMG",
        RAGE_MESSAGES1_2 = "DMG UP during DMG negation",
        RAGE_MESSAGES2_1 = "ATK UP",
        RAGE_MESSAGES2_2 = "Action speed UP"
    },

    [2013443] = {
        START_MESSAGE1 = "Action speed UP",
        RAGE_MESSAGES1_1 = "Negates 300000 DMG",
        RAGE_MESSAGES1_2 = "DMG UP during DMG negation",
        RAGE_MESSAGES2_1 = "ATK UP",
        RAGE_MESSAGES2_2 = "Action speed UP"
    },
    [2013449] = {
        START_MESSAGE1 = "See what I can do!",
        HP70_MESSAGE1 = "Magia Drive!",
        HP70_MESSAGE2 = "Arts gauge recovery speed UP ",
        HP30_MESSAGE1 = "This is my true strength!",
        HP30_MESSAGE2 = "Action speed UP"
    },
    
    [4000417] = {
        mess1 = "DMG Drain for a certain period",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP Auto-recovery",
        mess5 = "HP Auto-recovery Amount UP",
        mess6 = "Counter Arts against CRI DMG",
        mess7 = "Invincible Mode",
        mess8 = "Human & God Killer"
    },
    [4000427] = {
        mess1 = "DMG Drain for a certain period",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP Auto-recovery",
        mess5 = "HP Auto-recovery Amount UP",
        mess6 = "Counter Arts against CRI DMG",
        mess7 = "Invincible Mode",
        mess8 = "Human & God Killer"
    },
    [4000437] = {
        mess1 = "DMG Drain for a certain period",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP Auto-recovery",
        mess5 = "HP Auto-recovery Amount UP",
        mess6 = "Counter Arts against CRI DMG",
        mess7 = "Invincible Mode",
        mess8 = "Human & God Killer"
    },
    [4000447] = {
        mess1 = "DMG Drain for a certain period",
        mess2 = "Protective Water Stance",
        mess3 = "Heavenly Water Stance",
        mess4 = "HP Auto-recovery",
        mess5 = "HP Auto-recovery Amount UP",
        mess6 = "Counter Arts against CRI DMG",
        mess7 = "Invincible Mode",
        mess8 = "Human & God Killer"
    },

    --イフリート
    [4000517] = {
        mess1 = "Spirits & Machines Killer ",
        mess2 = "ATK Speed UP during Burn",
        mess3 = "Burn end. ATK Speed UP end.",
        mess4 = "DMG DOWN during Burn",
        mess5 = "Burn end. Water DEF DOWN.",
        mess6 = "Arts gauge Auto-fill Speed UP during Burn"
    },
     [4000527] = {
        mess1 = "Spirits & Machines Killer ",
        mess2 = "ATK Speed UP during Burn",
        mess3 = "Burn end. ATK Speed UP end.",
        mess4 = "DMG DOWN during Burn",
        mess5 = "Burn end. Water DEF DOWN.",
        mess6 = "Arts gauge Auto-fill Speed UP during Burn"
    },
     [4000537] = {
        mess1 = "Spirits & Machines Killer ",
        mess2 = "ATK Speed UP during Burn",
        mess3 = "Burn end. ATK Speed UP end.",
        mess4 = "DMG DOWN during Burn",
        mess5 = "Burn end. Water DEF DOWN.",
        mess6 = "Arts gauge Auto-fill Speed UP during Burn"
    },
     [4000547] = {
        mess1 = "Spirits & Machines Killer ",
        mess2 = "ATK Speed UP during Burn",
        mess3 = "Burn end. ATK Speed UP end.",
        mess4 = "DMG DOWN during Burn",
        mess5 = "Burn end. Water DEF DOWN.",
        mess6 = "Arts gauge Auto-fill Speed UP during Burn",
        mess7 = "Water DEF UP during Burn"
    },
    [2007042] = {
        mess1 = "People are... tough...",
        mess2 = "Accuracy rate UP",
        mess3 = "HP Auto-recovery",
        mess4 = "Arts DMG UP"
    },
    [2000663] = {
        mess1 = "God Killer",
        mess2 = "Demon Killer",
        mess3 = "CRI DMG UP",
        mess4 = "CRI DMG (except when Burn)",
        mess5 = "DMG Invalid (except CRI DMG)",
        mess6_1 = "CRI DMG Invalid",
        mess6_2 = "Isn't that impressive to have the courage to defend you allies.",
        mess6_3 = "I'm fighting with my full strength from now!",
        mess7 = "DMG UP"
    },
    [4910024] = {
        RAGE = "Rage Mode",
        ANTIDAMAGE = "Negates All DMG (except CRI DMG)",
        ANTICRITICAL = "Negates All DMG (except while Burning)",
        ANTIWATER = "Drain Water DMG",
        BARRIEREND = "Cancel DMG Negating",
        REGENATION = "HP Auto-recovery",
        BURN = "Stop Auto-recovery",
        RESTART = "Restart Auto-recovery",
        ANTIBURN = "Burn Resistance",
        BURNDOWN = "Burning Resistance DOWN",
        TALK1 = "Welcome! Get ready!",
        TALK2 = "Not bad... But I ain't gonna lose!",
        TALK3 = "No, no way... Here's my last hope!",
        TALK4 = "NO WAAAAAAAAAAAAY!"
    },

    [49101] = {
        RAGE = "Rage Mode",
        ANTIDAMAGE = "Negates All DMG (except CRI DMG)",
        ANTICRITICAL = "Negates All DMG (except while Burning)",
        ANTIWATER = "Drain Water DMG",
        BARRIEREND = "Cancel DMG Negating",
        REGENATION = "HP Auto-recovery",
        BURN = "Stop Auto-recovery",
        RESTART = "Restart Auto-recovery",
        ANTIBURN = "Burn Resistance",
        BURNDOWN = "Burning Resistance DOWN",
        TALK1 = "Welcome! Get ready!",
        TALK2 = "Not bad... But I ain't gonna lose!",
        TALK3 = "No, no way... Here's my last hope!",
        TALK4 = "NO WAAAAAAAAAAAAY!"
    },


    [2007705] = {
        START_MESSAGE1 = "Dark & Fire Elemental Killer",
        START_MESSAGE2 = "CRI Resistance",
        START_MESSAGE3 = "Resistance against all Status Ailment"
    },

    [2007709] = {
        START_MESSAGE1 = "Dark & Fire Elemental Killer",
        START_MESSAGE2 = "CRI Resistance",
        START_MESSAGE3 = "Resistance against all Status Ailment",
        RAGE_MESSAGE1 = "The moment I promised...",
        RAGE_MESSAGE2 = "Slash... its existance!",
        RAGE_MESSAGE3 = "I haven't slashed it yet..."
    },

    [4000617] = {
        START_MESSAGE1 = "DMG DOWN except Light",
        START_MESSAGE2 = "Negates CRI BUFF",
        START_MESSAGE3 = "Fire, Water, Earth Killer",
        RAGE_MESSAGE1 = "DMG DOWN except Dark",
        RAGE_MESSAGE2 = "ATK speed UP",
        RAGE_MESSAGE3 = "DMG UP",
        RAGE_MESSAGE4 = "When the judgement will come...",
        RAGE_MESSAGE5 = "the verdict will be accomplished!"
    },
    [4000627] = {
        START_MESSAGE1 = "DMG DOWN except Light",
        START_MESSAGE2 = "Negates CRI BUFF",
        START_MESSAGE3 = "Fire, Water, Earth Killer",
        RAGE_MESSAGE1 = "DMG DOWN except Dark",
        RAGE_MESSAGE2 = "ATK speed UP",
        RAGE_MESSAGE3 = "DMG UP",
        RAGE_MESSAGE4 = "When the judgement will come...",
        RAGE_MESSAGE5 = "the verdict will be accomplished!"
    },
    [4000637] = {
        START_MESSAGE1 = "DMG DOWN except Light",
        START_MESSAGE2 = "Negates CRI BUFF",
        START_MESSAGE3 = "Fire, Water, Earth Killer",
        RAGE_MESSAGE1 = "DMG DOWN except Dark",
        RAGE_MESSAGE2 = "ATK speed UP",
        RAGE_MESSAGE3 = "DMG UP",
        RAGE_MESSAGE4 = "When the judgement will come...",
        RAGE_MESSAGE5 = "the verdict will be accomplished!"
    },
    [4000647] = {
        START_MESSAGE1 = "DMG DOWN except Light",
        START_MESSAGE2 = "Negates CRI BUFF",
        START_MESSAGE3 = "Fire, Water, Earth Killer",
        RAGE_MESSAGE1 = "DMG DOWN except Dark",
        RAGE_MESSAGE2 = "ATK speed UP",
        RAGE_MESSAGE3 = "DMG UP",
        RAGE_MESSAGE4 = "When the judgement will come...",
        RAGE_MESSAGE5 = "the verdict will be accomplished!"
    },
    [4000717] = {
        START_MESSAGE1 = "ブレイク耐性",
        START_MESSAGE2 = "毒状態以外ダメージ無効",
        START_MESSAGE3 = "水属性キラー"
    },
    [4000727] = {
        START_MESSAGE1 = "ブレイク耐性",
        START_MESSAGE2 = "毒状態以外ダメージ無効",
        START_MESSAGE3 = "水属性キラー"
    },
    [4000737] = {
        START_MESSAGE1 = "ブレイク耐性",
        START_MESSAGE2 = "毒状態以外ダメージ無効",
        START_MESSAGE3 = "水属性キラー"
    },
    [4000747] = {
        START_MESSAGE1 = "ブレイク耐性",
        START_MESSAGE2 = "毒状態以外ダメージ無効",
        START_MESSAGE3 = "水属性キラー"
    },        
    [2007631] = {
        START_MESSAGE1 = "Light resistance",
        START_MESSAGE2 = "Break resistance DOWN during Disease",
        RAGE_MESSAGE1 = "I'll show you my power...",
        RAGE_MESSAGE2 = "DMG UP",
        RAGE_MESSAGE3 = "Reduce DMG",
        RAGE_MESSAGE4 = "Now this is interesting...",
        TALK1_1 = "I'm going to win once and for all.",
        TALK1_2 = "Show me what you've learned!",
        TALK2_1 = "You think you can beat me, Corsair?",
        TALK2_2 = "Yes--I will win!",
        TALK2_3 = "In the name of the Ice Sword!",
        TALK3_1 = "I've never thought I'd meet you here.",
        TALK3_2 = "Show me what you've got!",
        TALK3_3 = "Hehe... Fine then. Bring it on!",
        TALK4_1 = "CORSAIR!!!!!!!!!!!!!!!!!!!",
        TALK4_2 = "Sister!? You have dark powers!?",
        TALK4_3 = "Nope, just kidding♪",
        TALK5_1 = "Those eyes... You're serious, aren't you?",
        TALK5_2 = "If you don't come with all your might...",
        TALK5_3 = "You won't get away unscathed!"
    },
    [2007637] = {
        START_MESSAGE1 = "Light resistance",
        START_MESSAGE2 = "Break resistance DOWN during Disease",
        RAGE_MESSAGE1 = "I'll show you my power...",
        RAGE_MESSAGE2 = "DMG UP",
        RAGE_MESSAGE3 = "Reduce DMG",
        RAGE_MESSAGE4 = "Now this is interesting...",
        TALK1_1 = "I'm going to win once and for all.",
        TALK1_2 = "Show me what you've learned!",
        TALK2_1 = "You think you can beat me, Corsair?",
        TALK2_2 = "Yes--I will win!",
        TALK2_3 = "In the name of the Ice Sword!",
        TALK3_1 = "I've never thought I'd meet you here.",
        TALK3_2 = "Show me what you've got!",
        TALK3_3 = "Hehe... Fine then. Bring it on!",
        TALK4_1 = "CORSAIR!!!!!!!!!!!!!!!!!!!",
        TALK4_2 = "Sister!? You have dark powers!?",
        TALK4_3 = "Nope, just kidding♪",
        TALK5_1 = "Those eyes... You're serious, aren't you?",
        TALK5_2 = "If you don't come with all your might...",
        TALK5_3 = "You won't get away unscathed!"
    },
    [2007643] = {
        START_MESSAGE1 = "Light resistance",
        START_MESSAGE2 = "Break resistance DOWN during Disease",
        RAGE_MESSAGE1 = "I'll show you my power...",
        RAGE_MESSAGE2 = "DMG UP",
        RAGE_MESSAGE3 = "Reduce DMG",
        RAGE_MESSAGE4 = "Now this is interesting...",
        TALK1_1 = "I'm going to win once and for all.",
        TALK1_2 = "Show me what you've learned!",
        TALK2_1 = "You think you can beat me, Corsair?",
        TALK2_2 = "Yes--I will win!",
        TALK2_3 = "In the name of the Ice Sword!",
        TALK3_1 = "I've never thought I'd meet you here.",
        TALK3_2 = "Show me what you've got!",
        TALK3_3 = "Hehe... Fine then. Bring it on!",
        TALK4_1 = "CORSAIR!!!!!!!!!!!!!!!!!!!",
        TALK4_2 = "Sister!? You have dark powers!?",
        TALK4_3 = "Nope, just kidding♪",
        TALK5_1 = "Those eyes... You're serious, aren't you?",
        TALK5_2 = "If you don't come with all your might...",
        TALK5_3 = "You won't get away unscathed!"
    },
    [2007931] = {
        START_MESSAGE1 = "You wish to challenge me...",
        DEAD_MESSAGE1 = "It was a pleasure... fighting you..."
    },
    [2007937] = {
        START_MESSAGE1 = "Well then...",
        START_MESSAGE2 = "Reduce Light & Dark DMG",
        DEAD_MESSAGE1 = "Your skills... How!",
        SUMMARY = "Reduce Arts gauge"
    },
    [2007943] = {
        START_MESSAGE1 = "You wish to challenge me...",
        START_MESSAGE2 = "Reduce Light & Dark DMG",      
        DEAD_MESSAGE1 = "It was a pleasure... fighting you..."
    },
    [2007944] = {
        START_MESSAGE1 = "Well then...",
        START_MESSAGE2 = "Reduce Light & Dark DMG",
        DEAD_MESSAGE1 = "Your skills... How!",
        SUMMARY = "Reduce Arts gauge"
    },
    [2008243] = {
        START_MESSAGE1 = "Dark Resistance",
        FALL_MEO_MESSAGE1 = "そんな...ゴブ...",
        FALL_MEO_MESSAGE2 = "与ダメージUP",        
        FALL_MEO_MESSAGE3 = "防御力DOWN"
    },

    [2008243] = {
        START_MESSAGE1 = "クリティカル耐性",
        FALL_MEO_MESSAGE1 = "そんな…メオ…",
        FALL_MEO_MESSAGE2 = "与ダメージUP",        
        FALL_MEO_MESSAGE3 = "光属性耐性DOWN"
    },

    [2008843] = {
        START_MESSAGE1 = "Sakura Itto-Ryu Mira, here I come!",
        DEAD_MESSAGE1 = "I'm sorry... Sakura...",
        DESTROY_YOMI_MESSAGE1 = "How dare you treat Yomi like that!",
        DESTROY_YOMI_MESSAGE2 = "DMG UP"
    },
    [2009043] = {
        START_MESSAGE1 = "This is perfect for practice.",
        RAGE_MESSAGE1 = "Brace yourself... There's no way out.",
        RAGE_MESSAGE2 = "Action speed & CRI resistance UP"
    },
    [2009843] = {
        START_MESSAGE1 = "You want practice? I won't go easy on you!",
        START_MESSAGE2 = "DMG UP (Except Dark & Light)",
        START_MESSAGE3 = "Evasion rate UP",
        DEAD_ZENON_MESSAGE = "DMG UP",
        DEAD_LILY_MESSAGE = "Arts gauge Auto-fill Speed UP",
        RAGE_MESSAGE = "I haven't even used half of my powers!"
    },
    --属性回廊闇のフォスラディウス
    [2005533] = {
        mess1 = "Negates DMG (Except when Blind)",
        mess2 = "Arts Gauge Boost UP",
        mess3 = "Break Gauge Restored"
    },
    --属性回廊光のマヴロスキア
    [2005433] = {
        mess1 = "Rage Status: Break Power UP",
        mess2 = "Clear Angry Status",
        mess3 = "Negates DMG (Except when Paralyze)"
    },
    [200200000] = {
        UNIT_NAME = "Giant Dakyuon",
        START_MESSAGE = "MAX DMG 999"
    },
    [200200001] = {
        UNIT_NAME = "Giant Dakyuon",
        START_MESSAGE = "MAX DMG 999"
    },
    [200200002] = {
        UNIT_NAME = "Giant Dakyuon",
        START_MESSAGE = "MAX DMG 999"
    },
    [200200003] = {
        UNIT_NAME = "Giant Dakyuon",
        START_MESSAGE = "MAX DMG 999"
    },
    [200200004] = {
        UNIT_NAME = "Giant Dakyuon",
        START_MESSAGE = "MAX DMG 999"
    },
    [200200005] = {
        UNIT_NAME = "Giant Dakyuon",
        START_MESSAGE = "MAX DMG 999"
    },
    [4000817] = {
        mess1 = "命中率UP",
        mess2 = "全属性耐性UP",
        mess3 = "行動速度・ダメージUP"
    },
    [4000827] = {
        mess1 = "命中率UP",
        mess2 = "全属性耐性UP",
        mess3 = "行動速度・ダメージUP"
    },
    [4000837] = {
        mess1 = "命中率UP",
        mess2 = "全属性耐性UP",
        mess3 = "行動速度・ダメージUP"
    },
    [4000847] = {
        mess1 = "命中率UP",
        mess2 = "全属性耐性UP",
        mess3 = "行動速度・ダメージUP"
    },
    [600000014] = {
        mess1 = "Boss has targeted you!",
        mess2 = "Fallen Cells Reactivated",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking.",
        mess3 = "Until End of the World:",
        min = " minutes",
        sec = " seconds"
    },
    [600000015] = {
        mess1 = "Boss has targeted you!",
        mess2 = "Fallen Cells Reactivated",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking.",
        mess3 = "Until End of the World:",
        min = " minutes",
        sec = " seconds"
    },
    [2008605] = {
        mess1 = "I tear you apart!!",
        mess2 = "Demons are abominable!",
        mess3 = "Demon Killer",
        mess4 = "Dark Resistance",
        mess5 = "Negates CRI DMG",
        mess6 = "Further... Mighter!"
    },
    [2008609] = {
        mess1 = "I tear you apart!!",
        mess2 = "Demons are abominable!",
        mess3 = "Demon Killer",
        mess4 = "Dark Resistance",
        mess5 = "Negates CRI DMG",
        mess6 = "Further... Mighter!",
        mess7 = "Break Res UP",
        mess8 = "Get lost!!",
        mess9 = "CRI rate UP",
        mess10 = "The girl...!!!"
    },
    [2000670] = {
        START_MESSAGE1 = "Accuracy Rate UP",
        MIST_MESSAGE1 = "Start DMG Stock",
        RAGE_MESSAGE1 = "Movement Speed UP",
        RAGE_MESSAGE2 = "DMG UP",
        RAGE_MESSAGE3 = "Break Resistance UP",
        LAST_MESSAGE1 = "Cannot defeat until Gauge Break"
    },
    [2000674] = {
        messageStart1 = "Reduce DMG to Blinded enemy",
        messageStart2 = "Reduce DMG to Poisoned enemy",
        messageStart3 = "Accuracy rate UP",
        messageWind1 = "Storm mode:Break Resistance UP",
        messageWind2 = "Storm mode:Evasion rate UP",
        messageWindEnd = "Storm mode End",
        messageRage = "Anger mode:DMG UP",
        messageHeat1 = "Heat up:Break Resistance DOWN",
        messageHeat2 = "Heat up:Evasion rate DOWN",
        messageHeat3 = "Heat up:DMG UP"
    },
    [200330022] = {
        mess1 = "Damage towards Target UP",
        mess2 = "Halloween Nightmare",
        mess3 = "Sureshot",
        mess4 = "Earth Resistance",
        mess5 = "Water Resistance",
        mess6 = "Light Resistance"
    },

    [2010143] = {
        START_MESSAGE1 = "Evasion rate & CRI rate UP",
        START_MESSAGE2 = "CRI DMG UP",
        RAGE_MESSAGE1 = "Don't you think you can win!",
        LAST_MESSAGE1 = "You had your chance"
    },
    [2010144] = {
        START_MESSAGE1 = "How was my surprise attack?"
    },

        --氷ドラゴン EX
    [2010431] = {
        START_MESSAGE1 = "Burn to stop Rage mode",
        START_MESSAGE2 = "Magic Resistance DOWN",
        RAGE_MESSAGE1 = "Rage mode: Damage over time",
        RAGE_END_MESSAGE1 = "Rage mode end",
        FREEZE_MESSAGE1 = "HP Auto-recovery during Freeze",
        DAMAGE_UP_MESSAGE1 = "DMG UP"
    },
    --氷ドラゴン EX2
    [2010437] = {
        START_MESSAGE1 = "Burn to stop Rage mode",
        START_MESSAGE2 = "Magic Resistance DOWN",
        RAGE_MESSAGE1 = "Rage mode: Damage over time",
        RAGE_END_MESSAGE1 = "Rage mode end",
        FREEZE_MESSAGE1 = "HP Auto-recovery during Freeze",
        DAMAGE_UP_MESSAGE1 = "DMG UP"
    },
    --氷ドラゴン 真EX
    [2010443] = {
        START_MESSAGE1 = "Burn to stop Rage mode",
        START_MESSAGE2 = "Magic Resistance DOWN",
        RAGE_MESSAGE1 = "Rage mode: Damage over time",
        RAGE_END_MESSAGE1 = "Rage mode end",
        FREEZE_MESSAGE1 = "HP Auto-recovery during Freeze",
        DAMAGE_UP_MESSAGE1 = "DMG UP"
    },

    --氷ドラゴン 限定EX

    [2010449] = {
        START_MESSAGE1 = "DMG UP to Earth units",
        RAGE_MESSAGE1 = "I'll show you my power...",
        RAGE_MESSAGE2 = "Magia Drive",
        RAGE_MESSAGE3 = "Arts gauge Auto-fill amount UP",
        RAGE_MESSAGE4 = "DMG UP",
        LAST_MESSAGE1 = "This is the end!"
    },

    [2010731] = {
        START_MESSAGE1 = "Earth Resistance DOWN",
        START_MESSAGE2 = "CRI rate & CRI DMG UP",
        START_MESSAGE3 = "Action speed UP",
        RAGE_MESSAGE = "Action speed & DMG UP",
    },
    [2010737] = {
        START_MESSAGE1 = "Earth Resistance DOWN",
        START_MESSAGE2 = "CRI rate & CRI DMG UP",
        START_MESSAGE3 = "Action speed UP",
        RAGE_MESSAGE = "Action speed & DMG UP",
    },
    [2010743] = {
        START_MESSAGE1 = "Earth Resistance DOWN",
        START_MESSAGE2 = "CRI rate & CRI DMG UP",
        START_MESSAGE3 = "Action speed UP",
        RAGE_MESSAGE = "Action speed & DMG UP",
    },
    [2010749] = {
        START_MESSAGE1 = "Here's my Extra Large Attack!",
        START_MESSAGE2 = "DMG UP to Water units",
        SKILL3_1_MESSAGE1 = "I'm pumped up!",
        SKILL3_1_MESSAGE2 = "Magia Drive",
        SKILL3_1_MESSAGE3 = "Movment Speed & CRI rate UP",
        SKILL3_2_MESSAGE1 = "I'll show you my full power!"
    },
    [2011231] = {
        RAGE_MESSAGE1 = "DMG UP",
        RAGE_MESSAGE2 = "Action Speed UP",
        START_MESSAGE1 = "CRI Resistance"
    },
    [2011237] = {
        RAGE_MESSAGE1 = "DMG UP",
        RAGE_MESSAGE2 = "Action Speed UP",
        START_MESSAGE1 = "CRI Resistance"
    },
    [2011243] = {
        RAGE_MESSAGE1 = "DMG UP",
        RAGE_MESSAGE2 = "Action Speed UP",
        START_MESSAGE1 = "CRI Resistance"
    },
    [2011249] = {
        START_MESSAGE1 = "Can you keep up with me?",
        START_MESSAGE2 = "Evasion rate UP",
        START_MESSAGE3 = "Evasion rate DOWN at BREAK",
        RAGE_MESSAGE1 = "My senses are getting sharper",
        RAGE_MESSAGE2 = "DMG & Action Speed UP",
        RAGE_MESSAGE3 = "You can't run away from me!",
        RAGE_MESSAGE4 = "Evasion rate & Action Speed UP"
    },
    [2011643] = {
        RAGE_MESSAGE1 = "Victory to the Gods!",
        RAGE_MESSAGE2 = "Movement Speed UP",
        LAST_MESSAGE1 = "May the name of the Gods be carved in history!"
    },

    [2011649] = {
        START_MESSAGE1 = "I've got something I'd like to protect, too!",
        START_MESSAGE2 = "CRI Resistance",
        START_MESSAGE3 = "Fire Resistance",
        HP50_MESSAGE1 = "Our pledge to our ruler!",
        HP30_MESSAGE1 = "Body and soul...!",
        HP30_MESSAGE2 = "DMG & Movement Speed UP"
    },
    [2012043] = {
        START_MESSAGE1 = "Fire Resistance & Fire Killer",
        START_MESSAGE2 = "Auto-recovery",
        RAGE_MESSAGE1 = "Take this!",
        LAST_MESSAGE1 = "Pierce the Azure Sky!"
    },
    [2012049] = {
        START_MESSAGE1 = "God Killer",
        START_MESSAGE2 = "Let's get started!",
        TIME50_MESSAGE1 = "The Pledge to our Ruler!",
        TIME50_MESSAGE2 = "Speed & CRI Rate UP",
        TIME80_MESSAGE1 = "DMG UP",
        TIME110_MESSAGE1 = "Hold on a little more!",
        TIME120_MESSAGE1 = "Good Job!",
        TALK1_MESSAGE1 = "I'll give you all I have!",
        TALK1_MESSAGE2 = "Show me all your strength!",
        TALK2_MESSAGE1 = "Hey, can you ease up a bit?",
        TALK2_MESSAGE2 = "This is a serious match!",
        TALK3_MESSAGE1 = "There's no choice... here I come!",
        TALK3_MESSAGE2 = "Don't be too hard on me. "
    },

    [2014142] = {
        START_MESSAGE1 = "GYAGYUGAAA！",
        START_MESSAGE2 = "DMG DOWN (END after BREAK)",
        BREAK_MESSAGE1 = "GOBUUGAGA…！！",
        BREAK_MESSAGE2 = "DMG DOWN END",
        RAGE_MESSAGE1 = "GYAGORRRAAAAA！！",
        RAGE_MESSAGE2 = "DMG UP"
    },

    [2014643] = {
        HP50_MESSAGE1 = "Backup's here!",
        HP50_MESSAGE2 = "Platina evades DMG while Parlot joins battle",
        HP30_MESSAGE1 = "The gate of Judgement has been opened."
    },
    [2014649] = {
        START_MESSAGE1 = "Completely evades DMG",
        HP30_MESSAGE1 = "Arts gauge Speed UP",
        TALK1_MESSAGE1 = "I'll protect you.",
        TALK2_MESSAGE1 = "Little Lady, wait for me!",
        TALK3_MESSAGE1 = "Princess Leone, hang in there! ",
        TALK4_MESSAGE1 = "I'll protect you.",
        TALK5_MESSAGE1 = "Leone! I'm here to save you!"
    },

    [2014831] = {
        mess1 = "This is the rage of the Stars!",
        mess2 = "DMG received DOWN (ends after BREAK)",
        mess3 = "DMG received DOWN END"
    },
    [2014837] = {
        mess1 = "This is the rage of the Stars!",
        mess2 = "DMG received DOWN (ends after BREAK)",
        mess3 = "DMG received DOWN END"
    },
    [2014843] = {
        mess1 = "This is the rage of the Stars!",
        mess2 = "DMG received DOWN (ends after BREAK)",
        mess3 = "DMG received DOWN END"
    },
    [2014849] = {
        START_MESSAGE1 = "Defeat all the Templars within 250s!",
        START_MESSAGE2 = "Riviera, leave the defense to me!",
        START_MESSAGE3 = "Let's begin!",
        START_MESSAGE4 = "Riviera negates DMG while Thetis is there"
    },
    [2014851] = {
        START_MESSAGE1 = "Next is my turn!",
        START_MESSAGE2 = "Negates Magic DMG"
    },
    [2014852] = {
        START_MESSAGE1 = "Swordsman Berwick is here!",
        START_MESSAGE2 = "Negates Physical DMG"
    },
    [2014853] = {
        START_MESSAGE1 = "You came this far, but now try to defeat me!"
    },

    [487100000] = {
        HP_REDUCE_MESSAGE = "MAX HP DOWN",
        START_MESSAGE = "Negate Light Unit DMG & Break",
        BUFF_MESSAGE1 = "Negate DMG end",
        BUFF_MESSAGE2 = "DMG UP",
        BUFF_MESSAGE3 = "CRI Rate UP"
    },
    [487100020] = {
        HP_REDUCE_MESSAGE = "MAX HP DOWN",
        START_MESSAGE = "Negate Light Unit DMG & Break",
        BUFF_MESSAGE1 = "Negate DMG end",
        BUFF_MESSAGE2 = "DMG UP",
        BUFF_MESSAGE3 = "CRI Rate UP"
    },
    [487100041] = {
        HP_REDUCE_MESSAGE = "MAX HP DOWN",
        START_MESSAGE = "Negate Light Unit DMG & Break",
        BUFF_MESSAGE1 = "Negate DMG end",
        BUFF_MESSAGE2 = "DMG UP",
        BUFF_MESSAGE3 = "CRI Rate UP"
    },
    [2015429] = {
        SHOADOW = "Shadow Lightning Stance"
    },
    [2015430] = {
        START_MESSAGE1 = "DMG UP when Paralyzed",
        START_MESSAGE2 = "DMG UP when Freezed",
        HP30_MESSAGE1 = "Action Speed UP",
        SHOADOW = "Shadow Lightning Stance"
    },
    [2015436] = {
        START_MESSAGE1 = "DMG UP when Paralyzed",
        START_MESSAGE2 = "DMG UP when Freezed",
        HP30_MESSAGE1 = "Action Speed UP",
        SHOADOW = "Shadow Lightning Stance"
    },
    [2015442] = {
        START_MESSAGE1 = "DMG UP when Paralyzed",
        START_MESSAGE2 = "DMG UP when Freezed",
        HP30_MESSAGE1 = "Action Speed UP",
        SHOADOW = "Shadow Lightning Stance"
    },
    [2015449] = {
        RESULT_MESSAGE1 = " TOT",
        RESULT_MESSAGE2 = " DMG!!",
        RESULT_MESSAGE3 = "MAX HIT DMG ",
        DAMAGE_MESSAGE1 = ",000",
        DAMAGE_MESSAGE2 = "%d億",
        DAMAGE_MESSAGE3 = " DMG!!",
        DAMAGE_MESSAGE4 = " HIT",
        DAMAGE_MESSAGE5 = " DMG!!",
        START_MESSAGE1 = "Super-recovery",
        START_MESSAGE3 = "Negate BREAK DMG",
        START_MESSAGE2 = "Allies' DMG UP",
        START_MESSAGE4 = "100,000,000 DMG in 120s CLEAR!!",
        LOSE_MESSAGE1 = "You couldn't reach 100,000,000 DMG...",
        LOSE_MESSAGE2 = "Arts gauge Recovery Speed UP"
    },
    [501261413] = {
        mess1 = "Targeted by Boss!",
        mess2 = "Fallen Cells Reactivated",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking.",
        START_MESSAGE1 = "Every 2 min Elemental Killer changes",
        START_MESSAGE2 = "Killer effect reduced with Burn, Blind, Poison",  
        START_MESSAGE3 = "Accuracy rate UP",
        RAGE_MESSAGE = "Action speed UP",
        BREAK_MESSAGE = "DMG UP during BREAK"
    },
    [600000016] = {
        mess1 = "Targeted by Boss!",
        mess2 = "Fallen Cells Reactivated",
        telop1 = "DMG from enemy increases when targeted.",
        telop2 = "When your unit falls, replace them and fight!",
        telop3 = "Targeted by Boss!",
        telop4 = "Boss has powered up!",
        telop5 = "When your unit falls, replace them and fight!",
        telop6 = "Rewards will vary according to your ranking.",
        START_MESSAGE1 = "Every 2 min Elemental Killer changes",
        START_MESSAGE2 = "Killer effect reduced with Burn, Blind, Poison",  
        START_MESSAGE3 = "Accuracy rate UP",
        RAGE_MESSAGE = "Action speed UP",
        BREAK_MESSAGE = "DMG UP during BREAK"
    },

    [600000018] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Fire units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Fire units"
    },
    [600000019] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Water units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Water units"
    },
    [600000020] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Earth units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Earth units"
    },
    [600000021] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Light units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Light units"
    },

    [600000022] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Dark units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Dark units"
    },

    [600000023] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Fire units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Fire units"
    },

    [600000024] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Water units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Water units"
    },

    [600000025] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Earth units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Earth units"
    },

    [600000026] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Light units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Light units"
    },

    [600000027] = {
        mess1 = "EeegGaAaga... EEgaGAaa...",
        mess2 = "ReEEee... REeeeEEE...",
        mess3 = "BwWeEaHH... BwwWeaHH...",
        DEAD1 = "DMG UP to Dark units",
        DEAD2 = "If Boss has Burn / Blind / Poison, DMG DOWN to Dark units"
    }

}


_M.QUESTS = {
    --タスモン強襲
    [1001402] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },
    [1001401] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --ゴルネコ強襲
    [1001302] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },
    [1001301] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --ミキュオン強襲
    [1001201] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --コロック強襲
    [1001101] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --フレイド強襲
    [1000901] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --ミキュオン強襲
    [1000801] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --コロック強襲
    [1000701] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --フレイド強襲
    [1000601] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --メタチキ強襲
    [1001701] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    --メタチキ強襲
    [1001702] = {
        DEAD_ENEMY_TEXT = "Defeated",
    },

    [4000301] = {
        mess1 = "What's with this guys! Gotta tell the Boss!"
    },
    [4000302] = {
        mess1 = "What's with this guys! Gotta tell the Boss!"
    },
    [4000303] = {
        mess1 = "What's with this guys! Gotta tell the Boss!"
    },
    [4000304] = {
        mess1 = "What's with this guys! Gotta tell the Boss!"
    },
    [2014814] = {
        TALK_1 = "Out of time, I see.",
        TALK_2 = "See ya later, alligator!",
        TALK_3 = "Aw, too bad...!",
        TALK_4 = "I guess this is where it ends.",
        TALK_5 = "It was a close fight..."
    }

}

_G.package.loaded[_NAME] = _M
return _M