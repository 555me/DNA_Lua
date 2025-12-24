-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\RaidBuff.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "$#GlobalPassiveData[30101].Vars.Divider*100$%",
    [2] = "$#GlobalPassiveData[30101].Vars.Penetration*100$%",
    [3] = "$(#GlobalPassiveData[30101].Vars.MaxSkillInten-1)/(#GlobalPassiveData[30101].Vars.Divider)*(#GlobalPassiveData[30101].Vars.Penetration)*100$%",
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [8, 8] id: 1
  return r1_1
end)("RaidBuff", {
  [1] = {
    RaidBuffDes = "Raid_Buff_11",
    RaidBuffID = 1,
    RaidBuffParameter = r0_0.RT_1,
  },
  [2] = {
    RaidBuffDes = "Raid_Buff_11",
    RaidBuffID = 2,
    RaidBuffParameter = r0_0.RT_1,
  },
  [3] = {
    RaidBuffDes = "Raid_Buff_11",
    RaidBuffID = 3,
    RaidBuffParameter = r0_0.RT_1,
  },
})
