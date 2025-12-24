-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\DanmakuTemplate.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {
  [1] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/Test/BP_DanmakuTemplate_1.BP_DanmakuTemplate_1",
    Type = 1,
    UseSkillCreature = true,
  },
  [2] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_XY.BP_Danmaku_XY",
    Type = 2,
    UseSkillCreature = true,
  },
  [3] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_RandomDown.BP_Danmaku_RandomDown",
    Type = 3,
    UseSkillCreature = true,
  },
  [10] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/Test/BP_DanmakuTemplate_2.BP_DanmakuTemplate_2",
    Type = 10,
  },
}
r3_0[11] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/Test/BP_DanmakuTemplate_3.BP_DanmakuTemplate_3",
  Type = 11,
  Vars = {
    IsTest = true,
  },
}
r3_0[30401] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossOnline_Skill0901.BP_Danmaku_BossOnline_Skill0901",
  Type = 30401,
}
r3_0[850041] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossXibi_Skill04_Bullet.BP_Danmaku_BossXibi_Skill04_Bullet",
  Type = 850041,
}
r3_0[850051] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossXibi_Skill05.BP_Danmaku_BossXibi_Skill05",
  Type = 850051,
}
r3_0[850101] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLizhan_Skill10_Danmaku.BP_Danmaku_BossLizhan_Skill10_Danmaku",
  Type = 850101,
  UseSkillCreature = true,
}
r3_0[850102] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLizhan_Skill04_Danmaku.BP_Danmaku_BossLizhan_Skill04_Danmaku",
  Type = 850102,
}
r3_0[850201] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi_Skill19_Bullet.BP_Danmaku_BossSaiqi_Skill19_Bullet",
  Type = 850201,
}
r3_0[850301] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe.BP_Danmaku_BossShijingzhe",
  Type = 850301,
  UseSkillCreature = true,
}
r3_0[850302] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_2.BP_Danmaku_BossShijingzhe_2",
  Type = 850302,
  UseSkillCreature = true,
}
r3_0[850303] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_3.BP_Danmaku_BossShijingzhe_3",
  Type = 850303,
  UseSkillCreature = true,
}
r3_0[850304] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_4.BP_Danmaku_BossShijingzhe_4",
  Type = 850304,
}
r3_0[850305] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_Skill15.BP_Danmaku_BossShijingzhe_Skill15",
  Type = 850305,
  UseSkillCreature = true,
}
r3_0[850401] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill01_Bullet.BP_Danmaku_BossSaiqi02_Skill01_Bullet",
  Type = 850401,
}
r3_0[850402] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill02_Bullet.BP_Danmaku_BossSaiqi02_Skill02_Bullet",
  Type = 850402,
}
r3_0[850403] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill03_Bullet.BP_Danmaku_BossSaiqi02_Skill03_Bullet",
  Type = 850403,
}
r3_0[850404] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill04_Bullet.BP_Danmaku_BossSaiqi02_Skill04_Bullet",
  Type = 850404,
}
r3_0[850405] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill05_Bullet.BP_Danmaku_BossSaiqi02_Skill05_Bullet",
  Type = 850405,
}
r3_0[850406] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill06_Bullet.BP_Danmaku_BossSaiqi02_Skill06_Bullet",
  Type = 850406,
}
r3_0[850407] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill18_Bullet.BP_Danmaku_BossSaiqi02_Skill18_Bullet",
  Type = 850407,
}
r3_0[850408] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill19_Bullet.BP_Danmaku_BossSaiqi02_Skill19_Bullet",
  Type = 850408,
}
r3_0[850409] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill20_Left_Bullet.BP_Danmaku_BossSaiqi02_Skill20_Left_Bullet",
  Type = 850409,
}
r3_0[850410] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill20_Right_Bullet.BP_Danmaku_BossSaiqi02_Skill20_Right_Bullet",
  Type = 850410,
}
r3_0[850411] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill21_Down_Bullet.BP_Danmaku_BossSaiqi02_Skill21_Down_Bullet",
  Type = 850411,
  UseSkillCreature = true,
}
r3_0[850412] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill21_Up_Bullet.BP_Danmaku_BossSaiqi02_Skill21_Up_Bullet",
  Type = 850412,
  UseSkillCreature = true,
}
r3_0[850413] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill22_Bullet.BP_Danmaku_BossSaiqi02_Skill22_Bullet",
  Type = 850413,
}
r3_0[850414] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill23_Bullet.BP_Danmaku_BossSaiqi02_Skill23_Bullet",
  Type = 850414,
}
r3_0[850415] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill19_02_Bullet.BP_Danmaku_BossSaiqi02_Skill19_02_Bullet",
  Type = 850415,
}
r3_0[850416] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill04_02_Bullet.BP_Danmaku_BossSaiqi02_Skill04_02_Bullet",
  Type = 850416,
}
r3_0[850417] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill05_02_Bullet.BP_Danmaku_BossSaiqi02_Skill05_02_Bullet",
  Type = 850417,
}
r3_0[850418] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill29_Bullet.BP_Danmaku_BossSaiqi02_Skill29_Bullet",
  Type = 850418,
}
r3_0[850419] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_Picture_Bullet.BP_Danmaku_Picture_Bullet",
  Type = 850419,
}
r3_0[850901] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0701.BP_Danmaku_BossTuosi_Skill0701",
  Type = 850901,
}
r3_0[850902] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0702.BP_Danmaku_BossTuosi_Skill0702",
  Type = 850902,
}
r3_0[850903] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0801.BP_Danmaku_BossTuosi_Skill0801",
  Type = 850903,
}
r3_0[850904] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0802.BP_Danmaku_BossTuosi_Skill0802",
  Type = 850904,
}
r3_0[851001] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Laser.BP_Danmaku_BossHeilong_Laser",
  Type = 851001,
}
r3_0[851002] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Games.BP_Danmaku_BossHeilong_Games",
  Type = 851002,
}
r3_0[851003] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Skill07_Bullet.BP_Danmaku_BossHeilong_Skill07_Bullet",
  Type = 851003,
  UseSkillCreature = true,
}
r3_0[851004] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Skill08_Laser.BP_Danmaku_BossHeilong_Skill08_Laser",
  Type = 851004,
}
r3_0[851101] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossBailong_Laser.BP_Danmaku_BossBailong_Laser",
  Type = 851101,
}
r3_0[851201] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Summon1_Laser.BP_Danmaku_BossLinen_Summon1_Laser",
  Type = 851201,
  UseSkillCreature = true,
}
r3_0[851202] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Summon3_Laser.BP_Danmaku_BossLinen_Summon3_Laser",
  Type = 851202,
  UseSkillCreature = true,
}
r3_0[851203] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill06_Laser.BP_Danmaku_BossLinen_Skill06_Laser",
  Type = 851203,
  UseSkillCreature = true,
}
r3_0[851204] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill06Air_Laser.BP_Danmaku_BossLinen_Skill06Air_Laser",
  Type = 851204,
  UseSkillCreature = true,
}
r3_0[851205] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill09_Laser.BP_Danmaku_BossLinen_Skill09_Laser",
  Type = 851205,
  UseSkillCreature = true,
}
r3_0[851206] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill09Air_Laser.BP_Danmaku_BossLinen_Skill09Air_Laser",
  Type = 851206,
  UseSkillCreature = true,
}
r3_0[851207] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill09Ground_Laser.BP_Danmaku_BossLinen_Skill09Ground_Laser",
  Type = 851207,
  UseSkillCreature = true,
}
r3_0[851301] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossKuxiu_Skill07.BP_Danmaku_BossKuxiu_Skill07",
  Type = 851301,
}
r3_0[851501] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0401.BP_Danmaku_BossJushi_Skill0401",
  Type = 851501,
}
r3_0[851502] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0402.BP_Danmaku_BossJushi_Skill0402",
  Type = 851502,
}
r3_0[851503] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0403.BP_Danmaku_BossJushi_Skill0403",
  Type = 851503,
}
r3_0[851504] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0701.BP_Danmaku_BossJushi_Skill0701",
  Type = 851504,
}
r3_0[851505] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0501.BP_Danmaku_BossJushi_Skill0501",
  Type = 851505,
}
r3_0[851506] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0601.BP_Danmaku_BossJushi_Skill0601",
  Type = 851506,
}
r3_0[851801] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJuque_Laser.BP_Danmaku_BossJuque_Laser",
  Type = 851801,
}
r3_0[851901] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLiecheCannon_Skill0201.BP_Danmaku_BossLiecheCannon_Skill0201",
  Type = 851901,
}
r3_0[851902] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLiecheCannon_Skill0202.BP_Danmaku_BossLiecheCannon_Skill0202",
  Type = 851902,
}
r3_0[852001] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossAida_Skill1301.BP_Danmaku_BossAida_Skill1301",
  Type = 852001,
}
r3_0[600000401] = {
  AttachToOwner = true,
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_RandomAround.BP_Danmaku_RandomAround",
  Type = 600000401,
}
r3_0[600000406] = {
  BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_RotateLaser.BP_Danmaku_RotateLaser",
  Type = 600000406,
  UseSkillCreature = true,
}
return r0_0("DanmakuTemplate", r3_0)
