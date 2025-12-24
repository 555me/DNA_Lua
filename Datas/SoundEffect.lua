-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SoundEffect.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {
  [1] = {
    NumLimit = 5,
    SoundId = 1,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_metal",
  },
  [2] = {
    NumLimit = 5,
    SoundId = 2,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_grass",
  },
  [3] = {
    NumLimit = 5,
    SoundId = 3,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_glass",
  },
  [4] = {
    NumLimit = 5,
    SoundId = 4,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_concrete",
  },
  [5] = {
    NumLimit = 5,
    SoundId = 5,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_flesh",
  },
  [11] = {
    NumLimit = 1,
    SoundId = 11,
    SoundPath = "event:/ui/common/pick_up_gold",
  },
  [12] = {
    NumLimit = 1,
    SoundId = 12,
    SoundPath = "event:/ui/common/pick_up_item",
  },
  [13] = {
    NumLimit = 1,
    SoundId = 13,
    SoundPath = "event:/ui/common/pick_up_magic_ball",
  },
  [17] = {
    NumLimit = 5,
    SoundId = 17,
    SoundPath = "event:/sfx/common/scene/gear/coin_get",
  },
  [21] = {
    NumLimit = 5,
    SoundId = 21,
    SoundPath = "event:/sfx/common/player/hit/magic/recover_hp",
  },
  [22] = {
    NumLimit = 5,
    SoundId = 22,
    SoundPath = "event:/sfx/common/player/hit/magic/recover_mp",
  },
  [32] = {
    NumLimit = 5,
    SoundId = 32,
    SoundPath = "event:/sfx/boss/Xibi/condemn_end",
  },
  [101] = {
    NumLimit = 5,
    SoundId = 101,
    SoundPath = "event:/sfx/player/Nvzhu/fire_hit",
  },
  [102] = {
    NumLimit = 1,
    SoundId = 102,
    SoundPath = "event:/sfx/common/player/hit/weapon/hit_cri",
  },
  [103] = {
    NumLimit = 2,
    SoundId = 103,
    SoundPath = "event:/sfx/common/player/hit/bullet/hit_normal",
    SubSoundId = 1,
  },
  [104] = {
    NumLimit = 3,
    SoundId = 104,
    SoundPath = "event:/sfx/common/player/hit/weapon/$MeleeHit$Hit_$MeleeHitLevel$",
    SubSoundId = 2,
  },
  [105] = {
    NumLimit = 5,
    SoundId = 105,
    SoundPath = "event:/sfx/common/player/hit/weapon/dualbladeHit_$MeleeHitLevel$",
    SubSoundId = 7,
  },
  [107] = {
    NumLimit = 5,
    SoundId = 107,
    SubSoundId = 3,
  },
  [108] = {
    NumLimit = 5,
    SoundId = 108,
    SoundPath = "event:/sfx/common/player/weapon/scythe_fx_appear",
  },
  [109] = {
    NumLimit = 5,
    SoundId = 109,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/shoot_fire",
  },
  [112] = {
    NumLimit = 2,
    SoundId = 112,
    SoundPath = "event:/sfx/common/player/hit/bullet/hit_normal_bow",
    SubSoundId = 4,
  },
  [115] = {
    NumLimit = 3,
    SoundId = 115,
    SoundPath = "event:/sfx/common/player/hit/magic/windHit_normal_feina",
  },
  [118] = {
    NumLimit = 5,
    SoundId = 118,
    SoundPath = "event:/sfx/weapon/$MeleeWeapon$/whip_heavyAttack_attack_fx",
  },
  [119] = {
    SoundId = 119,
    SoundPath = "event:/sfx/common/player/hit/weapon/mod_$MeleeHitLevel$",
  },
  [151] = {
    NumLimit = 3,
    SoundId = 151,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal",
    SubSoundId = 51,
  },
  [152] = {
    NumLimit = 5,
    SoundId = 152,
    SoundPath = "event:/sfx/common/player/hit/weapon/hit_death",
  },
  [201] = {
    NumLimit = 5,
    SoundId = 201,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_be_hit",
  },
  [202] = {
    NumLimit = 3,
    SoundId = 202,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_be_hit_heavy",
  },
  [204] = {
    NumLimit = 5,
    SoundId = 204,
    SoundPath = "event:/sfx/common/scene/gear/teleportPoint",
  },
  [205] = {
    NumLimit = 5,
    SoundId = 205,
    SoundPath = "event:/sfx/common/scene/gear/teleportPoint_loop",
  },
  [206] = {
    NumLimit = 5,
    SoundId = 206,
    SoundPath = "event:/sfx/common/scene/gear/parkour_loop",
  },
  [207] = {
    NumLimit = 5,
    SoundId = 207,
    SoundPath = "event:/sfx/common/scene/gear/parkour_arrived",
  },
  [208] = {
    NumLimit = 5,
    SoundId = 208,
    SoundPath = "event:/sfx/common/scene/gear/energysupply_particle",
  },
  [209] = {
    NumLimit = 5,
    SoundId = 209,
    SoundPath = "event:/sfx/common/scene/gear/energysupply_recover_fx",
  },
  [211] = {
    NumLimit = 5,
    SoundId = 211,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_fail",
  },
  [212] = {
    NumLimit = 5,
    SoundId = 212,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_lvup",
  },
  [213] = {
    NumLimit = 5,
    SoundId = 213,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_appear",
  },
  [214] = {
    NumLimit = 5,
    SoundId = 214,
    SoundPath = "event:/voice/$Locale$/char/$playername$/vo_battleidle",
  },
  [215] = {
    NumLimit = 5,
    SoundId = 215,
    SoundPath = "event:/sfx/common/scene/shenmiao/buff_common",
  },
  [216] = {
    NumLimit = 5,
    SoundId = 216,
    SoundPath = "event:/sfx/common/scene/shenmiao/countdown",
  },
  [217] = {
    NumLimit = 5,
    SoundId = 217,
    SoundPath = "event:/sfx/common/scene/shenmiao/exp_small",
  },
  [218] = {
    NumLimit = 5,
    SoundId = 218,
    SoundPath = "event:/sfx/common/scene/shenmiao/hammer_hit",
  },
  [219] = {
    NumLimit = 5,
    SoundId = 219,
    SoundPath = "event:/sfx/common/scene/shenmiao/buff_fly",
  },
  [220] = {
    NumLimit = 5,
    SoundId = 220,
    SoundPath = "event:/sfx/common/enemy/buff/darkhit",
  },
  [221] = {
    NumLimit = 5,
    SoundId = 221,
    SoundPath = "event:/sfx/common/scene/shenmiao/hammer_pre",
  },
  [301] = {
    NumLimit = 5,
    SoundId = 301,
    SoundPath = "event:/sfx/common/player/action/highheeled/footstep",
  },
  [302] = {
    NumLimit = 5,
    SoundId = 302,
    SoundPath = "event:/sfx/common/player/action/barefeet/footstep",
  },
  [401] = {
    NumLimit = 5,
    SoundId = 401,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_skill01",
  },
  [501] = {
    NumLimit = 5,
    SoundId = 501,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_$MeleeHitLevel$",
  },
  [502] = {
    NumLimit = 5,
    SoundId = 502,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_$MeleeHitLevel$_02",
  },
  [503] = {
    NumLimit = 5,
    SoundId = 503,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_$MeleeHitLevel$",
  },
  [504] = {
    NumLimit = 5,
    SoundId = 504,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_$MeleeHitLevel$_02",
  },
  [505] = {
    NumLimit = 5,
    SoundId = 505,
    SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_$MeleeHitLevel$",
  },
  [601] = {
    NumLimit = 5,
    SoundId = 601,
    SoundPath = "event:/sfx/pet/Zisha/burst",
  },
  [602] = {
    NumLimit = 5,
    SoundId = 602,
    SoundPath = "event:/sfx/pet/Yuyi/skill01_burst",
  },
  [603] = {
    NumLimit = 5,
    SoundId = 603,
    SoundPath = "event:/sfx/pet/Dahuo/skill01_burst",
  },
  [604] = {
    NumLimit = 5,
    SoundId = 604,
    SoundPath = "event:/sfx/pet/Zhamao/skill01_burst_hero",
  },
  [605] = {
    NumLimit = 5,
    SoundId = 605,
    SoundPath = "event:/sfx/pet/Zhamao/skill01_burst_player",
  },
  [606] = {
    NumLimit = 5,
    SoundId = 606,
    SoundPath = "event:/sfx/pet/Yaoye/skill01_burst_hero",
  },
  [607] = {
    NumLimit = 5,
    SoundId = 607,
    SoundPath = "event:/sfx/pet/Shanling/skill01_burst",
  },
  [608] = {
    NumLimit = 5,
    SoundId = 608,
    SoundPath = "event:/sfx/enemy/Jt/BlastRobot/skill01_exp",
  },
  [609] = {
    NumLimit = 5,
    SoundId = 609,
    SoundPath = "event:/sfx/pet/Nihao/skill01_burst",
  },
  [610] = {
    NumLimit = 5,
    SoundId = 610,
    SoundPath = "event:/sfx/pet/Zhenzhu/skill_fx_burst",
  },
  [611] = {
    NumLimit = 5,
    SoundId = 611,
    SoundPath = "event:/sfx/pet/Haomeng/skill01_burst",
  },
  [612] = {
    NumLimit = 5,
    SoundId = 612,
    SoundPath = "event:/sfx/pet/Fuyou/burst",
  },
  [613] = {
    NumLimit = 5,
    SoundId = 613,
    SoundPath = "event:/sfx/pet/Tangshuang/ice_burst",
  },
  [614] = {
    NumLimit = 5,
    SoundId = 614,
    SoundPath = "event:/sfx/pet/YYHW/skill01_burst",
  },
  [615] = {
    NumLimit = 5,
    SoundId = 615,
    SoundPath = "event:/sfx/pet/Pipa/skill01_burst",
  },
  [616] = {
    NumLimit = 5,
    SoundId = 616,
    SoundPath = "event:/sfx/pet/Mianmian/skill01_burst",
  },
  [617] = {
    NumLimit = 5,
    SoundId = 617,
    SoundPath = "event:/sfx/pet/Qiuqiu/skill01_burst",
  },
  [618] = {
    NumLimit = 5,
    SoundId = 618,
    SoundPath = "event:/sfx/pet/Heiyao/burst",
  },
  [619] = {
    NumLimit = 5,
    SoundId = 619,
    SoundPath = "event:/sfx/pet/Jingqing/skill01_burst",
  },
  [620] = {
    NumLimit = 5,
    SoundId = 620,
    SoundPath = "event:/sfx/pet/Manao/skill01_burst",
  },
  [621] = {
    NumLimit = 5,
    SoundId = 621,
    SoundPath = "event:/sfx/pet/Zijing/skill01_burst",
  },
  [622] = {
    NumLimit = 5,
    SoundId = 622,
    SoundPath = "event:/sfx/pet/Bixi/skill01_burst",
  },
  [623] = {
    NumLimit = 5,
    SoundId = 623,
    SoundPath = "event:/sfx/pet/Oubo/skill01_burst",
  },
  [1001] = {
    NumLimit = 5,
    SoundId = 1001,
    SoundPath = "event:/sfx/common/enemy/hit/bullet_hit",
    SubSoundId = 101,
  },
  [1002] = {
    NumLimit = 3,
    SoundId = 1002,
    SoundPath = "event:/sfx/common/player/hit/weapon/weaponHit_comp_drop",
  },
  [1003] = {
    NumLimit = 2,
    SoundId = 1003,
    SoundPath = "event:/sfx/common/enemy/hit/weapon_hit",
  },
  [1004] = {
    NumLimit = 3,
    SoundId = 1004,
    SoundPath = "event:/sfx/common/player/hit/weapon/weaponHit_comp_hit_ground",
  },
  [2001] = {
    NumLimit = 5,
    SoundId = 2001,
    SoundPath = "event:/sfx/common/scene/gear/foliage_jump",
  },
  [2002] = {
    NumLimit = 5,
    SoundId = 2002,
    SoundPath = "event:/sfx/common/scene/baoxiang/show",
  },
  [2003] = {
    NumLimit = 5,
    SoundId = 2003,
    SoundPath = "event:/sfx/common/scene/baoxiang/unlock",
  },
  [2004] = {
    NumLimit = 5,
    SoundId = 2004,
    SoundPath = "event:/sfx/common/scene/baoxiang/dark_burst",
  },
  [2005] = {
    NumLimit = 5,
    SoundId = 2005,
    SoundPath = "event:/sfx/common/scene/baoxiang/dark_dismiss",
  },
  [2006] = {
    NumLimit = 5,
    SoundId = 2006,
    SoundPath = "event:/sfx/common/scene/baoxiang/foliage_burst",
  },
  [2007] = {
    NumLimit = 5,
    SoundId = 2007,
    SoundPath = "event:/sfx/common/scene/baoxiang/foliage_burn",
  },
  [2008] = {
    NumLimit = 5,
    SoundId = 2008,
    SoundPath = "event:/sfx/common/scene/baoxiang/ice_burst",
  },
  [2009] = {
    NumLimit = 5,
    SoundId = 2009,
    SoundPath = "event:/sfx/common/scene/baoxiang/ice_dismiss",
  },
  [2010] = {
    NumLimit = 5,
    SoundId = 2010,
    SoundPath = "event:/sfx/common/scene/baoxiang/shimmer_burst",
  },
  [2011] = {
    NumLimit = 5,
    SoundId = 2011,
    SoundPath = "event:/sfx/common/scene/baoxiang/shimmer_dismiss",
  },
  [2012] = {
    NumLimit = 5,
    SoundId = 2012,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_little_appear",
  },
  [2013] = {
    NumLimit = 5,
    SoundId = 2013,
    SoundPath = "event:/sfx/common/scene/gear/daba_hit",
  },
  [2014] = {
    NumLimit = 5,
    SoundId = 2014,
    SoundPath = "event:/sfx/common/scene/paotai/on",
  },
  [2015] = {
    NumLimit = 5,
    SoundId = 2015,
    SoundPath = "event:/sfx/common/scene/paotai/off",
  },
  [2016] = {
    NumLimit = 5,
    SoundId = 2016,
    SoundPath = "event:/sfx/common/scene/paotai/shoot_single",
  },
  [2017] = {
    NumLimit = 5,
    SoundId = 2017,
    SoundPath = "event:/sfx/common/scene/paotai/exp_single",
  },
  [2018] = {
    NumLimit = 5,
    SoundId = 2018,
    SoundPath = "event:/sfx/common/scene/paotai/shoot_auto",
  },
  [2019] = {
    NumLimit = 5,
    SoundId = 2019,
    SoundPath = "event:/sfx/common/scene/paotai/exp_auto",
  },
  [2020] = {
    NumLimit = 5,
    SoundId = 2020,
    SoundPath = "event:/sfx/common/scene/paotai/exhasut",
  },
  [2021] = {
    NumLimit = 5,
    SoundId = 2021,
    SoundPath = "event:/sfx/common/scene/interact/firemach_hit",
  },
  [2022] = {
    NumLimit = 5,
    SoundId = 2022,
    SoundPath = "event:/sfx/common/scene/baoxiang/vanish",
  },
  [2023] = {
    NumLimit = 5,
    SoundId = 2023,
    SoundPath = "event:/sfx/common/scene/week/gold_shot",
  },
  [2024] = {
    NumLimit = 5,
    SoundId = 2024,
    SoundPath = "event:/sfx/common/scene/week/gold_hit",
  },
  [2026] = {
    NumLimit = 5,
    SoundId = 2026,
    SoundPath = "event:/sfx/common/scene/week/baoxiang_open",
  },
  [2027] = {
    NumLimit = 5,
    SoundId = 2027,
    SoundPath = "event:/sfx/common/scene/baoxiang/common_low",
  },
  [2028] = {
    NumLimit = 5,
    SoundId = 2028,
    SoundPath = "event:/sfx/common/scene/baoxiang/common_mid",
  },
  [2029] = {
    NumLimit = 5,
    SoundId = 2029,
    SoundPath = "event:/sfx/common/scene/baoxiang/common_high",
  },
  [2030] = {
    NumLimit = 5,
    SoundId = 2030,
    SoundPath = "event:/sfx/common/scene/baoxiang/juntuan_low",
  },
  [2031] = {
    NumLimit = 5,
    SoundId = 2031,
    SoundPath = "event:/sfx/common/scene/baoxiang/juntuan_mid",
  },
  [2032] = {
    NumLimit = 5,
    SoundId = 2032,
    SoundPath = "event:/sfx/common/scene/baoxiang/juntuan_high",
  },
  [2033] = {
    SoundId = 2033,
    SoundPath = "event:/sfx/common/scene/magic_box",
  },
  [2034] = {
    SoundId = 2034,
    SoundPath = "event:/sfx/common/player/buff/huaxu_speed_up",
  },
  [2035] = {
    SoundId = 2035,
    SoundPath = "event:/sfx/common/scene/east/fushu_debuff_lp",
  },
  [2036] = {
    SoundId = 2036,
    SoundPath = "event:/sfx/common/player/hit/magic/jishu_normal",
  },
  [2037] = {
    SoundId = 2037,
    SoundPath = "event:/sfx/common/scene/baoxiang/east_low",
  },
  [2038] = {
    SoundId = 2038,
    SoundPath = "event:/sfx/common/scene/baoxiang/east_mid",
  },
  [2039] = {
    SoundId = 2039,
    SoundPath = "event:/sfx/common/scene/baoxiang/east_high",
  },
  [2040] = {
    NumLimit = 5,
    SoundId = 2040,
    SoundPath = "event:/sfx/common/scene/east/fushu_buff_heal",
  },
  [2101] = {
    NumLimit = 5,
    SoundId = 2101,
    SoundPath = "event:/sfx/common/scene/ice/berg_start",
  },
  [2102] = {
    NumLimit = 5,
    SoundId = 2102,
    SoundPath = "event:/sfx/common/scene/ice/berg_exp",
  },
  [2111] = {
    NumLimit = 5,
    SoundId = 2111,
    SoundPath = "event:/sfx/common/scene/powder/exp",
  },
  [2170] = {
    NumLimit = 5,
    SoundId = 2170,
    SoundPath = "event:/sfx/common/scene/magic/show_01",
  },
  [2190] = {
    NumLimit = 5,
    SoundId = 2190,
    SoundPath = "event:/sfx/common/scene/magic/poof_01",
  },
  [2201] = {
    NumLimit = 5,
    SoundId = 2201,
    SoundPath = "event:/sfx/common/scene/panshen/magic_shimmer",
  },
  [2202] = {
    NumLimit = 5,
    SoundId = 2202,
    SoundPath = "event:/sfx/common/scene/panshen/magic_wind",
  },
  [2205] = {
    NumLimit = 5,
    SoundId = 2205,
    SoundPath = "event:/sfx/common/scene/panshen/magic_step",
  },
  [3001] = {
    NumLimit = 3,
    SoundId = 3001,
    SoundPath = "event:/sfx/common/player/action/footstep_costume_hudie",
  },
  [3002] = {
    NumLimit = 3,
    SoundId = 3002,
    SoundPath = "event:/sfx/btc/common/footstep_costume_yongzhuang",
  },
  [3101] = {
    NumLimit = 5,
    SoundId = 3101,
    SoundPath = "event:/sfx/common/player/action/huanwen_costume_hudie",
  },
  [3102] = {
    NumLimit = 5,
    SoundId = 3102,
    SoundPath = "event:/sfx/btc/common/huanwen_costume_yongzhuang",
  },
  [3201] = {
    NumLimit = 5,
    SoundId = 3201,
    SoundPath = "event:/sfx/common/player/action/death01",
  },
  [3301] = {
    SoundId = 3301,
    SoundPath = "event:/sfx/btc/starry/fallattack",
  },
  [3302] = {
    SoundId = 3302,
    SoundPath = "event:/sfx/btc/summer/fallattack",
  },
  [3401] = {
    SoundId = 3401,
    SoundPath = "event:/sfx/btc/starry/bulletjump",
  },
  [3402] = {
    SoundId = 3402,
    SoundPath = "event:/sfx/btc/summer/bulletjump",
  },
  [10001] = {
    NumLimit = 5,
    SoundId = 10001,
    SoundPath = "event:/sfx/boss/Nanzhu/passive",
  },
  [10002] = {
    NumLimit = 2,
    SoundId = 10002,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy",
  },
  [18010] = {
    NumLimit = 5,
    SoundId = 18010,
    SoundPath = "event:/sfx/common/scene/ac/feina_shoot",
  },
  [18011] = {
    NumLimit = 5,
    SoundId = 18011,
    SoundPath = "event:/sfx/common/scene/ac/feina_fall",
  },
  [18012] = {
    NumLimit = 5,
    SoundId = 18012,
    SoundPath = "event:/sfx/common/scene/ac/feina_idle_loop",
  },
  [110101] = {
    NumLimit = 5,
    SoundId = 110101,
    SoundPath = "event:/sfx/player/Heitao/skill01_hit",
  },
  [110301] = {
    NumLimit = 5,
    SoundId = 110301,
    SoundPath = "event:/sfx/player/Tuosi/change_shooting_loop",
  },
  [110302] = {
    NumLimit = 5,
    SoundId = 110302,
    SoundPath = "event:/sfx/player/Tuosi/fury_shooting_loop",
  },
  [110303] = {
    NumLimit = 5,
    SoundId = 110303,
    SoundPath = "event:/sfx/player/Tuosi/change_loop",
  },
  [110304] = {
    NumLimit = 5,
    SoundId = 110304,
    SoundPath = "event:/sfx/player/Tuosi/fury_start",
  },
  [110305] = {
    NumLimit = 3,
    SoundId = 110305,
    SoundPath = "event:/sfx/common/player/hit/weapon/clawHit_normal",
  },
  [110306] = {
    NumLimit = 3,
    SoundId = 110306,
    SoundPath = "event:/sfx/common/player/hit/weapon/clawHit_normal",
  },
  [110307] = {
    NumLimit = 3,
    SoundId = 110307,
    SoundPath = "event:/sfx/common/player/hit/weapon/clawHit_heavy",
  },
  [110308] = {
    NumLimit = 2,
    SoundId = 110308,
    SoundPath = "event:/sfx/common/player/hit/weapon/spearHit_heavy",
  },
  [110309] = {
    NumLimit = 5,
    SoundId = 110309,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_02",
  },
  [110310] = {
    NumLimit = 5,
    SoundId = 110310,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_none",
  },
  [110311] = {
    NumLimit = 5,
    SoundId = 110311,
    SoundPath = "event:/sfx/common/player/hit/magic/lightingHit",
  },
  [110312] = {
    NumLimit = 5,
    SoundId = 110312,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_03",
  },
  [150101] = {
    NumLimit = 5,
    SoundId = 150101,
    SoundPath = "event:/sfx/player/Baonu/passive_01",
  },
  [150102] = {
    NumLimit = 5,
    SoundId = 150102,
    SoundPath = "event:/sfx/player/Baonu/passive_02",
  },
  [150103] = {
    NumLimit = 5,
    SoundId = 150103,
    SoundPath = "event:/sfx/player/Baonu/passive_03",
  },
  [150104] = {
    NumLimit = 5,
    SoundId = 150104,
    SoundPath = "event:/sfx/player/Baonu/passive_04",
  },
  [150105] = {
    NumLimit = 5,
    SoundId = 150105,
    SoundPath = "event:/sfx/player/Baonu/passive_explode",
  },
  [150106] = {
    SoundId = 150106,
    SoundPath = "event:sfx/common/player/hit/weapon/heavySwordHit_normal",
    SubSoundId = 2,
  },
  [150107] = {
    SoundId = 150107,
    SoundPath = "event:sfx/common/player/hit/weapon/heavySwordHit_heavy",
    SubSoundId = 2,
  },
  [150201] = {
    NumLimit = 5,
    SoundId = 150201,
    SoundPath = "event:/sfx/player/Nifu/skill01",
  },
  [150202] = {
    NumLimit = 5,
    SoundId = 150202,
    SoundPath = "event:/sfx/player/Nifu/skill01_strengthen",
  },
  [150203] = {
    NumLimit = 5,
    SoundId = 150203,
    SoundPath = "event:/sfx/player/Nifu/skill01_explode",
  },
  [150204] = {
    NumLimit = 5,
    SoundId = 150204,
    SoundPath = "event:/sfx/player/Nifu/skill01_explode_strengthen",
  },
  [150205] = {
    NumLimit = 5,
    SoundId = 150205,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_hit",
  },
  [150301] = {
    NumLimit = 3,
    SoundId = 150301,
    SoundPath = "event:/sfx/player/Kezhou/passive_weapon_loop",
  },
  [150303] = {
    NumLimit = 5,
    SoundId = 150303,
    SoundPath = "event:/sfx/player/Kezhou/polearm_runattack_02_cast_loop",
  },
  [150304] = {
    NumLimit = 5,
    SoundId = 150304,
    SoundPath = "event:/sfx/player/Kezhou/sword_runattack_04_loop",
  },
  [150305] = {
    NumLimit = 5,
    SoundId = 150305,
    SoundPath = "event:/sfx/player/Kezhou/skill02_fall",
  },
  [150306] = {
    NumLimit = 3,
    SoundId = 150306,
    SoundPath = "event:/sfx/player/Kezhou/skill02_weapon_loop",
  },
  [150307] = {
    NumLimit = 5,
    SoundId = 150307,
    SoundPath = "event:/sfx/player/Kezhou/skill01",
  },
  [150308] = {
    NumLimit = 3,
    SoundId = 150308,
    SoundPath = "event:/sfx/player/Kezhou/passive_weapon_hit",
  },
  [150309] = {
    NumLimit = 5,
    SoundId = 150309,
    SoundPath = "event:/sfx/weapon/Polearm/Kezhou/mod01_fly",
  },
  [160101] = {
    NumLimit = 5,
    SoundId = 160101,
    SoundPath = "event:/sfx/common/player/hit/weapon/mod_light",
  },
  [160102] = {
    NumLimit = 1,
    SoundId = 160102,
    SoundPath = "event:/sfx/player/NanzhuLight/skill01_fx_loop",
  },
  [160103] = {
    NumLimit = 5,
    SoundId = 160103,
    SoundPath = "event:/sfx/common/player/hit/magic/NanzhuLight_hit",
  },
  [160104] = {
    NumLimit = 5,
    SoundId = 160104,
    SoundPath = "event:/sfx/common/player/hit/magic/NanzhuLight_hit",
  },
  [180101] = {
    NumLimit = 5,
    SoundId = 180101,
    SoundPath = "event:/sfx/player/Feina/magic_water_loop",
  },
  [180102] = {
    NumLimit = 5,
    SoundId = 180102,
    SoundPath = "event:/sfx/player/Feina/magic_fire_loop",
  },
  [180103] = {
    NumLimit = 5,
    SoundId = 180103,
    SoundPath = "event:/sfx/player/Feina/magic_electric_loop",
  },
  [180104] = {
    NumLimit = 5,
    SoundId = 180104,
    SoundPath = "event:/sfx/player/Feina/magic_wind_loop",
  },
  [180105] = {
    NumLimit = 5,
    SoundId = 180105,
    SoundPath = "event:/sfx/player/Feina/passive_start",
  },
  [180106] = {
    NumLimit = 5,
    SoundId = 180106,
    SoundPath = "event:/sfx/player/Feina/passive_loop",
  },
  [180107] = {
    NumLimit = 5,
    SoundId = 180107,
    SoundPath = "event:/sfx/common/player/hit/magic/waterHit_normal_feina",
  },
  [180108] = {
    NumLimit = 5,
    SoundId = 180108,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal_feina",
  },
  [180109] = {
    NumLimit = 5,
    SoundId = 180109,
    SoundPath = "event:/sfx/common/player/hit/magic/electricHit_normal_feina",
  },
  [180110] = {
    NumLimit = 3,
    SoundId = 180110,
    SoundPath = "event:/sfx/common/player/hit/magic/windHit_normal_feina",
  },
  [201101] = {
    NumLimit = 5,
    SoundId = 201101,
    SoundPath = "event:/sfx/player/Awaer/skill01",
  },
  [201102] = {
    NumLimit = 5,
    SoundId = 201102,
    SoundPath = "event:/sfx/player/Awaer/skill02_exp_01",
  },
  [201103] = {
    NumLimit = 5,
    SoundId = 201103,
    SoundPath = "event:/sfx/player/Awaer/skill02_exp_02",
  },
  [201104] = {
    NumLimit = 5,
    SoundId = 201104,
    SoundPath = "event:/sfx/player/Awaer/skill02_exp_03",
  },
  [202101] = {
    NumLimit = 5,
    SoundId = 202101,
    SoundPath = "event:/sfx/player/Dafu/skill01_loop",
  },
  [202102] = {
    NumLimit = 5,
    SoundId = 202102,
    SoundPath = "event:/sfx/common/player/hit/magic/recover_hp",
  },
  [210101] = {
    NumLimit = 5,
    SoundId = 210101,
    SoundPath = "event:/sfx/player/Shuimu/skill_hit",
    SubSoundId = 53,
  },
  [210102] = {
    NumLimit = 3,
    SoundId = 210102,
    SoundPath = "event:/sfx/player/Shuimu/poison_hit",
  },
  [210103] = {
    NumLimit = 2,
    SoundId = 210103,
    SoundPath = "event:/sfx/player/Shuimu/poison_stack_warning",
  },
  [210104] = {
    NumLimit = 5,
    SoundId = 210104,
    SoundPath = "event:/sfx/player/Shuimu/poison_spread",
  },
  [210105] = {
    NumLimit = 5,
    SoundId = 210105,
    SoundPath = "event:/sfx/common/player/hit/magic/waterSuck_normal",
    SubSoundId = 53,
  },
  [230101] = {
    NumLimit = 3,
    SoundId = 230101,
    SoundPath = "event:/sfx/player/Zhangyu/tentacle_hit_ground",
    SubSoundId = 53,
  },
  [230102] = {
    NumLimit = 3,
    SoundId = 230102,
    SoundPath = "event:/sfx/player/Zhangyu/skill01_tentacle",
  },
  [230103] = {
    NumLimit = 3,
    SoundId = 230103,
    SoundPath = "event:/sfx/player/Zhangyu/tentacle_whoosh_carray",
    SubSoundId = 53,
  },
}
r3_0[240101] = {
  NumLimit = 3,
  ReplaceSoundID = {
    [240199] = "event:/sfx/player/Baiheng01/skill01_link",
  },
  SoundId = 240101,
  SoundPath = "event:/sfx/player/Baiheng/skill01_link",
}
r3_0[240102] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [240199] = "event:/sfx/player/Baiheng01/skill01_recover_wave",
  },
  SoundId = 240102,
  SoundPath = "event:/sfx/player/Baiheng/skill01_recover_wave",
}
r3_0[240103] = {
  NumLimit = 5,
  SoundId = 240103,
  SoundPath = "event:/sfx/common/player/hit/magic/waterSuck_normal",
  SubSoundId = 53,
}
r3_0[240104] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [240199] = "event:/sfx/player/Baiheng01/Swimring",
  },
  SoundId = 240104,
}
r3_0[310101] = {
  NumLimit = 2,
  SoundId = 310101,
  SoundPath = "event:/sfx/player/Linen/skill01_buff_start",
}
r3_0[310102] = {
  NumLimit = 5,
  SoundId = 310102,
  SoundPath = "event:/sfx/player/Linen/skill_buff_be_hit",
  SubSoundId = 52,
}
r3_0[310103] = {
  NumLimit = 3,
  SoundId = 310103,
  SoundPath = "event:/sfx/player/Linen/skill01_buff_explode",
}
r3_0[310104] = {
  NumLimit = 5,
  SoundId = 310104,
  SoundPath = "event:/sfx/player/Linen/skill02_ui_show",
}
r3_0[310105] = {
  NumLimit = 5,
  SoundId = 310105,
  SoundPath = "event:/sfx/common/player/hit/magic/fireBall_hit",
}
r3_0[310201] = {
  NumLimit = 3,
  SoundId = 310201,
  SoundPath = "event:/sfx/common/player/hit/weapon/spearHit_light",
  SubSoundId = 52,
}
r3_0[310202] = {
  NumLimit = 5,
  SoundId = 310202,
  SoundPath = "event:/sfx/player/Xier/passive_weapon_shoot",
}
r3_0[310203] = {
  NumLimit = 5,
  SoundId = 310203,
  SoundPath = "event:/sfx/player/Xier/passive_weapon_shoot_add",
}
r3_0[310204] = {
  NumLimit = 2,
  SoundId = 310204,
  SoundPath = "event:/sfx/player/Xier/skill01_add_weapon_rotate",
}
r3_0[310205] = {
  NumLimit = 5,
  SoundId = 310205,
  SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
  SubSoundId = 52,
}
r3_0[310301] = {
  NumLimit = 3,
  SoundId = 310301,
  SoundPath = "event:/sfx/player/Yeer/landing",
}
r3_0[310302] = {
  NumLimit = 5,
  SoundId = 310302,
  SoundPath = "event:/sfx/player/Yeer/land_explode",
}
r3_0[320101] = {
  NumLimit = 5,
  SoundId = 320101,
  SoundPath = "event:/sfx/player/Haier/spike_appear",
}
r3_0[320102] = {
  SoundId = 320102,
  SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_metal",
  SubSoundId = 53,
}
r3_0[320103] = {
  SoundId = 320103,
  SoundPath = "event:/sfx/player/Haier/skill02_cast",
}
r3_0[320104] = {
  SoundId = 320104,
  SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_normal",
}
r3_0[320105] = {
  SoundId = 320105,
  SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy",
}
r3_0[330101] = {
  NumLimit = 3,
  SoundId = 330101,
  SoundPath = "event:/sfx/player/Maerjie/skill01_hit",
}
r3_0[330102] = {
  NumLimit = 1,
  SoundId = 330102,
  SoundPath = "event:/sfx/player/Maerjie/passive",
}
r3_0[330103] = {
  NumLimit = 1,
  SoundId = 330103,
  SoundPath = "event:/sfx/player/Maerjie/skill02_exp",
}
r3_0[330104] = {
  NumLimit = 5,
  SoundId = 330104,
  SoundPath = "event:/sfx/player/Maerjie/skill02_exp_add",
}
r3_0[410101] = {
  NumLimit = 5,
  SoundId = 410101,
  SoundPath = "event:/sfx/player/Lise/skill01_elec_nor",
}
r3_0[410102] = {
  NumLimit = 5,
  SoundId = 410102,
  SoundPath = "event:/sfx/player/Lise/skill01_elec_str",
}
r3_0[410104] = {
  NumLimit = 5,
  SoundId = 410104,
  SoundPath = "event:/sfx/common/player/hit/magic/electricHit_normal_feina",
}
r3_0[410105] = {
  NumLimit = 4,
  SoundId = 410105,
  SoundPath = "event:/sfx/player/Lise/skill01_hit_str",
}
r3_0[410106] = {
  NumLimit = 5,
  SoundId = 410106,
  SoundPath = "event:/sfx/player/Lise/skill02_elec_arc",
}
r3_0[410107] = {
  NumLimit = 2,
  SoundId = 410107,
  SoundPath = "event:/sfx/player/Lise/skill02_elec_conncet",
}
r3_0[410108] = {
  NumLimit = 2,
  SoundId = 410108,
  SoundPath = "event:/sfx/player/Lise/skill02_elec_burst",
}
r3_0[410109] = {
  NumLimit = 5,
  SoundId = 410109,
  SoundPath = "event:/sfx/player/Lise/skill02_state_low",
}
r3_0[410201] = {
  NumLimit = 5,
  SoundId = 410201,
  SoundPath = "event:/sfx/player/Zhiliu/skill01_01_cast",
}
r3_0[410202] = {
  NumLimit = 5,
  SoundId = 410202,
  SoundPath = "event:/sfx/player/Zhiliu/passive_loop",
}
r3_0[410204] = {
  NumLimit = 5,
  SoundId = 410204,
  SoundPath = "event:/sfx/player/Zhiliu/skill02_tt_cast",
}
r3_0[410205] = {
  NumLimit = 4,
  SoundId = 410205,
  SoundPath = "event:/sfx/player/Zhiliu/skill02_td_explode",
}
r3_0[410206] = {
  NumLimit = 5,
  SoundId = 410206,
  SoundPath = "event:/sfx/player/Zhiliu/skill02_td_loop",
}
r3_0[410207] = {
  NumLimit = 5,
  SoundId = 410207,
  SoundPath = "event:/sfx/common/player/hit/magic/electricHit_normal_feina",
}
r3_0[410208] = {
  NumLimit = 2,
  SoundId = 410208,
  SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy",
}
r3_0[410209] = {
  NumLimit = 5,
  SoundId = 410209,
  SoundPath = "event:/sfx/common/player/hit/magic/lightingHit",
}
r3_0[410210] = {
  NumLimit = 5,
  SoundId = 410210,
  SoundPath = "event:/sfx/common/player/hit/magic/lightingHit",
}
r3_0[410211] = {
  NumLimit = 5,
  SoundId = 410211,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_03",
}
r3_0[410212] = {
  NumLimit = 5,
  SoundId = 410212,
  SoundPath = "event:/sfx/common/player/hit/magic/lightingHit",
}
r3_0[420101] = {
  NumLimit = 3,
  SoundId = 420101,
  SoundPath = "event:/sfx/player/Yuming/summon_hit",
}
r3_0[420102] = {
  NumLimit = 3,
  SoundId = 420102,
  SoundPath = "event:/sfx/player/Yuming/summon_hit",
  SubSoundId = 53,
}
r3_0[420103] = {
  NumLimit = 3,
  SoundId = 420103,
  SoundPath = "event:/sfx/player/Yuming/skill01_fx_hit",
}
r3_0[420201] = {
  NumLimit = 5,
  SoundId = 420201,
  SoundPath = "event:/sfx/player/Landi/skill02_cast_column",
}
r3_0[420202] = {
  NumLimit = 1,
  SoundId = 420202,
  SoundPath = "event:/sfx/player/Landi/crack_01",
}
r3_0[420203] = {
  NumLimit = 1,
  SoundId = 420203,
  SoundPath = "event:/sfx/player/Landi/crack_02",
}
r3_0[420204] = {
  NumLimit = 1,
  SoundId = 420204,
  SoundPath = "event:/sfx/player/Landi/crack_03",
}
r3_0[420206] = {
  NumLimit = 5,
  SoundId = 420206,
  SoundPath = "event:/sfx/player/Landi/shield_loop",
}
r3_0[420207] = {
  NumLimit = 5,
  SoundId = 420207,
  SoundPath = "event:/sfx/player/Landi/shield_recover",
}
r3_0[420208] = {
  NumLimit = 5,
  SoundId = 420208,
  SoundPath = "event:/sfx/player/Landi/column_loop",
}
r3_0[420209] = {
  NumLimit = 5,
  SoundId = 420209,
  SoundPath = "event:/sfx/player/Landi/column_cast",
}
r3_0[430101] = {
  NumLimit = 5,
  SoundId = 430101,
  SoundPath = "event:/sfx/player/Xibi/thunderHit",
}
r3_0[430102] = {
  NumLimit = 2,
  SoundId = 430102,
  SoundPath = "event:/sfx/player/Xibi/electric_hit",
  SubSoundId = 53,
}
r3_0[430103] = {
  NumLimit = 5,
  SoundId = 430103,
  SoundPath = "event:/sfx/player/Xibi/skill02_ball_appear_normal",
}
r3_0[430104] = {
  NumLimit = 5,
  SoundId = 430104,
  SoundPath = "event:/sfx/player/Xibi/skill02_ball_appear_special",
}
r3_0[430105] = {
  NumLimit = 5,
  SoundId = 430105,
  SoundPath = "event:/sfx/player/Xibi/skill02_ball_loop",
}
r3_0[430106] = {
  NumLimit = 5,
  SoundId = 430106,
  SoundPath = "event:/sfx/player/Xibi/skill02_ball_burst",
}
r3_0[430107] = {
  NumLimit = 5,
  SoundId = 430107,
  SoundPath = "event:/sfx/player/Xibi/electric_link",
}
r3_0[430108] = {
  NumLimit = 5,
  SoundId = 430108,
  SoundPath = "event:/sfx/player/Xibi/skill01_sword",
}
r3_0[430109] = {
  NumLimit = 5,
  SoundId = 430109,
  SoundPath = "event:/sfx/player/Xibi/skill01_cloud",
}
r3_0[510101] = {
  NumLimit = 5,
  SoundId = 510101,
  SoundPath = "event:/sfx/player/Songlu/skill01_ride_run_scatter",
}
r3_0[510102] = {
  NumLimit = 5,
  SoundId = 510102,
  SoundPath = "event:/sfx/player/Songlu/summon_hit",
  SubSoundId = 53,
}
r3_0[510103] = {
  NumLimit = 5,
  SoundId = 510103,
  SoundPath = "event:/sfx/player/Songlu/summon_hit_wall",
}
r3_0[510104] = {
  NumLimit = 5,
  SoundId = 510104,
  SoundPath = "event:/sfx/player/Songlu/passive_start",
}
r3_0[510105] = {
  NumLimit = 5,
  SoundId = 510105,
  SoundPath = "event:/sfx/player/Songlu/passive_loop",
}
r3_0[510201] = {
  NumLimit = 5,
  SoundId = 510201,
  SoundPath = "event:/sfx/player/Aote/skill01_background",
}
r3_0[510202] = {
  NumLimit = 5,
  SoundId = 510202,
  SoundPath = "event:/sfx/player/Aote/skill01_hint",
}
r3_0[510203] = {
  NumLimit = 5,
  SoundId = 510203,
  SoundPath = "event:/sfx/player/Aote/skill01_end",
}
r3_0[510204] = {
  NumLimit = 5,
  SoundId = 510204,
  SoundPath = "event:/sfx/player/Aote/skill02_state",
}
r3_0[510205] = {
  NumLimit = 5,
  SoundId = 510205,
  SoundPath = "event:/sfx/player/Aote/passive_show",
}
r3_0[510206] = {
  NumLimit = 5,
  SoundId = 510206,
  SoundPath = "event:/sfx/player/Aote/passive_mark",
}
r3_0[510207] = {
  NumLimit = 5,
  SoundId = 510207,
  SoundPath = "event:/sfx/player/Aote/passive_hit",
}
r3_0[530101] = {
  NumLimit = 3,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/passive_skill_attack",
  },
  SoundId = 530101,
  SoundPath = "event:/sfx/player/Saiqi/passive_skill_attack",
}
r3_0[530102] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/passive_skill_hit",
  },
  SoundId = 530102,
  SoundPath = "event:/sfx/player/Saiqi/passive_skill_hit",
  SubSoundId = 54,
}
r3_0[530103] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/skill01_shadow_appear",
  },
  SoundId = 530103,
  SoundPath = "event:/sfx/player/Saiqi/skill01_shadow_appear",
}
r3_0[530104] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/skill01_shadow_explode",
  },
  SoundId = 530104,
  SoundPath = "event:/sfx/player/Saiqi/skill01_shadow_explode",
}
r3_0[530105] = {
  NumLimit = 5,
  ParamFuncId = 530101,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/skill02_shoot",
  },
  SoundId = 530105,
  SoundPath = "event:/sfx/player/Saiqi/skill02_shoot",
}
r3_0[530106] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/skill02_shoot_hit",
  },
  SoundId = 530106,
  SoundPath = "event:/sfx/player/Saiqi/skill02_shoot_hit",
  SubSoundId = 201,
}
r3_0[530107] = {
  NumLimit = 3,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/skill02_shoot_hit_ground",
  },
  SoundId = 530107,
  SoundPath = "event:/sfx/player/Saiqi/skill02_shoot_hit_ground",
}
r3_0[530108] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/dodge",
  },
  SoundId = 530108,
  SoundPath = "event:/sfx/player/Saiqi/dodge",
}
r3_0[530109] = {
  NumLimit = 5,
  ReplaceSoundID = {
    [530199] = "event:/sfx/player/Saiqi01/skill01",
  },
  SoundId = 530109,
  SoundPath = "event:/sfx/player/Saiqi/skill01",
}
r3_0[540101] = {
  NumLimit = 5,
  SoundId = 540101,
  SoundPath = "event:/sfx/common/enemy/hit/debuff",
}
r3_0[600201] = {
  NumLimit = 5,
  SoundId = 600201,
  SoundPath = "event:/sfx/enemy/Gr/Youji/bullet_hit",
  SubSoundId = 101,
}
r3_0[600202] = {
  NumLimit = 3,
  SoundId = 600202,
  SoundPath = "event:/sfx/enemy/Gr/Piaofu/C01_skill01_bullet_hit",
  SubSoundId = 101,
}
r3_0[600203] = {
  NumLimit = 5,
  SoundId = 600203,
  SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit",
}
r3_0[600301] = {
  NumLimit = 5,
  SoundId = 600301,
  SoundPath = "event:/sfx/enemy/Gr/Piaofu/C01_bubble_appear",
}
r3_0[600302] = {
  NumLimit = 5,
  SoundId = 600302,
  SoundPath = "event:/sfx/enemy/Gr/Piaofu/C01_bubble_boom",
}
r3_0[600303] = {
  NumLimit = 5,
  SoundId = 600303,
  SoundPath = "event:/sfx/common/enemy/hit/bubble_hit",
}
r3_0[600401] = {
  SoundId = 600401,
  SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit",
}
r3_0[600501] = {
  NumLimit = 5,
  SoundId = 600501,
  SoundPath = "event:/sfx/enemy/Gr/Longcao/poison_bullet",
}
r3_0[600502] = {
  NumLimit = 5,
  SoundId = 600502,
  SoundPath = "event:/sfx/enemy/Gr/Longcao/poison_hit",
}
r3_0[600503] = {
  NumLimit = 5,
  SoundId = 600503,
  SoundPath = "event:/sfx/enemy/Gr/Longcao/poision_hit_ground",
}
r3_0[600504] = {
  NumLimit = 5,
  SoundId = 600504,
  SoundPath = "event:/sfx/enemy/Gr/Longcao/dummy_poision",
}
r3_0[600505] = {
  NumLimit = 5,
  SoundId = 600505,
  SoundPath = "event:/sfx/enemy/Gr/Longcao/underground_loop",
}
r3_0[600601] = {
  NumLimit = 3,
  SoundId = 600601,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_light_02",
}
r3_0[600602] = {
  NumLimit = 5,
  SoundId = 600602,
  SoundPath = "event:/sfx/common/enemy/buff/darkhit",
}
r3_0[600701] = {
  NumLimit = 3,
  SoundId = 600701,
  SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit",
}
r3_0[601501] = {
  NumLimit = 5,
  SoundId = 601501,
  SoundPath = "event:/sfx/enemy/Gr/Fangjin/shotboom",
}
r3_0[601502] = {
  NumLimit = 3,
  SoundId = 601502,
  SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit",
}
r3_0[601503] = {
  NumLimit = 5,
  SoundId = 601503,
  SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit",
}
r3_0[601601] = {
  NumLimit = 2,
  SoundId = 601601,
  SoundPath = "event:/sfx/enemy/Gr/Eshi/bullet_hit",
}
r3_0[601602] = {
  NumLimit = 3,
  SoundId = 601602,
  SoundPath = "event:/sfx/common/enemy/hit/sickleHit_normal",
}
r3_0[601603] = {
  NumLimit = 5,
  SoundId = 601603,
  SoundPath = "event:/sfx/enemy/Gr/Eshi/bullet_hitground",
}
r3_0[601701] = {
  NumLimit = 2,
  SoundId = 601701,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal",
}
r3_0[601702] = {
  NumLimit = 5,
  SoundId = 601702,
  SoundPath = "event:/sfx/enemy/Gr/Kuirui/skill03_boom",
}
r3_0[601703] = {
  NumLimit = 5,
  SoundId = 601703,
  SoundPath = "event:/sfx/common/enemy/hit/electric_ball",
}
r3_0[700101] = {
  NumLimit = 5,
  SoundId = 700101,
  SoundPath = "event:/sfx/enemy/Jt/Juji/invisible",
}
r3_0[700102] = {
  NumLimit = 5,
  SoundId = 700102,
  SoundPath = "event:/sfx/enemy/Jt/Juji/division_self",
}
r3_0[700103] = {
  NumLimit = 1,
  SoundId = 700103,
  SoundPath = "event:/sfx/common/enemy/buff/wind",
}
r3_0[700111] = {
  NumLimit = 5,
  SoundId = 700111,
  SoundPath = "event:/sfx/common/player/hit/magic/ice_hit",
  SubSoundId = 101,
}
r3_0[700112] = {
  NumLimit = 5,
  SoundId = 700112,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_frozen_reflect",
}
r3_0[700113] = {
  NumLimit = 5,
  SoundId = 700113,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_frozen_fly",
}
r3_0[700121] = {
  NumLimit = 3,
  SoundId = 700121,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_blood_loop",
}
r3_0[700122] = {
  NumLimit = 5,
  SoundId = 700122,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_blood_ hit_ground",
}
r3_0[700123] = {
  NumLimit = 5,
  SoundId = 700123,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_blood_cast",
}
r3_0[700131] = {
  NumLimit = 5,
  SoundId = 700131,
  SoundPath = "event:/sfx/common/player/hit/magic/energy_hit",
  SubSoundId = 101,
}
r3_0[700132] = {
  NumLimit = 5,
  SoundId = 700132,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_fade_charge",
}
r3_0[700133] = {
  NumLimit = 3,
  SoundId = 700133,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_fade_loop",
}
r3_0[700141] = {
  NumLimit = 5,
  SoundId = 700141,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_shield_bullet_enter",
}
r3_0[700142] = {
  NumLimit = 5,
  SoundId = 700142,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_shield_loop",
}
r3_0[700151] = {
  NumLimit = 5,
  SoundId = 700151,
  SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
  SubSoundId = 101,
}
r3_0[700152] = {
  NumLimit = 5,
  SoundId = 700152,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_burst_charge",
}
r3_0[700153] = {
  NumLimit = 5,
  SoundId = 700153,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_burst_explode",
}
r3_0[700161] = {
  NumLimit = 5,
  SoundId = 700161,
  SoundPath = "event:/sfx/common/player/hit/magic/electric_small_hit",
  SubSoundId = 101,
}
r3_0[700162] = {
  NumLimit = 10,
  SoundId = 700162,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_thunder_electric_ball_distory",
}
r3_0[700163] = {
  NumLimit = 5,
  SoundId = 700163,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_thunder_charge",
}
r3_0[700164] = {
  NumLimit = 5,
  SoundId = 700164,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_thunder_electric_ball_loop",
}
r3_0[700171] = {
  NumLimit = 3,
  SoundId = 700171,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_poison_loop",
}
r3_0[700172] = {
  NumLimit = 5,
  SoundId = 700172,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_poison_charge",
}
r3_0[700181] = {
  NumLimit = 5,
  SoundId = 700181,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_revenge_cast",
}
r3_0[700182] = {
  NumLimit = 3,
  SoundId = 700182,
  SoundPath = "event:/sfx/common/enemy/buff/buff_strong_revenge_loop",
}
r3_0[700201] = {
  NumLimit = 5,
  SoundId = 700201,
  SoundPath = "event:/sfx/enemy/Jt/Pizhuo/skill03_robot",
}
r3_0[700202] = {
  NumLimit = 5,
  SoundId = 700202,
  SoundPath = "event:/sfx/enemy/Jt/HealRobot/skill01_lp",
}
r3_0[700203] = {
  NumLimit = 5,
  SoundId = 700203,
  SoundPath = "event:/sfx/enemy/Jt/HealRobot/skill01_end",
}
r3_0[700204] = {
  NumLimit = 5,
  SoundId = 700204,
  SoundPath = "event:/sfx/enemy/Jt/Pizhuo/skill02_robot",
}
r3_0[700205] = {
  NumLimit = 5,
  SoundId = 700205,
  SoundPath = "event:/sfx/common/enemy/buff/stunparalysis",
}
r3_0[700311] = {
  NumLimit = 3,
  SoundId = 700311,
  SoundPath = "event:/sfx/enemy/Jt/Ranger/bomb_explosion",
}
r3_0[700312] = {
  NumLimit = 5,
  SoundId = 700312,
  SoundPath = "event:/sfx/enemy/Jt/Ranger/bomb_set_and_alarm",
}
r3_0[700313] = {
  NumLimit = 5,
  SoundId = 700313,
  SoundPath = "event:/sfx/enemy/Jt/Ranger/bomb_explode",
}
r3_0[700314] = {
  NumLimit = 5,
  SoundId = 700314,
  SoundPath = "event:/sfx/common/player/hit/magic/energy_hit",
}
r3_0[700315] = {
  NumLimit = 5,
  SoundId = 700315,
  SoundPath = "event:/sfx/common/enemy/hit/energy_hit",
}
r3_0[700321] = {
  NumLimit = 5,
  SoundId = 700321,
  SoundPath = "event:/sfx/enemy/Jt/Ranger/C01_bullet_loop",
}
r3_0[700322] = {
  NumLimit = 5,
  SoundId = 700322,
  SoundPath = "event:/sfx/common/enemy/hit/electric_ball",
}
r3_0[700323] = {
  NumLimit = 5,
  SoundId = 700323,
  SoundPath = "event:/sfx/enemy/Jt/Ranger/C01_bomb_explode",
}
r3_0[700324] = {
  NumLimit = 5,
  SoundId = 700324,
  SoundPath = "event:/sfx/common/enemy/hit/electricHit_heavy_feina",
}
r3_0[700325] = {
  NumLimit = 5,
  SoundId = 700325,
  SoundPath = "event:/sfx/common/enemy/hit/electric_ball",
}
r3_0[700401] = {
  NumLimit = 3,
  SoundId = 700401,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy",
}
r3_0[700402] = {
  NumLimit = 5,
  SoundId = 700402,
  SoundPath = "event:/sfx/common/enemy/hit/shield_hit",
}
r3_0[700801] = {
  NumLimit = 5,
  SoundId = 700801,
  SoundPath = "event:/sfx/enemy/Jt/Zhihui/common_explosion",
}
r3_0[700802] = {
  NumLimit = 5,
  SoundId = 700802,
  SoundPath = "event:/sfx/enemy/Jt/Zhihui/skill04_explosion",
}
r3_0[700803] = {
  NumLimit = 3,
  SoundId = 700803,
  SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina",
}
r3_0[700804] = {
  NumLimit = 3,
  SoundId = 700804,
  SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal",
}
r3_0[700901] = {
  NumLimit = 3,
  SoundId = 700901,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_light",
}
r3_0[700902] = {
  NumLimit = 3,
  SoundId = 700902,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_light_02",
}
r3_0[700903] = {
  NumLimit = 3,
  SoundId = 700903,
  SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal",
}
r3_0[701001] = {
  NumLimit = 2,
  SoundId = 701001,
  SoundPath = "event:/sfx/common/enemy/hit/lightingHit",
}
r3_0[701601] = {
  NumLimit = 5,
  SoundId = 701601,
  SoundPath = "event:/sfx/common/enemy/hit/electric_ball",
}
r3_0[701602] = {
  NumLimit = 3,
  SoundId = 701602,
  SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina",
}
r3_0[701603] = {
  NumLimit = 5,
  SoundId = 701603,
  SoundPath = "event:/sfx/enemy/Jt/Zhiyan/death",
}
r3_0[701604] = {
  NumLimit = 5,
  SoundId = 701604,
  SoundPath = "event:/sfx/enemy/Jt/Zhiyan/skill01",
}
r3_0[701605] = {
  NumLimit = 5,
  SoundId = 701605,
  SoundPath = "event:/sfx/enemy/Jt/Zhiyan/callback",
}
r3_0[800101] = {
  NumLimit = 5,
  SoundId = 800101,
  SoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material",
}
r3_0[800102] = {
  NumLimit = 3,
  SoundId = 800102,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_light_02",
}
r3_0[800301] = {
  NumLimit = 2,
  SoundId = 800301,
  SoundPath = "event:/sfx/common/enemy/hit/lightingHit",
}
r3_0[800302] = {
  NumLimit = 5,
  SoundId = 800302,
  SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit",
}
r3_0[800303] = {
  NumLimit = 2,
  SoundId = 800303,
  SoundPath = "event:/sfx/enemy/JH/Shenfu/buff",
}
r3_0[850001] = {
  NumLimit = 5,
  SoundId = 850001,
  SoundPath = "event:/sfx/boss/Xibi/electricWhip_hit",
}
r3_0[850002] = {
  NumLimit = 5,
  SoundId = 850002,
  SoundPath = "event:/sfx/boss/Xibi/electricBall_hit",
}
r3_0[850041] = {
  NumLimit = 3,
  SoundId = 850041,
  SoundPath = "event:/sfx/boss/Xibi/skill03_electricity",
}
r3_0[850051] = {
  NumLimit = 3,
  SoundId = 850051,
  SoundPath = "event:/sfx/boss/Xibi/dummy_move",
}
r3_0[850052] = {
  NumLimit = 5,
  SoundId = 850052,
  SoundPath = "event:/sfx/boss/Xibi/electricBall_hit",
}
r3_0[850071] = {
  NumLimit = 5,
  SoundId = 850071,
  SoundPath = "event:/sfx/boss/Xibi/drag_player",
}
r3_0[850101] = {
  NumLimit = 5,
  SoundId = 850101,
  SoundPath = "event:/sfx/boss/Lizhanzhe/skill03_shot",
}
r3_0[850102] = {
  NumLimit = 5,
  SoundId = 850102,
  SoundPath = "event:/sfx/boss/Lizhanzhe/skill03_whoosh",
}
r3_0[850103] = {
  NumLimit = 5,
  SoundId = 850103,
  SoundPath = "event:/sfx/boss/Lizhanzhe/skill03_exp",
}
r3_0[850104] = {
  NumLimit = 1,
  SoundId = 850104,
  SoundPath = "event:/sfx/boss/Lizhanzhe/skill05_exp",
}
r3_0[850105] = {
  NumLimit = 5,
  SoundId = 850105,
  SoundPath = "event:/sfx/boss/Lizhanzhe/skill10_whoosh",
}
r3_0[850106] = {
  NumLimit = 3,
  SoundId = 850106,
  SoundPath = "event:/sfx/boss/Lizhanzhe/skill10_exp",
}
r3_0[850107] = {
  NumLimit = 5,
  SoundId = 850107,
  SoundPath = "event:/sfx/boss/Lizhanzhe/hit",
}
r3_0[850108] = {
  NumLimit = 3,
  SoundId = 850108,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[850211] = {
  NumLimit = 3,
  SoundId = 850211,
  SoundPath = "event:/sfx/common/player/hit/weapon/sickleHit_heavy",
}
r3_0[850219] = {
  NumLimit = 5,
  SoundId = 850219,
  SoundPath = "event:/sfx/common/enemy/hit/electricBall_hit",
}
r3_0[850221] = {
  NumLimit = 5,
  SoundId = 850221,
  SoundPath = "event:/sfx/boss/Saiqi/skill02_fx_sickle",
}
r3_0[850231] = {
  NumLimit = 5,
  SoundId = 850231,
  SoundPath = "event:/sfx/boss/Saiqi/skill03_fx_attack",
}
r3_0[850232] = {
  NumLimit = 5,
  SoundId = 850232,
  SoundPath = "event:/sfx/common/enemy/action/lightingHit",
}
r3_0[850261] = {
  NumLimit = 5,
  SoundId = 850261,
  SoundPath = "event:/sfx/boss/Saiqi/skil06_fx_cast",
}
r3_0[850262] = {
  NumLimit = 5,
  SoundId = 850262,
  SoundPath = "event:/sfx/common/enemy/hit/windHit",
}
r3_0[850271] = {
  NumLimit = 3,
  SoundId = 850271,
  SoundPath = "event:/sfx/boss/Saiqi/skill07_fx",
}
r3_0[850272] = {
  NumLimit = 5,
  SoundId = 850272,
  SoundPath = "event:/sfx/common/enemy/hit/windHit",
}
r3_0[850281] = {
  NumLimit = 3,
  SoundId = 850281,
  SoundPath = "event:/sfx/boss/Saiqi/skill08_fx",
}
r3_0[850282] = {
  NumLimit = 5,
  SoundId = 850282,
  SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
}
r3_0[850291] = {
  NumLimit = 5,
  SoundId = 850291,
  SoundPath = "event:/sfx/boss/Saiqi/skill10_fx_wingfall",
}
r3_0[850292] = {
  NumLimit = 3,
  SoundId = 850292,
  SoundPath = "event:/sfx/common/player/hit/weapon/sickleHit_heavy",
}
r3_0[850293] = {
  NumLimit = 5,
  SoundId = 850293,
  SoundPath = "event:/sfx/boss/Saiqi/skill10_fx_expand_loop",
}
r3_0[850294] = {
  NumLimit = 3,
  SoundId = 850294,
  SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal",
}
r3_0[850301] = {
  NumLimit = 5,
  SoundId = 850301,
  SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_little_appear",
}
r3_0[850302] = {
  NumLimit = 5,
  SoundId = 850302,
  SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_little_boom",
}
r3_0[850303] = {
  NumLimit = 5,
  SoundId = 850303,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill10_fx_rock",
}
r3_0[850304] = {
  NumLimit = 3,
  SoundId = 850304,
  SoundPath = "event:/sfx/boss/Shijingzhe/danmaku",
}
r3_0[850305] = {
  NumLimit = 3,
  SoundId = 850305,
  SoundPath = "event:/sfx/boss/Shijingzhe/danmaku_fly",
}
r3_0[850306] = {
  NumLimit = 5,
  SoundId = 850306,
  SoundPath = "event:/sfx/boss/Shijingzhe/danmaku_hit",
}
r3_0[850307] = {
  NumLimit = 5,
  SoundId = 850307,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill09_fx_cast_01",
}
r3_0[850308] = {
  NumLimit = 5,
  SoundId = 850308,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill09_fx_cast_02",
}
r3_0[850309] = {
  NumLimit = 5,
  SoundId = 850309,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill09_fx_cast_03",
}
r3_0[850310] = {
  NumLimit = 5,
  SoundId = 850310,
  SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_large_appear",
}
r3_0[850311] = {
  NumLimit = 5,
  SoundId = 850311,
  SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_large_boom",
}
r3_0[850312] = {
  NumLimit = 2,
  SoundId = 850312,
  SoundPath = "event:/sfx/boss/Shijingzhe/fx_column_appear",
}
r3_0[850313] = {
  NumLimit = 5,
  SoundId = 850313,
  SoundPath = "event:/sfx/boss/Shijingzhe/fx_column",
}
r3_0[850314] = {
  NumLimit = 1,
  SoundId = 850314,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill14_fx_appear",
}
r3_0[850315] = {
  NumLimit = 4,
  SoundId = 850315,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill14_follow_fx",
}
r3_0[850316] = {
  NumLimit = 4,
  SoundId = 850316,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill14_loop",
}
r3_0[850317] = {
  NumLimit = 1,
  SoundId = 850317,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill14_fx_disappear",
}
r3_0[850318] = {
  NumLimit = 1,
  SoundId = 850318,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill14_fx_rock",
}
r3_0[850319] = {
  NumLimit = 5,
  SoundId = 850319,
  SoundPath = "event:/sfx/boss/Shijingzhe/skill10_fx_rock",
}
r3_0[850320] = {
  NumLimit = 3,
  SoundId = 850320,
  SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal",
}
r3_0[850321] = {
  NumLimit = 3,
  SoundId = 850321,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy",
}
r3_0[850322] = {
  NumLimit = 3,
  SoundId = 850322,
  SoundPath = "event:/sfx/common/enemy/hit/spearHit_heavy",
}
r3_0[850323] = {
  NumLimit = 5,
  SoundId = 850323,
  SoundPath = "event:/sfx/common/enemy/hit/windHit",
}
r3_0[850324] = {
  NumLimit = 5,
  SoundId = 850324,
  SoundPath = "event:/ui/common/boss_shield_bar_lose",
}
r3_0[850401] = {
  NumLimit = 3,
  SoundId = 850401,
  SoundPath = "event:/sfx/boss/Saiqi02/danmu_big",
}
r3_0[850402] = {
  NumLimit = 5,
  SoundId = 850402,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit02",
}
r3_0[850403] = {
  NumLimit = 5,
  SoundId = 850403,
  SoundPath = "event:/sfx/boss/Saiqi02/skill05_fx",
}
r3_0[850404] = {
  NumLimit = 5,
  SoundId = 850404,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit03",
}
r3_0[850405] = {
  NumLimit = 1,
  SoundId = 850405,
  SoundPath = "event:/sfx/boss/Saiqi02/skill08_01",
}
r3_0[850406] = {
  NumLimit = 5,
  SoundId = 850406,
  SoundPath = "event:/sfx/boss/Saiqi02/skill08_02",
}
r3_0[850407] = {
  NumLimit = 1,
  SoundId = 850407,
  SoundPath = "event:/sfx/boss/Saiqi02/skill08_03",
}
r3_0[850408] = {
  NumLimit = 5,
  SoundId = 850408,
  SoundPath = "event:/sfx/boss/Saiqi02/skill08_hit",
}
r3_0[850409] = {
  NumLimit = 5,
  SoundId = 850409,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit03",
}
r3_0[850410] = {
  NumLimit = 5,
  SoundId = 850410,
  SoundPath = "event:/sfx/boss/Saiqi02/skill10_fx",
}
r3_0[850411] = {
  NumLimit = 4,
  SoundId = 850411,
  SoundPath = "event:/sfx/boss/Saiqi02/skill10_fx_01",
}
r3_0[850412] = {
  NumLimit = 2,
  SoundId = 850412,
  SoundPath = "event:/sfx/boss/Saiqi02/skill10_fx_02",
}
r3_0[850413] = {
  NumLimit = 5,
  SoundId = 850413,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit03",
}
r3_0[850414] = {
  NumLimit = 5,
  SoundId = 850414,
  SoundPath = "event:/sfx/boss/Saiqi02/skill11_fx_loop",
}
r3_0[850415] = {
  NumLimit = 5,
  SoundId = 850415,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit02",
}
r3_0[850416] = {
  NumLimit = 5,
  SoundId = 850416,
  SoundPath = "event:/sfx/boss/Saiqi02/skill13_fx",
}
r3_0[850417] = {
  NumLimit = 4,
  SoundId = 850417,
  SoundPath = "event:/sfx/boss/Saiqi02/danmu_small",
}
r3_0[850418] = {
  NumLimit = 1,
  SoundId = 850418,
  SoundPath = "event:/sfx/boss/Saiqi02/skill17_fx_01",
}
r3_0[850419] = {
  NumLimit = 1,
  SoundId = 850419,
  SoundPath = "event:/sfx/boss/Saiqi02/skill17_fx_02",
}
r3_0[850420] = {
  NumLimit = 5,
  SoundId = 850420,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot01_hit",
}
r3_0[850421] = {
  NumLimit = 5,
  SoundId = 850421,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02",
}
r3_0[850422] = {
  NumLimit = 5,
  SoundId = 850422,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot01",
}
r3_0[850423] = {
  NumLimit = 5,
  SoundId = 850423,
  SoundPath = "event:/sfx/boss/Saiqi02/skill21_02",
}
r3_0[850501] = {
  NumLimit = 3,
  SoundId = 850501,
  SoundPath = "event:/sfx/boss/Lianhuo/skill04_explode",
}
r3_0[850502] = {
  NumLimit = 5,
  SoundId = 850502,
  SoundPath = "event:/sfx/boss/Lianhuo/skill05_explode",
}
r3_0[850503] = {
  NumLimit = 3,
  SoundId = 850503,
  SoundPath = "event:/sfx/boss/Lianhuo/skill06_blast",
}
r3_0[850504] = {
  NumLimit = 5,
  SoundId = 850504,
  SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal_feina",
}
r3_0[850505] = {
  NumLimit = 5,
  SoundId = 850505,
  SoundPath = "event:/sfx/common/player/hit/magic/fireHit_heavy_feina",
}
r3_0[850506] = {
  NumLimit = 5,
  SoundId = 850506,
  SoundPath = "event:/sfx/boss/Lianhuo/skill10_ball_disappear",
}
r3_0[850507] = {
  NumLimit = 5,
  SoundId = 850507,
  SoundPath = "event:/sfx/boss/Lianhuo/skill10_cast_ball",
}
r3_0[850508] = {
  NumLimit = 2,
  SoundId = 850508,
  SoundPath = "event:/sfx/common/player/hit/weapon/spearHit_heavy",
}
r3_0[850509] = {
  NumLimit = 5,
  SoundId = 850509,
  SoundPath = "event:/sfx/boss/Saiqi/skil06_fx_cast",
}
r3_0[850510] = {
  NumLimit = 5,
  SoundId = 850510,
  SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal_feina",
}
r3_0[850511] = {
  NumLimit = 5,
  SoundId = 850511,
  SoundPath = "event:/sfx/boss/Lianhuo/skill08_explode",
}
r3_0[850513] = {
  NumLimit = 2,
  SoundId = 850513,
  SoundPath = "event:/sfx/boss/Lianhuo/skill03_hard_fx_danmu_loop",
}
r3_0[850514] = {
  NumLimit = 2,
  SoundId = 850514,
  SoundPath = "event:/sfx/boss/Lianhuo/skill03_hard_fx_danmu_land",
}
r3_0[850516] = {
  NumLimit = 2,
  SoundId = 850516,
  SoundPath = "event:/sfx/boss/Lianhuo/skill03_hard_fx_fire_loop",
}
r3_0[850517] = {
  NumLimit = 5,
  SoundId = 850517,
  SoundPath = "event:/sfx/boss/Lianhuo/skill07_fx_cast",
}
r3_0[850518] = {
  NumLimit = 5,
  SoundId = 850518,
  SoundPath = "event:/sfx/boss/Lianhuo/skill07_fx_lock",
}
r3_0[850601] = {
  NumLimit = 3,
  SoundId = 850601,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal",
}
r3_0[850901] = {
  NumLimit = 5,
  SoundId = 850901,
  SoundPath = "event:/sfx/boss/Tuosi/skill_04_fx_flame",
}
r3_0[850903] = {
  NumLimit = 5,
  SoundId = 850903,
  SoundPath = "event:/sfx/boss/Tuosi/skill_05_fx_attack",
}
r3_0[850904] = {
  NumLimit = 5,
  SoundId = 850904,
  SoundPath = "event:/sfx/boss/Tuosi/skill_07_fx_boom",
}
r3_0[850905] = {
  NumLimit = 5,
  SoundId = 850905,
  SoundPath = "event:/sfx/boss/Tuosi/skill_07_fx_loop",
}
r3_0[850906] = {
  NumLimit = 3,
  SoundId = 850906,
  SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_laser",
}
r3_0[850907] = {
  NumLimit = 5,
  SoundId = 850907,
  SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_charge",
}
r3_0[850908] = {
  NumLimit = 5,
  SoundId = 850908,
  SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_hitGround",
}
r3_0[850909] = {
  NumLimit = 5,
  SoundId = 850909,
  SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_boom",
}
r3_0[850910] = {
  NumLimit = 5,
  SoundId = 850910,
  SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_ballBoom",
}
r3_0[850911] = {
  NumLimit = 5,
  SoundId = 850911,
  SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_ball_loop",
}
r3_0[850912] = {
  NumLimit = 2,
  SoundId = 850912,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal",
}
r3_0[850913] = {
  NumLimit = 3,
  SoundId = 850913,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[850914] = {
  NumLimit = 2,
  SoundId = 850914,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal",
}
r3_0[850915] = {
  NumLimit = 3,
  SoundId = 850915,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[850916] = {
  NumLimit = 3,
  SoundId = 850916,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[850917] = {
  NumLimit = 5,
  SoundId = 850917,
  SoundPath = "event:/sfx/common/enemy/hit/electricBall_hit",
}
r3_0[850918] = {
  NumLimit = 5,
  SoundId = 850918,
  SoundPath = "event:/sfx/common/enemy/hit/energy_hit",
}
r3_0[850919] = {
  NumLimit = 5,
  SoundId = 850919,
  SoundPath = "event:/sfx/common/enemy/hit/electricHit_heavy_feina",
}
r3_0[850920] = {
  NumLimit = 2,
  SoundId = 850920,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal",
}
r3_0[851001] = {
  NumLimit = 5,
  SoundId = 851001,
  SoundPath = " event:/sfx/boss/Zhuyin/skill_behit_hevay",
}
r3_0[851002] = {
  NumLimit = 3,
  SoundId = 851002,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[851003] = {
  NumLimit = 3,
  SoundId = 851003,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[851004] = {
  NumLimit = 3,
  SoundId = 851004,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy",
}
r3_0[851005] = {
  NumLimit = 5,
  SoundId = 851005,
  SoundPath = "event:/sfx/boss/Zhuyin/skill04_fx_boom",
}
r3_0[851006] = {
  NumLimit = 5,
  SoundId = 851006,
  SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_appear",
}
r3_0[851007] = {
  NumLimit = 5,
  SoundId = 851007,
  SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_stonebehit",
}
r3_0[851008] = {
  NumLimit = 5,
  SoundId = 851008,
  SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_finalexplosion",
}
r3_0[851009] = {
  NumLimit = 5,
  SoundId = 851009,
  SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_hevay",
}
r3_0[851010] = {
  NumLimit = 5,
  SoundId = 851010,
  SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_hevay",
}
r3_0[851011] = {
  NumLimit = 4,
  SoundId = 851011,
  SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_groundbrk",
}
r3_0[851012] = {
  NumLimit = 3,
  SoundId = 851012,
  SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina",
}
r3_0[851013] = {
  NumLimit = 5,
  SoundId = 851013,
  SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_tornado_loop",
}
r3_0[851014] = {
  NumLimit = 5,
  SoundId = 851014,
  SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_light",
}
r3_0[851015] = {
  NumLimit = 2,
  SoundId = 851015,
  SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_xlaser_loop",
}
r3_0[851016] = {
  NumLimit = 5,
  SoundId = 851016,
  SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_hevay",
}
r3_0[851017] = {
  NumLimit = 5,
  SoundId = 851017,
  SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_stoneatk",
}
r3_0[851018] = {
  NumLimit = 5,
  SoundId = 851018,
  SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_loop",
}
r3_0[851019] = {
  NumLimit = 5,
  SoundId = 851019,
  SoundPath = "event:/sfx/boss/Zhuyin/skill04_lightboom",
}
r3_0[851020] = {
  NumLimit = 5,
  SoundId = 851020,
  SoundPath = "event:/sfx/boss/Zhuyin/skill07_lightning",
}
r3_0[851021] = {
  NumLimit = 5,
  SoundId = 851021,
  SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_groundbrk",
}
r3_0[851201] = {
  NumLimit = 5,
  SoundId = 851201,
  SoundPath = "event:/sfx/boss/Linen/common_laser_be_hit",
}
r3_0[851202] = {
  NumLimit = 5,
  SoundId = 851202,
  SoundPath = "event:/sfx/boss/Linen/skill01_be_hit",
}
r3_0[851203] = {
  NumLimit = 3,
  SoundId = 851203,
  SoundPath = "event:/sfx/boss/Linen/skill02_fx_down",
}
r3_0[851204] = {
  NumLimit = 2,
  SoundId = 851204,
  SoundPath = "event:/sfx/boss/Linen/skill03_bullet_loop",
}
r3_0[851205] = {
  NumLimit = 6,
  SoundId = 851205,
  SoundPath = "event:/sfx/boss/Linen/skill03_fx_boom",
}
r3_0[851206] = {
  NumLimit = 2,
  SoundId = 851206,
  SoundPath = "event:/sfx/boss/Linen/skill05_fx_break",
}
r3_0[851207] = {
  NumLimit = 5,
  SoundId = 851207,
  SoundPath = "event:/sfx/boss/Linen/skill05_fx_laser",
}
r3_0[851208] = {
  NumLimit = 5,
  SoundId = 851208,
  SoundPath = "event:/sfx/boss/Linen/skill05_fx_dash",
}
r3_0[851209] = {
  NumLimit = 5,
  SoundId = 851209,
  SoundPath = "event:/sfx/boss/Linen/skill05_fx_shot",
}
r3_0[851210] = {
  NumLimit = 5,
  SoundId = 851210,
  SoundPath = "event:/sfx/boss/Linen/skill05_shot_behit",
}
r3_0[851211] = {
  NumLimit = 5,
  SoundId = 851211,
  SoundPath = "event:/sfx/boss/Linen/skill06_fx_shoot",
}
r3_0[851213] = {
  NumLimit = 5,
  SoundId = 851213,
  SoundPath = "event:/sfx/boss/Linen/skill06_2_fx_shoot ",
}
r3_0[851218] = {
  NumLimit = 4,
  SoundId = 851218,
  SoundPath = "event:/sfx/boss/Linen/skill07_fx_lock",
}
r3_0[851219] = {
  NumLimit = 5,
  SoundId = 851219,
  SoundPath = "event:/sfx/boss/Linen/skill07_fx_stop",
}
r3_0[851220] = {
  NumLimit = 4,
  SoundId = 851220,
  SoundPath = "event:/sfx/boss/Linen/skill07_fx_attack",
}
r3_0[851221] = {
  NumLimit = 3,
  SoundId = 851221,
  SoundPath = "event:/sfx/boss/Linen/skill08_fx_little_charge",
}
r3_0[851222] = {
  NumLimit = 5,
  SoundId = 851222,
  SoundPath = "event:/sfx/boss/Linen/skill08_fx_little_shot",
}
r3_0[851223] = {
  NumLimit = 5,
  SoundId = 851223,
  SoundPath = "event:/sfx/boss/Linen/skill08_fx_big_charge",
}
r3_0[851224] = {
  NumLimit = 5,
  SoundId = 851224,
  SoundPath = "event:/sfx/boss/Linen/skill08_big_shot",
}
r3_0[851225] = {
  NumLimit = 5,
  SoundId = 851225,
  SoundPath = "event:/sfx/boss/Linen/skill08_fx_little_shunyi",
}
r3_0[851226] = {
  NumLimit = 5,
  SoundId = 851226,
  SoundPath = "event:/sfx/boss/Linen/skill08_fx_shield_loop",
}
r3_0[851227] = {
  NumLimit = 4,
  SoundId = 851227,
  SoundPath = "event:/sfx/boss/Linen/skill09_fx_energyStorm_charge",
}
r3_0[851228] = {
  NumLimit = 5,
  SoundId = 851228,
  SoundPath = "event:/sfx/boss/Linen/skill09_fx_energyStorm_boom",
}
r3_0[851229] = {
  NumLimit = 8,
  SoundId = 851229,
  SoundPath = "event:/sfx/boss/Linen/skill09_fx_aimLaser",
}
r3_0[851230] = {
  NumLimit = 5,
  SoundId = 851230,
  SoundPath = "event:/sfx/boss/Linen/skill09_fx_shotLaser",
}
r3_0[851232] = {
  NumLimit = 3,
  SoundId = 851232,
  SoundPath = "event:/sfx/boss/Linen/skill11_fx_shot",
}
r3_0[851233] = {
  NumLimit = 5,
  SoundId = 851233,
  SoundPath = "event:/sfx/boss/Linen/move_loop",
}
r3_0[851234] = {
  NumLimit = 2,
  SoundId = 851234,
  SoundPath = "event:/sfx/boss/Linen/common_fx_appear",
}
r3_0[851235] = {
  NumLimit = 5,
  SoundId = 851235,
  SoundPath = "event:/sfx/boss/Linen/skill09_light",
}
r3_0[851236] = {
  NumLimit = 5,
  SoundId = 851236,
  SoundPath = "event:/sfx/boss/Linen/skill09_impact",
}
r3_0[851301] = {
  NumLimit = 3,
  SoundId = 851301,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy",
}
r3_0[851302] = {
  NumLimit = 5,
  SoundId = 851302,
  SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_common",
}
r3_0[851303] = {
  NumLimit = 5,
  SoundId = 851303,
  SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_hit",
}
r3_0[851304] = {
  NumLimit = 10,
  SoundId = 851304,
  SoundPath = "event:/sfx/boss/Kuxiu/skill03_shot",
}
r3_0[851305] = {
  NumLimit = 5,
  SoundId = 851305,
  SoundPath = "event:/sfx/boss/Kuxiu/skill03_bom",
}
r3_0[851306] = {
  NumLimit = 1,
  SoundId = 851306,
  SoundPath = "event:/sfx/boss/Kuxiu/skill03_hit",
}
r3_0[851307] = {
  NumLimit = 1,
  SoundId = 851307,
  SoundPath = "event:/sfx/boss/Kuxiu/skill05_shot",
}
r3_0[851308] = {
  NumLimit = 5,
  SoundId = 851308,
  SoundPath = "event:/sfx/boss/Kuxiu/skill05_boom",
}
r3_0[851309] = {
  NumLimit = 5,
  SoundId = 851309,
  SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit",
}
r3_0[851310] = {
  NumLimit = 5,
  SoundId = 851310,
  SoundPath = "event:/sfx/boss/Kuxiu/skill06_shot",
}
r3_0[851311] = {
  NumLimit = 5,
  SoundId = 851311,
  SoundPath = "event:/sfx/boss/Kuxiu/laser_hit",
}
r3_0[851312] = {
  NumLimit = 5,
  SoundId = 851312,
  SoundPath = " event:/sfx/boss/Kuxiu/skill07_ping",
}
r3_0[851314] = {
  NumLimit = 5,
  SoundId = 851314,
  SoundPath = "event:/sfx/boss/Kuxiu/skill07_aim",
}
r3_0[851316] = {
  NumLimit = 5,
  SoundId = 851316,
  SoundPath = "event:/sfx/common/enemy/hit/shield_hit",
}
r3_0[851317] = {
  NumLimit = 5,
  SoundId = 851317,
  SoundPath = "event:/sfx/boss/Kuxiu/laser_hit",
}
r3_0[851318] = {
  NumLimit = 10,
  SoundId = 851318,
  SoundPath = "event:/sfx/boss/Kuxiu/skill03_bullet",
}
r3_0[851319] = {
  NumLimit = 12,
  SoundId = 851319,
  SoundPath = "event:/sfx/boss/Kuxiu/skill05_bullet",
}
r3_0[851401] = {
  NumLimit = 5,
  SoundId = 851401,
  SoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material",
}
r3_0[851402] = {
  NumLimit = 4,
  SoundId = 851402,
  SoundPath = "event:/sfx/boss/Shenpan/skill02_fx_laser",
}
r3_0[851403] = {
  NumLimit = 3,
  SoundId = 851403,
  SoundPath = "event:/sfx/boss/Shenpan/skill02_fx_burst",
}
r3_0[851404] = {
  NumLimit = 5,
  SoundId = 851404,
  SoundPath = "event:/sfx/boss/Shenpan/skill03_fx_fire_whoosh",
}
r3_0[851405] = {
  NumLimit = 3,
  SoundId = 851405,
  SoundPath = "event:/sfx/boss/Shenpan/skill03_explode",
}
r3_0[851406] = {
  NumLimit = 3,
  SoundId = 851406,
  SoundPath = "event:/sfx/boss/Shenpan/skill04_boom",
}
r3_0[851407] = {
  NumLimit = 5,
  SoundId = 851407,
  SoundPath = "event:/sfx/common/enemy/hit/bullet_hit",
}
r3_0[851408] = {
  NumLimit = 5,
  SoundId = 851408,
  SoundPath = "event:/sfx/common/enemy/hit/shield_hit",
}
r3_0[851501] = {
  NumLimit = 5,
  SoundId = 851501,
  SoundPath = "event:/sfx/boss/Jushi/common_fx_loop",
}
r3_0[851502] = {
  NumLimit = 5,
  SoundId = 851502,
  SoundPath = "event:/sfx/common/enemy/hit/electric_ball",
}
r3_0[851505] = {
  NumLimit = 3,
  SoundId = 851505,
  SoundPath = "event:/sfx/boss/Jushi/skill04_fx_shot_loop",
}
r3_0[851506] = {
  NumLimit = 2,
  SoundId = 851506,
  SoundPath = "event:/sfx/boss/Jushi/skill04_fx_shot02_loop",
}
r3_0[851507] = {
  NumLimit = 3,
  SoundId = 851507,
  SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit",
}
r3_0[851508] = {
  NumLimit = 5,
  SoundId = 851508,
  SoundPath = "event:/sfx/boss/Jushi/skill05_fx_boom",
}
r3_0[851509] = {
  NumLimit = 5,
  SoundId = 851509,
  SoundPath = "event:/sfx/boss/Jushi/skill05_fx_shot03_boom",
}
r3_0[851510] = {
  NumLimit = 5,
  SoundId = 851510,
  SoundPath = "event:/sfx/boss/Jushi/skill05_fx_shot03_loop",
}
r3_0[851511] = {
  NumLimit = 3,
  SoundId = 851511,
  SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit",
}
r3_0[851512] = {
  NumLimit = 5,
  SoundId = 851512,
  SoundPath = "event:/sfx/boss/Jushi/common_beHit",
}
r3_0[851513] = {
  NumLimit = 5,
  SoundId = 851513,
  SoundPath = "event:/sfx/boss/Jushi/skill06_fx_laser",
}
r3_0[851514] = {
  NumLimit = 5,
  SoundId = 851514,
  SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_hit",
}
r3_0[851515] = {
  NumLimit = 10,
  SoundId = 851515,
  SoundPath = "event:/sfx/boss/Jushi/skill07_fx_boom_pre",
}
r3_0[851516] = {
  NumLimit = 5,
  SoundId = 851516,
  SoundPath = "event:/sfx/boss/Jushi/common_beHit",
}
r3_0[851517] = {
  NumLimit = 5,
  SoundId = 851517,
  SoundPath = "event:/sfx/boss/Jushi/skill08_fx_laser_shot",
}
r3_0[851518] = {
  NumLimit = 5,
  SoundId = 851518,
  SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_hit",
}
r3_0[851519] = {
  NumLimit = 5,
  SoundId = 851519,
  SoundPath = "event:/sfx/boss/Jushi/common_beHit",
}
r3_0[851701] = {
  NumLimit = 3,
  SoundId = 851701,
  SoundPath = "event:/sfx/common/enemy/hit/spearHit_heavy",
}
r3_0[851702] = {
  NumLimit = 5,
  SoundId = 851702,
  SoundPath = "event:/sfx/common/enemy/hit/electricBall_hit",
}
r3_0[851703] = {
  NumLimit = 5,
  SoundId = 851703,
  SoundPath = "event:/sfx/boss/Yuming/fx_electric_hit",
}
r3_0[851704] = {
  NumLimit = 5,
  SoundId = 851704,
  SoundPath = "event:/sfx/boss/Yuming/fx_electric_spinning",
}
r3_0[851801] = {
  SoundId = 851801,
  SoundPath = "event:/sfx/common/enemy/hit/shield_hit",
}
r3_0[851802] = {
  SoundId = 851802,
  SoundPath = "event:/sfx/boss/Juque/skill03_stone_loop",
}
r3_0[851803] = {
  SoundId = 851803,
  SoundPath = "event:/sfx/common/enemy/hit/shield_hit",
}
r3_0[851804] = {
  SoundId = 851804,
  SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal",
}
r3_0[851805] = {
  SoundId = 851805,
  SoundPath = "event:/sfx/boss/Juque/skill04_fx_cast",
}
r3_0[851807] = {
  SoundId = 851807,
  SoundPath = "event:/sfx/common/enemy/hit/shield_hit",
}
r3_0[851808] = {
  SoundId = 851808,
  SoundPath = "event:/sfx/boss/Juque/skill07_fx_explode",
}
r3_0[851809] = {
  SoundId = 851809,
  SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina",
}
r3_0[851810] = {
  SoundId = 851810,
  SoundPath = "event:/sfx/boss/Juque/skill08_fx_l",
}
r3_0[851811] = {
  SoundId = 851811,
  SoundPath = "event:/sfx/boss/Juque/skill08_fx_r",
}
r3_0[851812] = {
  SoundId = 851812,
  SoundPath = "event:/sfx/common/enemy/hit/dualbladeHit_light",
}
r3_0[851813] = {
  SoundId = 851813,
  SoundPath = "event:/sfx/boss/Juque/fx_part_damage",
}
r3_0[851814] = {
  SoundId = 851814,
  SoundPath = "event:/sfx/boss/Juque/local_damage",
}
r3_0[900001] = {
  NumLimit = 3,
  SoundId = 900001,
  SoundPath = "event:/sfx/common/scene/cannon_shoot_hit_ground",
}
r3_0[900101] = {
  NumLimit = 3,
  SoundId = 900101,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal",
}
r3_0[900201] = {
  NumLimit = 3,
  SoundId = 900201,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_light",
}
r3_0[900401] = {
  NumLimit = 4,
  SoundId = 900401,
  SoundPath = "event:/sfx/enemy/SQ/Wanju/mech_bomb_whistle",
}
r3_0[900402] = {
  NumLimit = 4,
  SoundId = 900402,
  SoundPath = "event:/sfx/enemy/SQ/Wanju/mech_bomb_exp",
}
r3_0[900501] = {
  NumLimit = 5,
  SoundId = 900501,
  SoundPath = "event:/sfx/enemy/SQ/Zhadan/skill01_whistle",
}
r3_0[900502] = {
  NumLimit = 3,
  SoundId = 900502,
  SoundPath = "event:/sfx/enemy/SQ/Zhadan/skill01_exp",
}
r3_0[900601] = {
  NumLimit = 3,
  SoundId = 900601,
  SoundPath = "event:/sfx/common/player/hit/weapon/swordHit_light",
}
r3_0[900602] = {
  NumLimit = 5,
  SoundId = 900602,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_1",
}
r3_0[900603] = {
  NumLimit = 5,
  SoundId = 900603,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_2",
}
r3_0[900604] = {
  NumLimit = 5,
  SoundId = 900604,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_3",
}
r3_0[900605] = {
  NumLimit = 5,
  SoundId = 900605,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_4",
}
r3_0[900606] = {
  NumLimit = 5,
  SoundId = 900606,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_5",
}
r3_0[900607] = {
  NumLimit = 5,
  SoundId = 900607,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill04_cast",
}
r3_0[900608] = {
  NumLimit = 5,
  SoundId = 900608,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/light",
}
r3_0[900609] = {
  NumLimit = 5,
  SoundId = 900609,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_1",
}
r3_0[900610] = {
  NumLimit = 5,
  SoundId = 900610,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_2",
}
r3_0[900611] = {
  NumLimit = 5,
  SoundId = 900611,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_3",
}
r3_0[900612] = {
  NumLimit = 5,
  SoundId = 900612,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_4",
}
r3_0[900613] = {
  NumLimit = 5,
  SoundId = 900613,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_5",
}
r3_0[900614] = {
  NumLimit = 5,
  SoundId = 900614,
  SoundPath = "event:/sfx/common/player/hit/magic/windHit",
}
r3_0[900615] = {
  NumLimit = 5,
  SoundId = 900615,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_appear",
}
r3_0[900616] = {
  NumLimit = 5,
  SoundId = 900616,
  SoundPath = "event:/sfx/enemy/SQ/Qizha/light",
}
r3_0[900701] = {
  NumLimit = 2,
  SoundId = 900701,
  SoundPath = "event:/sfx/common/enemy/hit/lightingHit",
}
r3_0[900702] = {
  NumLimit = 1,
  SoundId = 900702,
  SoundPath = "event:/sfx/enemy/SQ/Niaopao/bullet_fly",
}
r3_0[900703] = {
  NumLimit = 1,
  SoundId = 900703,
  SoundPath = "event:/sfx/enemy/SQ/Niaopao/exp",
}
r3_0[900704] = {
  NumLimit = 3,
  SoundId = 900704,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy",
}
r3_0[950001] = {
  NumLimit = 5,
  SoundId = 950001,
  SoundPath = "event:/sfx/enemy/NE/Dajie/fast_loop_fx",
}
r3_0[950002] = {
  NumLimit = 5,
  SoundId = 950002,
  SoundPath = "event:/sfx/enemy/NE/Dajie/skill03_hit",
}
r3_0[950101] = {
  NumLimit = 5,
  SoundId = 950101,
  SoundPath = "event:/sfx/enemy/Mn/Haer/skil02_hit",
}
r3_0[950102] = {
  NumLimit = 3,
  SoundId = 950102,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal",
}
r3_0[950401] = {
  SoundId = 950401,
  SoundPath = "event:/sfx/enemy/NE/Wuyou/skill01_loop",
}
r3_0[950402] = {
  SoundId = 950402,
  SoundPath = "event:/sfx/enemy/NE/Wuyou/skill01_hit",
}
r3_0[950701] = {
  SoundId = 950701,
  SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal",
}
r3_0[980101] = {
  NumLimit = 1,
  SoundId = 980101,
  SoundPath = "event:/sfx/common/enemy/hit/bite",
}
r3_0[980201] = {
  NumLimit = 3,
  SoundId = 980201,
  SoundPath = "event:/sfx/common/enemy/hit/spearHit_normal",
}
r3_0[980301] = {
  NumLimit = 3,
  SoundId = 980301,
  SoundPath = "event:/sfx/common/enemy/hit/spearHit_normal",
}
r3_0[1020101] = {
  NumLimit = 5,
  SoundId = 1020101,
  SoundPath = "event:/sfx/weapon/Polearm/Liandu/mod01_fly",
}
r3_0[1020102] = {
  NumLimit = 5,
  SoundId = 1020102,
  SoundPath = " event:/sfx/weapon/Polearm/Liandu/mod01_runattack_03_fx",
}
r3_0[1020103] = {
  NumLimit = 5,
  SoundId = 1020103,
  SoundPath = "event:/sfx/weapon/Polearm/Liandu/mod01_runattack_03_fx03",
}
r3_0[1030201] = {
  NumLimit = 3,
  SoundId = 1030201,
  SoundPath = "event:/sfx/weapon/Claymore/Common/mod01_attack03_fx",
}
r3_0[1040101] = {
  NumLimit = 5,
  SoundId = 1040101,
  SoundPath = "event:/sfx/weapon/$MeleeWeapon$/heavy_attack_fly",
}
r3_0[1040102] = {
  SoundId = 1040102,
  SoundPath = "event:/sfx/weapon/Dualblade/Common/mod01_heavyattack_fx_whooshes",
}
r3_0[2010101] = {
  NumLimit = 5,
  SoundId = 2010101,
  SoundPath = "event:/sfx/weapon/Pistol/Wuxu/explode",
}
r3_0[2010102] = {
  NumLimit = 5,
  SoundId = 2010102,
  SoundPath = "event:/sfx/weapon/Pistol/Wuxu/fx_loop",
}
r3_0[2010103] = {
  NumLimit = 5,
  SoundId = 2010103,
  SoundPath = "event:/sfx/weapon/Pistol/Wuxu/shoot_fx",
}
r3_0[2010104] = {
  NumLimit = 5,
  SoundId = 2010104,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_hit",
}
r3_0[2010105] = {
  NumLimit = 5,
  SoundId = 2010105,
  SoundPath = "event:/sfx/weapon/Pistol/Wuxu/hit_earth",
}
r3_0[2010106] = {
  NumLimit = 5,
  SoundId = 2010106,
  SoundPath = "event:/sfx/weapon/Pistol/Wuxu/hit_earth",
}
r3_0[2020301] = {
  NumLimit = 5,
  SoundId = 2020301,
  SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_flyby",
}
r3_0[2020302] = {
  NumLimit = 5,
  SoundId = 2020302,
  SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_bounce",
}
r3_0[2020303] = {
  NumLimit = 5,
  SoundId = 2020303,
  SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_hit",
}
r3_0[2020304] = {
  NumLimit = 5,
  SoundId = 2020304,
  SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_bounce",
}
r3_0[2030101] = {
  NumLimit = 5,
  SoundId = 2030101,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/shoot_hit_ground",
}
r3_0[2030201] = {
  NumLimit = 5,
  SoundId = 2030201,
  SoundPath = "event:/sfx/weapon/Cannon/Qunxing/shoot_hit_ground",
}
r3_0[2030202] = {
  NumLimit = 5,
  SoundId = 2030202,
  SoundPath = "event:/sfx/weapon/Cannon/Qunxing/sub_bullet_fly",
}
r3_0[2030203] = {
  NumLimit = 5,
  SoundId = 2030203,
  SoundPath = "event:/sfx/weapon/Cannon/Qunxing/sub_bullet_explode",
}
r3_0[2030204] = {
  NumLimit = 5,
  SoundId = 2030204,
  SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
}
r3_0[2030301] = {
  NumLimit = 5,
  SoundId = 2030301,
  SoundPath = "event:/sfx/weapon/Cannon/Chiqiang/shoot_hit_ground",
}
r3_0[2030302] = {
  NumLimit = 5,
  SoundId = 2030302,
  SoundPath = "event:/sfx/weapon/Cannon/Chiqiang/sub_bullet_explode",
}
r3_0[2030303] = {
  NumLimit = 5,
  SoundId = 2030303,
  SoundPath = "event:/sfx/weapon/Cannon/Chiqiang/main_bullet_fly",
}
r3_0[2030304] = {
  NumLimit = 5,
  SoundId = 2030304,
  SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
}
r3_0[2030401] = {
  NumLimit = 5,
  SoundId = 2030401,
  SoundPath = "event:/sfx/weapon/Cannon/Qingtong/break",
}
r3_0[2030402] = {
  NumLimit = 5,
  SoundId = 2030402,
  SoundPath = "event:/sfx/weapon/Cannon/Qingtong/hit_ground",
}
r3_0[2030403] = {
  NumLimit = 2,
  SoundId = 2030403,
  SoundPath = "event:/sfx/weapon/Cannon/Qingtong/loop",
}
r3_0[2030404] = {
  NumLimit = 2,
  SoundId = 2030404,
  SoundPath = "event:/sfx/weapon/Cannon/Qingtong/loop_ground",
}
r3_0[2030405] = {
  NumLimit = 5,
  SoundId = 2030405,
  SoundPath = "event:/sfx/weapon/Cannon/Qingtong/explode",
}
r3_0[2030406] = {
  NumLimit = 3,
  SoundId = 2030406,
  SoundPath = "event:/sfx/weapon/Cannon/Qingtong/hit",
}
r3_0[2030501] = {
  NumLimit = 5,
  SoundId = 2030501,
  SoundPath = "event:/sfx/weapon/Cannon/Yinbai/shoot_fx01",
}
r3_0[2030502] = {
  NumLimit = 5,
  SoundId = 2030502,
  SoundPath = "event:/sfx/weapon/Cannon/Yinbai/shoot_fx02",
}
r3_0[2030503] = {
  NumLimit = 5,
  SoundId = 2030503,
  SoundPath = "event:/sfx/weapon/Cannon/Yinbai/hit",
  SubSoundId = 1,
}
r3_0[2040201] = {
  NumLimit = 5,
  SoundId = 2040201,
  SoundPath = "event:/sfx/weapon/Shotgun/Banzi/bullet_attach",
}
r3_0[2040202] = {
  NumLimit = 5,
  SoundId = 2040202,
  SoundPath = "event:/sfx/weapon/Shotgun/Banzi/bullet_hit",
}
r3_0[2040203] = {
  NumLimit = 5,
  SoundId = 2040203,
  SoundPath = "event:/sfx/weapon/Shotgun/Banzi/bullet_loop",
}
r3_0[2040301] = {
  NumLimit = 5,
  SoundId = 2040301,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/bullet_loop",
}
r3_0[2040302] = {
  NumLimit = 5,
  SoundId = 2040302,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/bullet_explode",
}
r3_0[2040501] = {
  NumLimit = 5,
  SoundId = 2040501,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_shot",
}
r3_0[2040502] = {
  NumLimit = 5,
  SoundId = 2040502,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage2_shot",
}
r3_0[2040503] = {
  NumLimit = 3,
  SoundId = 2040503,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/sword_loop",
}
r3_0[2040504] = {
  NumLimit = 4,
  SoundId = 2040504,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/ball_loop",
}
r3_0[2040505] = {
  NumLimit = 5,
  SoundId = 2040505,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_hit",
}
r3_0[2040506] = {
  NumLimit = 3,
  SoundId = 2040506,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage2_hit",
}
r3_0[2040507] = {
  NumLimit = 4,
  SoundId = 2040507,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/exp",
}
r3_0[2040508] = {
  NumLimit = 1,
  SoundId = 2040508,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/exp_hit",
}
r3_0[2040509] = {
  NumLimit = 5,
  SoundId = 2040509,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_start",
}
r3_0[2040510] = {
  NumLimit = 5,
  SoundId = 2040510,
  SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage2_start",
}
r3_0[2050201] = {
  NumLimit = 5,
  SoundId = 2050201,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/hit",
}
r3_0[2050202] = {
  EmptyFXDontPlay = true,
  NumLimit = 5,
  SoundId = 2050202,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/electric_link",
}
r3_0[2050203] = {
  NumLimit = 5,
  SoundId = 2050203,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/hit_ground",
}
r3_0[2050401] = {
  NumLimit = 5,
  SoundId = 2050401,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_01",
  SubSoundId = 5,
}
r3_0[2050402] = {
  NumLimit = 5,
  SoundId = 2050402,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_02",
  SubSoundId = 5,
}
r3_0[2050403] = {
  NumLimit = 5,
  SoundId = 2050403,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_03",
  SubSoundId = 5,
}
r3_0[2050404] = {
  NumLimit = 5,
  SoundId = 2050404,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_none",
  SubSoundId = 6,
}
r3_0[2050601] = {
  SoundId = 2050601,
  SoundPath = "event:/sfx/weapon/Machinegun/Quewu/laser",
}
r3_0[2050602] = {
  SoundId = 2050602,
  SoundPath = "event:/sfx/weapon/Machinegun/Quewu/loop",
}
r3_0[2050603] = {
  SoundId = 2050603,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_02",
}
r3_0[2050701] = {
  NumLimit = 3,
  SoundId = 2050701,
  SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/fly",
}
r3_0[2050702] = {
  NumLimit = 3,
  SoundId = 2050702,
  SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/hit",
  SubSoundId = 1,
}
r3_0[2050703] = {
  NumLimit = 2,
  SoundId = 2050703,
  SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/hit_ground",
}
r3_0[2050704] = {
  NumLimit = 3,
  SoundId = 2050704,
  SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/fly_start",
}
r3_0[2050705] = {
  NumLimit = 5,
  SoundId = 2050705,
  SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/fly_back",
}
r3_0[2051001] = {
  NumLimit = 5,
  SoundId = 2051001,
  SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/disappear",
}
r3_0[2051002] = {
  NumLimit = 3,
  SoundId = 2051002,
  SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/fly_back",
}
r3_0[2051003] = {
  NumLimit = 3,
  SoundId = 2051003,
  SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/fly_start",
}
r3_0[2051004] = {
  NumLimit = 3,
  SoundId = 2051004,
  SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/fly",
}
r3_0[2060101] = {
  NumLimit = 5,
  SoundId = 2060101,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase01_bullet_loop",
}
r3_0[2060102] = {
  NumLimit = 5,
  SoundId = 2060102,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase02_bullet_loop",
}
r3_0[2060103] = {
  NumLimit = 5,
  SoundId = 2060103,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase03_bullet_loop",
}
r3_0[2060104] = {
  NumLimit = 5,
  SoundId = 2060104,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase01_light",
}
r3_0[2060105] = {
  NumLimit = 5,
  SoundId = 2060105,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase02_light",
}
r3_0[2060106] = {
  NumLimit = 5,
  SoundId = 2060106,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase03_light",
}
r3_0[2060107] = {
  NumLimit = 5,
  SoundId = 2060107,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase01_charge_loop",
}
r3_0[2060108] = {
  NumLimit = 5,
  SoundId = 2060108,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase02_charge_loop",
}
r3_0[2060109] = {
  NumLimit = 5,
  SoundId = 2060109,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase03_charge_loop",
}
r3_0[2060110] = {
  NumLimit = 5,
  SoundId = 2060110,
  SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase04_charge_loop",
}
r3_0[2060201] = {
  NumLimit = 3,
  SoundId = 2060201,
  SoundPath = "event:/sfx/weapon/Bow/Huguang/whistle",
}
r3_0[2060301] = {
  NumLimit = 3,
  SoundId = 2060301,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/whistle_shot",
}
r3_0[2060302] = {
  NumLimit = 2,
  SoundId = 2060302,
  SoundPath = "event:/sfx/common/player/hit/bullet/hit_normal_bow",
  SubSoundId = 1,
}
r3_0[2060303] = {
  NumLimit = 3,
  SoundId = 2060303,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/hit",
}
r3_0[2060304] = {
  NumLimit = 3,
  SoundId = 2060304,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/lock",
}
r3_0[2060305] = {
  NumLimit = 5,
  SoundId = 2060305,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/start",
}
r3_0[2060306] = {
  NumLimit = 5,
  SoundId = 2060306,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/xuli",
}
r3_0[2060307] = {
  NumLimit = 1,
  SoundId = 2060307,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/shot_heavy",
}
r3_0[2060308] = {
  NumLimit = 5,
  SoundId = 2060308,
  SoundPath = "event:/sfx/weapon/Bow/Inbu/shoot",
}
r3_0[3150201] = {
  NumLimit = 5,
  SoundId = 3150201,
  SoundPath = "event:/sfx/common/player/mod/helixJump_wind",
}
r3_0[3151301] = {
  NumLimit = 5,
  SoundId = 3151301,
  SoundPath = "event:/sfx/common/player/mod/landing_default",
}
r3_0[3331101] = {
  NumLimit = 3,
  SoundId = 3331101,
  SoundPath = "event:/sfx/common/player/mod/mod_deathExplosion",
}
r3_0[3331102] = {
  NumLimit = 5,
  SoundId = 3331102,
  SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit",
}
r3_0[9000401] = {
  NumLimit = 5,
  SoundId = 9000401,
  SoundPath = "event:/sfx/common/scene/shenmiao/ball_nor_exp",
}
r3_0[9000402] = {
  NumLimit = 5,
  SoundId = 9000402,
  SoundPath = "event:/sfx/common/scene/shenmiao/ball_ice_exp",
}
r3_0[9000403] = {
  NumLimit = 5,
  SoundId = 9000403,
  SoundPath = "event:/sfx/common/scene/shenmiao/ball_ice_field",
}
r3_0[9000404] = {
  NumLimit = 5,
  SoundId = 9000404,
  SoundPath = "event:/sfx/common/scene/shenmiao/ball_gold_exp",
}
r3_0[9000405] = {
  NumLimit = 5,
  SoundId = 9000405,
  SoundPath = "event:/sfx/common/scene/shenmiao/ball_gold_hit",
}
r3_0[9000601] = {
  NumLimit = 5,
  SoundId = 9000601,
  SoundPath = "event:/sfx/common/scene/monster/eyegun_shot",
}
r3_0[9000602] = {
  NumLimit = 5,
  SoundId = 9000602,
  SoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material",
}
r3_0[10001001] = {
  NumLimit = 3,
  SoundId = 10001001,
  SoundPath = "event:/sfx/enemy/HX/Tianwei/skill04_fx",
}
r3_0[10003001] = {
  NumLimit = 3,
  SoundId = 10003001,
  SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal",
}
r3_0[10003002] = {
  NumLimit = 3,
  SoundId = 10003002,
  SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit",
}
r3_0[10003003] = {
  NumLimit = 3,
  SoundId = 10003003,
  SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal",
}
r3_0[10003004] = {
  NumLimit = 3,
  SoundId = 10003004,
  SoundPath = "event:/sfx/boss/Bian/a_skill02_fx",
}
r3_0[10003005] = {
  NumLimit = 3,
  SoundId = 10003005,
  SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal",
}
r3_0[10003006] = {
  NumLimit = 3,
  SoundId = 10003006,
  SoundPath = "event:/sfx/boss/Bian/a_skill03_fx",
}
r3_0[10003007] = {
  NumLimit = 3,
  SoundId = 10003007,
  SoundPath = "event:/sfx/common/enemy/hit/energy_hit",
}
r3_0[10003008] = {
  NumLimit = 3,
  SoundId = 10003008,
  SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit",
}
r3_0[10004001] = {
  NumLimit = 3,
  SoundId = 10004001,
  SoundPath = "event:/sfx/boss/Bian/b_hit_mid",
}
r3_0[10004002] = {
  NumLimit = 3,
  SoundId = 10004002,
  SoundPath = "event:/sfx/boss/Bian/b_hit_light",
}
r3_0[10004003] = {
  NumLimit = 3,
  SoundId = 10004003,
  SoundPath = "event:/sfx/boss/Bian/b_skill02_fx",
}
r3_0[10004004] = {
  NumLimit = 3,
  SoundId = 10004004,
  SoundPath = "event:/sfx/boss/Bian/b_hit_heavy",
}
r3_0[10004006] = {
  NumLimit = 3,
  SoundId = 10004006,
  SoundPath = "event:/sfx/boss/Bian/b_skill03_fx",
}
r3_0[10004007] = {
  NumLimit = 3,
  SoundId = 10004007,
  SoundPath = "event:/sfx/boss/Bian/b_hit_heavy",
}
r3_0[10004008] = {
  NumLimit = 3,
  SoundId = 10004008,
  SoundPath = "event:/sfx/common/enemy/hit/energy_hit",
}
r3_0[10004009] = {
  NumLimit = 3,
  SoundId = 10004009,
  SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit",
}
r3_0[10101101] = {
  NumLimit = 3,
  SoundId = 10101101,
  SoundPath = "event:/ui/roguelike/door_appear",
}
r3_0[10101102] = {
  NumLimit = 1,
  SoundId = 10101102,
  SoundPath = "event:/ui/roguelike/door_loop",
}
r3_0[10101103] = {
  NumLimit = 5,
  SoundId = 10101103,
  SoundPath = "event:/sfx/rougue/luxin_slash_multi",
}
r3_0[10101104] = {
  NumLimit = 5,
  SoundId = 10101104,
  SoundPath = "event:/sfx/rougue/luxin_slash_single",
}
r3_0[10103101] = {
  NumLimit = 5,
  SoundId = 10103101,
  SoundPath = "event:/sfx/rougue/huiying_shinning_start",
}
r3_0[10103102] = {
  NumLimit = 5,
  SoundId = 10103102,
  SoundPath = "event:/sfx/rougue/huiying_radiate_electric_burst",
}
r3_0[10104301] = {
  NumLimit = 5,
  SoundId = 10104301,
  SoundPath = "event:/sfx/rougue/liuming_tree_heal",
}
r3_0[10104302] = {
  NumLimit = 5,
  SoundId = 10104302,
  SoundPath = "event:/sfx/rougue/liuming_tree_attack",
}
r3_0[10105202] = {
  NumLimit = 5,
  SoundId = 10105202,
  SoundPath = "event:/sfx/rougue/shiyingdie_bullet",
}
r3_0[10105203] = {
  NumLimit = 5,
  SoundId = 10105203,
  SoundPath = "event:/sfx/rougue/shiyingdie_wind_hole",
}
r3_0[10106101] = {
  NumLimit = 5,
  SoundId = 10106101,
  SoundPath = "event:/sfx/rougue/yeguangchong_fx_gun_appear",
}
r3_0[10106102] = {
  NumLimit = 5,
  SoundId = 10106102,
  SoundPath = "event:/sfx/rougue/yeguangchong_bullet_fly",
}
r3_0[10106103] = {
  NumLimit = 5,
  SoundId = 10106103,
  SoundPath = "event:/sfx/rougue/yeguangchong_bullet_burst",
}
r3_0[10108101] = {
  NumLimit = 5,
  SoundId = 10108101,
  SoundPath = "event:/sfx/rougue/fuhaiyue_bullet_fly",
}
r3_0[10108102] = {
  NumLimit = 3,
  SoundId = 10108102,
  SoundPath = "event:/sfx/rougue/fuhaiyue_bullet_burst",
}
r3_0[10108103] = {
  NumLimit = 5,
  SoundId = 10108103,
  SoundPath = "event:/sfx/rougue/fuhai_appear",
}
r3_0[10108104] = {
  NumLimit = 5,
  SoundId = 10108104,
  SoundPath = "event:/sfx/rougue/fuhai_explode",
}
r3_0[10109102] = {
  NumLimit = 5,
  SoundId = 10109102,
  SoundPath = "event:/sfx/rougue/jixuehua_buff_start",
}
r3_0[10109103] = {
  NumLimit = 5,
  SoundId = 10109103,
  SoundPath = "event:/sfx/rougue/jixue_cast",
}
r3_0[21030001] = {
  SoundId = 21030001,
  SoundPath = "event:/sfx/rougue/treasure_light",
}
r3_0[21031001] = {
  SoundId = 21031001,
  SoundPath = "event:/sfx/rougue/treasure_dark",
}
r3_0[21034001] = {
  SoundId = 21034001,
  SoundPath = "event:/sfx/rougue/treasure_fire",
}
r3_0[21035001] = {
  SoundId = 21035001,
  SoundPath = "event:/sfx/rougue/treasure_electric",
}
r3_0[40101001] = {
  SoundId = 40101001,
  SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_01",
}
r3_0[600000901] = {
  NumLimit = 5,
  SoundId = 600000901,
  SoundPath = "event:/sfx/common/enemy/buff/strong_iceOrb_01",
}
r3_0[600000902] = {
  NumLimit = 5,
  SoundId = 600000902,
  SoundPath = "event:/sfx/common/enemy/buff/strong_iceOrb_02",
}
r3_0[600000903] = {
  NumLimit = 5,
  SoundId = 600000903,
  SoundPath = "event:/sfx/common/enemy/hit/ice_hit",
}
r3_0[600001001] = {
  NumLimit = 5,
  SoundId = 600001001,
  SoundPath = "event:/sfx/common/enemy/buff/strong_reflect_01",
}
r3_0[600001002] = {
  NumLimit = 5,
  SoundId = 600001002,
  SoundPath = "event:/sfx/common/enemy/buff/strong_reflect_02",
}
r3_0[600001003] = {
  NumLimit = 5,
  SoundId = 600001003,
  SoundPath = "event:/sfx/common/enemy/buff/strong_reflect_loop",
}
r3_0[600001004] = {
  NumLimit = 3,
  SoundId = 600001004,
  SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit",
}
r3_0[600001101] = {
  NumLimit = 5,
  SoundId = 600001101,
  SoundPath = "event:/sfx/common/enemy/buff/strong_kamiKaze_01",
}
r3_0[600001102] = {
  NumLimit = 5,
  SoundId = 600001102,
  SoundPath = "event:/sfx/common/enemy/buff/strong_kamiKaze_02",
}
r3_0[600001103] = {
  NumLimit = 5,
  SoundId = 600001103,
  SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit",
}
r3_0[600001201] = {
  NumLimit = 4,
  SoundId = 600001201,
  SoundPath = "event:/sfx/common/enemy/buff/strong_thunderLaser_01",
}
r3_0[600001202] = {
  NumLimit = 3,
  SoundId = 600001202,
  SoundPath = "event:/sfx/common/enemy/buff/strong_thunderLaser_loop",
}
r3_0[600001203] = {
  NumLimit = 5,
  SoundId = 600001203,
  SoundPath = "event:/sfx/common/enemy/hit/energy_hit",
}
r3_0[600001301] = {
  NumLimit = 5,
  SoundId = 600001301,
  SoundPath = "event:/sfx/common/enemy/buff/strong_vampire",
}
r3_0[600001401] = {
  NumLimit = 5,
  SoundId = 600001401,
  SoundPath = "event:/sfx/common/enemy/buff/strong_threeFold",
}
r3_0[900000001] = {
  SoundId = 900000001,
  SoundPath = "event:/sfx/weapon/Cannon/Qunxing/sub_bullet_explode",
}
return r0_0("SoundEffect", r3_0)
