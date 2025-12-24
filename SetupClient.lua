-- filename: @C:/Pack/Branch/geili11\Content/Script/SetupClient.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("GWorld")
local r1_0 = require("Utils")
local r2_0 = require("NetworkEngine.Common.EntityManager")
local r3_0 = require("NetworkEngine.Common.EntityFactory")
return {
  SetupEntityManager = function(r0_1)
    -- line: [8, 10] id: 1
    r0_0.EntityManager = r1_0.New(r2_0)
  end,
  SetupEntityFactory = function(r0_2)
    -- line: [12, 16] id: 2
    r0_0.EntityFactory = r1_0.New(r3_0)
    r0_2:RegisterClientEntity()
  end,
  SetupServerListMgr = function(r0_3)
    -- line: [18, 20] id: 3
    r0_0.ServerListMgr = require("BluePrints/UI/GameLogin/ServerListMgr")
  end,
  RegisterClientEntity = function(r0_4)
    -- line: [22, 30] id: 4
    r0_0.EntityFactory:RegisterEntity("Account", require("BluePrints.Client.Entities.Account"))
    r0_0.EntityFactory:RegisterEntity("Avatar", require("BluePrints.Client.Entities.Avatar"))
    r0_0.EntityFactory:RegisterEntity("DSEntity", require("BluePrints.Client.Entities.DSEntity"))
  end,
  Setup = function(r0_5)
    -- line: [33, 37] id: 5
    r0_5:SetupEntityManager()
    r0_5:SetupEntityFactory()
    r0_5:SetupServerListMgr()
  end,
}
