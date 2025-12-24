-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RegionGraph.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    100101,
    100102,
    100103
  },
  RT_2 = {
    100101,
    "TargetPoint_Balcony_Connect1",
    1
  },
}
r0_0.RT_3 = {
  r0_0.RT_2
}
r0_0.RT_4 = {
  RegionTarget = r0_0.RT_3,
}
r0_0.RT_5 = {
  101101,
  101103
}
r0_0.RT_6 = {
  101107,
  "TargetPoint_Tavern",
  1
}
r0_0.RT_7 = {
  210101,
  "TargetPoint_HomeBase",
  1
}
r0_0.RT_8 = {
  101105,
  "TargetPoint_OutSiderHome",
  1
}
r0_0.RT_9 = {
  101106,
  "TargetPoint_Sanatorium",
  1
}
r0_0.RT_10 = {
  101701,
  "TargetPoint_Sewer",
  1,
  312
}
r0_0.RT_11 = {
  101702,
  "TargetPoint_SewPoorEnter",
  1
}
r0_0.RT_12 = {
  101301,
  "TargetPoint_Kuangkeng",
  1
}
r0_0.RT_13 = {
  101901,
  "TargetPoint_Theater",
  1
}
r0_0.RT_14 = {
  101110,
  "Cp2LeaveSickPoint",
  1
}
r0_0.RT_15 = {
  101111,
  "LC_EnterFlow",
  1
}
r0_0.RT_16 = {
  101108,
  "TargetPoint_Traff2SecEnter",
  1
}
r0_0.RT_17 = {
  101108,
  "TargetPoint_Traff2SecLeave",
  1,
  321
}
r0_0.RT_18 = {
  r0_0.RT_6,
  r0_0.RT_7,
  r0_0.RT_8,
  r0_0.RT_9,
  r0_0.RT_10,
  r0_0.RT_11,
  r0_0.RT_12,
  r0_0.RT_13,
  r0_0.RT_14,
  r0_0.RT_15,
  r0_0.RT_16,
  r0_0.RT_17
}
r0_0.RT_19 = {
  RegionTarget = r0_0.RT_18,
}
r0_0.RT_20 = {
  101301,
  101303,
  101304,
  101305
}
r0_0.RT_21 = {
  101103,
  "TargetPoint_Enter_2_TrafficWay",
  1
}
r0_0.RT_22 = {
  r0_0.RT_21
}
r0_0.RT_23 = {
  RegionTarget = r0_0.RT_22,
}
r0_0.RT_24 = {
  101701,
  101702,
  101703
}
r0_0.RT_25 = {
  101101,
  "TargetPoint_Sew1_2_IcelakeCity",
  1
}
r0_0.RT_26 = {
  101101,
  "TargetPoint_Sew2_2_IcelakeCity",
  1
}
r0_0.RT_27 = {
  r0_0.RT_25,
  r0_0.RT_26
}
r0_0.RT_28 = {
  RegionTarget = r0_0.RT_27,
}
r0_0.RT_29 = {
  102101,
  102102
}
r0_0.RT_30 = {
  104102,
  104103,
  104104,
  104105,
  104106,
  104107,
  104108,
  104109,
  104110
}
r0_0.RT_31 = {
  104901,
  "TargetPoint_EnterQiuOffice",
  1
}
r0_0.RT_32 = {
  r0_0.RT_31
}
r0_0.RT_33 = {
  RegionTarget = r0_0.RT_32,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [167, 167] id: 1
  return r1_1
end
local r3_0 = "RegionGraph"
local r4_0 = {}
local r5_0 = 100101
local r6_0 = {
  RegionStart = r0_0.RT_1,
  SubRegionStart = 100101,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      100102,
      "TargetPoint_Village_Connect",
      1
    },
    {
      100103,
      "TargetPoint_Village_Connect",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[100102] = {
  RegionStart = r0_0.RT_1,
  SubRegionStart = 100102,
  SubRegionTarget = r0_0.RT_4,
}
r4_0[100103] = {
  RegionStart = r0_0.RT_1,
  SubRegionStart = 100103,
  SubRegionTarget = r0_0.RT_4,
}
r4_0[100104] = {
  SubRegionStart = 100104,
}
r4_0[101101] = {
  RegionStart = r0_0.RT_5,
  SubRegionStart = 101101,
  SubRegionTarget = r0_0.RT_19,
}
r4_0[101103] = {
  RegionStart = r0_0.RT_5,
  SubRegionStart = 101103,
  SubRegionTarget = r0_0.RT_19,
}
r5_0 = 101105
r6_0 = {
  SubRegionStart = 101105,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "TargetPoint_LeaveOutsidersHome",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 101106
r6_0 = {
  SubRegionStart = 101106,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "TargetPoint_LeaveSanatorium",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 101107
r6_0 = {
  SubRegionStart = 101107,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "TargetPoint_LeaveTavern",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 101108
r6_0 = {
  SubRegionStart = 101108,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101103,
      "TargetPoint_SecLeave",
      1
    },
    {
      101103,
      "TargetPoint_SecrEnter",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 101110
r6_0 = {
  SubRegionStart = 101110,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "SickTelePoint",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 101111
r6_0 = {
  SubRegionStart = 101111,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "LC_LeaveFlow",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[101301] = {
  RegionStart = r0_0.RT_20,
  SubRegionStart = 101301,
  SubRegionTarget = r0_0.RT_23,
}
r4_0[101303] = {
  RegionStart = r0_0.RT_20,
  SubRegionStart = 101303,
  SubRegionTarget = r0_0.RT_23,
}
r4_0[101304] = {
  RegionStart = r0_0.RT_20,
  SubRegionStart = 101304,
  SubRegionTarget = r0_0.RT_23,
}
r4_0[101305] = {
  RegionStart = r0_0.RT_20,
  SubRegionStart = 101305,
  SubRegionTarget = r0_0.RT_23,
}
r4_0[101701] = {
  RegionStart = r0_0.RT_24,
  SubRegionStart = 101701,
  SubRegionTarget = r0_0.RT_28,
}
r4_0[101702] = {
  RegionStart = r0_0.RT_24,
  SubRegionStart = 101702,
  SubRegionTarget = r0_0.RT_28,
}
r4_0[101703] = {
  RegionStart = r0_0.RT_24,
  SubRegionStart = 101703,
  SubRegionTarget = r0_0.RT_28,
}
r5_0 = 101901
r6_0 = {
  SubRegionStart = 101901,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "LeavePoint_Theater",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[102101] = {
  RegionStart = r0_0.RT_29,
  SubRegionStart = 102101,
}
r4_0[102102] = {
  RegionStart = r0_0.RT_29,
  SubRegionStart = 102102,
}
r4_0[104102] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104102,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104103] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104103,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104104] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104104,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104105] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104105,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104106] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104106,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104107] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104107,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104108] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104108,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104109] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104109,
  SubRegionTarget = r0_0.RT_33,
}
r4_0[104110] = {
  RegionStart = r0_0.RT_30,
  SubRegionStart = 104110,
  SubRegionTarget = r0_0.RT_33,
}
r5_0 = 104901
r6_0 = {
  SubRegionStart = 104901,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      104109,
      "TargetPoint_LeaveQiuOffice",
      1
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 210101
r6_0 = {
  SubRegionStart = 210101,
}
r6_0.SubRegionTarget = {
  RegionTarget = {
    {
      101101,
      "TargetPoint_LeaveHomeBase",
      1
    }
  },
}
r4_0[r5_0] = r6_0
return r2_0(r3_0, r4_0)
