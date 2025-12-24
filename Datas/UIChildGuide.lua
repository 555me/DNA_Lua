-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\UIChildGuide.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_1.T_Guide_Img_Explore_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_1.T_Guide_Img_Explore_Step_1\'",
  },
  RT_2 = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Exterminate_Step_1.T_Guide_Img_Exterminate_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Exterminate_Step_1.T_Guide_Img_Exterminate_Step_1\'",
  },
  RT_3 = {
    GamePad = "UIGuide_FangShu_4",
    PC = "UIGuide_FangShu_4",
    Phone = "UIGuide_FangShu_4",
  },
  RT_4 = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_4.T_Guide_Img_FangShu_4\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_4.T_Guide_Img_FangShu_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_4.T_Guide_Img_FangShu_4\'",
  },
}
r0_0.RT_5 = {
  GuideContent = r0_0.RT_3,
  GuidePicture = r0_0.RT_4,
}
r0_0.RT_6 = {
  PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Elevator_01.T_Guide_Img_Elevator_01\'",
  Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Shadow_01.T_Guide_Img_Shadow_01\'",
}
r0_0.RT_7 = {
  PC = "UIGuide_SIDEWAYSJUMP",
  Phone = "UIGuide_SIDEWAYSJUMP",
}
r0_0.RT_8 = {
  PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SidewayJump_01.T_Guide_Img_SidewayJump_01\'",
  Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SidewayJump_01.T_Guide_Img_SidewayJump_01\'",
}
r0_0.RT_9 = {
  GuideContent = r0_0.RT_7,
  GuidePicture = r0_0.RT_8,
}
r0_0.RT_10 = {
  GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_02.T_Guide_Img_OnlineArea_02\'",
  PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_02.T_Guide_Img_OnlineArea_02\'",
  Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_02.T_Guide_Img_OnlineArea_02\'",
}
r0_0.RT_11 = {
  GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_03.T_Guide_Img_OnlineArea_03\'",
  PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_03.T_Guide_Img_OnlineArea_03\'",
  Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_03.T_Guide_Img_OnlineArea_03\'",
}
r0_0.RT_12 = {
  PC = "Message_Guide_Badge_1",
  Phone = "Message_Guide_Badge_1",
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [55, 55] id: 1
  return r1_1
end
local r3_0 = "UIChildGuide"
local r4_0 = {}
local r6_0 = {
  ChildGuideId = 301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGUIDE_EXECUTION_01",
    PC = "UIGUIDE_EXECUTION_01",
    Phone = "UIGUIDE_EXECUTION_01",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Toughness.T_Guide_Img_Toughness\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Toughness.T_Guide_Img_Toughness\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Toughness.T_Guide_Img_Toughness\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_EXECUTION_01"
r6_0.GuideType = "ImageText"
r4_0[301] = r6_0
r6_0 = {
  ChildGuideId = 302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_EXECUTION_02",
    Phone = "UIGUIDE_EXECUTION_02",
  },
  GuidePicture = {
    GamePad = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_Hero_Execute_GamePad.Video_Guide_Hero_Execute_GamePad\'",
    PC = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_Hero_Execute_PC.Video_Guide_Hero_Execute_PC\'",
    Phone = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_Hero_Execute_Phone.Video_Guide_Hero_Execute_Phone\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_EXECUTION_02"
r6_0.GuideType = "ImageText"
r4_0[302] = r6_0
r6_0 = {
  ChildGuideId = 401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_SKILL2_01",
    Phone = "UIGUIDE_SKILL2_01_phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Secondskill.T_Guide_Img_Secondskill\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Secondskill.T_Guide_Img_Secondskill\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_SKILL2_01"
r6_0.GuideType = "ImageText"
r4_0[401] = r6_0
r6_0 = {
  ChildGuideId = 501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_HPSHIELD",
    Phone = "UIGUIDE_HPSHIELD",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Hp_Shield_PC.T_Guide_Img_Hp_Shield_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Hp_Shield_Phone.T_Guide_Img_Hp_Shield_Phone\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_HPSHIELD"
r6_0.GuideType = "ImageText"
r4_0[501] = r6_0
r6_0 = {
  ChildGuideId = 502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_OverloadShield",
    Phone = "UIGuide_OverloadShield",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OverloadShield_PC.T_Guide_Img_OverloadShield_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OverloadShield_Phone.T_Guide_Img_OverloadShield_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_OverloadShield"
r6_0.GuideType = "ImageText"
r4_0[502] = r6_0
r6_0 = {
  ChildGuideId = 601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_01",
    Phone = "UIGUIDE_PARTIALDAMAGE_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_01.T_Guide_Img_DestructablePart_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_01.T_Guide_Img_DestructablePart_01\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[601] = r6_0
r6_0 = {
  ChildGuideId = 602,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_02",
    Phone = "UIGUIDE_PARTIALDAMAGE_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_02.T_Guide_Img_DestructablePart_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_02.T_Guide_Img_DestructablePart_02\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[602] = r6_0
r6_0 = {
  ChildGuideId = 603,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_03",
    Phone = "UIGUIDE_PARTIALDAMAGE_03",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_03.T_Guide_Img_DestructablePart_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_03.T_Guide_Img_DestructablePart_03\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[603] = r6_0
r6_0 = {
  ChildGuideId = 604,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_04",
    Phone = "UIGUIDE_PARTIALDAMAGE_04",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DestructablePart_04_Phone.T_Guide_Img_DestructablePart_04_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DestructablePart_04_Phone.T_Guide_Img_DestructablePart_04_Phone\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[604] = r6_0
r6_0 = {
  ChildGuideId = 605,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_05",
    Phone = "UIGUIDE_PARTIALDAMAGE_05",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_05.T_Guide_Img_DestructablePart_05\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_05.T_Guide_Img_DestructablePart_05\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[605] = r6_0
r6_0 = {
  ChildGuideId = 606,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_06",
    Phone = "UIGUIDE_PARTIALDAMAGE_06",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_06.T_Guide_Img_DestructablePart_06\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_06.T_Guide_Img_DestructablePart_06\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[606] = r6_0
r6_0 = {
  ChildGuideId = 607,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_07",
    Phone = "UIGUIDE_PARTIALDAMAGE_07",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_07.T_Guide_Img_DestructablePart_07\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_DestructablePart_07.T_Guide_Img_DestructablePart_07\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[607] = r6_0
r6_0 = {
  ChildGuideId = 608,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_PARTIALDAMAGE_08",
    Phone = "UIGUIDE_PARTIALDAMAGE_08",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DestructablePart_08_Phone.T_Guide_Img_DestructablePart_08_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DestructablePart_08_Phone.T_Guide_Img_DestructablePart_08_Phone\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_PARTIALDAMAGE"
r6_0.GuideType = "ImageText"
r4_0[608] = r6_0
r6_0 = {
  ChildGuideId = 701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_GUN",
    Phone = "UIGUIDE_GUN",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Gun_PC.T_Guide_Img_Gun_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Gun_Phone.T_Guide_Img_Gun_Phone\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_GUN"
r6_0.GuideType = "ImageText"
r4_0[701] = r6_0
r6_0 = {
  ChildGuideId = 702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGUIDE_AMMO",
    Phone = "UIGUIDE_AMMO",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Ammo_PC.T_Guide_Img_Ammo_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Ammo_Phone.T_Guide_Img_Ammo_Phone\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_AMMO"
r6_0.GuideType = "ImageText"
r4_0[702] = r6_0
r6_0 = {
  ChildGuideId = 901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Delivery_01",
    Phone = "UIGuide_Delivery_01_phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Delivery_01.T_Guide_Img_Delivery_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Delivery_01.T_Guide_Img_Delivery_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Delivery_01"
r6_0.GuideType = "ImageText"
r4_0[901] = r6_0
r6_0 = {
  ChildGuideId = 902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Delivery_02",
    Phone = "UIGuide_Delivery_02_phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Delivery_02.T_Guide_Img_Delivery_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Delivery_02.T_Guide_Img_Delivery_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Delivery_02"
r6_0.GuideType = "ImageText"
r4_0[902] = r6_0
r6_0 = {
  ChildGuideId = 1001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Combo_01",
    Phone = "UIGuide_Combo_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Combo_01.T_Guide_Img_Combo_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Combo_01.T_Guide_Img_Combo_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Combo_01"
r6_0.GuideType = "ImageText"
r4_0[1001] = r6_0
r6_0 = {
  ChildGuideId = 1002,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Combo_02_PC",
    Phone = "UIGuide_Combo_02_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Combo_02.T_Guide_Img_Combo_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Combo_02.T_Guide_Img_Combo_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Combo_02"
r6_0.GuideType = "ImageText"
r4_0[1002] = r6_0
r6_0 = {
  ChildGuideId = 1101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_HardBoss_01",
    Phone = "UIGuide_HardBoss_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HardBoss_01.T_Guide_Img_HardBoss_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HardBoss_01.T_Guide_Img_HardBoss_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_HardBoss"
r6_0.GuideType = "ImageText"
r4_0[1101] = r6_0
r6_0 = {
  ChildGuideId = 1102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_HardBoss_02",
    Phone = "UIGuide_HardBoss_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HardBoss_02.T_Guide_Img_HardBoss_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HardBoss_02.T_Guide_Img_HardBoss_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_HardBoss"
r6_0.GuideType = "ImageText"
r4_0[1102] = r6_0
r6_0 = {
  ChildGuideId = 1201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ModTendency_1",
    Phone = "UIGuide_ModTendency_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_01.T_Guide_Img_Mod_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_01.T_Guide_Img_Mod_01\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_ModTendency_2",
    Phone = "UIGuide_ModTendency_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_02.T_Guide_Img_Mod_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_02.T_Guide_Img_Mod_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ModTendency_1"
r6_0.GuideType = "ImageText"
r4_0[1201] = r6_0
r6_0 = {
  ChildGuideId = 1204,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ModTendency_4",
    Phone = "UIGuide_ModTendency_4",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_03.T_Guide_Img_Mod_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_03.T_Guide_Img_Mod_03\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_ModTendency_5",
    Phone = "UIGuide_ModTendency_5",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_04.T_Guide_Img_Mod_04\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Mod_04.T_Guide_Img_Mod_04\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ModTendency_4"
r6_0.GuideType = "ImageText"
r4_0[1204] = r6_0
r6_0 = {
  ChildGuideId = 1301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_BulletJump_1_PC",
    Phone = "UIGuide_BulletJump_1_Phone",
  },
  GuidePicture = {
    PC = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_BulletJump_01.Video_Guide_BulletJump_01\'",
    Phone = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_BulletJump_01.Video_Guide_BulletJump_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_BulletJump"
r6_0.GuideType = "ImageText"
r4_0[1301] = r6_0
r6_0 = {
  ChildGuideId = 1302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_BulletJump_2",
    Phone = "UIGuide_BulletJump_2",
  },
  GuidePicture = {
    PC = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_BulletJump_02.Video_Guide_BulletJump_02\'",
    Phone = "FileMediaSource\'/Game/Asset/UIVideo/Video_Guide_BulletJump_02.Video_Guide_BulletJump_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_BulletJump"
r6_0.GuideType = "ImageText"
r4_0[1302] = r6_0
r6_0 = {
  ChildGuideId = 1401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_WallJump_PC",
    Phone = "UIGuide_WallJump_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WallJump_01.T_Guide_Img_WallJump_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WallJump_01.T_Guide_Img_WallJump_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_WallJump"
r6_0.GuideType = "ImageText"
r4_0[1401] = r6_0
r6_0 = {
  ChildGuideId = 1501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Dodge_PC",
    Phone = "UIGuide_Dodge_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Dodge_01_PC.T_Guide_Img_Dodge_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Dodge_01_Phone.T_Guide_Img_Dodge_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Dodge"
r6_0.GuideType = "ImageText"
r4_0[1501] = r6_0
r6_0 = {
  ChildGuideId = 1502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Run_PC",
    Phone = "UIGuide_Run_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Run_01_PC.T_Guide_Img_Run_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Run_01_Phone.T_Guide_Img_Run_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Run"
r6_0.GuideType = "ImageText"
r4_0[1502] = r6_0
r6_0 = {
  ChildGuideId = 1601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_LockMonster_PC",
    Phone = "UIGuide_LockMonster_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LockMonster_01_PC.T_Guide_Img_LockMonster_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LockMonster_01_Phone.T_Guide_Img_LockMonster_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_LockMonster"
r6_0.GuideType = "ImageText"
r4_0[1601] = r6_0
r6_0 = {
  ChildGuideId = 1701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_BattleWheel_1",
    Phone = "UIGuide_BattleWheel_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_BattleWheel_01.T_Guide_Img_BattleWheel_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_BattleWheel_01.T_Guide_Img_BattleWheel_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_BattleWheel_1"
r6_0.GuideType = "ImageText"
r4_0[1701] = r6_0
r6_0 = {
  ChildGuideId = 1702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_BattleWheel_2_PC",
    Phone = "UIGuide_BattleWheel_2_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_BattleWheel_02.T_Guide_Img_BattleWheel_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_BattleWheel_02.T_Guide_Img_BattleWheel_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_BattleWheel_2"
r6_0.GuideType = "ImageText"
r4_0[1702] = r6_0
r6_0 = {
  ChildGuideId = 1801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Shadow_1",
    Phone = "UIGuide_Shadow_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Shadow_01.T_Guide_Img_Shadow_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Shadow_01.T_Guide_Img_Shadow_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Shadow_1"
r6_0.GuideType = "ImageText"
r4_0[1801] = r6_0
r6_0 = {
  ChildGuideId = 1802,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Shadow_2",
    Phone = "UIGuide_Shadow_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Shadow_02.T_Guide_Img_Shadow_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Shadow_02.T_Guide_Img_Shadow_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Shadow_2"
r6_0.GuideType = "ImageText"
r4_0[1802] = r6_0
r6_0 = {
  ChildGuideId = 1901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Elevator",
    Phone = "UIGuide_Elevator",
  },
  GuidePicture = r0_0.RT_6,
}
r6_0.GuideTitle = "UIGuide_Title_Elevator"
r6_0.GuideType = "ImageText"
r4_0[1901] = r6_0
r6_0 = {
  ChildGuideId = 2001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TurnTable",
    Phone = "UIGuide_TurnTable",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TurnTable_01_Phone.T_Guide_Img_TurnTable_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TurnTable_01_Phone.T_Guide_Img_TurnTable_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TurnTable"
r6_0.GuideType = "ImageText"
r4_0[2001] = r6_0
r6_0 = {
  ChildGuideId = 2101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ConnectMechanism",
    Phone = "UIGuide_ConnectMechanism",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ConnectMechanism_01_PC.T_Guide_Img_ConnectMechanism_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ConnectMechanism_01_Phone.T_Guide_Img_ConnectMechanism_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ConnectMechanism"
r6_0.GuideType = "ImageText"
r4_0[2101] = r6_0
r6_0 = {
  ChildGuideId = 2201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_DamageMechanism_1",
    Phone = "UIGuide_DamageMechanism_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DamageMechanism_01.T_Guide_Img_DamageMechanism_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DamageMechanism_01.T_Guide_Img_DamageMechanism_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_DamageMechanism"
r6_0.GuideType = "ImageText"
r4_0[2201] = r6_0
r6_0 = {
  ChildGuideId = 2202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_DamageMechanism_2",
    Phone = "UIGuide_DamageMechanism_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DamageMechanism_02.T_Guide_Img_DamageMechanism_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DamageMechanism_02.T_Guide_Img_DamageMechanism_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_DamageMechanism"
r6_0.GuideType = "ImageText"
r4_0[2202] = r6_0
r6_0 = {
  ChildGuideId = 2301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Destructible",
    Phone = "UIGuide_Destructible",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Destructible_01.T_Guide_Img_Destructible_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Destructible_01.T_Guide_Img_Destructible_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Destructible"
r6_0.GuideType = "ImageText"
r4_0[2301] = r6_0
r6_0 = {
  ChildGuideId = 2501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ExplorationMechanism_1_PC",
    Phone = "UIGuide_ExplorationMechanism_1_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExplorationMechanism_01_Phone.T_Guide_Img_ExplorationMechanism_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExplorationMechanism_01_Phone.T_Guide_Img_ExplorationMechanism_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ExplorationMechanism_1"
r6_0.GuideType = "ImageText"
r4_0[2501] = r6_0
r6_0 = {
  ChildGuideId = 2502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ExplorationMechanism_2",
    Phone = "UIGuide_ExplorationMechanism_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExplorationMechanism_02.T_Guide_Img_ExplorationMechanism_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExplorationMechanism_02.T_Guide_Img_ExplorationMechanism_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ExplorationMechanism_2"
r6_0.GuideType = "ImageText"
r4_0[2502] = r6_0
r6_0 = {
  ChildGuideId = 2503,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ExplorationMechanism_3",
    Phone = "UIGuide_ExplorationMechanism_3",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExplorationMechanism_03.T_Guide_Img_ExplorationMechanism_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExplorationMechanism_03.T_Guide_Img_ExplorationMechanism_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ExplorationMechanism_3"
r6_0.GuideType = "ImageText"
r4_0[2503] = r6_0
r6_0 = {
  ChildGuideId = 2601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_CursorActivation",
    Phone = "UIGuide_CursorActivation",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_CursorActivation_01.T_Guide_Img_CursorActivation_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_CursorActivation_01.T_Guide_Img_CursorActivation_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_CursorActivation"
r6_0.GuideType = "ImageText"
r4_0[2601] = r6_0
r6_0 = {
  ChildGuideId = 2701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Reading",
    Phone = "UIGuide_Reading",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Reading_01_Phone.T_Guide_Img_Reading_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Reading_01_Phone.T_Guide_Img_Reading_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Reading"
r6_0.GuideType = "ImageText"
r4_0[2701] = r6_0
r6_0 = {
  ChildGuideId = 2901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ImpressionSystem_1",
    Phone = "UIGuide_ImpressionSystem_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionSystem_01_Phone.T_Guide_Img_ImpressionSystem_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionSystem_01_Phone.T_Guide_Img_ImpressionSystem_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ImpressionSystem_1"
r6_0.GuideType = "ImageText"
r4_0[2901] = r6_0
r6_0 = {
  ChildGuideId = 2902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ImpressionSystem_2",
    Phone = "UIGuide_ImpressionSystem_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionSystem_02_Phone.T_Guide_Img_ImpressionSystem_02_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionSystem_02_Phone.T_Guide_Img_ImpressionSystem_02_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ImpressionSystem_2"
r6_0.GuideType = "ImageText"
r4_0[2902] = r6_0
r6_0 = {
  ChildGuideId = 2903,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ImpressionShop_1",
    Phone = "UIGuide_ImpressionShop_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionShop_01.T_Guide_Img_ImpressionShop_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionShop_01.T_Guide_Img_ImpressionShop_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ImpressionShop"
r6_0.GuideType = "ImageText"
r4_0[2903] = r6_0
r6_0 = {
  ChildGuideId = 2904,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ImpressionShop_2",
    Phone = "UIGuide_ImpressionShop_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionShop_02.T_Guide_Img_ImpressionShop_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionShop_02.T_Guide_Img_ImpressionShop_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ImpressionShop"
r6_0.GuideType = "ImageText"
r4_0[2904] = r6_0
r6_0 = {
  ChildGuideId = 3001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ImpressionCheck_1",
    Phone = "UIGuide_ImpressionCheck_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionCheck_01.T_Guide_Img_ImpressionCheck_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionCheck_01.T_Guide_Img_ImpressionCheck_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ImpressionCheck_1"
r6_0.GuideType = "ImageText"
r4_0[3001] = r6_0
r6_0 = {
  ChildGuideId = 3002,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ImpressionCheck_2",
    Phone = "UIGuide_ImpressionCheck_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionCheck_02.T_Guide_Img_ImpressionCheck_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ImpressionCheck_02.T_Guide_Img_ImpressionCheck_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ImpressionCheck_2"
r6_0.GuideType = "ImageText"
r4_0[3002] = r6_0
r6_0 = {
  ChildGuideId = 3101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Biography",
    Phone = "UIGuide_Biography",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Biography_01_Phone.T_Guide_Img_Biography_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Biography_01_Phone.T_Guide_Img_Biography_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Biography"
r6_0.GuideType = "ImageText"
r4_0[3101] = r6_0
r6_0 = {
  ChildGuideId = 3201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Phantom_1_1",
    Phone = "UIGuide_Phantom_1_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_01_01_PC.T_Guide_Img_Phantom_01_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_01_01_Phone.T_Guide_Img_Phantom_01_01_Phone\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Phantom_1_2",
    Phone = "UIGuide_Phantom_1_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_01_02_PC.T_Guide_Img_Phantom_01_02_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_01_02_Phone.T_Guide_Img_Phantom_01_02_Phone\'",
  },
}
r6_0.GuideInfo3 = {
  GuideContent = {
    PC = "UIGuide_Phantom_1_3",
    Phone = "UIGuide_Phantom_1_3",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_01_03_PC.T_Guide_Img_Phantom_01_03_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_01_03_Phone.T_Guide_Img_Phantom_01_03_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Phantom_1"
r6_0.GuideType = "ImageText"
r4_0[3201] = r6_0
r6_0 = {
  ChildGuideId = 3202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Phantom_2_1",
    Phone = "UIGuide_Phantom_2_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_02_01_PC.T_Guide_Img_Phantom_02_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_02_01_Phone.T_Guide_Img_Phantom_02_01_Phone\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Phantom_2_2",
    Phone = "UIGuide_Phantom_2_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_02_02_PC.T_Guide_Img_Phantom_02_02_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_02_02_Phone.T_Guide_Img_Phantom_02_02_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Phantom_2"
r6_0.GuideType = "ImageText"
r4_0[3202] = r6_0
r6_0 = {
  ChildGuideId = 3203,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Phantom_3_1",
    Phone = "UIGuide_Phantom_3_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_03_01_PC.T_Guide_Img_Phantom_03_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_03_01_Phone.T_Guide_Img_Phantom_03_01_Phone\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Phantom_3_2",
    Phone = "UIGuide_Phantom_3_2_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_03_02.T_Guide_Img_Phantom_03_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_03_02.T_Guide_Img_Phantom_03_02\'",
  },
}
r6_0.GuideInfo3 = {
  GuideContent = {
    PC = "UIGuide_Phantom_3_3",
    Phone = "UIGuide_Phantom_3_3",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_03_03.T_Guide_Img_Phantom_03_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Phantom_03_03.T_Guide_Img_Phantom_03_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Phantom_3"
r6_0.GuideType = "ImageText"
r4_0[3203] = r6_0
r6_0 = {
  ChildGuideId = 3204,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Phantom_4_1",
    Phone = "UIGuide_Phantom_4_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Phantom_04_01_PC.T_Guide_Img_Phantom_04_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Phantom_04_01_PC.T_Guide_Img_Phantom_04_01_PC\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Phantom_4"
r6_0.GuideType = "ImageText"
r4_0[3204] = r6_0
r6_0 = {
  ChildGuideId = 3301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TrainingGround_1",
    Phone = "UIGuide_TrainingGround_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TraingGround_01.T_Guide_Img_TraingGround_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TraingGround_01.T_Guide_Img_TraingGround_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TrainingGround_1"
r6_0.GuideType = "ImageText"
r4_0[3301] = r6_0
r6_0 = {
  ChildGuideId = 3302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TrainingGround_2",
    Phone = "UIGuide_TrainingGround_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TraingGround_02.T_Guide_Img_TraingGround_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TraingGround_02.T_Guide_Img_TraingGround_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TrainingGround_2"
r6_0.GuideType = "ImageText"
r4_0[3302] = r6_0
r6_0 = {
  ChildGuideId = 3303,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TrainingGround_3_PC",
    Phone = "UIGuide_TrainingGround_3_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TraingGround_03.T_Guide_Img_TraingGround_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TraingGround_03.T_Guide_Img_TraingGround_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TrainingGround_3"
r6_0.GuideType = "ImageText"
r4_0[3303] = r6_0
r6_0 = {
  ChildGuideId = 3401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TrainingGround_4_PC",
    Phone = "UIGuide_TrainingGround_4_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LeaveTrainingGround_01.T_Guide_Img_LeaveTrainingGround_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LeaveTrainingGround_01.T_Guide_Img_LeaveTrainingGround_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TrainingGround_4"
r6_0.GuideType = "ImageText"
r4_0[3401] = r6_0
r6_0 = {
  ChildGuideId = 3501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_AssistanceSkill",
    Phone = "UIGuide_AssistanceSkill",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_AssistanceSkill_01_PC.T_Guide_Img_AssistanceSkill_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_AssistanceSkill_01_Phone.T_Guide_Img_AssistanceSkill_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_AssistanceSkill"
r6_0.GuideType = "ImageText"
r4_0[3501] = r6_0
r6_0 = {
  ChildGuideId = 3601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Sp",
    Phone = "UIGuide_Sp",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Sp_01_PC.T_Guide_Img_Sp_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Sp_01_Phone.T_Guide_Img_Sp_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Sp"
r6_0.GuideType = "ImageText"
r4_0[3601] = r6_0
r6_0 = {
  ChildGuideId = 3701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TriggerEffect_1",
    Phone = "UIGuide_TriggerEffect_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TriggerEffect_01.T_Guide_Img_TriggerEffect_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TriggerEffect_01.T_Guide_Img_TriggerEffect_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TriggerEffect"
r6_0.GuideType = "ImageText"
r4_0[3701] = r6_0
r6_0 = {
  ChildGuideId = 3702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TriggerEffect_2",
    Phone = "UIGuide_TriggerEffect_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TriggerEffect_02.T_Guide_Img_TriggerEffect_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TriggerEffect_02.T_Guide_Img_TriggerEffect_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TriggerEffect"
r6_0.GuideType = "ImageText"
r4_0[3702] = r6_0
r6_0 = {
  ChildGuideId = 3703,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TriggerEffect_3",
    Phone = "UIGuide_TriggerEffect_3",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TriggerEffect_03.T_Guide_Img_TriggerEffect_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TriggerEffect_03.T_Guide_Img_TriggerEffect_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TriggerEffect"
r6_0.GuideType = "ImageText"
r4_0[3703] = r6_0
r6_0 = {
  ChildGuideId = 3801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_BonusDamage",
    Phone = "UIGuide_BonusDamage",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_BonusDamage_01.T_Guide_Img_BonusDamage_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_BonusDamage_01.T_Guide_Img_BonusDamage_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_BonusDamage"
r6_0.GuideType = "ImageText"
r4_0[3801] = r6_0
r6_0 = {
  ChildGuideId = 3901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Dot",
    Phone = "UIGuide_Dot",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Dot_01.T_Guide_Img_Dot_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Dot_01.T_Guide_Img_Dot_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Dot"
r6_0.GuideType = "ImageText"
r4_0[3901] = r6_0
r6_0 = {
  ChildGuideId = 4001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_FireMechanism",
    Phone = "UIGuide_FireMechanism",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FireMechanism_01.T_Guide_Img_FireMechanism_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FireMechanism_01.T_Guide_Img_FireMechanism_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_FireMechanism"
r6_0.GuideType = "ImageText"
r4_0[4001] = r6_0
r6_0 = {
  ChildGuideId = 4101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_ValveMechanism",
    Phone = "UIGuide_ValveMechanism",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ValveMechanism_01_Phone.T_Guide_Img_ValveMechanism_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ValveMechanism_01_Phone.T_Guide_Img_ValveMechanism_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_ValveMechanism"
r6_0.GuideType = "ImageText"
r4_0[4101] = r6_0
r6_0 = {
  ChildGuideId = 4201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_EX01Mechanism_1",
    Phone = "UIGuide_EX01Mechanism_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_EX01_Mechanism_01.T_Guide_Img_EX01_Mechanism_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_EX01_Mechanism_01.T_Guide_Img_EX01_Mechanism_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_EX01Mechanism_1"
r6_0.GuideType = "ImageText"
r4_0[4201] = r6_0
r6_0 = {
  ChildGuideId = 4202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_EX01Mechanism_2",
    Phone = "UIGuide_EX01Mechanism_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_EX01_Mechanism_02.T_Guide_Img_EX01_Mechanism_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_EX01_Mechanism_02.T_Guide_Img_EX01_Mechanism_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_EX01Mechanism_2"
r6_0.GuideType = "ImageText"
r4_0[4202] = r6_0
r6_0 = {
  ChildGuideId = 4301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Temple_1",
    Phone = "UIGuide_Temple_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Temple_01_Phone.T_Guide_Img_Temple_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Temple_01_Phone.T_Guide_Img_Temple_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Temple_1"
r6_0.GuideType = "ImageText"
r4_0[4301] = r6_0
r6_0 = {
  ChildGuideId = 4302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Temple_2",
    Phone = "UIGuide_Temple_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Temple_02.T_Guide_Img_Temple_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Temple_02.T_Guide_Img_Temple_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Temple_2"
r6_0.GuideType = "ImageText"
r4_0[4302] = r6_0
r6_0 = {
  ChildGuideId = 4303,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Temple_3",
    Phone = "UIGuide_Temple_3",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Temple_03.T_Guide_Img_Temple_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Temple_03.T_Guide_Img_Temple_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Temple_1"
r6_0.GuideType = "ImageText"
r4_0[4303] = r6_0
r6_0 = {
  ChildGuideId = 4501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Team_1",
    Phone = "UIGuide_Team_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Team_01.T_Guide_Img_Team_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Team_01.T_Guide_Img_Team_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Team"
r6_0.GuideType = "ImageText"
r4_0[4501] = r6_0
r6_0 = {
  ChildGuideId = 4502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Team_2_PC",
    Phone = "UIGuide_Team_2_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Team_02_PC.T_Guide_Img_Team_02_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Team_02_Phone.T_Guide_Img_Team_02_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Team"
r6_0.GuideType = "ImageText"
r4_0[4502] = r6_0
r6_0 = {
  ChildGuideId = 4601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Online_01_01",
    Phone = "UIGuide_Online_01_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_01_01_PC.T_Guide_Img_Online_01_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_01_01_Phone.T_Guide_Img_Online_01_01_Phone\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Online_01_02",
    Phone = "UIGuide_Online_01_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_01_02.T_Guide_Img_Online_01_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_01_02.T_Guide_Img_Online_01_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Online_1"
r6_0.GuideType = "ImageText"
r4_0[4601] = r6_0
r6_0 = {
  ChildGuideId = 4602,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Online_02_01",
    Phone = "UIGuide_Online_02_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_02_01.T_Guide_Img_Online_02_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_02_01.T_Guide_Img_Online_02_01\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Online_02_02",
    Phone = "UIGuide_Online_02_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_02_02.T_Guide_Img_Online_02_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_02_02.T_Guide_Img_Online_02_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Online_2"
r6_0.GuideType = "ImageText"
r4_0[4602] = r6_0
r6_0 = {
  ChildGuideId = 4603,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Online_03_01",
    Phone = "UIGuide_Online_03_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_03_01.T_Guide_Img_Online_03_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_03_01.T_Guide_Img_Online_03_01\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Online_03_02",
    Phone = "UIGuide_Online_03_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_03_02.T_Guide_Img_Online_03_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_03_02.T_Guide_Img_Online_03_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Online_3"
r6_0.GuideType = "ImageText"
r4_0[4603] = r6_0
r6_0 = {
  ChildGuideId = 4604,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Online_04_01",
    Phone = "UIGuide_Online_04_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_04_01.T_Guide_Img_Online_04_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_04_01.T_Guide_Img_Online_04_01\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Online_04_02",
    Phone = "UIGuide_Online_04_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_04_02.T_Guide_Img_Online_04_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_04_02.T_Guide_Img_Online_04_02\'",
  },
}
r6_0.GuideInfo3 = {
  GuideContent = {
    PC = "UIGuide_Online_04_03",
    Phone = "UIGuide_Online_04_03",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_04_03.T_Guide_Img_Online_04_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_04_03.T_Guide_Img_Online_04_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Online_4"
r6_0.GuideType = "ImageText"
r4_0[4604] = r6_0
r6_0 = {
  ChildGuideId = 4605,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Online_05_01",
    Phone = "UIGuide_Online_05_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_05_01_PC.T_Guide_Img_Online_05_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_05_01_Phone.T_Guide_Img_Online_05_01_Phone\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_Online_05_02",
    Phone = "UIGuide_Online_05_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_05_02.T_Guide_Img_Online_05_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_05_02.T_Guide_Img_Online_05_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Online_5"
r6_0.GuideType = "ImageText"
r4_0[4605] = r6_0
r6_0 = {
  ChildGuideId = 4606,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Online_06_01",
    Phone = "UIGuide_Online_06_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_06_01.T_Guide_Img_Online_06_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Online_06_01.T_Guide_Img_Online_06_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Online_6"
r6_0.GuideType = "ImageText"
r4_0[4606] = r6_0
r6_0 = {
  ChildGuideId = 4701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_DynStory_1",
    Phone = "UIGuide_DynStory_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DynStory_01.T_Guide_Img_DynStory_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DynStory_01.T_Guide_Img_DynStory_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_DynStory"
r6_0.GuideType = "ImageText"
r4_0[4701] = r6_0
r6_0 = {
  ChildGuideId = 4702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_DynStory_2",
    Phone = "UIGuide_DynStory_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DynStory_02.T_Guide_Img_DynStory_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DynStory_02.T_Guide_Img_DynStory_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_DynStory"
r6_0.GuideType = "ImageText"
r4_0[4702] = r6_0
r6_0 = {
  ChildGuideId = 4801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_LayeredMap_1",
    Phone = "UIGuide_LayeredMap_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LayeredMap_01.T_Guide_Img_LayeredMap_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LayeredMap_01.T_Guide_Img_LayeredMap_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_LayeredMap_1"
r6_0.GuideType = "ImageText"
r4_0[4801] = r6_0
r6_0 = {
  ChildGuideId = 4802,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_LayeredMap_2",
    Phone = "UIGuide_LayeredMap_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LayeredMap_02.T_Guide_Img_LayeredMap_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LayeredMap_02.T_Guide_Img_LayeredMap_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_LayeredMap_2"
r6_0.GuideType = "ImageText"
r4_0[4802] = r6_0
r6_0 = {
  ChildGuideId = 4901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Pet_1",
    Phone = "UIGuide_Pet_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Pet_02.T_Guide_Img_Pet_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Pet_02.T_Guide_Img_Pet_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Pet"
r6_0.GuideType = "ImageText"
r4_0[4901] = r6_0
r6_0 = {
  ChildGuideId = 4902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Pet_2",
    Phone = "UIGuide_Pet_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Pet_01.T_Guide_Img_Pet_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Pet_01.T_Guide_Img_Pet_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Pet"
r6_0.GuideType = "ImageText"
r4_0[4902] = r6_0
r6_0 = {
  ChildGuideId = 5001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_SwitchMaster_PC",
    Phone = "UIGuide_SwitchMaster_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SwitchMaster_01_PC.T_Guide_Img_SwitchMaster_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SwitchMaster_01_Phone.T_Guide_Img_SwitchMaster_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_SwitchMaster"
r6_0.GuideType = "ImageText"
r4_0[5001] = r6_0
r6_0 = {
  ChildGuideId = 5101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_RelayMechanism_1",
    Phone = "UIGuide_RelayMechanism_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_RelayMechanism_01.T_Guide_Img_RelayMechanism_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_RelayMechanism_01.T_Guide_Img_RelayMechanism_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_RelayMechanism_1"
r6_0.GuideType = "ImageText"
r4_0[5101] = r6_0
r6_0 = {
  ChildGuideId = 5102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_RelayMechanism_2",
    Phone = "UIGuide_RelayMechanism_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_RelayMechanism_02.T_Guide_Img_RelayMechanism_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_RelayMechanism_02.T_Guide_Img_RelayMechanism_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_RelayMechanism_2"
r6_0.GuideType = "ImageText"
r4_0[5102] = r6_0
r6_0 = {
  ChildGuideId = 5201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fort_1_PC",
    Phone = "UIGuide_Fort_1_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fort_01_Phone.T_Guide_Img_Fort_01_Phone\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fort_01_Phone.T_Guide_Img_Fort_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Fort"
r6_0.GuideType = "ImageText"
r4_0[5201] = r6_0
r6_0 = {
  ChildGuideId = 5202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fort_2",
    Phone = "UIGuide_Fort_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fort_02_PC.T_Guide_Img_Fort_02_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fort_02_Phone.T_Guide_Img_Fort_02_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_Fort"
r6_0.GuideType = "ImageText"
r4_0[5202] = r6_0
r6_0 = {
  ChildGuideId = 5301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_MonsterExitMechanism_1",
    Phone = "UIGuide_MonsterExitMechanism_1",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MonsterExitMechanism_01.T_Guide_Img_MonsterExitMechanism_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MonsterExitMechanism_01.T_Guide_Img_MonsterExitMechanism_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_MonsterExitMechanism"
r6_0.GuideType = "ImageText"
r4_0[5301] = r6_0
r6_0 = {
  ChildGuideId = 5302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_MonsterExitMechanism_2",
    Phone = "UIGuide_MonsterExitMechanism_2",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MonsterExitMechanism_02.T_Guide_Img_MonsterExitMechanism_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MonsterExitMechanism_02.T_Guide_Img_MonsterExitMechanism_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_MonsterExitMechanism"
r6_0.GuideType = "ImageText"
r4_0[5302] = r6_0
r6_0 = {
  ChildGuideId = 5501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_LongPressedSkills",
    Phone = "UIGuide_LongPressedSkills",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongPressedSkills_01_PC.T_Guide_Img_LongPressedSkills_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongPressedSkills_01_Phone.T_Guide_Img_LongPressedSkills_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_LongPressedSkills"
r6_0.GuideType = "ImageText"
r4_0[5501] = r6_0
r6_0 = {
  ChildGuideId = 5601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_PerfectDodge",
    Phone = "UIGuide_PerfectDodge",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PerfectDodge_01_PC.T_Guide_Img_PerfectDodge_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PerfectDodge_01_Phone.T_Guide_Img_PerfectDodge_01_Phone\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_PerfectDodge"
r6_0.GuideType = "ImageText"
r4_0[5601] = r6_0
r6_0 = {
  ChildGuideId = 5701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TaskAcceptance",
    Phone = "UIGuide_TaskAcceptance",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TaskAcceptance_01.T_Guide_Img_TaskAcceptance_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TaskAcceptance_01.T_Guide_Img_TaskAcceptance_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_TaskAcceptance"
r6_0.GuideType = "ImageText"
r4_0[5701] = r6_0
r6_0 = {
  ChildGuideId = 5801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_EX01Map",
    Phone = "UIGuide_EX01Map",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_EX01Map.T_Guide_Img_EX01Map\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_EX01Map.T_Guide_Img_EX01Map\'",
  },
}
r6_0.GuideTitle = "UIGuide_Title_EX01Map"
r6_0.GuideType = "ImageText"
r4_0[5801] = r6_0
r6_0 = {
  ChildGuideId = 6901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_WIKI_01",
    Phone = "UIGuide_WIKI_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WIKI_01.T_Guide_Img_WIKI_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WIKI_01.T_Guide_Img_WIKI_01\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_WIKI"
r6_0.GuideType = "ImageText"
r4_0[6901] = r6_0
r6_0 = {
  ChildGuideId = 6902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_WIKI_02",
    Phone = "UIGuide_WIKI_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WIKI_02.T_Guide_Img_WIKI_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WIKI_02.T_Guide_Img_WIKI_02\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_WIKI"
r6_0.GuideType = "ImageText"
r4_0[6902] = r6_0
r4_0[7001] = {
  ChildGuideId = 7001,
  GuideInfo1 = r0_0.RT_9,
  GuideTitle = "UIGUIDE_TITLE_SIDEWAYSJUMP",
  GuideType = "ImageText",
}
r6_0 = {
  ChildGuideId = 7101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_PetPan_01",
    Phone = "UIGuide_PetPan_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetPan_01.T_Guide_Img_PetPan_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetPan_01.T_Guide_Img_PetPan_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_PetPan_Title"
r6_0.GuideType = "ImageText"
r4_0[7101] = r6_0
r6_0 = {
  ChildGuideId = 7102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_PetPan_02",
    Phone = "UIGuide_PetPan_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetPan_02.T_Guide_Img_PetPan_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetPan_02.T_Guide_Img_PetPan_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_PetPan_Title"
r6_0.GuideType = "ImageText"
r4_0[7102] = r6_0
r6_0 = {
  ChildGuideId = 7201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fish_01",
    Phone = "UIGuide_Fish_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_01.T_Guide_Img_Fishing_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_01.T_Guide_Img_Fishing_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Fish_SubTitle_1"
r6_0.GuideType = "ImageText"
r4_0[7201] = r6_0
r6_0 = {
  ChildGuideId = 7202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fish_02",
    Phone = "UIGuide_Fish_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_02.T_Guide_Img_Fishing_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_02.T_Guide_Img_Fishing_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Fish_SubTitle_2"
r6_0.GuideType = "ImageText"
r4_0[7202] = r6_0
r6_0 = {
  ChildGuideId = 7203,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fish_03",
    Phone = "UIGuide_Fish_03",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_03.T_Guide_Img_Fishing_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_03.T_Guide_Img_Fishing_03\'",
  },
}
r6_0.GuideTitle = "UIGuide_Fish_SubTitle_3"
r6_0.GuideType = "ImageText"
r4_0[7203] = r6_0
r6_0 = {
  ChildGuideId = 7204,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fish_04",
    Phone = "UIGuide_Fish_04",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_04.T_Guide_Img_Fishing_04\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_04.T_Guide_Img_Fishing_04\'",
  },
}
r6_0.GuideTitle = "UIGuide_Fish_SubTitle_4"
r6_0.GuideType = "ImageText"
r4_0[7204] = r6_0
r6_0 = {
  ChildGuideId = 7205,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Fish_05",
    Phone = "UIGuide_Fish_05",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_05.T_Guide_Img_Fishing_05\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_05.T_Guide_Img_Fishing_05\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Fishing_05.T_Guide_Img_Fishing_05\'",
  },
}
r6_0.GuideTitle = "UIGuide_Fish_SubTitle_5"
r6_0.GuideType = "ImageText"
r4_0[7205] = r6_0
r6_0 = {
  ChildGuideId = 7301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_SpecialSideStoryUI1",
    Phone = "UIGuide_SpecialSideStoryUI1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SpecialSideStory_01.T_Guide_Img_SpecialSideStory_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SpecialSideStory_01.T_Guide_Img_SpecialSideStory_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SpecialSideStory_01.T_Guide_Img_SpecialSideStory_01\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_SpecialSideStoryUI"
r6_0.GuideType = "ImageText"
r4_0[7301] = r6_0
r6_0 = {
  ChildGuideId = 7302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_SpecialSideStoryUI2",
    Phone = "UIGuide_SpecialSideStoryUI2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SpecialSideStory_02.T_Guide_Img_SpecialSideStory_02\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SpecialSideStory_02.T_Guide_Img_SpecialSideStory_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_SpecialSideStory_02.T_Guide_Img_SpecialSideStory_02\'",
  },
}
r6_0.GuideTitle = "UIGUIDE_TITLE_SpecialSideStoryUI"
r6_0.GuideType = "ImageText"
r4_0[7302] = r6_0
r4_0[7401] = {
  ChildGuideId = 7401,
  GuideInfo1 = r0_0.RT_9,
  GuideTitle = "UIGUIDE_TITLE_DailyGoalUI",
  GuideType = "ImageText",
}
r4_0[7501] = {
  ChildGuideId = 7501,
  GuideInfo1 = r0_0.RT_9,
  GuideTitle = "UIGUIDE_TITLE_ModArchiveUI",
  GuideType = "ImageText",
}
r6_0 = {
  ChildGuideId = 7601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Abyss_1",
    PC = "UIGuide_Abyss_1",
    Phone = "UIGuide_Abyss_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_1.T_Guide_Img_Abyss_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_1.T_Guide_Img_Abyss_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_1.T_Guide_Img_Abyss_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ABYSS"
r6_0.GuideType = "ImageText"
r4_0[7601] = r6_0
r6_0 = {
  ChildGuideId = 7602,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Abyss_2",
    PC = "UIGuide_Abyss_2",
    Phone = "UIGuide_Abyss_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_2.T_Guide_Img_Abyss_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_2.T_Guide_Img_Abyss_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_2.T_Guide_Img_Abyss_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ABYSS_2"
r6_0.GuideType = "ImageText"
r4_0[7602] = r6_0
r6_0 = {
  ChildGuideId = 7603,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Abyss_3_1",
    PC = "UIGuide_Abyss_3_1",
    Phone = "UIGuide_Abyss_3_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_3_1.T_Guide_Img_Abyss_3_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_3_1.T_Guide_Img_Abyss_3_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_3_1.T_Guide_Img_Abyss_3_1\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    GamePad = "UIGuide_Abyss_3_2",
    PC = "UIGuide_Abyss_3_2",
    Phone = "UIGuide_Abyss_3_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_3_2.T_Guide_Img_Abyss_3_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_3_2.T_Guide_Img_Abyss_3_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_3_2.T_Guide_Img_Abyss_3_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ABYSS_3"
r6_0.GuideType = "ImageText"
r4_0[7603] = r6_0
r6_0 = {
  ChildGuideId = 7604,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Abyss_4",
    PC = "UIGuide_Abyss_4",
    Phone = "UIGuide_Abyss_4",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_4.T_Guide_Img_Abyss_4\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_4.T_Guide_Img_Abyss_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_4.T_Guide_Img_Abyss_4\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ABYSS_4"
r6_0.GuideType = "ImageText"
r4_0[7604] = r6_0
r6_0 = {
  ChildGuideId = 7605,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Abyss_5",
    PC = "UIGuide_Abyss_5",
    Phone = "UIGuide_Abyss_5",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_5.T_Guide_Img_Abyss_5\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_5.T_Guide_Img_Abyss_5\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Abyss_5.T_Guide_Img_Abyss_5\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ABYSS_5"
r6_0.GuideType = "ImageText"
r4_0[7605] = r6_0
r6_0 = {
  ChildGuideId = 7701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Rouge_1",
    Phone = "UIGuide_Rouge_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_1.T_Guide_Img_Rouge_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_1.T_Guide_Img_Rouge_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_1.T_Guide_Img_Rouge_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ROUGE"
r6_0.GuideType = "ImageText"
r4_0[7701] = r6_0
r6_0 = {
  ChildGuideId = 7702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Rouge_2_1",
    PC = "UIGuide_Rouge_2_1",
    Phone = "UIGuide_Rouge_2_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_1.T_Guide_Img_Rouge_2_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_1.T_Guide_Img_Rouge_2_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_1.T_Guide_Img_Rouge_2_1\'",
  },
}
r6_0.GuideInfo2 = {
  GuideContent = {
    GamePad = "UIGuide_Rouge_2_3",
    PC = "UIGuide_Rouge_2_3",
    Phone = "UIGuide_Rouge_2_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_2.T_Guide_Img_Rouge_2_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_2.T_Guide_Img_Rouge_2_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_2.T_Guide_Img_Rouge_2_2\'",
  },
}
r6_0.GuideInfo3 = {
  GuideContent = {
    GamePad = "UIGuide_Rouge_2_2",
    PC = "UIGuide_Rouge_2_2",
    Phone = "UIGuide_Rouge_2_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_3.T_Guide_Img_Rouge_2_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_3.T_Guide_Img_Rouge_2_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Rouge_2_3.T_Guide_Img_Rouge_2_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ROUGE"
r6_0.GuideType = "ImageText"
r4_0[7702] = r6_0
r6_0 = {
  ChildGuideId = 7801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_PetTrain_4",
    PC = "Message_Guide_PetTrain_4",
    Phone = "Message_Guide_PetTrain_4",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_1.T_Guide_Img_PetTrain_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_1.T_Guide_Img_PetTrain_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_1.T_Guide_Img_PetTrain_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_PETTRAIN"
r6_0.GuideType = "ImageText"
r4_0[7801] = r6_0
r6_0 = {
  ChildGuideId = 7802,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_PetTrain_5",
    PC = "Message_Guide_PetTrain_5",
    Phone = "Message_Guide_PetTrain_5",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_2.T_Guide_Img_PetTrain_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_2.T_Guide_Img_PetTrain_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_2.T_Guide_Img_PetTrain_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_PETTRAIN"
r6_0.GuideType = "ImageText"
r4_0[7802] = r6_0
r6_0 = {
  ChildGuideId = 7803,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_PetTrain_6",
    PC = "Message_Guide_PetTrain_6",
    Phone = "Message_Guide_PetTrain_6",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_3.T_Guide_Img_PetTrain_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_3.T_Guide_Img_PetTrain_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_3.T_Guide_Img_PetTrain_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_PETTRAIN"
r6_0.GuideType = "ImageText"
r4_0[7803] = r6_0
r6_0 = {
  ChildGuideId = 7804,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_PetTrain_7",
    PC = "Message_Guide_PetTrain_7",
    Phone = "Message_Guide_PetTrain_7",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_4.T_Guide_Img_PetTrain_4\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_4.T_Guide_Img_PetTrain_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_PetTrain_4.T_Guide_Img_PetTrain_4\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_PETTRAIN"
r6_0.GuideType = "ImageText"
r4_0[7804] = r6_0
r6_0 = {
  ChildGuideId = 7901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_DungeonSec_3",
    PC = "Message_Guide_DungeonSec_3",
    Phone = "Message_Guide_DungeonSec_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_1.T_Guide_Img_DungeonSec_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_1.T_Guide_Img_DungeonSec_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_1.T_Guide_Img_DungeonSec_1\'",
  },
}
r6_0.GuideTitle = "UI_Dungeon_Tab_WalnutDungeon"
r6_0.GuideType = "ImageText"
r4_0[7901] = r6_0
r6_0 = {
  ChildGuideId = 7902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_DungeonSec_1",
    PC = "Message_Guide_DungeonSec_1",
    Phone = "Message_Guide_DungeonSec_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_2.T_Guide_Img_DungeonSec_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_2.T_Guide_Img_DungeonSec_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_2.T_Guide_Img_DungeonSec_2\'",
  },
}
r6_0.GuideTitle = "UI_Dungeon_Tab_WalnutDungeon"
r6_0.GuideType = "ImageText"
r4_0[7902] = r6_0
r6_0 = {
  ChildGuideId = 7903,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_DungeonSec_2",
    PC = "Message_Guide_DungeonSec_2",
    Phone = "Message_Guide_DungeonSec_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_3.T_Guide_Img_DungeonSec_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_3.T_Guide_Img_DungeonSec_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DungeonSec_3.T_Guide_Img_DungeonSec_3\'",
  },
}
r6_0.GuideTitle = "UI_Dungeon_Tab_WalnutDungeon"
r6_0.GuideType = "ImageText"
r4_0[7903] = r6_0
r6_0 = {
  ChildGuideId = 8001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_OnlineArea_1",
    PC = "Message_Guide_OnlineArea_1",
    Phone = "Message_Guide_OnlineArea_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_01.T_Guide_Img_OnlineArea_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_01.T_Guide_Img_OnlineArea_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_01.T_Guide_Img_OnlineArea_01\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ONLINEAREA"
r6_0.GuideType = "ImageText"
r4_0[8001] = r6_0
r6_0 = {
  ChildGuideId = 8002,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_OnlineArea_2",
    PC = "Message_Guide_OnlineArea_2",
    Phone = "Message_Guide_OnlineArea_2",
  },
  GuidePicture = r0_0.RT_10,
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ONLINEAREA"
r6_0.GuideType = "ImageText"
r4_0[8002] = r6_0
r6_0 = {
  ChildGuideId = 8003,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_OnlineArea_3",
    PC = "Message_Guide_OnlineArea_3",
    Phone = "Message_Guide_OnlineArea_3",
  },
  GuidePicture = r0_0.RT_11,
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ONLINEAREA"
r6_0.GuideType = "ImageText"
r4_0[8003] = r6_0
r6_0 = {
  ChildGuideId = 8101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Hook_PC",
    Phone = "UIGuide_Hook_Phone",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Hook_01.T_Guide_Img_Hook_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Hook_01.T_Guide_Img_Hook_01\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HOOK"
r6_0.GuideType = "ImageText"
r4_0[8101] = r6_0
r6_0 = {
  ChildGuideId = 8201,
}
r6_0.GuideInfo1 = {
  GuideContent = r0_0.RT_12,
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExploreBadge_01.T_Guide_Img_ExploreBadge_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExploreBadge_01.T_Guide_Img_ExploreBadge_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExploreBadge_01.T_Guide_Img_ExploreBadge_01\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Badge"
r6_0.GuideType = "ImageText"
r4_0[8201] = r6_0
r6_0 = {
  ChildGuideId = 8202,
}
r6_0.GuideInfo1 = {
  GuideContent = r0_0.RT_12,
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExploreBadge_02.T_Guide_Img_ExploreBadge_02\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExploreBadge_02.T_Guide_Img_ExploreBadge_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ExploreBadge_02.T_Guide_Img_ExploreBadge_02\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Badge"
r6_0.GuideType = "ImageText"
r4_0[8202] = r6_0
r6_0 = {
  ChildGuideId = 8301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Message_Guide_Treasure_1",
    Phone = "Message_Guide_Treasure_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Treasure_01.T_Guide_Img_Treasure_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Treasure_01.T_Guide_Img_Treasure_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Treasure_01.T_Guide_Img_Treasure_01\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Treasure"
r6_0.GuideType = "ImageText"
r4_0[8301] = r6_0
r6_0 = {
  ChildGuideId = 8302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Message_Guide_Treasure_2",
    Phone = "Message_Guide_Treasure_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Treasure_02.T_Guide_Img_Treasure_02\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Treasure_02.T_Guide_Img_Treasure_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Treasure_02.T_Guide_Img_Treasure_02\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Treasure"
r6_0.GuideType = "ImageText"
r4_0[8302] = r6_0
r6_0 = {
  ChildGuideId = 8401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_MirrorPuzzle_1",
    Phone = "UIGuide_MirrorPuzzle_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MirrorPuzzle_01.T_Guide_Img_MirrorPuzzle_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MirrorPuzzle_01.T_Guide_Img_MirrorPuzzle_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_MirrorPuzzle_01.T_Guide_Img_MirrorPuzzle_01\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_MirrorPuzzle"
r6_0.GuideType = "ImageText"
r4_0[8401] = r6_0
r6_0 = {
  ChildGuideId = 8501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TrialRank_1",
    Phone = "UIGuide_TrialRank_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Trailrank_01.T_Guide_Img_Trailrank_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Trailrank_01.T_Guide_Img_Trailrank_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Trailrank_01.T_Guide_Img_Trailrank_01\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_TRIALRANK"
r6_0.GuideType = "ImageText"
r4_0[8501] = r6_0
r6_0 = {
  ChildGuideId = 8502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_TrialRank_2",
    Phone = "UIGuide_TrialRank_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Trailrank_02.T_Guide_Img_Trailrank_02\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Trailrank_02.T_Guide_Img_Trailrank_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Trailrank_02.T_Guide_Img_Trailrank_02\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_TRIALRANK"
r6_0.GuideType = "ImageText"
r4_0[8502] = r6_0
r6_0 = {
  ChildGuideId = 8601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Deduce_1",
    Phone = "UIGuide_Deduce_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Deduce_01.T_Guide_Img_Deduce_01\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Deduce_01.T_Guide_Img_Deduce_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Deduce_01.T_Guide_Img_Deduce_01\'",
  },
}
r6_0.GuideTitle = "UIGuide_Deduce_SubTitle_1"
r6_0.GuideType = "ImageText"
r4_0[8601] = r6_0
r6_0 = {
  ChildGuideId = 8602,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Deduce_2",
    Phone = "UIGuide_Deduce_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Deduce_02.T_Guide_Img_Deduce_02\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Deduce_02.T_Guide_Img_Deduce_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_Deduce_02.T_Guide_Img_Deduce_02\'",
  },
}
r6_0.GuideTitle = "UIGuide_Deduce_SubTitle_2"
r6_0.GuideType = "ImageText"
r4_0[8602] = r6_0
r6_0 = {
  ChildGuideId = 8701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Saiqi_1_Gamepad",
    PC = "UIGuide_Saiqi_1",
    Phone = "UIGuide_Saiqi_1_Phone",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SaiqiSkill_01_PC.T_Guide_Img_SaiqiSkill_01_PC\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SaiqiSkill_01_PC.T_Guide_Img_SaiqiSkill_01_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SaiqiSkill_01_Phone.T_Guide_Img_SaiqiSkill_01_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Saiqi_1"
r6_0.GuideType = "ImageText"
r4_0[8701] = r6_0
r6_0 = {
  ChildGuideId = 8702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Saiqi_2_Gamepad",
    PC = "UIGuide_Saiqi_2",
    Phone = "UIGuide_Saiqi_2_Phone",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SaiqiSkill_02_PC.T_Guide_Img_SaiqiSkill_02_PC\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SaiqiSkill_02_PC.T_Guide_Img_SaiqiSkill_02_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SaiqiSkill_02_PC.T_Guide_Img_SaiqiSkill_02_PC\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Saiqi_2"
r6_0.GuideType = "ImageText"
r4_0[8702] = r6_0
r6_0 = {
  ChildGuideId = 8801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_OnlineAreaPre_1",
    PC = "Message_Guide_OnlineAreaPre_1",
    Phone = "Message_Guide_OnlineAreaPre_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_04.T_Guide_Img_OnlineArea_04\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_04.T_Guide_Img_OnlineArea_04\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_OnlineArea_04.T_Guide_Img_OnlineArea_04\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ONLINEAREAPRE_1"
r6_0.GuideType = "ImageText"
r4_0[8801] = r6_0
r6_0 = {
  ChildGuideId = 8802,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_OnlineAreaPre_2",
    PC = "Message_Guide_OnlineAreaPre_2",
    Phone = "Message_Guide_OnlineAreaPre_2",
  },
  GuidePicture = r0_0.RT_10,
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ONLINEAREAPRE_2"
r6_0.GuideType = "ImageText"
r4_0[8802] = r6_0
r6_0 = {
  ChildGuideId = 8803,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "Message_Guide_OnlineAreaPre_3",
    PC = "Message_Guide_OnlineAreaPre_3",
    Phone = "Message_Guide_OnlineAreaPre_3",
  },
  GuidePicture = r0_0.RT_11,
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ONLINEAREAPRE_3"
r6_0.GuideType = "ImageText"
r4_0[8803] = r6_0
r6_0 = {
  ChildGuideId = 8901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_TongLv_1",
    PC = "UIGuide_TongLv_1",
    Phone = "UIGuide_TongLv_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TongLv_1.T_Guide_Img_TongLv_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TongLv_1.T_Guide_Img_TongLv_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_TongLv_1.T_Guide_Img_TongLv_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_TongLv_1"
r6_0.GuideType = "ImageText"
r4_0[8901] = r6_0
r6_0 = {
  ChildGuideId = 9001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FangShu_1",
    PC = "UIGuide_FangShu_1",
    Phone = "UIGuide_FangShu_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_1.T_Guide_Img_FangShu_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_1.T_Guide_Img_FangShu_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_1.T_Guide_Img_FangShu_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FangShu_1"
r6_0.GuideType = "ImageText"
r4_0[9001] = r6_0
r6_0 = {
  ChildGuideId = 9002,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FangShu_2",
    PC = "UIGuide_FangShu_2",
    Phone = "UIGuide_FangShu_2_Phone",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_2.T_Guide_Img_FangShu_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_2.T_Guide_Img_FangShu_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_2_Phone.T_Guide_Img_FangShu_2_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FangShu_2"
r6_0.GuideType = "ImageText"
r4_0[9002] = r6_0
r6_0 = {
  ChildGuideId = 9003,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FangShu_3",
    PC = "UIGuide_FangShu_3",
    Phone = "UIGuide_FangShu_3_Phone",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_3.T_Guide_Img_FangShu_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_3.T_Guide_Img_FangShu_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FangShu_3_Phone.T_Guide_Img_FangShu_3_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FangShu_3"
r6_0.GuideType = "ImageText"
r4_0[9003] = r6_0
r4_0[9004] = {
  ChildGuideId = 9004,
  GuideInfo1 = r0_0.RT_5,
  GuideTitle = "MAINUIGUIDE_TITLE_FangShu_4",
  GuideType = "ImageText",
}
r6_0 = {
  ChildGuideId = 9101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FuWen_1",
    PC = "UIGuide_FuWen_1",
    Phone = "UIGuide_FuWen_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FuWen_1.T_Guide_Img_FuWen_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FuWen_1.T_Guide_Img_FuWen_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FuWen_1.T_Guide_Img_FuWen_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FuWen_1"
r6_0.GuideType = "ImageText"
r4_0[9101] = r6_0
r6_0 = {
  ChildGuideId = 9102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FuWen_2",
    PC = "UIGuide_FuWen_2",
    Phone = "UIGuide_FuWen_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FuWen_2.T_Guide_Img_FuWen_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FuWen_2.T_Guide_Img_FuWen_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FuWen_2.T_Guide_Img_FuWen_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FuWen_1"
r6_0.GuideType = "ImageText"
r4_0[9102] = r6_0
r6_0 = {
  ChildGuideId = 9201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_ChenMo_1",
    PC = "UIGuide_ChenMo_1",
    Phone = "UIGuide_ChenMo_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ChenMo_1.T_Guide_Img_ChenMo_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ChenMo_1.T_Guide_Img_ChenMo_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ChenMo_1.T_Guide_Img_ChenMo_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ChenMo_1"
r6_0.GuideType = "ImageText"
r4_0[9201] = r6_0
r6_0 = {
  ChildGuideId = 9202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_ChenMo_2",
    PC = "UIGuide_ChenMo_2",
    Phone = "UIGuide_ChenMo_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ChenMo_2.T_Guide_Img_ChenMo_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ChenMo_2.T_Guide_Img_ChenMo_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ChenMo_2.T_Guide_Img_ChenMo_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ChenMo_1"
r6_0.GuideType = "ImageText"
r4_0[9202] = r6_0
r6_0 = {
  ChildGuideId = 9301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_ShanYe_1",
    PC = "UIGuide_ShanYe_1",
    Phone = "UIGuide_ShanYe_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ShanYe_1.T_Guide_Img_ShanYe_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ShanYe_1.T_Guide_Img_ShanYe_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ShanYe_1.T_Guide_Img_ShanYe_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ShanYe_1"
r6_0.GuideType = "ImageText"
r4_0[9301] = r6_0
r6_0 = {
  ChildGuideId = 9401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_XiQiu_1",
    PC = "UIGuide_XiQiu_1",
    Phone = "UIGuide_XiQiu_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XiQiu_1.T_Guide_Img_XiQiu_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XiQiu_1.T_Guide_Img_XiQiu_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XiQiu_1.T_Guide_Img_XiQiu_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_XiQiu_1"
r6_0.GuideType = "ImageText"
r4_0[9401] = r6_0
r6_0 = {
  ChildGuideId = 9501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FanZhuan_1",
    PC = "UIGuide_FanZhuan_1",
    Phone = "UIGuide_FanZhuan_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FanZhuan_1.T_Guide_Img_FanZhuan_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FanZhuan_1.T_Guide_Img_FanZhuan_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FanZhuan_1.T_Guide_Img_FanZhuan_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FanZhuan_1"
r6_0.GuideType = "ImageText"
r4_0[9501] = r6_0
r6_0 = {
  ChildGuideId = 9502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FanZhuan_2",
    PC = "UIGuide_FanZhuan_2",
    Phone = "UIGuide_FanZhuan_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FanZhuan_2.T_Guide_Img_FanZhuan_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FanZhuan_2.T_Guide_Img_FanZhuan_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FanZhuan_2.T_Guide_Img_FanZhuan_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FanZhuan_1"
r6_0.GuideType = "ImageText"
r4_0[9502] = r6_0
r6_0 = {
  ChildGuideId = 9601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuaBan_1",
    PC = "UIGuide_HuaBan_1",
    Phone = "UIGuide_HuaBan_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBan_1.T_Guide_Img_HuaBan_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBan_1.T_Guide_Img_HuaBan_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBan_1.T_Guide_Img_HuaBan_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuaBan_1"
r6_0.GuideType = "ImageText"
r4_0[9601] = r6_0
r6_0 = {
  ChildGuideId = 9701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_WangXi_1",
    PC = "UIGuide_WangXi_1",
    Phone = "UIGuide_WangXi_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_1.T_Guide_Img_WangXi_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_1.T_Guide_Img_WangXi_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_1.T_Guide_Img_WangXi_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_WangXi_1"
r6_0.GuideType = "ImageText"
r4_0[9701] = r6_0
r6_0 = {
  ChildGuideId = 9702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_WangXi_2",
    PC = "UIGuide_WangXi_2",
    Phone = "UIGuide_WangXi_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_2.T_Guide_Img_WangXi_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_2.T_Guide_Img_WangXi_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_2.T_Guide_Img_WangXi_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_WangXi_1"
r6_0.GuideType = "ImageText"
r4_0[9702] = r6_0
r6_0 = {
  ChildGuideId = 9703,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_WangXi_3",
    PC = "UIGuide_WangXi_3",
    Phone = "UIGuide_WangXi_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_3.T_Guide_Img_WangXi_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_3.T_Guide_Img_WangXi_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_WangXi_3.T_Guide_Img_WangXi_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_WangXi_1"
r6_0.GuideType = "ImageText"
r4_0[9703] = r6_0
r6_0 = {
  ChildGuideId = 9801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_DengHua_1",
    PC = "UIGuide_DengHua_1",
    Phone = "UIGuide_DengHua_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DengHua_1.T_Guide_Img_DengHua_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DengHua_1.T_Guide_Img_DengHua_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DengHua_1.T_Guide_Img_DengHua_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_DengHua_1"
r6_0.GuideType = "ImageText"
r4_0[9801] = r6_0
r6_0 = {
  ChildGuideId = 9901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_QiTianDeng_1",
    PC = "UIGuide_QiTianDeng_1",
    Phone = "UIGuide_QiTianDeng_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_QiTianDeng_1.T_Guide_Img_QiTianDeng_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_QiTianDeng_1.T_Guide_Img_QiTianDeng_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_QiTianDeng_1.T_Guide_Img_QiTianDeng_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_QiTianDeng_1"
r6_0.GuideType = "ImageText"
r4_0[9901] = r6_0
r6_0 = {
  ChildGuideId = 10001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_XiaoChuan_1",
    PC = "UIGuide_XiaoChuan_1",
    Phone = "UIGuide_XiaoChuan_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XiaoChuan_1.T_Guide_Img_XiaoChuan_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XiaoChuan_1.T_Guide_Img_XiaoChuan_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XiaoChuan_1.T_Guide_Img_XiaoChuan_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_XiaoChuan_1"
r6_0.GuideType = "ImageText"
r4_0[10001] = r6_0
r6_0 = {
  ChildGuideId = 10101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_ZhanFeng_1",
    PC = "UIGuide_ZhanFeng_1",
    Phone = "UIGuide_ZhanFeng_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ZhanFeng_1.T_Guide_Img_ZhanFeng_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ZhanFeng_1.T_Guide_Img_ZhanFeng_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ZhanFeng_1.T_Guide_Img_ZhanFeng_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ZhanFeng_1"
r6_0.GuideType = "ImageText"
r4_0[10101] = r6_0
r6_0 = {
  ChildGuideId = 10201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_XingShi_1",
    PC = "UIGuide_XingShi_1",
    Phone = "UIGuide_XingShi_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XingShi_1.T_Guide_Img_XingShi_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XingShi_1.T_Guide_Img_XingShi_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_XingShi_1.T_Guide_Img_XingShi_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_XingShi_1"
r6_0.GuideType = "ImageText"
r4_0[10201] = r6_0
r6_0 = {
  ChildGuideId = 10301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JiGuanZhen_1",
    PC = "UIGuide_JiGuanZhen_1",
    Phone = "UIGuide_JiGuanZhen_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_1.T_Guide_Img_JiGuanZhen_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_1.T_Guide_Img_JiGuanZhen_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_1.T_Guide_Img_JiGuanZhen_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JiGuanZhen_1"
r6_0.GuideType = "ImageText"
r4_0[10301] = r6_0
r6_0 = {
  ChildGuideId = 10302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JiGuanZhen_2",
    PC = "UIGuide_JiGuanZhen_2",
    Phone = "UIGuide_JiGuanZhen_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_2.T_Guide_Img_JiGuanZhen_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_2.T_Guide_Img_JiGuanZhen_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_2.T_Guide_Img_JiGuanZhen_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JiGuanZhen_1"
r6_0.GuideType = "ImageText"
r4_0[10302] = r6_0
r6_0 = {
  ChildGuideId = 10303,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JiGuanZhen_3",
    PC = "UIGuide_JiGuanZhen_3",
    Phone = "UIGuide_JiGuanZhen_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_3.T_Guide_Img_JiGuanZhen_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_3.T_Guide_Img_JiGuanZhen_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiGuanZhen_3.T_Guide_Img_JiGuanZhen_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JiGuanZhen_1"
r6_0.GuideType = "ImageText"
r4_0[10303] = r6_0
r6_0 = {
  ChildGuideId = 10401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_YanShi_1",
    PC = "UIGuide_YanShi_1",
    Phone = "UIGuide_YanShi_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_YanShi_1.T_Guide_Img_YanShi_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_YanShi_1.T_Guide_Img_YanShi_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_YanShi_1.T_Guide_Img_YanShi_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_YanShi_1"
r6_0.GuideType = "ImageText"
r4_0[10401] = r6_0
r6_0 = {
  ChildGuideId = 10402,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_YanShi_2",
    PC = "UIGuide_YanShi_2",
    Phone = "UIGuide_YanShi_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_YanShi_2.T_Guide_Img_YanShi_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_YanShi_2.T_Guide_Img_YanShi_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_YanShi_2.T_Guide_Img_YanShi_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_YanShi_1"
r6_0.GuideType = "ImageText"
r4_0[10402] = r6_0
r6_0 = {
  ChildGuideId = 10501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuaBao_1",
    PC = "UIGuide_HuaBao_1",
    Phone = "UIGuide_HuaBao_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBao_1.T_Guide_Img_HuaBao_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBao_1.T_Guide_Img_HuaBao_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBao_1.T_Guide_Img_HuaBao_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuaBao_1"
r6_0.GuideType = "ImageText"
r4_0[10501] = r6_0
r6_0 = {
  ChildGuideId = 10502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuaBao_2",
    PC = "UIGuide_HuaBao_2",
    Phone = "UIGuide_HuaBao_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBao_2_PC.T_Guide_Img_HuaBao_2_PC\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBao_2_PC.T_Guide_Img_HuaBao_2_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaBao_2_Phone.T_Guide_Img_HuaBao_2_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuaBao_1"
r6_0.GuideType = "ImageText"
r4_0[10502] = r6_0
r6_0 = {
  ChildGuideId = 10601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_LongLin_1",
    PC = "UIGuide_LongLin_1",
    Phone = "UIGuide_LongLin_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_1.T_Guide_Img_LongLin_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_1.T_Guide_Img_LongLin_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_1.T_Guide_Img_LongLin_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_LongLin_1"
r6_0.GuideType = "ImageText"
r4_0[10601] = r6_0
r6_0 = {
  ChildGuideId = 10602,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_LongLin_2",
    PC = "UIGuide_LongLin_2",
    Phone = "UIGuide_LongLin_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_2.T_Guide_Img_LongLin_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_2.T_Guide_Img_LongLin_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_2.T_Guide_Img_LongLin_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_LongLin_1"
r6_0.GuideType = "ImageText"
r4_0[10602] = r6_0
r6_0 = {
  ChildGuideId = 10603,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_LongLin_3",
    PC = "UIGuide_LongLin_3",
    Phone = "UIGuide_LongLin_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_3.T_Guide_Img_LongLin_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_3.T_Guide_Img_LongLin_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_3.T_Guide_Img_LongLin_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_LongLin_1"
r6_0.GuideType = "ImageText"
r4_0[10603] = r6_0
r6_0 = {
  ChildGuideId = 10604,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_LongLin_4",
    PC = "UIGuide_LongLin_4",
    Phone = "UIGuide_LongLin_4",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_4.T_Guide_Img_LongLin_4\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_4.T_Guide_Img_LongLin_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_LongLin_4.T_Guide_Img_LongLin_4\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_LongLin_1"
r6_0.GuideType = "ImageText"
r4_0[10604] = r6_0
r6_0 = {
  ChildGuideId = 10701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JiaSu_1",
    PC = "UIGuide_JiaSu_1",
    Phone = "UIGuide_JiaSu_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiaSu_1.T_Guide_Img_JiaSu_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiaSu_1.T_Guide_Img_JiaSu_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JiaSu_1.T_Guide_Img_JiaSu_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JiaSu_1"
r6_0.GuideType = "ImageText"
r4_0[10701] = r6_0
r6_0 = {
  ChildGuideId = 10801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuiYu_1",
    PC = "UIGuide_HuiYu_1",
    Phone = "UIGuide_HuiYu_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuiYu_1_PC.T_Guide_Img_HuiYu_1_PC\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuiYu_1_PC.T_Guide_Img_HuiYu_1_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuiYu_1_Phone.T_Guide_Img_HuiYu_1_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuiYu_1"
r6_0.GuideType = "ImageText"
r4_0[10801] = r6_0
r6_0 = {
  ChildGuideId = 10802,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuiYu_2",
    PC = "UIGuide_HuiYu_2",
    Phone = "UIGuide_HuiYu_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuiYu_2.T_Guide_Img_HuiYu_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuiYu_2.T_Guide_Img_HuiYu_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuiYu_2.T_Guide_Img_HuiYu_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuiYu_1"
r6_0.GuideType = "ImageText"
r4_0[10802] = r6_0
r6_0 = {
  ChildGuideId = 10901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuaRui_1",
    PC = "UIGuide_HuaRui_1",
    Phone = "UIGuide_HuaRui_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_1.T_Guide_Img_HuaRui_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_1.T_Guide_Img_HuaRui_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_1.T_Guide_Img_HuaRui_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuaRui_1"
r6_0.GuideType = "ImageText"
r4_0[10901] = r6_0
r6_0 = {
  ChildGuideId = 10902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuaRui_2",
    PC = "UIGuide_HuaRui_2",
    Phone = "UIGuide_HuaRui_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_2_PC.T_Guide_Img_HuaRui_2_PC\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_2_PC.T_Guide_Img_HuaRui_2_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_2_Phone.T_Guide_Img_HuaRui_2_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuaRui_1"
r6_0.GuideType = "ImageText"
r4_0[10902] = r6_0
r6_0 = {
  ChildGuideId = 10903,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_HuaRui_3",
    PC = "UIGuide_HuaRui_3",
    Phone = "UIGuide_HuaRui_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_3_PC.T_Guide_Img_HuaRui_3_PC\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_3_PC.T_Guide_Img_HuaRui_3_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_HuaRui_3_Phone.T_Guide_Img_HuaRui_3_Phone\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_HuaRui_1"
r6_0.GuideType = "ImageText"
r4_0[10903] = r6_0
r6_0 = {
  ChildGuideId = 11001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FenZuSai_1",
    PC = "UIGuide_FenZuSai_1",
    Phone = "UIGuide_FenZuSai_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_1.T_Guide_Img_FenZuSai_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_1.T_Guide_Img_FenZuSai_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_1.T_Guide_Img_FenZuSai_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FenZuSai_1"
r6_0.GuideType = "ImageText"
r4_0[11001] = r6_0
r6_0 = {
  ChildGuideId = 11002,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FenZuSai_2",
    PC = "UIGuide_FenZuSai_2",
    Phone = "UIGuide_FenZuSai_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_2.T_Guide_Img_FenZuSai_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_2.T_Guide_Img_FenZuSai_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_2.T_Guide_Img_FenZuSai_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FenZuSai_1"
r6_0.GuideType = "ImageText"
r4_0[11002] = r6_0
r6_0 = {
  ChildGuideId = 11003,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_FenZuSai_3",
    PC = "UIGuide_FenZuSai_3",
    Phone = "UIGuide_FenZuSai_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_3.T_Guide_Img_FenZuSai_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_3.T_Guide_Img_FenZuSai_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_FenZuSai_3.T_Guide_Img_FenZuSai_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_FenZuSai_1"
r6_0.GuideType = "ImageText"
r4_0[11003] = r6_0
r6_0 = {
  ChildGuideId = 11101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_DianFeng_1",
    PC = "UIGuide_DianFeng_1",
    Phone = "UIGuide_DianFeng_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_1.T_Guide_Img_DianFeng_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_1.T_Guide_Img_DianFeng_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_1.T_Guide_Img_DianFeng_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_DianFeng_1"
r6_0.GuideType = "ImageText"
r4_0[11101] = r6_0
r6_0 = {
  ChildGuideId = 11102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_DianFeng_2",
    PC = "UIGuide_DianFeng_2",
    Phone = "UIGuide_DianFeng_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_2.T_Guide_Img_DianFeng_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_2.T_Guide_Img_DianFeng_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_2.T_Guide_Img_DianFeng_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_DianFeng_1"
r6_0.GuideType = "ImageText"
r4_0[11102] = r6_0
r6_0 = {
  ChildGuideId = 11103,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_DianFeng_3",
    PC = "UIGuide_DianFeng_3",
    Phone = "UIGuide_DianFeng_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_3.T_Guide_Img_DianFeng_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_3.T_Guide_Img_DianFeng_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_3.T_Guide_Img_DianFeng_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_DianFeng_1"
r6_0.GuideType = "ImageText"
r4_0[11103] = r6_0
r6_0 = {
  ChildGuideId = 11104,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_DianFeng_4",
    PC = "UIGuide_DianFeng_4",
    Phone = "UIGuide_DianFeng_4",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_4.T_Guide_Img_DianFeng_4\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_4.T_Guide_Img_DianFeng_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_DianFeng_4.T_Guide_Img_DianFeng_4\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_DianFeng_1"
r6_0.GuideType = "ImageText"
r4_0[11104] = r6_0
r6_0 = {
  ChildGuideId = 11201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_ZhouYe_1",
    PC = "UIGuide_ZhouYe_1",
    Phone = "UIGuide_ZhouYe_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ZhouYe_1.T_Guide_Img_ZhouYe_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ZhouYe_1.T_Guide_Img_ZhouYe_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_ZhouYe_1.T_Guide_Img_ZhouYe_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_ZhouYe_1"
r6_0.GuideType = "ImageText"
r4_0[11201] = r6_0
r4_0[11301] = {
  ChildGuideId = 11301,
  GuideInfo1 = r0_0.RT_5,
  GuideTitle = "MAINUIGUIDE_TITLE_FangShu_4",
  GuideType = "ImageText",
}
r6_0 = {
  ChildGuideId = 11401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JuYuan_1",
    PC = "UIGuide_JuYuan_1",
    Phone = "UIGuide_JuYuan_1",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_1.T_Guide_Img_JuYuan_1\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_1.T_Guide_Img_JuYuan_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_1.T_Guide_Img_JuYuan_1\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JuYuan_1"
r6_0.GuideType = "ImageText"
r4_0[11401] = r6_0
r6_0 = {
  ChildGuideId = 11402,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JuYuan_2",
    PC = "UIGuide_JuYuan_2",
    Phone = "UIGuide_JuYuan_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_2.T_Guide_Img_JuYuan_2\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_2.T_Guide_Img_JuYuan_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_2.T_Guide_Img_JuYuan_2\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JuYuan_1"
r6_0.GuideType = "ImageText"
r4_0[11402] = r6_0
r6_0 = {
  ChildGuideId = 11403,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_JuYuan_3",
    PC = "UIGuide_JuYuan_3",
    Phone = "UIGuide_JuYuan_3",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_3.T_Guide_Img_JuYuan_3\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_3.T_Guide_Img_JuYuan_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/System/T_Guide_Img_JuYuan_3.T_Guide_Img_JuYuan_3\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_JuYuan_1"
r6_0.GuideType = "ImageText"
r4_0[11403] = r6_0
r6_0 = {
  ChildGuideId = 11501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_115_01",
    Phone = "Mon_Guide_115_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_11501.T_Guide_Img_Mon_11501\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_11501.T_Guide_Img_Mon_11501\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_115"
r6_0.GuideType = "ImageText"
r4_0[11501] = r6_0
r6_0 = {
  ChildGuideId = 11502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_115_02",
    Phone = "Mon_Guide_115_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_11502.T_Guide_Img_Mon_11502\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_11502.T_Guide_Img_Mon_11502\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_115"
r6_0.GuideType = "ImageText"
r4_0[11502] = r6_0
r6_0 = {
  ChildGuideId = 100101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALPRO_114",
    Phone = "DUNGEON_SURVIVALPRO_114",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_1.T_Guide_Img_Survival01_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_1.T_Guide_Img_Survival01_Step_1\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_100"
r6_0.GuideType = "ImageText"
r4_0[100101] = r6_0
r6_0 = {
  ChildGuideId = 100102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALPRO_115",
    Phone = "DUNGEON_SURVIVALPRO_115",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_2.T_Guide_Img_Survival01_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_2.T_Guide_Img_Survival01_Step_2\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_100"
r6_0.GuideType = "ImageText"
r4_0[100102] = r6_0
r6_0 = {
  ChildGuideId = 100103,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALPRO_116",
    Phone = "DUNGEON_SURVIVALPRO_116",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_3.T_Guide_Img_Survival01_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_3.T_Guide_Img_Survival01_Step_3\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_100"
r6_0.GuideType = "ImageText"
r4_0[100103] = r6_0
r6_0 = {
  ChildGuideId = 100104,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALPRO_117",
    Phone = "DUNGEON_SURVIVALPRO_117",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_4.T_Guide_Img_Survival01_Step_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survival01_Step_4.T_Guide_Img_Survival01_Step_4\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_100"
r6_0.GuideType = "ImageText"
r4_0[100104] = r6_0
r6_0 = {
  ChildGuideId = 100201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALMINIPRO_102",
    Phone = "DUNGEON_SURVIVALMINIPRO_102",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survivalminipro_Step_1.T_Guide_Img_Survivalminipro_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survivalminipro_Step_1.T_Guide_Img_Survivalminipro_Step_1\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_105"
r6_0.GuideType = "ImageText"
r4_0[100201] = r6_0
r6_0 = {
  ChildGuideId = 100202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALMINIPRO_103",
    Phone = "DUNGEON_SURVIVALMINIPRO_103",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survivalminipro_Step_2.T_Guide_Img_Survivalminipro_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survivalminipro_Step_2.T_Guide_Img_Survivalminipro_Step_2\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_105"
r6_0.GuideType = "ImageText"
r4_0[100202] = r6_0
r6_0 = {
  ChildGuideId = 100203,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SURVIVALMINIPRO_104",
    Phone = "DUNGEON_SURVIVALMINIPRO_104",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survivalminipro_Step_3.T_Guide_Img_Survivalminipro_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Survivalminipro_Step_3.T_Guide_Img_Survivalminipro_Step_3\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_105"
r6_0.GuideType = "ImageText"
r4_0[100203] = r6_0
r6_0 = {
  ChildGuideId = 100301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_DEFENCE_108",
    Phone = "TARGET_DUNGEON_DEFENCE_108",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Defense_Step_1.T_Guide_Img_Defense_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Defense_Step_1.T_Guide_Img_Defense_Step_1\'",
  },
}
r6_0.GuideTitle = "DUNGEON_DEFENCE_103"
r6_0.GuideType = "ImageText"
r4_0[100301] = r6_0
r6_0 = {
  ChildGuideId = 100302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_DEFENCE_109",
    Phone = "TARGET_DUNGEON_DEFENCE_109",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Denfense_Step_2.T_Guide_Img_Denfense_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Denfense_Step_2.T_Guide_Img_Denfense_Step_2\'",
  },
}
r6_0.GuideTitle = "DUNGEON_DEFENCE_103"
r6_0.GuideType = "ImageText"
r4_0[100302] = r6_0
r6_0 = {
  ChildGuideId = 100401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_DEFENCE_112",
    Phone = "TARGET_DUNGEON_DEFENCE_112",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Defense02_Step_1.T_Guide_Img_Defense02_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Defense02_Step_1.T_Guide_Img_Defense02_Step_1\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_DEFENCE_101"
r6_0.GuideType = "ImageText"
r4_0[100401] = r6_0
r6_0 = {
  ChildGuideId = 100501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_CAPTURE_103",
    Phone = "TARGET_DUNGEON_CAPTURE_103",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_1.T_Guide_Img_Capture_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_1.T_Guide_Img_Capture_Step_1\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_CAPTURE_100"
r6_0.GuideType = "ImageText"
r4_0[100501] = r6_0
r6_0 = {
  ChildGuideId = 100502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_CAPTURE_104",
    Phone = "TARGET_DUNGEON_CAPTURE_104",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_2_PC.T_Guide_Img_Capture_Step_2_PC\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_2_Mobile.T_Guide_Img_Capture_Step_2_Mobile\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_CAPTURE_100"
r6_0.GuideType = "ImageText"
r4_0[100502] = r6_0
r6_0 = {
  ChildGuideId = 100503,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_CAPTURE_105",
    Phone = "TARGET_DUNGEON_CAPTURE_105",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_3.T_Guide_Img_Capture_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_3.T_Guide_Img_Capture_Step_3\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_CAPTURE_100"
r6_0.GuideType = "ImageText"
r4_0[100503] = r6_0
r6_0 = {
  ChildGuideId = 100504,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_CAPTURE_107",
    Phone = "TARGET_DUNGEON_CAPTURE_107",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_4.T_Guide_Img_Capture_Step_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Capture_Step_4.T_Guide_Img_Capture_Step_4\'",
  },
}
r6_0.GuideTitle = "TARGET_DUNGEON_CAPTURE_100"
r6_0.GuideType = "ImageText"
r4_0[100504] = r6_0
r6_0 = {
  ChildGuideId = 100601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_EXCAVATION_104",
    Phone = "TARGET_DUNGEON_EXCAVATION_104",
  },
  GuidePicture = r0_0.RT_1,
}
r6_0.GuideTitle = "DUNGEON_EXCAVATION_100"
r6_0.GuideType = "ImageText"
r4_0[100601] = r6_0
r6_0 = {
  ChildGuideId = 100602,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_EXCAVATION_105",
    Phone = "TARGET_DUNGEON_EXCAVATION_105",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_2.T_Guide_Img_Explore_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_2.T_Guide_Img_Explore_Step_2\'",
  },
}
r6_0.GuideTitle = "DUNGEON_EXCAVATION_100"
r6_0.GuideType = "ImageText"
r4_0[100602] = r6_0
r6_0 = {
  ChildGuideId = 100603,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_EXCAVATION_106",
    Phone = "TARGET_DUNGEON_EXCAVATION_106",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_3.T_Guide_Img_Explore_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_3.T_Guide_Img_Explore_Step_3\'",
  },
}
r6_0.GuideTitle = "DUNGEON_EXCAVATION_100"
r6_0.GuideType = "ImageText"
r4_0[100603] = r6_0
r6_0 = {
  ChildGuideId = 100604,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_EXCAVATION_107",
    Phone = "TARGET_DUNGEON_EXCAVATION_107",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_4.T_Guide_Img_Explore_Step_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_4.T_Guide_Img_Explore_Step_4\'",
  },
}
r6_0.GuideTitle = "DUNGEON_EXCAVATION_100"
r6_0.GuideType = "ImageText"
r4_0[100604] = r6_0
r6_0 = {
  ChildGuideId = 100605,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_EXCAVATION_108",
    Phone = "TARGET_DUNGEON_EXCAVATION_108",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_5.T_Guide_Img_Explore_Step_5\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_5.T_Guide_Img_Explore_Step_5\'",
  },
}
r6_0.GuideTitle = "DUNGEON_EXCAVATION_100"
r6_0.GuideType = "ImageText"
r4_0[100605] = r6_0
r6_0 = {
  ChildGuideId = 100606,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "TARGET_DUNGEON_EXCAVATION_109",
    Phone = "TARGET_DUNGEON_EXCAVATION_109",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_6.T_Guide_Img_Explore_Step_6\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Explore_Step_6.T_Guide_Img_Explore_Step_6\'",
  },
}
r6_0.GuideTitle = "DUNGEON_EXCAVATION_100"
r6_0.GuideType = "ImageText"
r4_0[100606] = r6_0
r6_0 = {
  ChildGuideId = 100701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGE_110",
    Phone = "DUNGEON_SABOTAGE_110",
  },
  GuidePicture = r0_0.RT_1,
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGE"
r6_0.GuideType = "ImageText"
r4_0[100701] = r6_0
r6_0 = {
  ChildGuideId = 100702,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGE_112",
    Phone = "DUNGEON_SABOTAGE_112",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_2.T_Guide_Img_Sabotage_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_2.T_Guide_Img_Sabotage_Step_2\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGE"
r6_0.GuideType = "ImageText"
r4_0[100702] = r6_0
r6_0 = {
  ChildGuideId = 100703,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGE_113",
    Phone = "DUNGEON_SABOTAGE_113",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_3.T_Guide_Img_Sabotage_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_3.T_Guide_Img_Sabotage_Step_3\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGE"
r6_0.GuideType = "ImageText"
r4_0[100703] = r6_0
r6_0 = {
  ChildGuideId = 100704,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGE_114",
    Phone = "DUNGEON_SABOTAGE_114",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_4.T_Guide_Img_Sabotage_Step_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_4.T_Guide_Img_Sabotage_Step_4\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGE"
r6_0.GuideType = "ImageText"
r4_0[100704] = r6_0
r6_0 = {
  ChildGuideId = 100705,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGE_111",
    Phone = "DUNGEON_SABOTAGE_111",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_5.T_Guide_Img_Sabotage_Step_5\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Sabotage_Step_5.T_Guide_Img_Sabotage_Step_5\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGE"
r6_0.GuideType = "ImageText"
r4_0[100705] = r6_0
r6_0 = {
  ChildGuideId = 100801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_RESCUE_101",
    Phone = "DUNGEON_RESCUE_101",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_1.T_Guide_Img_Rescue_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_1.T_Guide_Img_Rescue_Step_1\'",
  },
}
r6_0.GuideTitle = "DUNGEON_NAME_30007"
r6_0.GuideType = "ImageText"
r4_0[100801] = r6_0
r6_0 = {
  ChildGuideId = 100802,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_RESCUE_102",
    Phone = "DUNGEON_RESCUE_102",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_2.T_Guide_Img_Rescue_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_2.T_Guide_Img_Rescue_Step_2\'",
  },
}
r6_0.GuideTitle = "DUNGEON_NAME_30007"
r6_0.GuideType = "ImageText"
r4_0[100802] = r6_0
r6_0 = {
  ChildGuideId = 100803,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_RESCUE_103",
    Phone = "DUNGEON_RESCUE_103",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_3.T_Guide_Img_Rescue_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_3.T_Guide_Img_Rescue_Step_3\'",
  },
}
r6_0.GuideTitle = "DUNGEON_NAME_30007"
r6_0.GuideType = "ImageText"
r4_0[100803] = r6_0
r6_0 = {
  ChildGuideId = 100804,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_RESCUE_104",
    Phone = "DUNGEON_RESCUE_104",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_4.T_Guide_Img_Rescue_Step_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_4.T_Guide_Img_Rescue_Step_4\'",
  },
}
r6_0.GuideTitle = "DUNGEON_NAME_30007"
r6_0.GuideType = "ImageText"
r4_0[100804] = r6_0
r6_0 = {
  ChildGuideId = 100805,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_RESCUE_105",
    Phone = "DUNGEON_RESCUE_105",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_5.T_Guide_Img_Rescue_Step_5\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Rescue_Step_5.T_Guide_Img_Rescue_Step_5\'",
  },
}
r6_0.GuideTitle = "DUNGEON_NAME_30007"
r6_0.GuideType = "ImageText"
r4_0[100805] = r6_0
r6_0 = {
  ChildGuideId = 100901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_HIJACK_112",
    Phone = "DUNGEON_HIJACK_112",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Hijack_Step_1.T_Guide_Img_Hijack_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Hijack_Step_1.T_Guide_Img_Hijack_Step_1\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_HIJACK"
r6_0.GuideType = "ImageText"
r4_0[100901] = r6_0
r6_0 = {
  ChildGuideId = 100902,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_HIJACK_113",
    Phone = "DUNGEON_HIJACK_113",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Hijack_Step_2.T_Guide_Img_Hijack_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Hijack_Step_2.T_Guide_Img_Hijack_Step_2\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_HIJACK"
r6_0.GuideType = "ImageText"
r4_0[100902] = r6_0
r6_0 = {
  ChildGuideId = 100903,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_HIJACK_114",
    Phone = "DUNGEON_HIJACK_114",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Hijack_Step_3.T_Guide_Img_Hijack_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Hijack_Step_3.T_Guide_Img_Hijack_Step_3\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_HIJACK"
r6_0.GuideType = "ImageText"
r4_0[100903] = r6_0
r6_0 = {
  ChildGuideId = 101001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_EXTERMINATE_101",
    Phone = "DUNGEON_EXTERMINATE_101",
  },
  GuidePicture = r0_0.RT_2,
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_EXTERMINATE"
r6_0.GuideType = "ImageText"
r4_0[101001] = r6_0
r6_0 = {
  ChildGuideId = 101002,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_EXTERMINATE_102",
    Phone = "DUNGEON_EXTERMINATE_102",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Exterminate_Step_2.T_Guide_Img_Exterminate_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Exterminate_Step_2.T_Guide_Img_Exterminate_Step_2\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_EXTERMINATE"
r6_0.GuideType = "ImageText"
r4_0[101002] = r6_0
r6_0 = {
  ChildGuideId = 101101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_EXTERMPRO_100",
    Phone = "DUNGEON_EXTERMPRO_100",
  },
  GuidePicture = r0_0.RT_2,
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_TESTING"
r6_0.GuideType = "ImageText"
r4_0[101101] = r6_0
r6_0 = {
  ChildGuideId = 101201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGEPRO_102",
    Phone = "DUNGEON_SABOTAGEPRO_102",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SabotagePro_Step_1.T_Guide_Img_SabotagePro_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SabotagePro_Step_1.T_Guide_Img_SabotagePro_Step_1\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGEPRO"
r6_0.GuideType = "ImageText"
r4_0[101201] = r6_0
r6_0 = {
  ChildGuideId = 101202,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SABOTAGEPRO_103",
    Phone = "DUNGEON_SABOTAGEPRO_103",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SabotagePro_Step_2.T_Guide_Img_SabotagePro_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_SabotagePro_Step_2.T_Guide_Img_SabotagePro_Step_2\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SABOTAGEPRO"
r6_0.GuideType = "ImageText"
r4_0[101202] = r6_0
r6_0 = {
  ChildGuideId = 101301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SYNTHESIS_119",
    Phone = "DUNGEON_SYNTHESIS_119",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_1.T_Guide_Img_Synthesis_Step_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_1.T_Guide_Img_Synthesis_Step_1\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SYNTHESIS"
r6_0.GuideType = "ImageText"
r4_0[101301] = r6_0
r6_0 = {
  ChildGuideId = 101302,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SYNTHESIS_120",
    Phone = "DUNGEON_SYNTHESIS_120",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_2.T_Guide_Img_Synthesis_Step_2\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_2.T_Guide_Img_Synthesis_Step_2\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SYNTHESIS"
r6_0.GuideType = "ImageText"
r4_0[101302] = r6_0
r6_0 = {
  ChildGuideId = 101303,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SYNTHESIS_121",
    Phone = "DUNGEON_SYNTHESIS_121",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_3.T_Guide_Img_Synthesis_Step_3\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_3.T_Guide_Img_Synthesis_Step_3\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SYNTHESIS"
r6_0.GuideType = "ImageText"
r4_0[101303] = r6_0
r6_0 = {
  ChildGuideId = 101304,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SYNTHESIS_122",
    Phone = "DUNGEON_SYNTHESIS_122",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_4.T_Guide_Img_Synthesis_Step_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_4.T_Guide_Img_Synthesis_Step_4\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SYNTHESIS"
r6_0.GuideType = "ImageText"
r4_0[101304] = r6_0
r6_0 = {
  ChildGuideId = 101305,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SYNTHESIS_123",
    Phone = "DUNGEON_SYNTHESIS_123",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_5.T_Guide_Img_Synthesis_Step_5\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_5.T_Guide_Img_Synthesis_Step_5\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SYNTHESIS"
r6_0.GuideType = "ImageText"
r4_0[101305] = r6_0
r6_0 = {
  ChildGuideId = 101306,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "DUNGEON_SYNTHESIS_134",
    Phone = "DUNGEON_SYNTHESIS_134",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_6.T_Guide_Img_Synthesis_Step_6\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Synthesis_Step_6.T_Guide_Img_Synthesis_Step_6\'",
  },
}
r6_0.GuideTitle = "UI_DUNGEON_TYPE_SYNTHESIS"
r6_0.GuideType = "ImageText"
r4_0[101306] = r6_0
r6_0 = {
  ChildGuideId = 200101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_1",
    Phone = "UIGuide_Feina_1_Phone",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_15.T_Guide_Img_Feina_15\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_15.T_Guide_Img_Feina_15\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_15.T_Guide_Img_Feina_15\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_1"
r6_0.GuideType = "ImageText"
r4_0[200101] = r6_0
r6_0 = {
  ChildGuideId = 200201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_2",
    Phone = "UIGuide_Feina_2",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_13.T_Guide_Img_Feina_13\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_13.T_Guide_Img_Feina_13\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_13.T_Guide_Img_Feina_13\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_2"
r6_0.GuideType = "ImageText"
r4_0[200201] = r6_0
r6_0 = {
  ChildGuideId = 200301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    GamePad = "UIGuide_Feina_3_Gamepad",
    PC = "UIGuide_Feina_3",
    Phone = "UIGuide_Feina_3_Phone",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_12.T_Guide_Img_Feina_12\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_12.T_Guide_Img_Feina_12\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_12.T_Guide_Img_Feina_12\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_3"
r6_0.GuideType = "ImageText"
r4_0[200301] = r6_0
r6_0 = {
  ChildGuideId = 200401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_4",
    Phone = "UIGuide_Feina_4",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_4.T_Guide_Img_Feina_4\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_4.T_Guide_Img_Feina_4\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_4.T_Guide_Img_Feina_4\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_4"
r6_0.GuideType = "ImageText"
r4_0[200401] = r6_0
r6_0 = {
  ChildGuideId = 200501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_5",
    Phone = "UIGuide_Feina_5",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_5.T_Guide_Img_Feina_5\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_5.T_Guide_Img_Feina_5\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_5.T_Guide_Img_Feina_5\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_5"
r6_0.GuideType = "ImageText"
r4_0[200501] = r6_0
r6_0 = {
  ChildGuideId = 200601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_6",
    Phone = "UIGuide_Feina_6",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_6.T_Guide_Img_Feina_6\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_6.T_Guide_Img_Feina_6\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_6.T_Guide_Img_Feina_6\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_6"
r6_0.GuideType = "ImageText"
r4_0[200601] = r6_0
r6_0 = {
  ChildGuideId = 200701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_7",
    Phone = "UIGuide_Feina_7",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_7.T_Guide_Img_Feina_7\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_7.T_Guide_Img_Feina_7\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_7.T_Guide_Img_Feina_7\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_7"
r6_0.GuideType = "ImageText"
r4_0[200701] = r6_0
r6_0 = {
  ChildGuideId = 200801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_8",
    Phone = "UIGuide_Feina_8",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_8.T_Guide_Img_Feina_8\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_8.T_Guide_Img_Feina_8\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_8.T_Guide_Img_Feina_8\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_8"
r6_0.GuideType = "ImageText"
r4_0[200801] = r6_0
r6_0 = {
  ChildGuideId = 200901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_9",
    Phone = "UIGuide_Feina_9",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_9.T_Guide_Img_Feina_9\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_9.T_Guide_Img_Feina_9\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_9.T_Guide_Img_Feina_9\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_9"
r6_0.GuideType = "ImageText"
r4_0[200901] = r6_0
r6_0 = {
  ChildGuideId = 201001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_10",
    Phone = "UIGuide_Feina_10",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_10.T_Guide_Img_Feina_10\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_10.T_Guide_Img_Feina_10\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_10.T_Guide_Img_Feina_10\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_10"
r6_0.GuideType = "ImageText"
r4_0[201001] = r6_0
r6_0 = {
  ChildGuideId = 201101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_11",
    Phone = "UIGuide_Feina_11",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_11.T_Guide_Img_Feina_11\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_11.T_Guide_Img_Feina_11\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_11.T_Guide_Img_Feina_11\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_11"
r6_0.GuideType = "ImageText"
r4_0[201101] = r6_0
r6_0 = {
  ChildGuideId = 201201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_Feina_12",
    Phone = "UIGuide_Feina_12",
  },
  GuidePicture = {
    GamePad = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_14.T_Guide_Img_Feina_14\'",
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_14.T_Guide_Img_Feina_14\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Level/T_Guide_Img_Feina_14.T_Guide_Img_Feina_14\'",
  },
}
r6_0.GuideTitle = "MAINUIGUIDE_TITLE_Feina_12"
r6_0.GuideType = "ImageText"
r4_0[201201] = r6_0
r6_0 = {
  ChildGuideId = 203001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_content_203001",
    Phone = "UIGuide_content_203001",
  },
  GuidePicture = r0_0.RT_6,
}
r6_0.GuideTitle = "UIGuide_Title_203001"
r6_0.GuideType = "ImageText"
r4_0[203001] = r6_0
r6_0 = {
  ChildGuideId = 203501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_content_203501",
    Phone = "UIGuide_content_203501",
  },
  GuidePicture = r0_0.RT_6,
}
r6_0.GuideTitle = "UIGuide_Title_203501"
r6_0.GuideType = "ImageText"
r4_0[203501] = r6_0
r6_0 = {
  ChildGuideId = 203601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "UIGuide_content_203601",
    Phone = "UIGuide_content_203601",
  },
  GuidePicture = r0_0.RT_6,
  GuideSubTitle = "UIGuide_Title_203601",
}
r6_0.GuideInfo2 = {
  GuideContent = {
    PC = "UIGuide_content_203602",
    Phone = "UIGuide_content_203602",
  },
  GuidePicture = r0_0.RT_6,
  GuideSubTitle = "UIGuide_Title_203602",
}
r6_0.GuideTitle = "UIGuide_Title_203601"
r6_0.GuideType = "ImageText"
r4_0[203601] = r6_0
local r5_0 = 1001101
r6_0 = {
  ChildGuideId = 1001101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Frozen_01",
    Phone = "Mon_Guide_Strong_Frozen_01",
  },
  GuideDescValues = {
    "$#SkillEffects[600000102].TaskEffects[2].LastTime$",
    "$#Buff[6000102].MaxLayer$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Frozen_01.T_Guide_Img_Mon_Strong_Frozen_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Frozen_01.T_Guide_Img_Mon_Strong_Frozen_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Frozen"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r5_0 = 1001201
r6_0 = {
  ChildGuideId = 1001201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Burst_01",
    Phone = "Mon_Guide_Strong_Burst_01",
  },
  GuideDescValues = {
    "$#Buff[6000103].DotDatas[1].Interval$",
    "$#SkillEffects[600000201].TaskEffects[3].LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Burst_01.T_Guide_Img_Mon_Strong_Burst_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Burst_01.T_Guide_Img_Mon_Strong_Burst_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Burst"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 1001301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Poison_01",
    Phone = "Mon_Guide_Strong_Poison_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Poison_01.T_Guide_Img_Mon_Strong_Poison_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Poison_01.T_Guide_Img_Mon_Strong_Poison_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Poison"
r6_0.GuideType = "ImageText"
r4_0[1001301] = r6_0
r5_0 = 1001401
r6_0 = {
  ChildGuideId = 1001401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Thunder_01",
    Phone = "Mon_Guide_Strong_Thunder_01",
  },
  GuideDescValues = {
    "$#DanmakuCreature[600000401].Vars.DamageInterval$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Thunder_01.T_Guide_Img_Mon_Strong_Thunder_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Thunder_01.T_Guide_Img_Mon_Strong_Thunder_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Thunder"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r5_0 = 1001501
r6_0 = {
  ChildGuideId = 1001501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Blood_01",
    Phone = "Mon_Guide_Strong_Blood_01",
  },
  GuideDescValues = {
    "$#SkillEffects[600000501].TaskEffects[1].SingleSummonCount$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Blood_01.T_Guide_Img_Mon_Strong_Blood_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Blood_01.T_Guide_Img_Mon_Strong_Blood_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Blood"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 1001502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Blood_02",
    Phone = "Mon_Guide_Strong_Blood_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Blood_02.T_Guide_Img_Mon_Strong_Blood_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Blood_02.T_Guide_Img_Mon_Strong_Blood_02\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Blood"
r6_0.GuideType = "ImageText"
r4_0[1001502] = r6_0
r6_0 = {
  ChildGuideId = 1001601,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Fade_01",
    Phone = "Mon_Guide_Strong_Fade_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Fade_01.T_Guide_Img_Mon_Strong_Fade_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Fade_01.T_Guide_Img_Mon_Strong_Fade_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Fade"
r6_0.GuideType = "ImageText"
r4_0[1001601] = r6_0
r5_0 = 1001701
r6_0 = {
  ChildGuideId = 1001701,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Shield_01",
    Phone = "Mon_Guide_Strong_Shield_01",
  },
  GuideDescValues = {
    "$#SkillEffects[600000701].TaskEffects[1].LifeTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Shield_01.T_Guide_Img_Mon_Strong_Shield_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Shield_01.T_Guide_Img_Mon_Strong_Shield_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Shield"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r5_0 = 1001801
r6_0 = {
  ChildGuideId = 1001801,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Revenge_01",
    Phone = "Mon_Guide_Strong_Revenge_01",
  },
  GuideDescValues = {
    "$#SkillEffects[600000801].TaskEffects[1].LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Revenge_01.T_Guide_Img_Mon_Strong_Revenge_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Revenge_01.T_Guide_Img_Mon_Strong_Revenge_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Revenge"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r5_0 = 1001901
r6_0 = {
  ChildGuideId = 1001901,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_IceOrb_01",
    Phone = "Mon_Guide_Strong_IceOrb_01",
  },
  GuideDescValues = {
    "$#MechanismSummon[900901].BluePrintParams.SpeedDownTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_IceOrb_01.T_Guide_Img_Mon_Strong_IceOrb_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_IceOrb_01.T_Guide_Img_Mon_Strong_IceOrb_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_IceOrb"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r5_0 = 1002001
r6_0 = {
  ChildGuideId = 1002001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Reflect_01",
    Phone = "Mon_Guide_Strong_Reflect_01",
  },
  GuideDescValues = {
    "$#SkillEffects[600001001].TaskEffects[1].LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Reflect_01.T_Guide_Img_Mon_Strong_Reflect_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Reflect_01.T_Guide_Img_Mon_Strong_Reflect_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Reflect"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 1002101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Kamikaze_01",
    Phone = "Mon_Guide_Strong_Kamikaze_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Kamikaze_01.T_Guide_Img_Mon_Strong_Kamikaze_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Kamikaze_01.T_Guide_Img_Mon_Strong_Kamikaze_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Kamikaze"
r6_0.GuideType = "ImageText"
r4_0[1002101] = r6_0
r6_0 = {
  ChildGuideId = 1002201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_ThunderLaser_01",
    Phone = "Mon_Guide_Strong_ThunderLaser_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_ThunderLaser_01.T_Guide_Img_Mon_Strong_ThunderLaser_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_ThunderLaser_01.T_Guide_Img_Mon_Strong_ThunderLaser_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_ThunderLaser"
r6_0.GuideType = "ImageText"
r4_0[1002201] = r6_0
r6_0 = {
  ChildGuideId = 1002301,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Vampire_01",
    Phone = "Mon_Guide_Strong_Vampire_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Vampire_01.T_Guide_Img_Mon_Strong_Vampire_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Vampire_01.T_Guide_Img_Mon_Strong_Vampire_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Vampire"
r6_0.GuideType = "ImageText"
r4_0[1002301] = r6_0
r5_0 = 1002401
r6_0 = {
  ChildGuideId = 1002401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Threefold_01",
    Phone = "Mon_Guide_Strong_Threefold_01",
  },
  GuideDescValues = {
    "$#SkillEffects[600001401].TaskEffects[1].SingleSummonCount$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Threefold_01.T_Guide_Img_Mon_Strong_Threefold_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Threefold_01.T_Guide_Img_Mon_Strong_Threefold_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Threefold"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 1010001,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_Strong_Multiple_01",
    Phone = "Mon_Guide_Strong_Multiple_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Multiple_01.T_Guide_Img_Mon_Strong_Multiple_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_Strong_Multiple_01.T_Guide_Img_Mon_Strong_Multiple_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_Strong_Multiple"
r6_0.GuideType = "ImageText"
r4_0[1010001] = r6_0
r6_0 = {
  ChildGuideId = 600600101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_6006001_01",
    Phone = "Mon_Guide_6006001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_6006001_01.T_Guide_Img_Mon_6006001_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_6006001_01.T_Guide_Img_Mon_6006001_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_6006001"
r6_0.GuideType = "ImageText"
r4_0[600600101] = r6_0
r6_0 = {
  ChildGuideId = 600700101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_6007001_01",
    Phone = "Mon_Guide_6007001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_6007001_01.T_Guide_Img_Mon_6007001_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_6007001_01.T_Guide_Img_Mon_6007001_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_6007001"
r6_0.GuideType = "ImageText"
r4_0[600700101] = r6_0
r6_0 = {
  ChildGuideId = 601500101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_6015001_01",
    Phone = "Mon_Guide_6015001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_6015001_01.T_Guide_Img_Mon_6015001_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_6015001_01.T_Guide_Img_Mon_6015001_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_6015001"
r6_0.GuideType = "ImageText"
r4_0[601500101] = r6_0
r5_0 = 700100501
r6_0 = {
  ChildGuideId = 700100501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7001005_01",
    Phone = "Mon_Guide_7001005_01",
  },
  GuideDescValues = {
    "$#PassiveEffect[700121].Vars.LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7001005_01.T_Guide_Img_Mon_7001005_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7001005_01.T_Guide_Img_Mon_7001005_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7001005"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r5_0 = 700100502
r6_0 = {
  ChildGuideId = 700100502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7001005_02",
    Phone = "Mon_Guide_7001005_02",
  },
  GuideDescValues = {
    "$#PassiveEffect[700121].Vars.SpareCD$",
    "$#PassiveEffect[700121].Vars.LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7001005_02.T_Guide_Img_Mon_7001005_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7001005_02.T_Guide_Img_Mon_7001005_02\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7001005"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 700200501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7002005_01",
    Phone = "Mon_Guide_7002005_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7002005_01.T_Guide_Img_Mon_7002005_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7002005_01.T_Guide_Img_Mon_7002005_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7002005"
r6_0.GuideType = "ImageText"
r4_0[700200501] = r6_0
r6_0 = {
  ChildGuideId = 700200502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7002005_02",
    Phone = "Mon_Guide_7002005_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7002005_02.T_Guide_Img_Mon_7002005_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7002005_02.T_Guide_Img_Mon_7002005_02\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7002005"
r6_0.GuideType = "ImageText"
r4_0[700200502] = r6_0
r5_0 = 700200503
r6_0 = {
  ChildGuideId = 700200503,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7002005_03",
    Phone = "Mon_Guide_7002005_03",
  },
  GuideDescValues = {
    "$#SkillEffects[700722].TaskEffects[3].LastTime$",
    "$#SkillEffects[700721].TaskEffects[1].LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7002005_03.T_Guide_Img_Mon_7002005_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7002005_03.T_Guide_Img_Mon_7002005_03\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7002005"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 700300501,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7003005_01",
    Phone = "Mon_Guide_7003005_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7003005_01.T_Guide_Img_Mon_7003005_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7003005_01.T_Guide_Img_Mon_7003005_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7003005"
r6_0.GuideType = "ImageText"
r4_0[700300501] = r6_0
r5_0 = 700300502
r6_0 = {
  ChildGuideId = 700300502,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7003005_02",
    Phone = "Mon_Guide_7003005_02",
  },
  GuideDescValues = {
    "$#SkillEffects[700323].TaskEffects[5].LastTime$"
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7003005_02.T_Guide_Img_Mon_7003005_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7003005_02.T_Guide_Img_Mon_7003005_02\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7003005"
r6_0.GuideType = "ImageText"
r4_0[r5_0] = r6_0
r6_0 = {
  ChildGuideId = 700700201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7007002_01",
    Phone = "Mon_Guide_7007002_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7007002_01.T_Guide_Img_Mon_7007002_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7007002_01.T_Guide_Img_Mon_7007002_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7007002"
r6_0.GuideType = "ImageText"
r4_0[700700201] = r6_0
r6_0 = {
  ChildGuideId = 700800101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7008001_01",
    Phone = "Mon_Guide_7008001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7008001_01.T_Guide_Img_Mon_7008001_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7008001_01.T_Guide_Img_Mon_7008001_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7008001"
r6_0.GuideType = "ImageText"
r4_0[700800101] = r6_0
r6_0 = {
  ChildGuideId = 700800102,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7008001_02",
    Phone = "Mon_Guide_7008001_02",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7008001_02.T_Guide_Img_Mon_7008001_02\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7008001_02.T_Guide_Img_Mon_7008001_02\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7008001"
r6_0.GuideType = "ImageText"
r4_0[700800102] = r6_0
r6_0 = {
  ChildGuideId = 700800103,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7008001_03",
    Phone = "Mon_Guide_7008001_03",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7008001_03.T_Guide_Img_Mon_7008001_03\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7008001_03.T_Guide_Img_Mon_7008001_03\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7008001"
r6_0.GuideType = "ImageText"
r4_0[700800103] = r6_0
r6_0 = {
  ChildGuideId = 701500101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_7015001_01",
    Phone = "Mon_Guide_7015001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7015001.T_Guide_Img_Mon_7015001\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_7015001.T_Guide_Img_Mon_7015001\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_7015001"
r6_0.GuideType = "ImageText"
r4_0[701500101] = r6_0
r6_0 = {
  ChildGuideId = 850100201,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_8501002_01",
    Phone = "Mon_Guide_8501002_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_8501002_01.T_Guide_Img_Mon_8501002_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_8501002_01.T_Guide_Img_Mon_8501002_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_8501002"
r6_0.GuideType = "ImageText"
r4_0[850100201] = r6_0
r6_0 = {
  ChildGuideId = 851500101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_8515001_01",
    Phone = "Mon_Guide_8515001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_8515001_01.T_Guide_Img_Mon_8515001_01\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_8515001_01.T_Guide_Img_Mon_8515001_01\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_8515001"
r6_0.GuideType = "ImageText"
r4_0[851500101] = r6_0
r6_0 = {
  ChildGuideId = 900300401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_9003001_01",
    Phone = "Mon_Guide_9003001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9003001_1.T_Guide_Img_Mon_9003001_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9003001_1.T_Guide_Img_Mon_9003001_1\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_9003004"
r6_0.GuideType = "ImageText"
r4_0[900300401] = r6_0
r6_0 = {
  ChildGuideId = 900500401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_9005001_01",
    Phone = "Mon_Guide_9005001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9005001_1.T_Guide_Img_Mon_9005001_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9005001_1.T_Guide_Img_Mon_9005001_1\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_9005004"
r6_0.GuideType = "ImageText"
r4_0[900500401] = r6_0
r6_0 = {
  ChildGuideId = 900600401,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_9006001_01",
    Phone = "Mon_Guide_9006001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9006001_1.T_Guide_Img_Mon_9006001_1\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9006001_1.T_Guide_Img_Mon_9006001_1\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_9006004"
r6_0.GuideType = "ImageText"
r4_0[900600401] = r6_0
r6_0 = {
  ChildGuideId = 950000101,
}
r6_0.GuideInfo1 = {
  GuideContent = {
    PC = "Mon_Guide_9500001_01",
    Phone = "Mon_Guide_9500001_01",
  },
  GuidePicture = {
    PC = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9500001.T_Guide_Img_Mon_9500001\'",
    Phone = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Guide/Battle/T_Guide_Img_Mon_9500001.T_Guide_Img_Mon_9500001\'",
  },
}
r6_0.GuideTitle = "Mon_Guide_Title_9500001"
r6_0.GuideType = "ImageText"
r4_0[950000101] = r6_0
return r2_0(r3_0, r4_0)
