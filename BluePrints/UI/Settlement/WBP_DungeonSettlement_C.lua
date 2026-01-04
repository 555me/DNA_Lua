-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Settlement\WBP_DungeonSettlement_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local r2_0 = require("Utils.TimeUtils")
local r3_0 = require("Utils.MiscUtils")
local r4_0 = Class("BluePrints.UI.BP_UIState_C")
r4_0._components = {
  "BluePrints.UI.Settlement.DungeonSettlementComponent"
}
function r4_0.InitUIInfo(r0_1, r1_1, r2_1, r3_1, ...)
  -- line: [23, 103] id: 1
  local r7_1 = nil	-- notice: implicit variable refs by block#[0]
  local r6_1 = nil	-- notice: implicit variable refs by block#[0]
  local r5_1 = nil	-- notice: implicit variable refs by block#[0]
  r0_1.Super.InitUIInfo(r0_1, r1_1, r2_1, r3_1, ...)
  r0_1:AddDispatcher(EventID.OnChangeActionPoint, r0_1, r0_1.InitActionPointInfo)
  r0_1:AddDispatcher(EventID.TeamMatchTimingStart, r0_1, r0_1.OnTeamMatchTimingStart)
  r0_1:AddDispatcher(EventID.TeamMatchTimingEnd, r0_1, r0_1.OnTeamMatchTimingEnd)
  UIManager(r0_1):GetUI("BattleMain"):HidePlayerDeadUI()
  ... = ... -- error: untaken top expr
  r0_1.IsWin, r0_1.BattleInfo, r0_1.Rewards, r0_1.SpRewards, r0_1.PlayerTime, r0_1.GameTime = table.unpack(r5_1, 1, r5_1.n)
  r0_1.DungeonId = r6_1
  r0_1.CombatData = r7_1
  r0_1.IsWeeklyDungeon = r0_1.DungeonId and DataMgr.Dungeon[r0_1.DungeonId] and DataMgr.Dungeon[r0_1.DungeonId].IsWeeklyDungeon
  r0_1.IntervalTime = 0.06666666666666667
  r0_1.FirstDelayTime = 0.3333333333333333 - r0_1.IntervalTime
  r0_1:CheckIsHardBossMode()
  r0_1:CheckIsTempleMode()
  r0_1:CheckIsPartyMode()
  r0_1:CheckIsWalnutMode()
  r0_1:CheckIsNoExpMode()
  r0_1.HideUITag = "DungeonSettlement"
  r0_1.IsAllowPropInAnimation = true
  DebugPrint("DungeonSettlement: OnLoaded, IsWin", r0_1.IsWin, "PlayerTime", r0_1.PlayerTime, "GameTime", r0_1.GameTime, "DungeonId", r0_1.DungeonId)
  r0_1.RoleItemInfos = {
    Char = {
      Widget = r0_1.Settlement_Role,
    },
    MeleeWeapon = {
      Widget = r0_1.Settlement_Role_1,
    },
    RangedWeapon = {
      Widget = r0_1.Settlement_Role_2,
    },
    Player = {
      Widget = r0_1.Settlement_Account,
    },
  }
  r0_1.PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(r0_1, 0)
  r0_1.PlayerController = UE4.UGameplayStatics.GetPlayerController(r0_1, 0)
  r0_1.PlayerState = r0_1.PlayerController.PlayerState
  r0_1.IsFirstFocus = true
  r0_1:BlockAllUIInput(false)
  r0_1:InitContent()
  r0_1:SetAllUIVisibility(true)
  if r0_1.IsTemple then
    r0_1:CalcTempleInfo()
  elseif r0_1.IsParty then
    r0_1:CalcPartyInfo()
  else
    r0_1:CalcRoleAndRewardsInfo()
  end
  r0_1:ShowSettlementInfo()
  AudioManager(r0_1):PauseAllBGM()
  r0_1:SetCharDirLight(true)
  if r0_1.WBP_Chat_CommonEnter then
    r0_1.WBP_Chat_CommonEnter.bInDungeonSettlement = GWorld:GetAvatar().SettlementUidArray
  end
end
function r4_0.OnLoaded(r0_2, ...)
  -- line: [105, 110] id: 2
  r4_0.Super.OnLoaded(r0_2, ...)
  r0_2:InitDeviceInfo()
  r0_2:InitListenEvent()
end
function r4_0.Destruct(r0_3)
  -- line: [112, 115] id: 3
  AudioManager(r0_3):ResumeAllBGM()
  r4_0.Super.Destruct(r0_3)
end
function r4_0.InitContent(r0_4)
  -- line: [117, 129] id: 4
  r0_4:InitHeadline()
  r0_4:InitStageInfo()
  r0_4:InitMainButtons()
  r0_4:InitActionPointInfo()
  r0_4:InitHardBossOrWeekyDungeonInfo()
  r0_4:InitSwitchPanelContent()
  r0_4:InitRewardPanel()
  r0_4:InitPlayersHighLightData()
  r0_4:InitDoubleModInfo()
end
function r4_0.InitRewardPanel(r0_5)
  -- line: [131, 168] id: 5
  if r0_5.IsTemple then
    return 
  end
  DebugPrint("DungeonSettlement: Reward列表入场")
  PrintTable(r0_5.SpRewards, 3)
  PrintTable(r0_5.Rewards, 3)
  r0_5.SpRewardsArray = {}
  r0_5.RewardsArray = {}
  r0_5:RewardsAddToArray(r0_5.SpRewardsArray, r0_5.SpRewards, true)
  r0_5:RewardsAddToArray(r0_5.RewardsArray, r0_5.Rewards, false)
  r0_5:SortRewardsArray(r0_5.SpRewardsArray)
  r0_5:SortRewardsArray(r0_5.RewardsArray)
  if r0_5.IsHardBoss then
    if #r0_5.RewardsArray > 0 then
      r0_5.Panel_Reward:SetVisibility(ESlateVisibility.Collapsed)
      r0_5.Text_PropTitle:SetVisibility(ESlateVisibility.Collapsed)
    elseif #r0_5.SpRewardsArray > 0 then
      r0_5.Panel_Prop:SetVisibility(ESlateVisibility.Collapsed)
      r0_5.Panel_Reward:SetVisibility(ESlateVisibility.Visible)
      r0_5.Text_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_5.Switcher:SetActiveWidgetIndex(1)
    end
  elseif #r0_5.SpRewardsArray > 0 or #r0_5.RewardsArray > 0 then
    r0_5.Panel_Reward:SetVisibility(ESlateVisibility.Visible)
    r0_5.Text_RewardTitle:SetText(GText("UI_DUNGEON_ObtainType"))
    r0_5.Panel_PropTitle:SetVisibility(ESlateVisibility.Visible)
    r0_5.Text_PropTitle:SetText(GText("UI_DUNGEON_Drops"))
  else
    r0_5.Switcher:SetActiveWidgetIndex(1)
  end
end
function r4_0.InitPlayersHighLightData(r0_6)
  -- line: [170, 501] id: 6
  if r0_6.IsParty then
    for r4_6 = 1, 4, 1 do
      r0_6["Data0" .. r4_6]:SetVisibility(ESlateVisibility.Collapsed)
    end
    local r1_6 = GWorld.GameInstance.ScenePlayers
    if r1_6 and #r1_6 <= 1 then
      return 
    end
    for r6_6, r7_6 in ipairs(r1_6) do
      if r0_6["TempleData0" .. r6_6] then
        r0_6["TempleData0" .. r6_6]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        r0_6["TempleData0" .. r6_6].Text_Index:SetText(r6_6)
        if r7_6.IsMainPlayer then
          r0_6["TempleData0" .. r6_6]:PlayAnimation(r0_6["TempleData0" .. r6_6].Player)
        else
          r0_6["TempleData0" .. r6_6]:PlayAnimation(r0_6["TempleData0" .. r6_6].Other)
        end
        if r0_6.CombatData.PartyPlayerCompleteTime[r6_6] then
          r0_6["TempleData0" .. r6_6]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          r0_6["TempleData0" .. r6_6].Text_Time:SetText(r0_6:GetTimeStr(r0_6.CombatData.PartyPlayerCompleteTime[r6_6]))
        else
          r0_6["TempleData0" .. r6_6].SizeBox_77:SetVisibility(ESlateVisibility.Collapsed)
          r0_6["TempleData0" .. r6_6].Text_Time:SetText(GText("UI_PARTY_PARKOUR_UNFINISH"))
        end
        if r6_6 == 1 then
          local r8_6 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_6["TempleData0" .. r6_6].Text_Index)
          r8_6:SetPosition(FVector2D(r8_6:GetPosition().X, r0_6["TempleData0" .. r6_6].TextPosY_No1))
          local r10_6 = r0_6["TempleData0" .. r6_6].Text_Index.Font
          r10_6.Size = r0_6["TempleData0" .. r6_6].TextSize_No1
          r0_6["TempleData0" .. r6_6].Text_Index:SetFont(r10_6)
        else
          local r8_6 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_6["TempleData0" .. r6_6].Text_Index)
          r8_6:SetPosition(FVector2D(r8_6:GetPosition().X, r0_6["TempleData0" .. r6_6].TextPosY_Other))
          local r10_6 = r0_6["TempleData0" .. r6_6].Text_Index.Font
          r10_6.Size = r0_6["TempleData0" .. r6_6].TextSize_Other
          r0_6["TempleData0" .. r6_6].Text_Index:SetFont(r10_6)
        end
      end
    end
    -- close: r2_6
    return 
  end
  if not r0_6.IsWin or r0_6.IsTemple then
    for r4_6 = 1, 4, 1 do
      r0_6["Data0" .. r4_6]:SetVisibility(ESlateVisibility.Collapsed)
    end
    return 
  end
  for r4_6 = 1, 4, 1 do
    r0_6["Data0" .. r4_6]:SetRenderOpacity(0)
  end
  if not r0_6.LevelDataPriority then
    r0_6.LevelDataPriority = {}
    for r6_6, r7_6 in pairs(DataMgr.LevelEnterData) do
      table.insert(r0_6.LevelDataPriority, {
        Name = r6_6,
        Priority = r7_6.Priority,
      })
    end
    -- close: r2_6
  end
  table.sort(r0_6.LevelDataPriority, function(r0_7, r1_7)
    -- line: [239, 241] id: 7
    return r0_7.Priority < r1_7.Priority
  end)
  local r1_6 = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {},
  }
  local r2_6 = {}
  for r7_6, r8_6 in ipairs(r0_6.LevelDataPriority) do
    table.insert(r2_6, {
      [r8_6.Name] = {},
    })
  end
  -- close: r3_6
  local r3_6 = {}
  for r8_6, r9_6 in ipairs(r0_6.LevelDataPriority) do
    r3_6[r8_6] = r9_6.Name
  end
  -- close: r4_6
  local r4_6 = 0
  local r5_6 = 0
  local r6_6 = {
    1,
    2,
    3,
    4
  }
  local r7_6 = GWorld.GameInstance.ScenePlayers
  local r8_6 = r0_6:FilterNpcInPhantoms(r0_6.CombatData.PhantomAttrInfos)
  local r9_6 = r0_6.CombatData.TeammateDamageInfos and {}
  if not r0_6.CombatData.TeammateNum then
    local r10_6 = 0
  end
  DebugPrint("thy   ScenePlayers")
  PrintTable(r7_6, 3)
  DebugPrint("thy   PhantomsData")
  PrintTable(r8_6, 5)
  DebugPrint("thy   TeammateData")
  PrintTable(r9_6, 5)
  local r11_6 = 0
  local r12_6 = 0
  r4_6 = r0_6.CombatData.TotalDamage
  r5_6 = r0_6.CombatData.TakedDamage
  if r8_6 then
    for r17_6, r18_6 in pairs(r8_6) do
      if r18_6 then
        r4_6 = r4_6 + r18_6.FinalDamage
        r5_6 = r5_6 + r18_6.TakedDamage
      end
    end
    -- close: r13_6
  end
  if r9_6 then
    for r17_6, r18_6 in pairs(r9_6) do
      if r18_6 then
        r4_6 = r4_6 + r18_6.FinalDamage
        r5_6 = r5_6 + r18_6.TakedDamage
        if r18_6.PhantomAttrInfo then
          if r18_6.PhantomAttrInfo.FinalDamage > 0 then
            r4_6 = r4_6 + r18_6.PhantomAttrInfo.FinalDamage
          end
          if r18_6.PhantomAttrInfo.TakedDamage > 0 then
            r5_6 = r5_6 + r18_6.PhantomAttrInfo.TakedDamage
          end
        end
      end
    end
    -- close: r13_6
  end
  local r13_6 = 0
  for r18_6, r19_6 in ipairs(r7_6) do
    if r19_6.IsMainPlayer or not r19_6.IsPhantom then
      r13_6 = r13_6 + 1
    end
  end
  -- close: r14_6
  if r13_6 > 1 then
    r0_6.CombatData.IsInOnlineDungeon = true
  else
    r0_6.CombatData.IsInOnlineDungeon = false
  end
  local r23_6 = nil	-- notice: implicit variable refs by block#[74, 96]
  local r24_6 = nil	-- notice: implicit variable refs by block#[84, 105, 113]
  local r25_6 = nil	-- notice: implicit variable refs by block#[123]
  if not r0_6.CombatData.IsInOnlineDungeon then
    for r18_6, r19_6 in ipairs(r7_6) do
      local r20_6 = r6_6[r18_6]
      if r19_6.IsMainPlayer then
        local r21_6 = r2_6[1].Damage
        local r22_6 = {
          PlayerIndex = r20_6,
        }
        if r4_6 ~= 0 then
          r23_6 = math.floor(r0_6.CombatData.TotalDamage / r4_6 * 100 + 0.5)
          if not r23_6 then
            ::label_479::
            r23_6 = 0
          end
        else
          goto label_479	-- block#73 is visited secondly
        end
        r22_6.Value = r23_6
        r21_6[r18_6] = r22_6
        r22_6 = {
          PlayerIndex = r20_6,
        }
        r23_6 = r0_6.CombatData.TotalKill
        r22_6.Value = r23_6
        r2_6[2].Kill[r18_6] = r22_6
        r21_6 = r2_6[3].Damaged
        r22_6 = {
          PlayerIndex = r20_6,
        }
        if r5_6 ~= 0 then
          r23_6 = math.floor(r0_6.CombatData.TakedDamage / r5_6 * 100 + 0.5) and 0
        else
          goto label_511	-- block#76 is visited secondly
        end
        r22_6.Value = r23_6
        r21_6[r18_6] = r22_6
        r2_6[4].Heal[r18_6] = {
          PlayerIndex = r20_6,
          Value = r0_6.CombatData.GiveHealing,
        }
        r2_6[5].DamageSingle[r18_6] = {
          PlayerIndex = r20_6,
          Value = r0_6.CombatData.MaxDamage,
        }
        r2_6[6].Destroy[r18_6] = {
          PlayerIndex = r20_6,
          Value = r0_6.CombatData.BreakableItemCount,
        }
        r22_6 = {
          PlayerIndex = r20_6,
        }
        r23_6 = r0_6.CombatData.MaxComboCount
        r22_6.Value = r23_6
        r2_6[7].HitCount[r18_6] = r22_6
      elseif r8_6 and #r8_6 > 0 then
        local r21_6 = r0_6:GetPhantomInfo(r19_6.RoleId, r8_6)
        if r21_6 then
          local r22_6 = r2_6[1].Damage
          r23_6 = {
            PlayerIndex = r20_6,
          }
          if r4_6 ~= 0 then
            r24_6 = math.floor(r21_6.FinalDamage / r4_6 * 100 + 0.5)
            if not r24_6 then
              ::label_581::
              r24_6 = 0
            end
          else
            goto label_581	-- block#83 is visited secondly
          end
          r23_6.Value = r24_6
          r22_6[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
          }
          r24_6 = r21_6.TotalKillCount
          r23_6.Value = r24_6
          r2_6[2].Kill[r18_6] = r23_6
          r22_6 = r2_6[3].Damaged
          r23_6 = {
            PlayerIndex = r20_6,
          }
          if r5_6 ~= 0 then
            r24_6 = math.floor(r21_6.TakedDamage / r5_6 * 100 + 0.5) and 0
          else
            goto label_611	-- block#86 is visited secondly
          end
          r23_6.Value = r24_6
          r22_6[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
            Value = r21_6.GiveHealing,
          }
          r2_6[4].Heal[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
          }
          r24_6 = r21_6.MaxDamage
          r23_6.Value = r24_6
          r2_6[5].DamageSingle[r18_6] = r23_6
        else
          DebugPrint("thy   PhantomData is nil", r19_6.RoleId)
          r0_6:CloseHighLightDataShow()
          return 
        end
      end
    end
    -- close: r14_6
  else
    for r18_6, r19_6 in ipairs(r7_6) do
      local r20_6 = r6_6[r18_6]
      if r19_6.IsMainPlayer then
        local r21_6 = r2_6[1].Damage
        local r22_6 = {
          PlayerIndex = r20_6,
        }
        if r4_6 ~= 0 then
          r23_6 = math.floor(r0_6.CombatData.TotalDamage / r4_6 * 100 + 0.5)
          if not r23_6 then
            ::label_670::
            r23_6 = 0
          end
        else
          goto label_670	-- block#95 is visited secondly
        end
        r22_6.Value = r23_6
        r21_6[r18_6] = r22_6
        r22_6 = {
          PlayerIndex = r20_6,
        }
        r23_6 = r0_6.CombatData.TotalKill
        r22_6.Value = r23_6
        r2_6[2].Kill[r18_6] = r22_6
        r21_6 = r2_6[3].Damaged
        r22_6 = {
          PlayerIndex = r20_6,
        }
        if r5_6 ~= 0 then
          r23_6 = math.floor(r0_6.CombatData.TakedDamage / r5_6 * 100 + 0.5) and 0
        else
          goto label_702	-- block#98 is visited secondly
        end
        r22_6.Value = r23_6
        r21_6[r18_6] = r22_6
        r2_6[4].Heal[r18_6] = {
          PlayerIndex = r20_6,
          Value = r0_6.CombatData.GiveHealing,
        }
        r2_6[5].DamageSingle[r18_6] = {
          PlayerIndex = r20_6,
          Value = r0_6.CombatData.MaxDamage,
        }
        r2_6[6].Destroy[r18_6] = {
          PlayerIndex = r20_6,
          Value = r0_6.CombatData.BreakableItemCount,
        }
        r22_6 = {
          PlayerIndex = r20_6,
        }
        r23_6 = r0_6.CombatData.MaxComboCount
        r22_6.Value = r23_6
        r2_6[7].HitCount[r18_6] = r22_6
      elseif not r19_6.IsPhantom then
        r11_6 = r11_6 + 1
        local r21_6 = r9_6[r11_6]
        if r21_6 then
          local r22_6 = r2_6[1].Damage
          r23_6 = {
            PlayerIndex = r20_6,
          }
          if r4_6 ~= 0 then
            r24_6 = math.floor(r21_6.FinalDamage / r4_6 * 100 + 0.5)
            if not r24_6 then
              ::label_769::
              r24_6 = 0
            end
          else
            goto label_769	-- block#104 is visited secondly
          end
          r23_6.Value = r24_6
          r22_6[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
          }
          r24_6 = r21_6.TotalKillCount
          r23_6.Value = r24_6
          r2_6[2].Kill[r18_6] = r23_6
          r22_6 = r2_6[3].Damaged
          r23_6 = {
            PlayerIndex = r20_6,
          }
          if r5_6 ~= 0 then
            r24_6 = math.floor(r21_6.TakedDamage / r5_6 * 100 + 0.5) and 0
          else
            goto label_799	-- block#107 is visited secondly
          end
          r23_6.Value = r24_6
          r22_6[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
            Value = r21_6.GiveHealing,
          }
          r2_6[4].Heal[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
            Value = r21_6.MaxDamage,
          }
          r2_6[5].DamageSingle[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
            Value = r21_6.BreakableItemCount,
          }
          r2_6[6].Destroy[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
          }
          r24_6 = r21_6.MaxComboCount
          r23_6.Value = r24_6
          r2_6[7].HitCount[r18_6] = r23_6
        end
      else
        local r21_6 = r0_6:GetPhantomInfo(r19_6.RoleId, r8_6)
        if r21_6 then
          local r22_6 = r2_6[1].Damage
          r23_6 = {
            PlayerIndex = r20_6,
          }
          if r4_6 ~= 0 then
            r24_6 = math.floor(r21_6.FinalDamage / r4_6 * 100 + 0.5)
            if not r24_6 then
              ::label_860::
              r24_6 = 0
            end
          else
            goto label_860	-- block#112 is visited secondly
          end
          r23_6.Value = r24_6
          r22_6[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
          }
          r24_6 = r21_6.TotalKillCount
          r23_6.Value = r24_6
          r2_6[2].Kill[r18_6] = r23_6
          r22_6 = r2_6[3].Damaged
          r23_6 = {
            PlayerIndex = r20_6,
          }
          if r5_6 ~= 0 then
            r24_6 = math.floor(r21_6.TakedDamage / r5_6 * 100 + 0.5) and 0
          else
            goto label_890	-- block#115 is visited secondly
          end
          r23_6.Value = r24_6
          r22_6[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
            Value = r21_6.GiveHealing,
          }
          r2_6[4].Heal[r18_6] = r23_6
          r23_6 = {
            PlayerIndex = r20_6,
          }
          r24_6 = r21_6.MaxDamage
          r23_6.Value = r24_6
          r2_6[5].DamageSingle[r18_6] = r23_6
        else
          local r22_6 = r9_6[1] and r9_6[1].PhantomAttrInfo
          if r22_6 then
            r23_6 = r2_6[1].Damage
            r24_6 = {
              PlayerIndex = r20_6,
            }
            if r4_6 ~= 0 then
              r25_6 = math.floor(r22_6.FinalDamage / r4_6 * 100 + 0.5)
              if not r25_6 then
                ::label_936::
                r25_6 = 0
              end
            else
              goto label_936	-- block#122 is visited secondly
            end
            r24_6.Value = r25_6
            r23_6[r18_6] = r24_6
            r24_6 = {
              PlayerIndex = r20_6,
            }
            r25_6 = r22_6.TotalKillCount
            r24_6.Value = r25_6
            r2_6[2].Kill[r18_6] = r24_6
            r23_6 = r2_6[3].Damaged
            r24_6 = {
              PlayerIndex = r20_6,
            }
            if r5_6 ~= 0 then
              r25_6 = math.floor(r22_6.TakedDamage / r5_6 * 100 + 0.5) and 0
            else
              goto label_966	-- block#125 is visited secondly
            end
            r24_6.Value = r25_6
            r23_6[r18_6] = r24_6
            r24_6 = {
              PlayerIndex = r20_6,
              Value = r22_6.GiveHealing,
            }
            r2_6[4].Heal[r18_6] = r24_6
            r23_6 = r2_6[5].DamageSingle
            r24_6 = {
              PlayerIndex = r20_6,
            }
            r25_6 = r22_6.MaxDamage
            r24_6.Value = r25_6
            r23_6[r18_6] = r24_6
          else
            DebugPrint("thy   TeammatePhantomData is nil", r19_6.RoleId)
            r0_6:CloseHighLightDataShow()
            return 
          end
        end
      end
    end
    -- close: r14_6
  end
  for r18_6, r19_6 in ipairs(r2_6) do
    local r21_6 = r19_6[r3_6[r18_6]]
    if r21_6 and #r21_6 > 1 then
      table.sort(r21_6, function(r0_8, r1_8)
        -- line: [432, 441] id: 8
        if not r0_8 then
          return false
        end
        if not r1_8 then
          return true
        end
        return r1_8.Value < r0_8.Value
      end)
    end
  end
  -- close: r14_6
  for r18_6, r19_6 in ipairs(r2_6[1].Damage) do
    r12_6 = r12_6 + r19_6.Value
  end
  -- close: r14_6
  if r12_6 > 0 then
    r2_6[1].Damage[1].Value = r2_6[1].Damage[1].Value + 100 - r12_6
  end
  local r14_6 = {
    Damage = false,
    Kill = false,
    Damaged = false,
    Heal = false,
    DamageSingle = false,
    Destroy = false,
    HitCount = false,
  }
  for r18_6 = 1, #r7_6, 1 do
    for r23_6, r24_6 in ipairs(r2_6) do
      r25_6 = r3_6[r23_6]
      local r26_6 = r24_6[r25_6][r18_6]
      if not r14_6[r25_6] and r26_6 and r26_6.Value ~= 0 then
        r1_6[r26_6.PlayerIndex][#r1_6[r26_6.PlayerIndex] + 1] = {
          DataName = r3_6[r23_6],
          Value = r26_6.Value,
        }
        r14_6[r25_6] = true
        DebugPrint("thy   PlayersCompensateTip", r26_6.PlayerIndex, r3_6[r23_6], r26_6.Value)
      end
    end
    -- close: r19_6
  end
  for r18_6 = 1, #r7_6, 1 do
    if r1_6[r6_6[r18_6]] and #r1_6[r6_6[r18_6]] == 0 then
      table.insert(r1_6[r6_6[r18_6]], {
        DataName = "Damage",
        Value = r0_6:GetDamageData(r6_6[r18_6], r2_6[1].Damage),
      })
    end
  end
  for r19_6, r20_6 in pairs(r1_6) do
    if CommonUtils.Size(r20_6) ~= 0 then
      r0_6["Data0" .. r19_6]:Init(r20_6[1])
    else
      r0_6["Data0" .. r19_6]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  -- close: r15_6
  for r19_6, r20_6 in ipairs(r7_6) do
    DebugPrint("thy   ScenePlayers", r19_6, r20_6.RoleId)
  end
  -- close: r15_6
  for r19_6, r20_6 in ipairs(r1_6) do
    if CommonUtils.Size(r20_6) ~= 0 then
      DebugPrint("thy PlayersShowTip", r19_6, r20_6[1].DataName, r20_6[1].Value)
    end
  end
  -- close: r15_6
end
function r4_0.CloseHighLightDataShow(r0_9)
  -- line: [504, 508] id: 9
  for r4_9 = 1, 4, 1 do
    r0_9["Data0" .. r4_9]:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.FilterNpcInPhantoms(r0_10, r1_10)
  -- line: [510, 518] id: 10
  local r2_10 = {}
  for r7_10, r8_10 in pairs(r1_10) do
    if r8_10 and 999 < r8_10.PhantomRoleId then
      table.insert(r2_10, r8_10)
    end
  end
  -- close: r3_10
  return r2_10
end
function r4_0.GetPhantomInfo(r0_11, r1_11, r2_11)
  -- line: [520, 527] id: 11
  for r7_11, r8_11 in pairs(r2_11) do
    if r1_11 == r8_11.PhantomRoleId then
      return r8_11
    end
  end
  -- close: r3_11
  return nil
end
function r4_0.GetDamageData(r0_12, r1_12, r2_12)
  -- line: [529, 536] id: 12
  for r7_12, r8_12 in ipairs(r2_12) do
    if r1_12 == r8_12.PlayerIndex then
      return r8_12.Value
    end
  end
  -- close: r3_12
  return 0
end
function r4_0.InitHeadline(r0_13)
  -- line: [539, 554] id: 13
  if r0_13.IsWin then
    local r1_13 = GText("UI_MISSION_COMPLETE")
    if r0_13.IsTemple or r0_13.IsParty then
      r1_13 = GText("UI_TEMPLE_COMPLETE")
    end
    if r0_13.IsHardBoss then
      r1_13 = GText("UI_HARDBOSS_COMPLETE")
    end
    r0_13.Text_HeadLine_Victory:SetText(r1_13)
    r0_13.VX_Text_HeadLine:SetText(r1_13)
  else
    r0_13.Text_HeadLine_Defeat:SetText(GText("UI_MISSION_FAIL"))
  end
end
function r4_0.InitDungeonClearanceTime(r0_14)
  -- line: [556, 562] id: 14
  local r1_14 = math.floor(r0_14.PlayerTime / 60)
  local r2_14 = math.floor(r0_14.PlayerTime % 60)
  r0_14.TimeDict = {}
  table.insert(r0_14.TimeDict, 1, {
    TimeType = "Min",
    TimeValue = r1_14,
  })
  table.insert(r0_14.TimeDict, 2, {
    TimeType = "Sec",
    TimeValue = r2_14,
  })
end
function r4_0.InitDungeonLevelIndex(r0_15)
  -- line: [564, 602] id: 15
  local r1_15 = r0_15:GetDungeonInfo(r0_15.BattleInfo)
  if r1_15.DungeonType and r1_15.DungeonType == "Temple" then
    return 
  end
  local r2_15 = UE4.UGameplayStatics.GetGameState(r0_15)
  if not r2_15 then
    return 
  end
  local r3_15 = nil
  if r0_15.IsWeeklyDungeon then
    r3_15 = DataMgr.WeeklyDungeonId2ChapterId[r2_15.DungeonId]
  else
    r3_15 = DataMgr.Dungeon2Select[r2_15.DungeonId]
  end
  if not r3_15 then
    return 
  end
  local r4_15 = nil
  if r0_15.IsWeeklyDungeon then
    r4_15 = DataMgr.WeeklySelectDungeon[r3_15].DungeonList
  else
    r4_15 = DataMgr.SelectDungeon[r3_15].DungeonList
  end
  if not r4_15 then
    return 
  end
  local r5_15 = 1
  for r10_15, r11_15 in pairs(r4_15) do
    if r11_15 == r2_15.DungeonId then
      r5_15 = r10_15
      goto label_63
    end
  end
  -- close: r6_15
  ::label_63::
  -- close: r6_15
  r0_15.DungeonLevelIndex = GText(Const.RomanNum[r5_15])
end
function r4_0.InitDungeonName(r0_16)
  -- line: [604, 645] id: 16
  local r1_16 = GWorld:GetAvatar()
  if not r1_16 then
    error("Avatar is nil")
  end
  r0_16.Describe = ""
  if r0_16.IsHardBoss then
    if GameState(r0_16):IsInRegion() then
      r0_16.Describe = GText(DataMgr.HardBossMain[r0_16.BattleInfo.HardBossId].HardBossName)
      r0_16.Describe = r0_16.Describe .. " " .. GText("UI_LEVEL_NAME")
      local r2_16 = r1_16.HardBossInfo.DifficultyId
      local r3_16 = ""
      if r2_16 and DataMgr.HardBossDifficulty[r2_16] then
        r3_16 = DataMgr.HardBossDifficulty[r2_16].DifficultyLevel
      end
      r0_16.Describe = r0_16.Describe .. r3_16
    else
      local r2_16 = DataMgr.HardBossDg[r0_16.DungeonId]
      if r2_16 then
        r0_16.Describe = GText(DataMgr.HardBossMain[r2_16.HardBossId].HardBossName)
        r0_16.Describe = r0_16.Describe .. " " .. GText("UI_LEVEL_NAME")
        local r3_16 = r2_16.DifficultyId
        local r4_16 = ""
        if r3_16 and DataMgr.HardBossDifficulty[r3_16] then
          r4_16 = DataMgr.HardBossDifficulty[r3_16].DifficultyLevel
        end
        r0_16.Describe = r0_16.Describe .. r4_16
      else
        r0_16.Describe = ""
      end
    end
  elseif r1_16:IsInDungeon() then
    r0_16.DungeonInfo = r0_16:GetDungeonInfo(r0_16.BattleInfo)
    r0_16.Describe = r0_16:GetDungeonName(r0_16.DungeonInfo)
    r0_16:InitDungeonLevelIndex()
  end
  if r0_16.DungeonLevelIndex then
    r0_16.Describe = r0_16.Describe .. r0_16.DungeonLevelIndex
    r0_16.DungeonLevelIndex = nil
  end
end
function r4_0.InitStageWidgets(r0_17)
  -- line: [647, 652] id: 17
  r0_17.Time:SetVisibility(ESlateVisibility.Visible)
end
function r4_0.InitStageInfo(r0_18)
  -- line: [654, 667] id: 18
  r0_18:InitStageWidgets()
  r0_18:InitDungeonClearanceTime()
  r0_18:InitDungeonName()
  r0_18.Time:SetTimeText(r0_18.Describe, r0_18.TimeDict)
  if r0_18.IsTemple or r0_18.IsParty then
    r0_18.Time.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
    r0_18.Time.Text_TimeDesc:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.InitMainButtons(r0_19)
  -- line: [669, 707] id: 19
  r0_19.Btn_Continue:SetText(GText("UI_MISSION_AGAIN"))
  r0_19.Btn_Continue:BindEventOnClicked(r0_19, r0_19.Continue)
  r0_19.Btn_Continue:BindForbidStateExecuteEvent(r0_19, r0_19.ForbidContinue)
  r0_19.Btn_Continue:SetDefaultGamePadImg("Y")
  if not r0_19:CheckAgainAvailable() then
    r0_19.Btn_Continue:ForbidBtn(true)
    r0_19.AgainNotAvailable = true
  end
  r0_19:AddDispatcher(EventID.OnDungeonsUpdate, r0_19, r0_19.OnWalnutDungeonUpdate)
  r0_19.Btn_Close:SetVisibility(ESlateVisibility.Visible)
  r0_19.Btn_Close:ForbidBtn(false)
  if not r0_19.IsTemple then
    r0_19.Btn_Close:SetText(GText("UI_Esc_ExitDungeon"))
  else
    r0_19.Btn_Close:SetText(GText("UI_Esc_ExitTemple"))
  end
  r0_19.Btn_Close:BindEventOnClicked(r0_19, r0_19.Exit)
  r0_19.Btn_Close:SetDefaultGamePadImg("B")
  if r0_19.IsWin then
    r0_19:BindToAnimationFinished(r0_19.Victory_In, {
      r0_19,
      r0_19.OnInAnimationFinished
    })
  else
    r0_19:BindToAnimationFinished(r0_19.Defeat_In, {
      r0_19,
      r0_19.OnInAnimationFinished
    })
  end
  if r0_19.Bar_Click then
    r0_19.Bar_Click:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.OnWalnutDungeonUpdate(r0_20)
  -- line: [709, 716] id: 20
  if not r0_20.IsWalnut then
    return 
  end
  r0_20.Btn_Continue:ForbidBtn(true)
  r0_20.AgainNotAvailable = true
end
function r4_0.InitActionPointInfo(r0_21)
  -- line: [718, 783] id: 21
  local r1_21 = GWorld:GetAvatar()
  if not r1_21 then
    error("Avatar is nil")
  end
  if r0_21.IsTemple then
    return 
  end
  r0_21.CurActionPoint = r1_21.ActionPoint
  local r2_21 = DataMgr.Dungeon[r0_21.DungeonId]
  local r3_21 = 0
  r0_21.DungeonCost = 0
  if r2_21 and r2_21.DungeonCost then
    r3_21 = r2_21.DungeonCost[1] and 0
  end
  if r1_21.bDungeonDoubleCost then
    r0_21.DungeonCost = r3_21 * 2
  else
    r0_21.DungeonCost = r3_21
  end
  if r0_21.IsHardBoss or r0_21.IsWeeklyDungeon then
    r0_21.Cost:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_21.Cost:InitContent({
    ResourceId = 103,
    bShowDenominator = true,
    CostText = nil,
    Denominator = r0_21.DungeonCost,
    Numerator = r0_21.CurActionPoint,
    KeyIconName = nil,
    Owner = r0_21,
  })
  r0_21.Cost.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(r0_21, r0_21.ItemMenuAnchorChanged)
  r0_21.Cost.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(r0_21, r0_21.ItemMenuAnchorChanged)
  r0_21.Cost:SetVisibility(ESlateVisibility.Visible)
end
function r4_0.InitHardBossOrWeekyDungeonInfo(r0_22)
  -- line: [785, 817] id: 22
  local r1_22 = GWorld:GetAvatar()
  if not r1_22 then
    error("Avatar is nil")
    return 
  end
  local r2_22 = nil
  local r3_22 = nil
  if r0_22.IsHardBoss then
    r2_22 = r1_22.HardBoss.HardBossRewardTimesLeft
    r3_22 = DataMgr.GlobalConstant.BossRewardRefresh.ConstantValue
    r0_22.Text_Times01:SetText(GText("UI_HardBoss_ChancesRemain"))
  elseif r0_22.IsWeeklyDungeon then
    r2_22 = r1_22.WeeklyDungeonRewardLeft
    r3_22 = DataMgr.GlobalConstant.DungeonRewardRefresh.ConstantValue
    r0_22.Text_Times01:SetText(GText("UI_WeeklyDungeon_ChancesRemain"))
  end
  if r2_22 and r3_22 then
    r0_22.Text_Times02:SetText(r2_22)
    r0_22.Text_Times04:SetText(math.floor(r3_22))
    if r2_22 <= 0 then
      r0_22.Text_Times02:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DD1C45"))
    end
    r0_22:ShowHardBossTimes(true)
    return 
  end
  r0_22:ShowHardBossTimes(false)
end
function r4_0.ShowHardBossTimes(r0_23, r1_23)
  -- line: [819, 825] id: 23
  local r2_23 = ESlateVisibility.Collapsed
  if r1_23 then
    r2_23 = ESlateVisibility.Visible
  end
  r0_23.TimesRemain:SetVisibility(r2_23)
end
function r4_0.InitDoubleModInfo(r0_24)
  -- line: [827, 874] id: 24
  local r1_24 = GWorld:GetAvatar()
  if not r1_24 then
    return false
  end
  if r1_24.ActivityTimeOpen and r1_24.ActivityTimeOpen[CommonConst.DoubleModDropEventID] and r1_24.DoubleModDrop[CommonConst.DoubleModDropEventID] then
    local r2_24 = nil
    local r3_24 = nil
    local r4_24, r5_24 = r0_24:IsDoubleModDungeon(CommonConst.DoubleModDropEventID)
    if not r4_24 and not r5_24 then
      return false
    end
    if r4_24 then
      r2_24 = DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue
      r3_24 = r2_24 - r1_24.DoubleModDrop[CommonConst.DoubleModDropEventID].DropTimes
      r0_24.Text_Times01:SetText(GText("UI_Event_ModDrop_DropRemain"))
    elseif r5_24 then
      r2_24 = DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue
      local r6_24 = r1_24.DoubleModDrop[CommonConst.DoubleModDropEventID]
      local r7_24 = r6_24 and r6_24.EliteRushTimes
      if not r7_24 then
        return false
      end
      r3_24 = r2_24 - r7_24
      r0_24.Text_Times01:SetText(GText("UI_Event_ModDrop_ChallengeRemain"))
    end
    r0_24.TimesRemain:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r5_24 and r3_24 == 0 then
      r0_24.Text_Times02:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DD1C45"))
      r0_24.Btn_Continue:ForbidBtn(true)
      r0_24.Btn_Continue:BindForbidStateExecuteEvent(r0_24, function()
        -- line: [858, 860] id: 25
        UIManager(r0_24):ShowUITip("CommonToastMain", GText("UI_Event_ModDrop_Exhausted"))
      end)
    end
    r0_24.Text_Times02:SetText(r3_24)
    r0_24.Text_Times04:SetText(r2_24)
  else
    local r2_24, r3_24 = r0_24:IsDoubleModDungeon(CommonConst.DoubleModDropEventID)
    if r3_24 then
      r0_24.Btn_Continue:ForbidBtn(true)
      r0_24.Btn_Continue:BindForbidStateExecuteEvent(r0_24, function()
        -- line: [869, 871] id: 26
        UIManager(r0_24):ShowUITip("CommonToastMain", GText("UI_Event_ModDrop_Exhausted"))
      end)
    end
  end
end
function r4_0.IsDoubleModDungeon(r0_27, r1_27)
  -- line: [876, 894] id: 27
  local r2_27 = false
  local r3_27 = false
  if not DataMgr.DoubleModDrop[r1_27] then
    return r2_27, r3_27
  end
  for r8_27, r9_27 in pairs(DataMgr.DoubleModDrop[r1_27].ModDungeonId) do
    if r9_27 == r0_27.DungeonId then
      r2_27 = true
      return r2_27, r3_27
    end
  end
  -- close: r4_27
  for r8_27, r9_27 in pairs(DataMgr.DoubleModDrop[r1_27].EliteRushDungeonId) do
    if r9_27 == r0_27.DungeonId then
      r3_27 = true
      return r2_27, r3_27
    end
  end
  -- close: r4_27
  return r2_27, r3_27
end
function r4_0.InitSwitchPanelContent(r0_28)
  -- line: [896, 907] id: 28
  if not r0_28.IsTemple then
    r0_28.Btn_Data:SetVisibility(ESlateVisibility.Visible)
    r0_28.Btn_Data:BindEventOnClicked(r0_28, r0_28.OnBtnChangePanelClicked)
    r0_28.Btn_Data:SetCurrentTextBlock("UI_BATTLE_DATA")
    r0_28.Text_None:SetText(GText("UI_NONE"))
    r0_28:ActivateDropPanelScrolling(false, r0_28.TileView_Reward)
    r0_28:ActivateDropPanelScrolling(false, r0_28.TileView_Prop)
    r0_28.EMScrollBox_255:SetScrollBarVisibility(ESlateVisibility.Collapsed)
    r0_28.EMScrollBox_255:SetControlScrollbarInside(true)
  end
end
function r4_0.OnBtnChangePanelClicked(r0_29)
  -- line: [909, 923] id: 29
  local r2_29 = UE4.UGameplayStatics.GetGameInstance(r0_29):GetGameUIManager()
  if r2_29 then
    r0_29.Popup_CombatData = r2_29:ShowCommonPopupUI(Const.Popup_CombatData, {
      OnCloseCallbackObj = r0_29,
      OnCloseCallbackFunction = r0_29.OnCombatDataClosed,
    }, r0_29)
    r0_29.Popup_CombatData:SetVisibility(ESlateVisibility.Collapsed)
    r0_29.Popup_CombatData:ShowGamepadScrollBtn(true)
    r0_29:CreateCombatData()
  end
end
function r4_0.OnCombatDataClosed(r0_30)
  -- line: [925, 929] id: 30
end
function r4_0.CreateCombatData(r0_31)
  -- line: [931, 944] id: 31
  for r4_31 = 0, r0_31.Popup_CombatData.VB_Node:GetChildrenCount() + -1, 1 do
    local r5_31 = r0_31.Popup_CombatData.VB_Node:GetChildAt(r4_31)
    if r5_31.EMScrollBox_31 ~= nil then
      r0_31.Panel_CombatData = r5_31
      break
    end
  end
  r0_31:SetDetailsContent()
  r0_31.Popup_CombatData:SetVisibility(ESlateVisibility.Visible)
  r0_31.Panel_CombatData.EMScrollBox_31:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  r0_31.Panel_CombatData.EMScrollBox_31:SetControlScrollbarInside(true)
  r0_31.Panel_CombatData:SetFocus()
end
function r4_0.SetAllUIVisibility(r0_32, r1_32)
  -- line: [946, 956] id: 32
  local r3_32 = UE4.UGameplayStatics.GetGameInstance(r0_32):GetGameUIManager()
  if r3_32 then
    r3_32:HideAllUI_EX({
      r0_32:GetName(),
      "DungeonMatchTimingBar"
    }, r1_32, r0_32.HideUITag, false)
  end
  local r4_32 = r3_32:GetUIObj(UIConst.DestroyAlarmName)
  if r4_32 then
    AudioManager(r0_32):StopSound(r4_32, "BattleWarning")
  end
end
function r4_0.OnProgressBarAnimFinished(r0_33)
  -- line: [958, 962] id: 33
  r0_33.Btn_Continue:SetVisibility(ESlateVisibility.Visible)
  r0_33.Btn_Close:SetVisibility(ESlateVisibility.Visible)
end
function r4_0.OnInAnimationFinished(r0_34)
  -- line: [964, 983] id: 34
  if r0_34.IsTemple or r0_34.IsParty then
    r0_34.IsFirstFocus = false
    return 
  else
    for r5_34, r6_34 in pairs(r0_34.RoleItemInfos) do
      r6_34.Widget:PlayExpAnim()
    end
    -- close: r1_34
    if r0_34.CurInputDeviceType == ECommonInputType.Gamepad then
      r0_34:AddTimer(1.5, function()
        -- line: [977, 979] id: 35
        r0_34:SetFocusInGamePad()
      end)
    end
    r0_34.IsFirstFocus = false
  end
end
function r4_0.OnProgressBarAnimationFinished(r0_36)
  -- line: [985, 988] id: 36
  r0_36.Btn_Close:SetVisibility(ESlateVisibility.Visible)
  r0_36.Btn_Close:ForbidBtn(false)
end
function r4_0.ForbidContinue(r0_37)
  -- line: [990, 999] id: 37
  DebugPrint("DungeonSettlement: ClickContinueButton Forbid")
  if not r0_37.IsWalnut then
    return 
  end
  if not r0_37.AgainNotAvailable then
    return 
  end
  GameState(r0_37):ShowDungeonToast_Lua("UI_WALNUTDUNGEON_REFRESH_TOAST", 2, EToastType.Common)
end
function r4_0.Continue(r0_38)
  -- line: [1001, 1050] id: 38
  DebugPrint("DungeonSettlement: ClickContinueButton")
  if r0_38.IsTemple then
    r0_38:DefaultContinue()
    return 
  end
  if not r0_38:CheckAgainAvailable() then
    r0_38.Btn_Continue:ForbidBtn(true)
    r0_38.AgainNotAvailable = true
    r0_38:ForbidContinue()
    return 
  end
  if r0_38.CurActionPoint < r0_38.DungeonCost then
    UIUtils.ShowActionRecover(r0_38)
    return 
  end
  local r1_38 = GWorld:GetAvatar()
  if r0_38.IsHardBoss then
    local r2_38 = r1_38.HardBoss.HardBossRewardTimesLeft and 0
    local r3_38 = r0_38:CheckNeedShowWindow("IsBossBattlePopup")
    local r4_38 = 1
    if GameState(r0_38):IsInRegion() then
      r4_38 = r1_38.HardBossInfo.DifficultyId
    else
      r4_38 = DataMgr.HardBossDg[r0_38.DungeonId].DifficultyId
    end
    if r2_38 > 0 or r3_38 or r1_38 and r4_38 and r1_38.HardBoss:GetPassCount(r4_38) == 0 then
      r0_38:DefaultContinue()
    else
      r0_38:ShowConfirmWindow()
    end
  elseif r1_38 and r0_38.IsWeeklyDungeon then
    local r2_38 = r1_38.WeeklyDungeonRewardLeft and 0
    local r3_38 = r0_38:CheckNeedShowWindow("IsWeeklyDungeonPopup")
    if r2_38 > 0 or r3_38 then
      r0_38:DefaultContinue()
    else
      r0_38:ShowConfirmWindow()
    end
  else
    r0_38:DefaultContinue()
  end
end
function r4_0.CheckNeedShowWindow(r0_39, r1_39)
  -- line: [1053, 1060] id: 39
  local r2_39 = r0_0:Get(r1_39 .. "NoMorePrompts", true) and false
  if r2_0 and r2_39 then
    r2_39 = r2_0.IsTimestampInCurrentWeek(r0_0:Get(r1_39 .. "Timestamp", true))
  end
  return r2_39
end
function r4_0.DefaultContinue(r0_40)
  -- line: [1062, 1084] id: 40
  local r1_40 = GWorld:GetAvatar()
  if not r1_40 then
    return 
  end
  if not r1_40:IsInNarrowDungeon() then
    r0_40:RequestServerContinue()
    return 
  end
  if r0_40.IsWalnut and r0_40:IsStandAloneSolo() then
    DebugPrint("ljl@WBP_DungeonSettlement_C M:DefaultContinue StandAloneSolo")
    r0_40:AddDispatcher(EventID.SelectedWalnut, r0_40, r0_40.OnStandAloneSoloSelectedWalnut)
    UIManager(r0_40):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Settlement, r0_40.DungeonId, GWorld.GameInstance.CombatData.TempTeamInfo)
  else
    DebugPrint("ljl@WBP_DungeonSettlement_C M:DefaultContinue Other")
    r0_40:TryEnterDungeonAgain()
  end
end
function r4_0.OnStandAloneSoloSelectedWalnut(r0_41)
  -- line: [1086, 1091] id: 41
  r0_41:RemoveDispatcher(EventID.SelectedWalnut)
  DebugPrint("ljl@WBP_DungeonSettlement_C M:OnStandAloneSoloSelectedWalnut")
  r0_41.Btn_Continue:ForbidBtn(true)
  r0_41:TryEnterDungeonAgain()
end
function r4_0.RequestServerContinue(r0_42, r1_42)
  -- line: [1119, 1124] id: 42
  r0_42:BlockAllUIInput(true)
  local r2_42 = GWorld:GetAvatar()
  local r3_42 = r2_42.Dungeons[r0_42.DungeonId]
  local r6_42 = r0_42.BattleInfo
  local r7_42 = CommonUtils.Bind(r0_42, r0_42.DefaultContinueCallBack)
  local r8_42 = r1_42
  local r9_42 = nil	-- notice: implicit variable refs by block#[3]
  if r3_42 then
    r9_42 = r3_42.Squad
    if not r9_42 then
      ::label_22::
      r9_42 = nil
    end
  else
    goto label_22	-- block#2 is visited secondly
  end
  r2_42:ContinueDungeonSettlement(r6_42, r7_42, r8_42, r9_42)
end
function r4_0.DefaultContinueCallBack(r0_43, r1_43)
  -- line: [1126, 1137] id: 43
  DebugPrint("DungeonSettlement: ContinueCallBack")
  r0_43:BlockAllUIInput(false)
  if r1_43 == ErrorCode.RET_SUCCESS then
    r0_43:OnCloseSettlementUI()
    return 
  end
  local r2_43 = DataMgr.ErrorCode[r1_43]
  if r2_43 ~= nil then
    UIManager(r0_43):ShowError(r2_43, 1.5)
  else
    UIManager(r0_43):ShowError(DataMgr.ErrorCode[-1], 1.5)
  end
end
function r4_0.Exit(r0_44)
  -- line: [1139, 1145] id: 44
  DebugPrint("DungeonSettlement: ClickExitButton")
  r0_44:BlockAllUIInput(true)
  GWorld:GetAvatar():ExitDungeonSettlement()
  EventManager:AddEvent(EventID.OnExitDungeon, r0_44, r0_44.DefaultExit)
end
function r4_0.DefaultExit(r0_45)
  -- line: [1147, 1160] id: 45
  DebugPrint("DungeonSettlement: ExitCallBack")
  EventManager:RemoveEvent(EventID.OnExitDungeon, r0_45)
  r0_45:BlockAllUIInput(false)
  r0_45:OnCloseSettlementUI()
  local r1_45 = r0_45:GetDeputeType()
  if r1_45 then
    local r2_45 = GWorld.GameInstance:GetExitDungeonData() and {}
    r2_45.Type = "Depute"
    r2_45.DeputeType = r1_45
    GWorld.GameInstance:SetExitDungeonData(r2_45)
  end
end
function r4_0.OnCloseSettlementUI(r0_46)
  -- line: [1163, 1184] id: 46
  r0_46:SetAllUIVisibility(false)
  USkillFeatureFunctionLibrary.SKillFeatureForceStop()
  local r1_46 = UE4.UGameplayStatics.GetPlayerCharacter(r0_46, 0)
  if r1_46 then
    r1_46:SetCanInteractiveTrigger(true)
    r1_46.PlayerAnimInstance:Montage_Stop(0)
  end
  UE4.UGameplayStatics.GetGameInstance(r0_46):ProcessSettlementCharacter()
  if r0_46.IsWin == false then
    AudioManager(r0_46):StopSound(r1_46, "FailedPlayerCharAudio")
  else
    AudioManager(r0_46):StopSound(r0_46, "WinSettlement")
  end
  r0_46:SetCharDirLight(false)
  r0_46:Close()
end
function r4_0.GetDeputeType(r0_47)
  -- line: [1187, 1216] id: 47
  for r5_47, r6_47 in pairs(DataMgr.SelectDungeon and {}) do
    for r11_47, r12_47 in pairs(r6_47.DungeonList and {}) do
      if r12_47 == r0_47.DungeonId then
        return "Regular"
      end
    end
    -- close: r7_47
  end
  -- close: r1_47
  for r5_47, r6_47 in pairs(DataMgr.ModDungeonMonReward and {}) do
    for r11_47, r12_47 in pairs(r6_47.DungeonList and {}) do
      if r12_47 == r0_47.DungeonId then
        return "NightBook"
      end
    end
    -- close: r7_47
  end
  -- close: r1_47
  for r5_47, r6_47 in pairs(DataMgr.WalnutSelectDungeon and {}) do
    for r11_47, r12_47 in pairs(r6_47.DungeonId and {}) do
      if r12_47 == r0_47.DungeonId then
        return "Walnut"
      end
    end
    -- close: r7_47
  end
  -- close: r1_47
  return nil
end
function r4_0.CalcRoleAndRewardsInfo(r0_48)
  -- line: [1218, 1227] id: 48
  local r1_48 = GWorld:GetAvatar()
  if not r1_48 then
    return 
  end
  r0_48:CalcRoleInfo(r1_48)
  r0_48:PreInitPropInfo()
end
function r4_0.CalcRoleInfo(r0_49, r1_49)
  -- line: [1229, 1244] id: 49
  local r2_49 = r0_49:SetIncrsExps(r0_49.Rewards.Exps)
  for r7_49, r8_49 in pairs(r0_49.RoleItemInfos) do
    local r9_49 = r0_49.CombatData.OldBattleInfo[r7_49 .. "_OldBattleInfo"]
    local r10_49 = r0_49.CombatData.CurBattleInfo[r7_49 .. "_CurBattleInfo"]
    if r2_49[r7_49] == 0 then
      r10_49 = {
        Exp = r9_49.Exp,
        Level = r9_49.Level,
      }
    end
    r8_49.Widget:SetItem(r9_49, r7_49, r2_49[r7_49], false, r10_49, r0_49.IsNoExpDungeon)
    r8_49.Widget:SetVisibility(ESlateVisibility.Visible)
    r8_49.Widget:PlayInAnimation()
  end
  -- close: r3_49
end
function r4_0.PreInitPropInfo(r0_50)
  -- line: [1246, 1250] id: 50
  r0_50.Switcher:SetActiveWidgetIndex(0)
  r0_50.TileView_Reward:ClearListItems()
  r0_50.TileView_Prop:ClearListItems()
end
function r4_0.InitRewardsInfo(r0_51, r1_51, r2_51)
  -- line: [1252, 1294] id: 51
  local r3_51, r4_51 = UIUtils.GetTileViewContentMaxCount(r2_51, "XY", true)
  local r5_51 = #r1_51
  if r5_51 < 1 and #r0_51.SpRewardsArray == 0 and #r0_51.RewardsArray == 0 then
    r0_51.Switcher:SetActiveWidgetIndex(1)
  else
    if r0_51.IsHardBoss then
      r4_51 = math.max(r0_51.EmptyLine and 0, r4_51)
    end
    local r6_51 = r4_51 * r3_51
    if r6_51 < r5_51 then
      local r7_51 = r5_51 // r3_51
      if r5_51 % r3_51 ~= 0 then
        r7_51 = r7_51 + 1
      end
      r6_51 = r7_51 * r3_51
    end
    local r7_51 = r2_51:GetName()
    r0_51.IsAllowPropInAnimation = true
    local function r8_51()
      -- line: [1279, 1290] id: 52
      local r0_52 = r2_51:GetNumItems()
      if r0_52 < r6_51 then
        r2_51:AddItem(r0_51:NewPropContent(r1_51[r0_52 + 1], r2_51))
      else
        r0_51:RemoveTimer(r7_51, true)
        r2_51:SetVisibility(UIConst.VisibilityOp.Visible)
        r0_51.IsAllowPropInAnimation = false
      end
      r2_51:SetEmptyGridItemCount(math.max(0, r0_52 - r5_51))
    end
    r2_51:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_51:AddTimer(r0_51.IntervalTime, r8_51, true, r0_51.FirstDelayTime, r7_51, true)
    -- close: r6_51
  end
end
function r4_0.InitRefundInfo(r0_53, r1_53)
  -- line: [1296, 1316] id: 53
  if not r1_53 then
    DebugPrint("thy  UnCostItemsInfo is nil")
    return 
  end
  r0_53.RefundItemsInfo = {}
  for r6_53, r7_53 in pairs(r1_53) do
    for r12_53, r13_53 in pairs(r7_53) do
      r0_53.RefundItemsInfo[r6_53] = r13_53
    end
    -- close: r8_53
  end
  -- close: r2_53
  r0_53.Refund:SetVisibility(ESlateVisibility.Visible)
  r0_53.Refund:InitRefund(r0_53.RefundItemsInfo)
  GWorld.GameInstance.UnCostItemsInfo = nil
end
function r4_0.CalcPropInfo(r0_54)
  -- line: [1319, 1350] id: 54
  r0_54:ShowCountDown()
  if r0_54.IsTemple then
    return 
  end
  r0_54.TileView_Reward:DisableScroll(true)
  r0_54.TileView_Prop:DisableScroll(true)
  r0_54:AddTimer(0.01, function()
    -- line: [1327, 1347] id: 55
    r0_54:InitRewardsInfo(r0_54.SpRewardsArray, r0_54.TileView_Reward)
    r0_54:InitRewardsInfo(r0_54.RewardsArray, r0_54.TileView_Prop)
    if not r0_54.IsWin then
      if r0_54.IsHardBoss then
        if GameState(r0_54):IsInRegion() then
          r0_54.FailTips:InitialTips(r0_54.BattleInfo.HardBossId, true)
        else
          r0_54.FailTips:InitialTips(DataMgr.HardBossDg[r0_54.DungeonId].HardBossId, true)
        end
      else
        r0_54.FailTips:InitialTips(r0_54.DungeonId, false)
      end
      if CommonUtils.Size(DataMgr.FailureGuidance) > 7 then
        r0_54.FailTipsNum = CommonUtils.Size(DataMgr.FailureGuidance)
        r0_54.CurFailTipIndex = 0
      end
      r0_54:InitRefundInfo(GWorld.GameInstance.UnCostItemsInfo)
    end
  end)
  r0_54:UpdateMainUI()
end
function r4_0.SetDetailsContent(r0_56)
  -- line: [1352, 1364] id: 56
  r0_56.Widget_DetailsTime = r0_56:InitDataContent(GText("UI_STAT_Time"), r0_56:GetTimeStr(r0_56.PlayerTime))
  r0_56:SetOnlineDetails()
  r0_56:SetDamageDetails()
  r0_56:SetKillDetails()
  r0_56:SetTakedDamageDetails()
  r0_56:SetPhantomAttrsDetails()
  r0_56:SetOtherDetails()
  r0_56.Widget_DeadCount = r0_56:InitDataContent(GText("UI_STAT_DEAD"), tostring(r0_56.CombatData.DeadCount and 0))
end
function r4_0.SetOtherDetails(r0_57)
  -- line: [1366, 1397] id: 57
  r0_57.Widget_Other = r0_57:InitDataContent(GText("UI_STAT_Other"))
  r0_57:WrapedInitChildDetailContentFunc(r0_57.Widget_Other, {
    {
      Name = GText("UI_STAT_ActionPoint_Cost"),
      Value = r0_57.CombatData.SpConsume,
    },
    {
      Name = GText("UI_STAT_Bullets_Cost"),
      Value = r0_57.CombatData.BulletConsume,
    },
    {
      Name = GText("UI_STAT_Chest"),
      Value = r0_57.CombatData.ChestOpenedCount,
    },
    {
      Name = GText("UI_STAT_Destructible"),
      Value = r0_57.CombatData.BreakableItemCount,
    },
    {
      Name = GText("UI_STAT_Combo_Max"),
      Value = r0_57.CombatData.MaxComboCount,
    },
    {
      Name = GText("UI_STAT_Damage_Max"),
      Value = r0_57.CombatData.MaxDamage,
    }
  }, 6)
end
function r4_0.SetOnlineDetails(r0_58)
  -- line: [1399, 1439] id: 58
  if not r0_58.CombatData.IsInOnlineDungeon then
    return 
  end
  local r1_58 = ""
  local r2_58 = r0_58.CombatData.TeammateDamageInfos
  local r3_58 = r0_58.CombatData.TeammateNum
  if not TeamController:GetModel() then
    return 
  end
  local r5_58 = {}
  for r10_58, r11_58 in pairs(r2_58) do
    if r11_58 and r11_58.Index then
      r5_58[r11_58.Index] = r11_58
    end
  end
  -- close: r6_58
  table.sort(r5_58)
  for r10_58, r11_58 in pairs(r5_58) do
    if r1_58 == "" then
      r1_58 = GText("UI_STAT_Online_P" .. r10_58)
    else
      r1_58 = r1_58 .. "、" .. GText("UI_STAT_Online_P" .. r10_58)
    end
  end
  -- close: r6_58
  r0_58.Widget_OnlineDetails = r0_58:InitDataContent(GText("UI_STAT_Online"), r1_58)
  for r10_58, r11_58 in pairs(r5_58) do
    r0_58:WrapedInitChildDetailContentFunc(r0_58.Widget_OnlineDetails, {
      {
        Name = GText("UI_STAT_Online_Damage_" .. r10_58 .. "P"),
        Value = r11_58.FinalDamage,
      },
      {
        Name = GText("UI_STAT_Online_Kill_" .. r10_58 .. "P"),
        Value = r11_58.TotalKillCount,
      }
    }, 2)
  end
  -- close: r6_58
end
function r4_0.SetPhantomAttrsDetails(r0_59)
  -- line: [1441, 1472] id: 59
  local r1_59 = r0_59.CombatData.PhantomAttrInfos
  local r2_59 = r0_59.CombatData.PhantomNum
  if not GWorld.Battle then
    DebugPrint("[THY]  Battle为nil")
    return 
  end
  if r2_59 == 0 then
    DebugPrint("[THY]  没有魅影")
    return 
  end
  local r4_59 = {}
  for r9_59, r10_59 in pairs(r1_59) do
    if r10_59 and r10_59.PhantomRoleId and 999 < r10_59.PhantomRoleId then
      r0_59["Widget_PhantomDetails" .. r9_59] = r0_59:InitDataContent(GText("UI_STAT_Sigil"), GText(DataMgr.Char[r10_59.PhantomRoleId].CharName))
      r4_59 = {
        {
          Name = GText("UI_STAT_Sigil_DAMAGE"),
          Value = r10_59.FinalDamage,
        },
        {
          Name = GText("UI_STAT_Sigil_SUFFER"),
          Value = r10_59.TakedDamage,
        },
        {
          Name = GText("UI_STAT_Sigil_KILL"),
          Value = r10_59.TotalKillCount,
        },
        {
          Name = GText("UI_STAT_Sigil_DEAD"),
          Value = r10_59.DeathCount,
        }
      }
      r0_59:WrapedInitChildDetailContentFunc(r0_59["Widget_PhantomDetails" .. r9_59], r4_59, 4)
    end
  end
  -- close: r5_59
end
function r4_0.SetTakedDamageDetails(r0_60)
  -- line: [1474, 1495] id: 60
  local r1_60 = r0_60.CombatData.TakeDamagePercentage
  local r2_60 = r3_0.Round(r0_60.CombatData.TakedDamage)
  local r3_60 = r0_60.CombatData.TakedShieldDamage
  local r4_60 = r0_60.CombatData.TakedHeal
  local r5_60 = tostring(r3_0.Round(r2_60))
  if not IsStandAlone(r0_60) then
    r5_60 = r5_60 .. "(" .. r3_0.Round(r1_60 * 100) .. "%)"
  end
  r0_60.Widget_TotalDamage = r0_60:InitDataContent(GText("UI_STAT_SUFFER"), r5_60)
  r0_60:WrapedInitChildDetailContentFunc(r0_60.Widget_TotalDamage, {
    {
      Name = GText("UI_STAT_Shield"),
      Value = r3_60,
    },
    {
      Name = GText("UI_STAT_Healing"),
      Value = r4_60,
    }
  }, 2)
end
function r4_0.SetDamageDetails(r0_61)
  -- line: [1497, 1530] id: 61
  local r1_61 = r0_61.CombatData.DamagePercentage and 0
  local r2_61 = r0_61.CombatData.TotalDamage and 0
  local r3_61 = r0_61.CombatData.MeleeDamage and 0
  local r4_61 = r0_61.CombatData.RangedDamage and 0
  local r5_61 = r0_61.CombatData.SkillDamage and 0
  local r6_61 = r0_61.CombatData.SupportDamage and 0
  local r7_61 = tostring(r3_0.Round(r2_61))
  if not IsStandAlone(r0_61) then
    r7_61 = r7_61 .. "(" .. r3_0.Round(r1_61 * 100) .. "%)"
  end
  r0_61.Widget_DamageDetail = r0_61:InitDataContent(GText("UI_STAT_DAMAGE_TITLE"), r7_61)
  local r8_61 = {
    {
      Name = GText("UI_STAT_DAMAGE_MELEE"),
      Value = r3_61,
    },
    {
      Name = GText("UI_STAT_DAMAGE_RANGE"),
      Value = r4_61,
    },
    {
      Name = GText("UI_STAT_DAMAGE_CHAR"),
      Value = r5_61,
    },
    {
      Name = GText("UI_STAT_DAMAGE_Pet"),
      Value = r6_61,
    }
  }
  table.sort(r8_61, function(r0_62, r1_62)
    -- line: [1525, 1527] id: 62
    return r1_62.Value < r0_62.Value
  end)
  r0_61:WrapedInitChildDetailContentFunc(r0_61.Widget_DamageDetail, r8_61, 4)
end
function r4_0.SetKillDetails(r0_63)
  -- line: [1532, 1560] id: 63
  local r1_63 = r0_63.CombatData.TotalKill and 0
  local r2_63 = r0_63.CombatData.MeleeKill and 0
  local r3_63 = r0_63.CombatData.RangedKill and 0
  local r4_63 = r0_63.CombatData.SkillKill and 0
  local r5_63 = r0_63.CombatData.SupportKill and 0
  r0_63.Widget_KillDetail = r0_63:InitDataContent(GText("UI_STAT_KILL_TITLE"), tostring(r3_0.Round(r1_63)))
  local r6_63 = {
    {
      Name = GText("UI_STAT_KILL_MELEE"),
      Value = r2_63,
    },
    {
      Name = GText("UI_STAT_KILL_RANGE"),
      Value = r3_63,
    },
    {
      Name = GText("UI_STAT_KILL_CHAR"),
      Value = r4_63,
    },
    {
      Name = GText("UI_STAT_KILL_Pet"),
      Value = r5_63,
    }
  }
  table.sort(r6_63, function(r0_64, r1_64)
    -- line: [1555, 1557] id: 64
    return r1_64.Value < r0_64.Value
  end)
  r0_63:WrapedInitChildDetailContentFunc(r0_63.Widget_KillDetail, r6_63, 4)
end
function r4_0.WrapedInitChildDetailContentFunc(r0_65, r1_65, r2_65, r3_65)
  -- line: [1570, 1578] id: 65
  local r4_65 = true
  local r5_65 = r0_65:InitTargetContents(r1_65, r3_65)
  for r9_65 = 1, #r5_65, 1 do
    local r10_65 = r2_65[r9_65]
    r0_65:SetTargetContent(r5_65[r9_65], r10_65.Name, r10_65.Value, r4_65)
    r4_65 = not r4_65
  end
end
function r4_0.InitDataContent(r0_66, r1_66, r2_66)
  -- line: [1580, 1585] id: 66
  local r3_66 = r0_66:CreateWidgetNew("DungeonSettlementData")
  r0_66:SetTitleContent(r3_66.Title, r1_66, r2_66)
  r0_66.Panel_CombatData.EMScrollBox_31:AddChild(r3_66)
  return r3_66
end
function r4_0.InitTargetContents(r0_67, r1_67, r2_67)
  -- line: [1587, 1595] id: 67
  local r3_67 = {}
  for r7_67 = 1, r2_67, 1 do
    local r8_67 = r0_67:CreateWidgetNew("DungeonSettlementTarget")
    r1_67.SubTitle:AddChildToVerticalBox(r8_67)
    r3_67[r7_67] = r8_67
  end
  return r3_67
end
function r4_0.SetTitleContent(r0_68, r1_68, r2_68, r3_68)
  -- line: [1598, 1601] id: 68
  r1_68.Text_Main:SetText(r2_68)
  r1_68.Text_Number:SetText(r3_68)
end
function r4_0.SetTargetContent(r0_69, r1_69, r2_69, r3_69, r4_69)
  -- line: [1604, 1614] id: 69
  r1_69.Text_Main:SetText(r2_69)
  if r3_69 then
    r1_69.Text_Number:SetText(r3_0.Round(r3_69))
  end
  if r4_69 then
    r1_69.Bg:SetVisibility(ESlateVisibility.Collapsed)
  else
    r1_69.Bg:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end
function r4_0.SetIncrsExps(r0_70, r1_70)
  -- line: [1616, 1640] id: 70
  local r2_70 = {}
  for r7_70, r8_70 in pairs(r0_70.RoleItemInfos) do
    r2_70[r7_70] = 0
  end
  -- close: r3_70
  if not r1_70 then
    return r2_70
  end
  for r7_70, r8_70 in pairs(r1_70) do
    local r9_70 = r1_0:GetCount(r8_70)
    if r7_70 == CommonConst.CharExpItemId then
      r2_70.Char = r9_70
    elseif r7_70 == CommonConst.MeleeWeaponExpItemId then
      r2_70.MeleeWeapon = r9_70
    elseif r7_70 == CommonConst.RangedWeaponExpItemId then
      r2_70.RangedWeapon = r9_70
    elseif r7_70 == CommonConst.PlayerExpId then
      r2_70.Player = r9_70
    end
  end
  -- close: r3_70
  return r2_70
end
function r4_0.RewardsAddToArray(r0_71, r1_71, r2_71, r3_71)
  -- line: [1642, 1706] id: 71
  if not r2_71 then
    return 
  end
  for r9_71, r10_71 in pairs(DataMgr.RewardType) do
    if r10_71.DungeonRewardType then
      local r11_71 = r2_71[r9_71 .. "s"]
      if r11_71 then
        for r16_71, r17_71 in pairs(r11_71) do
          local r18_71 = r1_0:FindCountByTag(r17_71, "Normal")
          local r19_71 = r1_0:FindCountByTag(r17_71, "Extra")
          local r20_71 = r1_0:FindCountByTag(r17_71, "Walnut")
          local r21_71 = r1_0:FindCountByTag(r17_71, "First")
          local r22_71 = r0_71:CreateOneReward(r9_71, r10_71, r16_71, r18_71, r3_71, false, false, false)
          local r23_71 = r0_71:CreateOneReward(r9_71, r10_71, r16_71, r19_71, r3_71, true, false, false)
          local r24_71 = r0_71:CreateOneReward(r9_71, r10_71, r16_71, r20_71, r3_71, false, true, false)
          local r25_71 = r0_71:CreateOneReward(r9_71, r10_71, r16_71, r21_71, r3_71, false, false, true)
          if r22_71 then
            table.insert(r1_71, r22_71)
          end
          if r23_71 then
            table.insert(r1_71, r23_71)
          end
          if r24_71 then
            table.insert(r1_71, r24_71)
          end
          if r25_71 then
            table.insert(r1_71, r25_71)
          end
        end
        -- close: r12_71
      end
    end
  end
  -- close: r5_71
end
function r4_0.CreateOneReward(r0_72, r1_72, r2_72, r3_72, r4_72, r5_72, r6_72, r7_72, r8_72)
  -- line: [1708, 1731] id: 72
  if r4_72 == 0 then
    return 
  end
  local r9_72 = DataMgr[r1_72][tonumber(r3_72)]
  if r9_72 then
    local r10_72 = {
      Priority = r2_72.DungeonRewardSeq and 0,
      Id = r3_72,
      Count = r4_72,
      Icon = r9_72.Icon,
      Rarity = r9_72.Rarity and r9_72[r1_72 .. "Rarity"] and 0,
      ItemType = r1_72,
      IsSpecial = r5_72,
      IsBonus = r6_72,
      IsWalnutBonus = r7_72,
      IsFirst = r8_72,
    }
    return r10_72
  else
    return 
  end
end
function r4_0.SortRewardsArray(r0_73, r1_73)
  -- line: [1733, 1762] id: 73
  table.sort(r1_73, function(r0_74, r1_74)
    -- line: [1735, 1761] id: 74
    if r0_74.IsFirst ~= r1_74.IsFirst then
      return r0_74.IsFirst
    end
    if r0_74.IsSpecial ~= r1_74.IsSpecial then
      return r0_74.IsSpecial
    end
    if r0_74.Rarity ~= r1_74.Rarity then
      return r1_74.Rarity < r0_74.Rarity
    end
    if r0_74.Priority ~= r1_74.Priority then
      return r1_74.Priority < r0_74.Priority
    end
    if r0_74.Id ~= r1_74.Id then
      return r1_74.Id < r0_74.Id
    end
    if r0_74.IsBonus ~= r1_74.IsBonus then
      return not r0_74.IsBonus
    end
    if r0_74.IsWalnut ~= r1_74.IsWalnut then
      return not r0_74.IsWalnut
    end
    if r0_74.Count ~= r1_74.Count then
      return r1_74.Count < r0_74.Count
    end
    return false
  end)
end
function r4_0.NewPropContent(r0_75, r1_75, r2_75)
  -- line: [1764, 1816] id: 75
  local r3_75 = NewObject(UIUtils.GetCommonItemContentClass())
  if r1_75 ~= nil then
    r3_75.ParentWidget = r0_75
    r3_75.Id = r1_75.Id
    r3_75.Count = r1_75.Count
    function r3_75.AfterInitCallback(r0_76)
      -- line: [1771, 1781] id: 76
      if r0_75.IsAllowPropInAnimation and not r0_76.Content.IsPlayedInAnimation then
        r0_76:PlayInAnimation()
        r0_76.Content.IsPlayedInAnimation = true
      else
        r0_76:PlayAnimation(r0_76.Normal_In, r0_76.Normal_In:GetEndTime())
      end
      r0_75:OpenTipsBindEvents(r0_76)
    end
    r3_75.OnAddedToFocusPathEvent = {
      Obj = r3_75.ParentWidget,
      Callback = function(r0_77)
        -- line: [1784, 1788] id: 77
        if r0_77.CurInputDeviceType == ECommonInputType.Gamepad then
          r0_77.EMScrollBox_255:ScrollWidgetIntoView(r3_75.SelfWidget)
        end
      end,
      Params = {},
    }
    if r1_75.ItemType == "Mod" and r0_75:CheckIsNew(r1_75.Id) then
      r3_75.RedDotType = UIConst.RedDotType.NewRedDot
    end
    if r1_75.Icon then
      r3_75.Icon = r1_75.Icon
    end
    DebugPrint("thy     Content.Icon", r1_75.Icon)
    r3_75.Rarity = r1_75.Rarity
    r3_75.IsShowDetails = true
    r3_75.ItemType = r1_75.ItemType
    r3_75.IsSpecial = r1_75.IsSpecial
    if r1_75.IsWalnutBonus then
      r3_75.BonusType = 3
    end
    if r1_75.IsBonus then
      r3_75.BonusType = 1
    end
    if r1_75.IsFirst then
      r3_75.BonusType = 2
    end
    r3_75.UIName = "DungeonSettlement"
  end
  return r3_75
end
function r4_0.CheckIsNew(r0_78, r1_78)
  -- line: [1818, 1834] id: 78
  if not r1_78 then
    return false
  end
  local r2_78 = GWorld:GetAvatar()
  if not r2_78 then
    return false
  end
  local r4_78 = GWorld.GameInstance.GameEndTime - r0_78.PlayerTime
  for r9_78, r10_78 in pairs(r2_78.HoldMods) do
    if r9_78 == r1_78 then
      return r4_78 < r10_78
    end
  end
  -- close: r5_78
  return false
end
function r4_0.OpenTipsBindEvents(r0_79, r1_79)
  -- line: [1836, 1840] id: 79
  r1_79:BindEvents(r0_79, {
    OnMenuOpenChanged = r0_79.ItemMenuAnchorChanged,
  })
end
function r4_0.ItemMenuAnchorChanged(r0_80)
  -- line: [1843, 1860] id: 80
  if UIManager(r0_80):IsHaveMenuAnchorOpen() then
    r0_80:UpdateMainUIInGamePadClick()
  elseif r0_80.CurInputDeviceType == ECommonInputType.Gamepad then
    r0_80:SwitchMainUIPCToGamePad()
    r0_80:SetFocusInGamePad()
    if r0_80.Switcher:GetActiveWidgetIndex() ~= 1 then
      r0_80:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    end
  else
    r0_80:UpdateMainUIWithPCOrMoble()
  end
end
function r4_0.OpenTempleTipsBindEvents(r0_81, r1_81)
  -- line: [1862, 1866] id: 81
  r1_81:BindEvents(r0_81, {
    OnMenuOpenChanged = r0_81.TempleMenuAnchorChanged,
  })
end
function r4_0.TempleMenuAnchorChanged(r0_82)
  -- line: [1869, 1890] id: 82
  if UIManager(r0_82):IsHaveMenuAnchorOpen() then
    r0_82:UpdateMainUIInGamePadClick()
    if r0_82.WidgetRewards.Key_Controller_Qa then
      r0_82.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif r0_82.CurInputDeviceType == ECommonInputType.Gamepad then
    if r0_82.WidgetRewards.Key_Controller_Qa then
      r0_82.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    r0_82:SwitchMainUIPCToGamePad()
    r0_82:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
  else
    r0_82:UpdateMainUIWithPCOrMoble()
  end
end
function r4_0.ShowSettlementInfo(r0_83)
  -- line: [1892, 1922] id: 83
  if r0_83.IsWin then
    r0_83:PlayAnimation(r0_83.Victory_In)
    AudioManager(r0_83):PlayUISound(r0_83, "event:/ui/common/level_sucess_hud_show", nil, nil)
    if r0_83.IsStarLevel then
      local r1_83 = r0_83.CombatData.StarLevel
      if r1_83 == 1 then
        AudioManager(r0_83):PlayUISound(r0_83, "event:/ui/common/level_success_hud_show_one_star", nil, nil)
      elseif r1_83 == 2 then
        AudioManager(r0_83):PlayUISound(r0_83, "event:/ui/common/level_success_hud_show_two_stars", nil, nil)
      elseif r1_83 == 3 then
        AudioManager(r0_83):PlayUISound(r0_83, "event:/ui/common/level_success_hud_show_three_stars", nil, nil)
      end
    end
    local r1_83 = FPlayFMODSoundStruct()
    r1_83.FMODEventPath, r1_83.SelectKey = AudioManager(r0_83):ContactPlayerStringPath(r0_83.PlayerCharacter, "vo_victory")
    r1_83.EventKey = "vo_victory"
    r1_83.bStopWhenAttachedToDestoryed = true
    r1_83.bPlayAs2D = true
    local r2_83 = AudioManager(r0_83):PlayFMODSound_Sync(UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(r1_83, r0_83))
  else
    r0_83:PlayAnimation(r0_83.Defeat_In)
    AudioManager(r0_83):PlayUISound(r0_83, "event:/ui/common/level_fail_hud_show", nil, nil)
    AudioManager(r0_83):PlayFMODSoundByID(r0_83.PlayerCharacter, 211, r0_83.PlayerCharacter, "None", {
      bFollowSocket = true,
      EventKey = "FailedPlayerCharAudio",
    })
  end
  r0_83:AddTimer(5, function()
    -- line: [1919, 1921] id: 84
    r0_83:UpdateMainUI()
  end)
end
function r4_0.ActivateDropPanelScrolling(r0_85, r1_85, r2_85)
  -- line: [1924, 1932] id: 85
  if r1_85 then
    r2_85:SetScrollBarVisibility(ESlateVisibility.Visible)
  else
    r2_85:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.ShowConfirmWindow(r0_86)
  -- line: [1935, 1954] id: 86
  local r1_86 = {
    RightCallbackFunction = function(r0_87, r1_87, r2_87)
      -- line: [1937, 1941] id: 87
      r2_87.DontPlayOutAnimation = true
      r0_86:DefaultContinue()
      r0_86:UpdateSelectedInfo(r1_87)
    end,
    LeftCallbackFunction = function(r0_88, r1_88, r2_88)
      -- line: [1942, 1945] id: 88
      r2_88.DontPlayOutAnimation = false
      r0_86:UpdateSelectedInfo(r1_88)
    end,
  }
  local r3_86 = UE4.UGameplayStatics.GetGameInstance(r0_86):GetGameUIManager()
  if r0_86.IsHardBoss then
    r3_86:ShowCommonPopupUI(Const.Popup_SecondConfirm, r1_86, r0_86)
  elseif r0_86.IsWeeklyDungeon then
    r3_86:ShowCommonPopupUI(100211, r1_86, r0_86)
  end
end
function r4_0.UpdateSelectedInfo(r0_89, r1_89)
  -- line: [1956, 1967] id: 89
  local r2_89 = r1_89.SelectHint.IsSelected
  local r3_89 = r2_0.NowTime()
  if r0_89.IsHardBoss then
    r0_0:Set("IsBossBattlePopupNoMorePrompts", r2_89, true)
    r0_0:Set("IsBossBattlePopupTimestamp", r3_89, true)
  elseif r0_89.IsWeeklyDungeon then
    r0_0:Set("IsWeeklyDungeonPopupNoMorePrompts", r2_89, true)
    r0_0:Set("IsWeeklyDungeonPopupTimestamp", r3_89, true)
  end
end
function r4_0.ShowCountDown(r0_90)
  -- line: [1970, 1983] id: 90
  r0_90.RemainTime = 120
  r0_90.MaxAutoExitTime = 120
  if not r0_90.IsWin then
    r0_90.RemainTime = 30
    r0_90.MaxAutoExitTime = 30
  end
  r0_90.CurrentTime = 0
  r0_90.ProgressInterval = 0.06666666666666667
  r0_90.Bar_Click:SetPercent(0)
  r0_90.Bar_Click:SetVisibility(ESlateVisibility.Collapsed)
  r0_90:AddTimer(1, r0_90.CountDown, true, -1, "CountDown")
  r0_90:AddTimer(r0_90.ProgressInterval, r0_90.SetProgressBar, true, -1, "SetProgressBar", nil, r0_90.ProgressInterval)
end
function r4_0.CountDown(r0_91)
  -- line: [1985, 1994] id: 91
  r0_91.Text_ExitTime:SetText(string.format(GText("UI_Text_ExitTime"), r0_91.RemainTime))
  if r0_91.RemainTime <= 0 then
    r0_91:Exit()
    r0_91:RemoveTimer("CountDown")
    r0_91:RemoveTimer("SetProgressBar")
  end
  r0_91.RemainTime = r0_91.RemainTime + -1
end
function r4_0.SetProgressBar(r0_92, r1_92)
  -- line: [1996, 1999] id: 92
  r0_92.CurrentTime = r0_92.CurrentTime + r1_92
  r0_92.Bar_Click:SetPercent(r0_92.CurrentTime / r0_92.MaxAutoExitTime)
end
function r4_0.CheckIsNoExpMode(r0_93)
  -- line: [2001, 2022] id: 93
  r0_93.IsNoExpDungeon = false
  local r1_93 = DataMgr.Dungeon[r0_93.DungeonId]
  if r1_93 then
    local r2_93 = r1_93.DungeonType
    if r2_93 == "Temple" then
      r0_93.IsNoExpDungeon = true
    elseif r2_93 == "Party" then
      r0_93.IsNoExpDungeon = true
    elseif r2_93 == "Abyss" then
      r0_93.IsNoExpDungeon = true
    end
  end
  local r2_93 = GWorld:GetAvatar()
  if r2_93 then
    if r0_93.IsHardBoss then
      r0_93.IsNoExpDungeon = true
    elseif r2_93:IsInRougeLike() then
      r0_93.IsNoExpDungeon = true
    end
  end
end
function r4_0.CheckIsWalnutMode(r0_94)
  -- line: [2024, 2030] id: 94
  r0_94.IsWalnut = false
  local r1_94 = DataMgr.Dungeon[r0_94.DungeonId]
  if r1_94 then
    r0_94.IsWalnut = r1_94.IsWalnutDungeon == true
  end
end
function r4_0.CheckIsHardBossMode(r0_95)
  -- line: [2032, 2044] id: 95
  r0_95.IsHardBoss = false
  local r1_95 = GWorld:GetAvatar()
  if r1_95 and r1_95:IsInHardBoss() then
    r0_95.IsHardBoss = true
    return 
  end
  local r2_95 = DataMgr.Dungeon[r0_95.DungeonId]
  if r2_95 then
    r0_95.IsHardBoss = r2_95.DungeonType == "HardBossDg"
  end
end
function r4_0.CheckAgainAvailable(r0_96)
  -- line: [2046, 2065] id: 96
  local r1_96 = GWorld:GetAvatar()
  if not r1_96 then
    return true
  end
  if not r0_96.IsWalnut then
    return true
  end
  if r1_96.Walnuts and r1_96.Walnuts.ValidWalnutDungeons then
    for r6_96, r7_96 in pairs(r1_96.Walnuts.ValidWalnutDungeons) do
      for r12_96, r13_96 in pairs(r7_96) do
        if r13_96 == r0_96.DungeonId then
          return true
        end
      end
      -- close: r8_96
    end
    -- close: r2_96
  end
  return false
end
function r4_0.CheckIsTempleMode(r0_97)
  -- line: [2067, 2099] id: 97
  r0_97.IsTemple = false
  local r1_97 = GWorld:GetAvatar()
  if not r1_97 then
    error("Avatar is nil")
  end
  r0_97.GameMode = UE4.UGameplayStatics.GetGameMode(r0_97)
  if not r0_97.GameMode then
    return 
  end
  if r1_97:IsInDungeon() then
    local r2_97 = r0_97:GetDungeonInfo(r0_97.BattleInfo)
    if r2_97.DungeonType and r2_97.DungeonType == "Temple" then
      r0_97.IsTemple = true
      r0_97.Panel_Main:SetVisibility(ESlateVisibility.Collapsed)
      r0_97.Panel_Consume:SetVisibility(ESlateVisibility.Collapsed)
      r0_97.FailTips:SetVisibility(ESlateVisibility.Collapsed)
      r0_97.Btn_Data:SetVisibility(ESlateVisibility.Collapsed)
      r0_97.Group_Temple:SetVisibility(ESlateVisibility.Visible)
    end
  end
end
function r4_0.CheckIsPartyMode(r0_98)
  -- line: [2101, 2133] id: 98
  r0_98.IsParty = false
  local r1_98 = GWorld:GetAvatar()
  if not r1_98 then
    error("Avatar is nil")
  end
  r0_98.GameMode = UE4.UGameplayStatics.GetGameMode(r0_98)
  if not r0_98.GameMode then
    return 
  end
  if r1_98:IsInDungeon() then
    local r2_98 = r0_98:GetDungeonInfo(r0_98.BattleInfo)
    if r2_98.DungeonType and r2_98.DungeonType == "Party" then
      r0_98.IsParty = true
      r0_98.Panel_Main:SetVisibility(ESlateVisibility.Collapsed)
      r0_98.Panel_Consume:SetVisibility(ESlateVisibility.Collapsed)
      r0_98.FailTips:SetVisibility(ESlateVisibility.Collapsed)
      r0_98.Btn_Data:SetVisibility(ESlateVisibility.Collapsed)
      r0_98.Group_Temple:SetVisibility(ESlateVisibility.Visible)
    end
  end
end
function r4_0.CalcTempleInfo(r0_99)
  -- line: [2135, 2302] id: 99
  r0_99.TempleInfo = DataMgr.Temple[r0_99.DungeonId]
  if not r0_99.TempleInfo then
    return 
  end
  local r1_99 = 0
  local r2_99 = 0
  local r3_99 = 0
  local r4_99 = r0_99.TempleInfo.RewardId
  if #r4_99 == 3 then
    r0_99.IsStarLevel = true
    if r0_99.CombatData.StarLevel then
      r1_99 = r0_99.CombatData.StarLevel
    end
    if r1_99 < 0 or r1_99 > 3 then
      error("本关设置星级超出可获得的范围")
    end
  elseif #r4_99 == 1 then
    r0_99.IsStarLevel = false
  else
    error("本关奖励配置有误，请正确配置星级奖励或无星级奖励")
  end
  local r5_99 = ""
  if not r0_99.IsWin then
    r5_99 = r0_99.CombatData.FailReason
    r1_99 = 0
  end
  r0_99.WidgetStar = r0_99:CreateWidgetNew("TempleItem")
  r0_99.WidgetStar.ParentUI = r0_99
  r0_99.WidgetStar.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
  if r0_99.IsStarLevel then
    r0_99.WidgetStar:SetStarLevel(r1_99, r5_99)
  else
    r0_99.WidgetStar:SetNoStarLevel(r5_99)
  end
  local r6_99 = r0_99.TempleInfo.SucRule
  if r6_99 == "Time" or r6_99 == "CountDown" and r0_99.TempleInfo.UIShowType == 1 then
    local r7_99 = 0
    if r0_99.CombatData.TempleTime then
      r7_99 = r0_99.CombatData.TempleTime
    end
    r0_99.WidgetStar:SetPoints(r0_99:CalcTimeInfo(r7_99))
    r0_99.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_TIME"))
  elseif r6_99 == "CountDown" then
    local r7_99 = 0
    if r0_99.CombatData.RemainTempleTime then
      r7_99 = r0_99.CombatData.RemainTempleTime
    end
    r0_99.WidgetStar:SetPoints(r0_99:CalcTimeInfo(r7_99))
    r0_99.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_COUNTDOWN"))
  elseif r6_99 == "Score" then
    if r0_99.CombatData.Score then
      r2_99 = r0_99.CombatData.Score
    end
    r0_99.WidgetStar:SetPoints(r2_99)
    r0_99.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_SCORE"))
  elseif r6_99 == "Collect" then
    if r0_99.CombatData.Collection then
      r3_99 = r0_99.CombatData.Collection
    end
    r0_99.WidgetStar:SetPoints(r3_99)
    r0_99.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_COLLECT"))
  end
  r0_99.WidgetStar:SetVisibility(ESlateVisibility.Hidden)
  r0_99.SizeBox_Stars:AddChild(r0_99.WidgetStar)
  r0_99.WidgetRewards = r0_99:CreateWidgetNew("TempleItem")
  r0_99.WidgetRewards.ParentUI = r0_99
  local r7_99 = {}
  if r0_99.IsStarLevel then
    local r8_99 = 0
    if r0_99.CombatData.MaxTempleStar then
      r8_99 = r0_99.CombatData.MaxTempleStar
    end
    for r12_99 = 1, #r4_99, 1 do
      table.insert(r7_99, r0_99:NewTempleContent(r0_99:GetFirstRewardInfoById(r4_99[r12_99]), r12_99))
    end
    r0_99.WidgetRewards:SetStarRewards(r7_99, r1_99, r8_99)
  else
    if r4_99[1] ~= nil then
      local r8_99 = RewardUtils:GetAllRewardByRewardId(r4_99[1])
      local r9_99 = {}
      r0_99:RewardsAddToArray(r9_99, r8_99, false)
      r0_99:SortRewardsArray(r9_99)
      r7_99 = r9_99
    end
    local r8_99 = GWorld:GetAvatar()
    if not r8_99 then
      error("Avatar is nil")
    end
    if r8_99.Dungeons[r0_99.DungeonId] then
      r0_99.WidgetRewards:SetNoStarRewards(r7_99, r8_99.Dungeons[r0_99.DungeonId].IsPass, r0_99.IntervalTime, r0_99.FirstDelayTime)
    end
  end
  r0_99.WidgetRewards:SetVisibility(ESlateVisibility.Hidden)
  r0_99.SizeBox_Rewards:AddChild(r0_99.WidgetRewards)
  r0_99.rewardItems = {
    r0_99.WidgetRewards.Item01,
    r0_99.WidgetRewards.Item02,
    r0_99.WidgetRewards.Item03,
    r0_99.WidgetRewards.Item_Repeat
  }
  r0_99.WidgetRewards.Btn_Qa:Init({
    OwnerWidget = r0_99.WidgetRewards,
    TextContent = GText("UI_Temple_RewardDetail"),
  })
  r0_99.WidgetRewards.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
end
function r4_0.CalcPartyInfo(r0_100)
  -- line: [2304, 2507] id: 100
  r0_100.PartyInfo = DataMgr.Party[r0_100.DungeonId]
  if not r0_100.PartyInfo then
    return 
  end
  local r1_100 = 0
  local r2_100 = 0
  local r3_100 = 0
  local r4_100 = r0_100.PartyInfo.RewardId
  if #r4_100 == 3 then
    r0_100.IsStarLevel = true
    if r0_100.CombatData.StarLevel then
      r1_100 = r0_100.CombatData.StarLevel
    else
      r1_100 = 0
    end
    if r1_100 < 0 or r1_100 > 3 then
      error("本关设置星级超出可获得的范围")
    end
  elseif #r4_100 == 1 then
    r0_100.IsStarLevel = false
  else
    error("本关奖励配置有误，请正确配置星级奖励或无星级奖励")
  end
  local r5_100 = ""
  if not r0_100.IsWin then
    r1_100 = 0
  end
  r0_100.WidgetStar = r0_100:CreateWidgetNew("TempleItem")
  r0_100.WidgetStar.ParentUI = r0_100
  r0_100.WidgetStar.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
  r0_100.WidgetStar.ParentUI = r0_100
  if r0_100.IsStarLevel then
    r0_100.WidgetStar:SetStarLevel(r1_100, r5_100)
  else
    r0_100.WidgetStar:SetNoStarLevel(r5_100)
  end
  r0_100.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_TIME"))
  for r11_100, r12_100 in ipairs(GWorld.GameInstance.ScenePlayers) do
    if r12_100.IsMainPlayer then
      if r0_100.CombatData.PartyPlayerCompleteTime[r11_100] then
        r0_100.WidgetStar.Text_PointsNum:SetText(r0_100:GetTimeStr(r0_100.CombatData.PartyPlayerCompleteTime[r11_100]))
        break
      else
        r0_100.WidgetStar.Text_PointsNum:SetText(GText("UI_PARTY_PARKOUR_UNFINISH"))
        break
      end
    end
  end
  -- close: r7_100
  r0_100.WidgetStar:SetVisibility(ESlateVisibility.Hidden)
  r0_100.SizeBox_Stars:AddChild(r0_100.WidgetStar)
  r0_100.WidgetRewards = r0_100:CreateWidgetNew("TempleItem")
  r0_100.WidgetRewards.ParentUI = r0_100
  local r7_100 = {}
  local r8_100 = GWorld:GetAvatar()
  if r0_100.IsStarLevel then
    local r9_100 = 0
    if r8_100.Dungeons[r0_100.DungeonId].MaxStar then
      r9_100 = r8_100.Dungeons[r0_100.DungeonId].MaxStar
    else
      r9_100 = 0
    end
    for r13_100 = 1, #r4_100, 1 do
      table.insert(r7_100, r0_100:NewTempleContent(r0_100:GetFirstRewardInfoById(r4_100[r13_100]), r13_100))
    end
    r0_100.WidgetRewards:SetStarRewards(r7_100, r1_100, r9_100)
  else
    if r4_100[1] ~= nil then
      local r9_100 = RewardUtils:GetAllRewardByRewardId(r4_100[1])
      local r10_100 = {}
      r0_100:RewardsAddToArray(r10_100, r9_100, false)
      r0_100:SortRewardsArray(r10_100)
      r7_100 = r10_100
    end
    local r9_100 = GWorld:GetAvatar()
    if not r9_100 then
      error("Avatar is nil")
    end
    if r9_100.Dungeons[r0_100.DungeonId] then
      r0_100.WidgetRewards:SetNoStarRewards(r7_100, r9_100.Dungeons[r0_100.DungeonId].IsPass, r0_100.IntervalTime, r0_100.FirstDelayTime)
    end
  end
  r0_100.WidgetRewards:SetVisibility(ESlateVisibility.Hidden)
  r0_100.SizeBox_Rewards:AddChild(r0_100.WidgetRewards)
  r0_100.rewardItems = {
    r0_100.WidgetRewards.Item01,
    r0_100.WidgetRewards.Item02,
    r0_100.WidgetRewards.Item03,
    r0_100.WidgetRewards.Item_Repeat
  }
  r0_100.WidgetRewards.Panel_RepeatReward:SetVisibility(ESlateVisibility.Collapsed)
  local r9_100 = GWorld:GetAvatar()
  local r10_100 = UE4.UGameplayStatics.GetGameState(r0_100)
  if not r9_100 or not r10_100 then
    return 
  end
  if r0_100.IsParty then
    local r12_100 = NewObject(UIUtils.GetCommonItemContentClass())
    local r13_100 = {
      [0] = 0,
      [1] = 1,
      [2] = 1.5,
      [3] = 2,
      [4] = 2.5,
    }
    if DataMgr.Reward[7005] ~= nil then
      r12_100.ParentWidget = r0_100
      r12_100.Id = 101
      r12_100.ItemType = "Resource"
      if DataMgr.Party[r0_100.DungeonId] then
        if not r0_100.CombatData.NumOfPlayers then
          r12_100.Count = 0
        else
          r12_100.Count = DataMgr.Party[r0_100.DungeonId].RewardCoin[(r0_100.CombatData.StarLevel + 1)] * r13_100[r0_100.CombatData.NumOfPlayers]
        end
      else
        r12_100.Count = 0
      end
      r12_100.Icon = ItemUtils.GetItemIconPath(101, "Resource")
      r12_100.Rarity = 1
      r12_100.IsShowDetails = true
      r12_100.bHasGot = false
      r12_100.UIName = "DungeonSettlement"
      function r12_100.AfterInitCallback(r0_101)
        -- line: [2467, 2474] id: 101
        if r0_100.IsAllowPropInAnimation and not r0_101.Content.IsPlayedInAnimation then
          r0_101:PlayInAnimation()
          r0_101.Content.IsPlayedInAnimation = true
        else
          r0_101:PlayAnimation(r0_101.Normal_In, r0_101.Normal_In:GetEndTime())
        end
      end
      r12_100.OnMouseButtonUpEvents = {
        Obj = r0_100,
        Callback = function()
          -- line: [2475, 2477] id: 102
          r0_100.TempleNeedFocusItemIndex = 4
        end,
      }
      r0_100.WidgetRewards.Panel_RepeatReward:SetVisibility(ESlateVisibility.Visible)
      r0_100.WidgetRewards.Item_Repeat:SetVisibility(ESlateVisibility.Visible)
      local r14_100 = DataMgr.GlobalConstant.PartyRewardDailyLimit.ConstantValue
      local r15_100 = r9_100.TodayPartyReward and 0
      if r14_100 <= r12_100.Count + r15_100 then
        r15_100 = r14_100
        r12_100.bHasGot = true
        UIManager(r0_100):ShowUITip("CommonToastMain", "UI_Party_RewardCoin_OnLimit_Toast")
        r0_100.WidgetRewards.Text_RepeatReward:SetText(string.format(GText("UI_Party_RewardCoin_OnLimit"), r15_100, r14_100))
      else
        r0_100.WidgetRewards.Text_RepeatReward:SetText(string.format(GText("UI_Party_RewardCoin"), r15_100, r14_100))
      end
      r0_100.WidgetRewards.Item_Repeat:Init(r12_100)
      r0_100.WidgetRewards.Btn_Qa:Init({
        OwnerWidget = r0_100.WidgetRewards,
        TextContent = GText("UI_Party_RewardDetail"),
      })
      r0_100.WidgetRewards.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
    end
  else
    r0_100.WidgetRewards.Btn_Qa:Init({
      OwnerWidget = r0_100.WidgetRewards,
      TextContent = GText("UI_Temple_RewardDetail"),
    })
  end
end
function r4_0.ShowTempleStars(r0_103)
  -- line: [2509, 2514] id: 103
  if r0_103.WidgetStar then
    r0_103.WidgetStar:SetVisibility(ESlateVisibility.Visible)
    r0_103.WidgetStar:PlayStarInAnim()
  end
end
function r4_0.ShowTemplePoints(r0_104)
  -- line: [2516, 2521] id: 104
  if r0_104.WidgetPoints then
    r0_104.WidgetPoints:SetVisibility(ESlateVisibility.Visible)
    r0_104.WidgetPoints:PlayPointsInAnim()
  end
end
function r4_0.ShowTempleRewards(r0_105)
  -- line: [2523, 2528] id: 105
  if r0_105.WidgetRewards then
    r0_105.WidgetRewards:SetVisibility(ESlateVisibility.Visible)
    r0_105.WidgetRewards:PlayRewardsInAnim()
  end
end
function r4_0.GetFirstRewardInfoById(r0_106, r1_106)
  -- line: [2530, 2551] id: 106
  local r2_106 = {}
  local r3_106 = DataMgr.Reward[r1_106]
  if not r3_106 then
    return r2_106
  end
  local r4_106 = r3_106.Type
  local r5_106 = r3_106.Id
  local r6_106 = r3_106.Count
  if not r4_106 or not r5_106 or not r6_106 then
    return r2_106
  end
  r2_106.Type = r4_106[1]
  r2_106.Id = r5_106[1]
  r2_106.Count = r6_106[1][1]
  local r7_106 = DataMgr[r2_106.Type][r2_106.Id]
  if r7_106 then
    r2_106.Name = r7_106.Name and r7_106[r2_106.Type .. "Name"]
    r2_106.Rarity = r7_106.Rarity and r7_106[r2_106.Type .. "Rarity"]
  end
  return r2_106
end
function r4_0.NewTempleContent(r0_107, r1_107, r2_107)
  -- line: [2553, 2582] id: 107
  local r3_107 = NewObject(UIUtils.GetCommonItemContentClass())
  if r1_107 ~= nil then
    r3_107.ParentWidget = r0_107
    r3_107.Id = r1_107.Id
    r3_107.ItemType = r1_107.Type
    r3_107.Count = r1_107.Count
    r3_107.Icon = ItemUtils.GetItemIconPath(r1_107.Id, r1_107.Type)
    r3_107.Rarity = r1_107.Rarity and 1
    r3_107.IsShowDetails = true
    r3_107.bHasGot = r1_107.IsGot and false
    r3_107.UIName = "DungeonSettlement"
    r3_107.bAsyncLoadIcon = true
    function r3_107.AfterInitCallback(r0_108)
      -- line: [2566, 2576] id: 108
      if r0_107.IsAllowPropInAnimation and not r0_108.Content.IsPlayedInAnimation then
        r0_108:PlayInAnimation()
        r0_108.Content.IsPlayedInAnimation = true
      else
        r0_108:PlayAnimation(r0_108.Normal_In, r0_108.Normal_In:GetEndTime())
      end
      r0_107:OpenTempleTipsBindEvents(r0_108)
    end
    r3_107.OnMouseButtonUpEvents = {
      Obj = r0_107,
      Callback = function()
        -- line: [2577, 2579] id: 109
        r0_107.TempleNeedFocusItemIndex = r2_107
      end,
    }
  end
  return r3_107
end
function r4_0.CalcTimeInfo(r0_110, r1_110)
  -- line: [2584, 2608] id: 110
  local r2_110 = math.floor(r1_110 / 3600)
  r1_110 = r1_110 % 3600
  local r3_110 = math.floor(r1_110 / 60)
  local r4_110 = math.floor(r1_110 % 60)
  local r5_110 = nil
  if r2_110 > 0 then
    r5_110 = string.format("%02d%s%02d%s", r2_110, GText("UI_GameEvent_TimeRemain_Hour"), r3_110, GText("UI_GameEvent_TimeRemain_Min"))
  else
    r5_110 = string.format("%02d%s%02d%s", r3_110, GText("UI_GameEvent_TimeRemain_Min"), r4_110, GText("UI_GameEvent_TimeRemain_Sec"))
  end
  return r5_110
end
function r4_0.InitDeviceInfo(r0_111)
  -- line: [2612, 2623] id: 111
  r0_111.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_111, 0))
  r0_111.NavigateWidget = r0_111.GameInputModeSubsystem and r0_111.GameInputModeSubsystem:GetNavigateWidget()
  if r0_111.NavigateWidget then
    r0_111.NavigateWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
  if IsValid(r0_111.GameInputModeSubsystem) then
    r0_111:RefreshOpInfoByInputDevice(r0_111.GameInputModeSubsystem:GetCurrentInputType(), r0_111.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r4_0.InitListenEvent(r0_112)
  -- line: [2625, 2629] id: 112
  if IsValid(r0_112.GameInputModeSubsystem) then
    r0_112.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_112, r0_112.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RefreshOpInfoByInputDevice(r0_113, r1_113, r2_113)
  -- line: [2631, 2646] id: 113
  if not r0_113:HasFocusedDescendants() and not r0_113:HasAnyUserFocus() and r0_113.CurInputDeviceType then
    return 
  end
  if r0_113.CurInputDeviceType == r1_113 then
    DebugPrint("thy    已经显示的是该输入模式，不需要进行刷新")
    return 
  end
  r0_113.CurInputDeviceType = r1_113
  r0_113.CurGamepadName = r2_113
  r0_113.IsSwitchDevice = true
  r0_113:UpdateMainUI()
end
function r4_0.UpdateMainUI(r0_114)
  -- line: [2648, 2674] id: 114
  if not r0_114.IsNotFirstUpdateMainUI then
    r0_114.IsNotFirstUpdateMainUI = true
    return 
  end
  if not r0_114.CurInputDeviceType then
    r0_114.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  end
  if r0_114.CurInputDeviceType == ECommonInputType.Touch then
    DebugPrint("thy    IsMoblie")
    return 
  end
  if not r0_114:HasFocusedDescendants() and not r0_114:HasAnyUserFocus() then
    DebugPrint("ljl@ 已聚焦至上级界面 不聚焦到该界面")
    return 
  end
  r0_114:SetFocus()
  if r0_114.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    DebugPrint("thy   IsPC")
    r0_114:UpdateMainUIWithPCOrMoble()
  else
    DebugPrint("thy   IsGamePad")
    r0_114:UpdateMainUIWithGamePad()
  end
end
function r4_0.SetFocusInGamePad(r0_115)
  -- line: [2676, 2721] id: 115
  DebugPrint("jly Set Focus In GamePad")
  if r0_115:IsAnimationPlaying(r0_115.Defeat_In) or r0_115:IsAnimationPlaying(r0_115.Victory_In) then
    DebugPrint("jly Set Focus In GamePad, but animation is playing")
    return 
  end
  if r0_115.IsTemple then
    if r0_115.IsStarLevel then
      if r0_115.TempleNeedFocusItemIndex then
        r0_115.rewardItems[r0_115.TempleNeedFocusItemIndex]:SetFocus()
      else
        r0_115.rewardItems[1]:SetFocus()
      end
    else
      r0_115.WidgetRewards.List_Reward:SetFocus()
    end
    return 
  end
  if #r0_115.SpRewardsArray == 0 then
    if #r0_115.RewardsArray ~= 0 then
      if r0_115.TileView_Prop:GetItemAt(0) and r0_115.TileView_Prop:GetItemAt(0).SelfWidget then
        r0_115:SetFoucsOnTileView(r0_115.TileView_Prop)
      else
        r0_115:SetFocusOnTileViewDelay(r0_115.TileView_Prop)
      end
    else
      r0_115:SetFocus()
      r0_115.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
      r0_115.NavigateWidget:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    if r0_115.TileView_Reward:GetItemAt(0) and r0_115.TileView_Reward:GetItemAt(0).SelfWidget then
      r0_115:SetFoucsOnTileView(r0_115.TileView_Reward)
    else
      r0_115:SetFocusOnTileViewDelay(r0_115.TileView_Reward)
    end
    if #r0_115.RewardsArray == 0 then
      r0_115.TileView_Prop.bIsFocusable = true
    end
  end
  r0_115:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
end
function r4_0.SetFocusOnTileViewDelay(r0_116, r1_116)
  -- line: [2723, 2742] id: 116
  r0_116:AddTimer(0.1, function()
    -- line: [2724, 2741] id: 117
    DebugPrint("jly Focus On TileView Delay")
    if r0_116:IsAnimationPlaying(r0_116.Defeat_In) or r0_116:IsAnimationPlaying(r0_116.Victory_In) then
      DebugPrint("jly Focus On TileView Delay, but animation is playing")
      return 
    end
    local r0_117 = r1_116:GetItemAt(0)
    if r0_117 and r0_117.SelfWidget then
      r0_116.NavigateWidget:SetVisibility(ESlateVisibility.Visible)
      r1_116.bIsFocusable = true
      r1_116:SetFocus()
      r1_116:SetSelectedIndex(0)
      local r1_117 = r0_117.SelfWidget
      r1_117:StopAllAnimations()
      r1_117:PlayAnimation(r1_117.Hover)
      r0_116:RemoveTimer("SetFocusInGamePad")
    end
  end, true, 0.5, "SetFocusInGamePad")
end
function r4_0.SetFoucsOnTileView(r0_118, r1_118)
  -- line: [2744, 2752] id: 118
  r0_118.NavigateWidget:SetVisibility(ESlateVisibility.Visible)
  r1_118.bIsFocusable = true
  r1_118:SetFocus()
  r1_118:SetSelectedIndex(0)
  local r2_118 = r1_118:GetItemAt(0).SelfWidget
  r2_118:StopAllAnimations()
  r2_118:PlayAnimation(r2_118.Hover)
end
function r4_0.UpdateBottomTabsInfo(r0_119, r1_119, r2_119)
  -- line: [2754, 2794] id: 119
  if r0_119.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_119 then
    local r3_119 = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
      Desc = r1_119,
    }
    r0_119.Key_Confirm:SetVisibility(ESlateVisibility.Visible)
    r0_119.Key_Confirm:CreateCommonKey(r3_119)
  else
    r0_119.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r2_119 then
    local r3_119 = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = r2_119,
    }
    r0_119.Key_Cancel:SetVisibility(ESlateVisibility.Visible)
    r0_119.Key_Cancel:CreateCommonKey(r3_119)
  else
    r0_119.Key_Cancel:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r1_119 or r2_119 then
    r0_119.Panel_Controller:SetVisibility(ESlateVisibility.Visible)
    r0_119.Panel_Key:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.UpdateMainUIWithGamePad(r0_120)
  -- line: [2797, 2914] id: 120
  if r0_120.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if not r0_120.IsFirstFocus then
    r0_120:SetFocusInGamePad()
  end
  if r0_120.Switch_Mode then
    r0_120.Switch_Mode:SetActiveWidgetIndex(1)
  end
  r0_120.Icon_Key_Data:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
      }
    },
  })
  r0_120.Cost:InitContent({
    ResourceId = 103,
    bShowDenominator = true,
    CostText = nil,
    Denominator = r0_120.DungeonCost,
    Numerator = r0_120.CurActionPoint,
    KeyIconName = "LS",
    Owner = r0_120,
  })
  r0_120.Btn_Continue:SetDefaultGamePadImg("Y")
  r0_120.Btn_Close:SetDefaultGamePadImg("B")
  r0_120.Refund:Show()
  r0_120.Refund:UpdateGamePadIcon("RS")
  r0_120.Icon_Key_FailTips:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RH",
      }
    },
    Desc = GText("UI_DynInteract_1"),
  })
  if not r0_120.IsWin and CommonUtils.Size(DataMgr.FailureGuidance) > 7 and r0_120.Controller_FailTips then
    r0_120.Controller_FailTips:SetVisibility(ESlateVisibility.Visible)
  elseif r0_120.Controller_FailTips then
    r0_120.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_120.Panel_Controller:SetVisibility(ESlateVisibility.Visible)
  r0_120.Panel_Key:SetVisibility(ESlateVisibility.Collapsed)
  if not r0_120.IsTemple then
    if #r0_120.SpRewardsArray > 0 or #r0_120.RewardsArray > 0 then
      r0_120:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    else
      r0_120:UpdateBottomTabsInfo()
    end
    for r7_120 = 0, r0_120.TileView_Reward:GetNumItems() + -1, 1 do
      local r8_120 = r0_120.TileView_Reward:GetItemAt(r7_120)
      if r8_120 and r8_120.SelfWidget then
        r8_120.SelfWidget:SetNavigationRuleExplicit(EUINavigation.Down, r0_120.TileView_Prop)
      end
    end
  else
    r0_120:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    r0_120.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Visible)
    r0_120.WidgetRewards.Key_Controller_Qa:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RS",
        }
      },
    })
    local r4_120 = nil
    for r9_120, r10_120 in ipairs(r0_120.rewardItems) do
      if r10_120 then
        if r4_120 then
          r4_120:SetNavigationRuleExplicit(EUINavigation.Right, r10_120)
          r10_120:SetNavigationRuleExplicit(EUINavigation.Left, r4_120)
        else
          r10_120:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        end
        if not r0_120.rewardItems[(r9_120 + 1)] then
          r10_120:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        end
        r4_120 = r10_120
      end
    end
    -- close: r5_120
  end
  if r0_120.WBP_Chat_CommonEnter and r0_120.WBP_Chat_CommonEnter.IsShowGamePad then
    r0_120.WBP_Chat_CommonEnter:IsShowGamePad(true)
  end
end
function r4_0.UpdateMainUIWithPCOrMoble(r0_121)
  -- line: [2917, 2957] id: 121
  if r0_121.Switch_Mode then
    r0_121.Switch_Mode:SetActiveWidgetIndex(0)
  end
  r0_121.Cost:InitContent({
    ResourceId = 103,
    bShowDenominator = true,
    CostText = nil,
    Denominator = r0_121.DungeonCost,
    Numerator = r0_121.CurActionPoint,
    KeyIconName = nil,
    Owner = r0_121,
  })
  r0_121.Refund:UpdateGamePadIcon("None")
  if r0_121.Controller_FailTips then
    r0_121.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_121.Refund:Hide()
  if r0_121.IsSwitchDevice and r0_121.Panel_Controller then
    r0_121.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
    r0_121.Panel_Key:SetVisibility(ESlateVisibility.Visible)
  else
    r0_121:UpdateBottomTabsInfo()
  end
  if r0_121.IsTemple and r0_121.WidgetRewards.Key_Controller_Qa then
    r0_121.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_121.WBP_Chat_CommonEnter and r0_121.WBP_Chat_CommonEnter.IsShowGamePad then
    r0_121.WBP_Chat_CommonEnter:IsShowGamePad(false)
  end
  DebugPrint("thy     Update PC")
  r0_121:InitHandleKeyInfo()
end
function r4_0.UpdateMainUIInGamePadClick(r0_122)
  -- line: [2960, 2986] id: 122
  if r0_122.Switch_Mode then
    r0_122.Switch_Mode:SetActiveWidgetIndex(0)
  end
  r0_122.Cost.Key:SetVisibility(ESlateVisibility.Collapsed)
  r0_122.Btn_Continue:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  r0_122.Btn_Continue:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_122.Btn_Close:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  r0_122.Btn_Close:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if r0_122.Controller_FailTips then
    r0_122.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_122.Refund:Hide()
  if r0_122.Key_Confirm then
    r0_122.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_122.Key_Cancel then
    r0_122.Key_Cancel:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.SwitchMainUIPCToGamePad(r0_123)
  -- line: [2989, 3032] id: 123
  if r0_123.Switch_Mode then
    r0_123.Switch_Mode:SetActiveWidgetIndex(1)
  end
  local r1_123 = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
      }
    },
  }
  if r0_123.Icon_Key_Data then
    r0_123.Icon_Key_Data:CreateCommonKey(r1_123)
  end
  r0_123.Cost.Key:SetVisibility(ESlateVisibility.Visible)
  r0_123.Btn_Continue:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_123.Btn_Continue:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  r0_123.Btn_Close:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_123.Btn_Close:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  r0_123.Refund:Show()
  if not r0_123.IsWin and CommonUtils.Size(DataMgr.FailureGuidance) > 7 and r0_123.Controller_FailTips then
    r0_123.Controller_FailTips:SetVisibility(ESlateVisibility.Visible)
  elseif r0_123.Controller_FailTips then
    r0_123.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not r0_123.IsTemple then
    if #r0_123.SpRewardsArray > 0 or #r0_123.RewardsArray > 0 then
      r0_123:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    else
      r0_123:UpdateBottomTabsInfo()
    end
  end
end
function r4_0.Handle_OnPCDown(r0_124, r1_124)
  -- line: [3035, 3048] id: 124
  DebugPrint("thy   Handle_OnPCDown", r1_124)
  if r1_124 == "Escape" then
    r0_124.Btn_Close:OnBtnClicked()
    return true
  elseif r1_124 == "V" then
    r0_124.Btn_Data:OnBtnClicked()
    return true
  elseif r1_124 == "R" then
    r0_124:OnBtnContinueClicked()
    return true
  end
  return false
end
function r4_0.Handle_OnGamePadDown(r0_125, r1_125)
  -- line: [3051, 3163] id: 125
  if r0_125.IsTemple then
    if r1_125 == "Gamepad_FaceButton_Top" then
      r0_125:OnBtnContinueClicked()
      return true
    elseif r1_125 == "Gamepad_FaceButton_Right" then
      if r0_125.IsFocusInTips and r0_125.WidgetRewards.Key_Controller_Qa then
        r0_125.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Visible)
        r0_125:SetFocusInGamePad()
        r0_125.IsFocusInTips = false
        r0_125.WidgetRewards.Btn_Qa:CloseMenuAnchor()
        r0_125:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
      else
        r0_125.Btn_Close:OnBtnClicked()
        return true
      end
      return true
    elseif r1_125 == "Gamepad_RightThumbstick" then
      r0_125.IsFocusInTips = true
      if r0_125.WidgetRewards.Key_Controller_Qa then
        r0_125.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Collapsed)
      end
      local r2_125 = r0_125:GetOwningPlayer()
      for r7_125, r8_125 in ipairs(r0_125.rewardItems) do
        if r8_125 and r8_125:HasUserFocus(r2_125) then
          r0_125.TempleNeedFocusItemIndex = r7_125
          break
        end
      end
      -- close: r3_125
      r0_125.WidgetRewards.Btn_Qa:SetFocus()
      r0_125.WidgetRewards.Btn_Qa:OpenMenuAnchor()
      r0_125:UpdateBottomTabsInfo(nil, GText("UI_Tips_Close"))
      return true
    end
    return false
  end
  DebugPrint("thy    Handle_OnGamePadDown", r1_125)
  if r1_125 == "Gamepad_FaceButton_Top" then
    r0_125:OnBtnContinueClicked()
    return true
  elseif r1_125 == "Gamepad_Special_Right" then
    if UIManager(r0_125):GetUIObj("CommonDialog") then
      return 
    end
    r0_125:OnBtnChangePanelClicked()
    return true
  elseif r1_125 == "Gamepad_RightThumbstick" then
    if not r0_125.IsWin then
      if r0_125.Refund:GetFocusState() then
        r0_125.IsInRefund = false
        r0_125.Refund:CancelItemListFocus()
        r0_125:SetFocusInGamePad()
        r0_125:SwitchMainUIPCToGamePad()
        return true
      end
      r0_125.IsInRefund = true
      r0_125.NavigateWidget:SetVisibility(ESlateVisibility.Visible)
      r0_125.Refund:SetItemListFocus()
      r0_125:UpdateMainUIInGamePadClick()
      r0_125:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"), GText("UI_Tips_Close"))
    end
    return true
  elseif r1_125 == "Gamepad_FaceButton_Right" then
    if not r0_125.IsInRefund then
      r0_125.Btn_Close:OnBtnClicked()
      return true
    end
    if not r0_125.IsWin and r0_125.Refund:GetFocusState() then
      r0_125.IsInRefund = false
      r0_125.Refund:CancelItemListFocus()
      r0_125:SetFocusInGamePad()
    end
    r0_125:UpdateBottomTabsInfo(GText("UI_Tips_Ensure"), GText("UI_Tips_Close"))
    r0_125:SwitchMainUIPCToGamePad()
    return true
  elseif r1_125 == "Gamepad_LeftThumbstick" then
    r0_125.Cost:OpenTip()
    r0_125:UpdateMainUIInGamePadClick()
    return true
  elseif r1_125 == "Gamepad_RightStick_Right" then
    if r0_125.FailTipsNum then
      r0_125.CurFailTipIndex = math.min(r0_125.CurFailTipIndex + 1, r0_125.FailTipsNum)
      r0_125.FailTips.List_Tips:NavigateToIndex(r0_125.CurFailTipIndex)
    end
    return true
  elseif r1_125 == "Gamepad_RightStick_Left" then
    if r0_125.FailTipsNum then
      r0_125.CurFailTipIndex = math.max(r0_125.CurFailTipIndex + -1, 0)
      r0_125.FailTips.List_Tips:NavigateToIndex(r0_125.CurFailTipIndex)
    end
    return true
  end
  if r1_125 == Const.GamepadSpecialLeft then
    if r0_125.WBP_Chat_CommonEnter then
      if r0_125.WBP_Chat_CommonEnter.ControllerKeyImg then
        r0_125.WBP_Chat_CommonEnter.ControllerKeyImg:OnButtonPressed()
      else
        r0_125.WBP_Chat_CommonEnter:OnClick()
      end
    end
    return true
  end
  return false
end
function r4_0.OnPreviewKeyDown(r0_126, r1_126, r2_126)
  -- line: [3165, 3178] id: 126
  local r3_126 = false
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_126)) == "Enter" and r0_126.WBP_Chat_CommonEnter and r0_126.WBP_Chat_CommonEnter.OnClick then
    r0_126.WBP_Chat_CommonEnter:OnClick()
    r3_126 = true
  end
  if r3_126 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r4_0.OnKeyDown(r0_127, r1_127, r2_127)
  -- line: [3181, 3197] id: 127
  local r3_127 = false
  local r4_127 = UE4.UKismetInputLibrary.GetKey(r2_127)
  local r5_127 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_127)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_127) then
    DebugPrint("thy    Key_IsGamepadKey", r5_127)
    r3_127 = r0_127:Handle_OnGamePadDown(r5_127)
  else
    DebugPrint("thy    Key_IsPC", r5_127)
    r3_127 = r0_127:Handle_OnPCDown(r5_127)
  end
  if r3_127 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r4_0.OnKeyUp(r0_128, r1_128, r2_128)
  -- line: [3199, 3216] id: 128
  local r3_128 = false
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_128)) == Const.GamepadSpecialLeft then
    if r0_128.WBP_Chat_CommonEnter and r0_128.WBP_Chat_CommonEnter.ControllerKeyImg then
      r0_128.WBP_Chat_CommonEnter.ControllerKeyImg:OnButtonReleased()
    end
    r3_128 = true
  end
  if r3_128 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r4_0.OnTeamMatchTimingStart(r0_129)
  -- line: [3229, 3234] id: 129
  r0_129.Btn_Continue:ForbidBtn(true)
end
function r4_0.OnTeamMatchTimingEnd(r0_130)
  -- line: [3236, 3238] id: 130
  r0_130.Btn_Continue:ForbidBtn(false)
end
function r4_0.TryEnterDungeonAgain(r0_131)
  -- line: [3240, 3287] id: 131
  -- notice: unreachable block#7
  DebugPrint("gmy@WBP_DungeonSettlement_C M:TryEnterDungeonAgain")
  local r1_131 = GWorld:GetAvatar()
  if not r1_131 then
    return 
  end
  if r0_131.DungeonId == nil then
    return 
  end
  local r2_131 = r0_131:IsSolo()
  local r3_131 = r0_131:IsStandAloneSolo()
  local r4_131 = DataMgr.Dungeon[r0_131.DungeonId]
  local r5_131 = r4_131.TicketId
  if r5_131 then
    r5_131 = #r4_131.TicketId
    if r5_131 == 0 then
      ::label_28::
      r5_131 = r4_131.NoTicketEnter
    else
      r5_131 = true
    end
  else
    goto label_28	-- block#6 is visited secondly
  end
  DebugPrint("gmy@WBP_DungeonSettlement_C M:TryEnterDungeonAgain", r2_131, r3_131, r5_131)
  if r3_131 and r5_131 then
    r0_131:OpenTicketDialog()
  elseif r2_131 then
    if r5_131 then
      r1_131:EnterDungeonAgain(function(r0_132)
        -- line: [3264, 3267] id: 132
        DebugPrint("gmy@WBP_DungeonSettlement_C M:EnterDungeonAgain Callback1", r0_132)
      end)
    else
      r1_131:EnterDungeonAgain(function(r0_133)
        -- line: [3269, 3275] id: 133
        DebugPrint("gmy@WBP_DungeonSettlement_C M:EnterDungeonAgain Callback2", r0_133)
        if r0_133 == ErrorCode.RET_SUCCESS then
          UIManager(r0_131):LoadUINew("DungeonMatchTimingBar", r0_131.DungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
        end
      end)
    end
  else
    r1_131:EnterDungeonAgain(function(r0_134)
      -- line: [3279, 3285] id: 134
      DebugPrint("gmy@WBP_DungeonSettlement_C M:EnterDungeonAgain Callback", r0_134)
      if r0_134 == ErrorCode.RET_SUCCESS then
        UIManager(r0_131):LoadUINew("DungeonMatchTimingBar", r0_131.DungeonId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
      end
    end)
  end
end
function r4_0.IsSolo(r0_135)
  -- line: [3289, 3295] id: 135
  local r1_135 = GWorld:GetAvatar()
  if not r1_135 then
    return true
  end
  return not r1_135:IsInMultiSettlement()
end
function r4_0.IsStandAloneSolo(r0_136)
  -- line: [3298, 3304] id: 136
  local r1_136 = GWorld:GetAvatar()
  if not r1_136 then
    return true
  end
  return r1_136.SettlementUidArray == nil
end
function r4_0.OpenTicketDialog(r0_137, r1_137)
  -- line: [3306, 3326] id: 137
  local r2_137 = UIManager(r0_137):ShowCommonPopupUI(100123, {
    DungeonId = r0_137.DungeonId,
    RightCallbackObj = r0_137,
    RightCallbackFunction = function(r0_138, r1_138)
      -- line: [3310, 3322] id: 138
      GWorld:GetAvatar():EnterDungeonAgain(function(r0_139)
        -- line: [3312, 3315] id: 139
        r0_137:BlockAllUIInput(false)
        DebugPrint("gmy@WBP_DungeonSettlement_C M:OpenTicketDialog Callback", r0_139)
      end, r1_138.Content_1.TicketId)
      r0_137:BlockAllUIInput(true)
      r0_137:AddTimer(10, function()
        -- line: [3317, 3321] id: 140
        if r0_137 and r0_137:IsAllUIInputBlocked() then
          r0_137:BlockAllUIInput(false)
        end
      end)
    end,
    ForbiddenRightCallbackObj = r0_137,
    AutoFocus = true,
  }, r0_137)
end
function r4_0.BP_GetDesiredFocusTarget(r0_141)
  -- line: [3328, 3352] id: 141
  DebugPrint("ljl@ BP_GetDesiredFocusTarget")
  if r0_141:IsAnimationPlaying(r0_141.Defeat_In) or r0_141:IsAnimationPlaying(r0_141.Victory_In) then
    return r0_141
  end
  if r0_141.IsTemple then
    return r0_141.WidgetRewards.List_Reward
  end
  if #r0_141.SpRewardsArray == 0 then
    if #r0_141.RewardsArray ~= 0 then
      return r0_141.TileView_Prop
    else
      return r0_141
    end
  else
    return r0_141.TileView_Reward
  end
end
function r4_0.InitHandleKeyInfo(r0_142)
  -- line: [3354, 3407] id: 142
  if ModController:IsMobile() then
    return 
  end
  r0_142.Panel_Key:SetVisibility(ESlateVisibility.Visible)
  r0_142.WBox_Key:ClearChildren()
  local r1_142 = r0_142:CreateWidgetNew("ComKeyTextDesc")
  local r2_142 = r0_142:CreateWidgetNew("ComKeyTextDesc")
  local r3_142 = r0_142:CreateWidgetNew("ComKeyTextDesc")
  r1_142:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "V",
        ClickCallback = r0_142.OnBtnChangePanelClicked,
        Owner = r0_142,
      }
    },
    Desc = GText("UI_BATTLE_DATA"),
  })
  r2_142:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "R",
        ClickCallback = function()
          -- line: [3380, 3382] id: 143
          r0_142:OnBtnContinueClicked()
        end,
        Owner = r0_142,
      }
    },
    Desc = GText("UI_MISSION_AGAIN"),
  })
  r3_142:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = r0_142.Exit,
        Owner = r0_142,
      }
    },
    Desc = GText("UI_Esc_ExitDungeon"),
  })
  local r4_142 = r0_142:GetDungeonInfo(r0_142.BattleInfo)
  if r4_142 and r4_142.DungeonType and r4_142.DungeonType ~= "Temple" and r4_142.DungeonType ~= "Party" then
    r0_142.WBox_Key:AddChild(r1_142)
  elseif r0_142.IsHardBoss then
    r0_142.WBox_Key:AddChild(r1_142)
  end
  r0_142.WBox_Key:AddChild(r2_142)
  r0_142.WBox_Key:AddChild(r3_142)
end
function r4_0.OnBtnContinueClicked(r0_144)
  -- line: [3409, 3414] id: 144
  if r0_144.Btn_Continue:IsBtnForbidden() then
    r0_144.Btn_Continue.CurrentClickIsForbid = true
  end
  r0_144.Btn_Continue:OnBtnClicked()
end
AssembleComponents(r4_0)
return r4_0
