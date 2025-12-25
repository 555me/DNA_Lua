-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Menu\Menu_Level_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local r1_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
local r2_0 = require("Utils.UIUtils")
r1_0._components = {
  "BluePrints.UI.UI_PC.Menu.MenuLevelAbyssComponent"
}
function r1_0.Initialize(r0_1, r1_1)
  -- line: [16, 50] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.BtnName = {
    "UI_Esc_Continue",
    "UI_Esc_CommonSet",
    "UI_Esc_Skill"
  }
  r0_1.ClickFunction = {
    "OnClickContinueGame",
    "OnClickCommonSet",
    "OnClickSkill"
  }
  r0_1.BtnIconPath = {
    UI_Esc_Continue = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Continue.T_Menu_Continue",
    UI_Rouge_ESC_HalfwayOut = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Suspend.T_Menu_Suspend",
    UI_Rouge_ESC_EndOut = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
    UI_HardBoss_TabName_2 = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
    UI_Esc_CommonSet = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Setting.T_Menu_Setting",
    UI_Esc_Skill = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Skill.T_Menu_Skill",
    UI_TEMPLE_RESTART = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Restart.T_Menu_Restart",
    UI_DUNGEON_DES_TRAINING_27 = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Skill.T_Menu_Skill",
    UI_DUNGEON_DES_TRAINING_28 = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
    UI_SpecialQuest_GiveUp = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
    UI_CharTrial_LeaveTitle = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
    FeinaEvent_Exit_Title = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
    UI_Esc_ExitTemple = "/Game/UI/Texture/Dynamic/Atlas/Menu/T_Menu_Exit.T_Menu_Exit",
  }
  r0_1.BtnIdx = 0
  r0_1.CloseBySelf = false
  r0_1.CloseByChild = false
  r0_1.GamePadGiveUpKeyName = "UI_Esc_Challenge"
end
function r1_0.OnLoaded(r0_2)
  -- line: [52, 58] id: 2
  r0_2.Super.OnLoaded(r0_2)
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/common/esc_menu_open", "EscMenuOpen", nil)
  r0_2:SetFocus()
  r0_2:Init()
  r0_2:PlayInAnim()
end
function r1_0.Init(r0_3)
  -- line: [60, 87] id: 3
  r0_3.MaxBtnNum = 10
  r0_3:InitCommonInfo()
  r0_3:InitByType()
  r0_3:InitSetupList()
  r0_3:InitStageInfo()
  r0_3:InitRoleItemInfos()
  r0_3:InitCommonButton()
  if CommonUtils.GetDeviceTypeByPlatformName(r0_3) == "PC" then
    r0_3:AddInputMethodChangedListen()
  end
  r0_3.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_3)
  r0_3:RefreshOpInfoByInputDevice(r0_3.GameInputModeSubsystem:GetCurrentInputType(), r0_3.GameInputModeSubsystem:GetCurrentGamepadName())
  local r1_3 = UIManager(r0_3):GetUI("BattleMain")
  if r1_3 ~= nil then
    r1_3:SetRenderOpacity(0)
  end
  local r2_3 = UIManager(r0_3):GetUI("FeinaEventHUD")
  if r2_3 ~= nil then
    r2_3:PlayOutAnim()
  end
end
function r1_0.InitCommonInfo(r0_4)
  -- line: [89, 93] id: 4
  r0_4.Text_Title:SetText(GText("UI_Dungeon_DetailTitle"))
end
function r1_0.InitByType(r0_5)
  -- line: [95, 154] id: 5
  local r1_5 = GWorld:GetAvatar()
  r0_5.InHardBoss = false
  r0_5.InTemple = false
  r0_5.InTraining = false
  r0_5.InRougeLike = false
  r0_5.IsInCommonDungeon = false
  if r1_5 and r1_5:IsInHardBoss() then
    r0_5.InHardBoss = true
    r0_5:InitHardBoss()
    return 
  end
  if r1_5 and r1_5:IsInRougeLike() then
    r0_5:InitRougeLike()
    r0_5.InRougeLike = true
    return 
  end
  if r1_5 and r1_5.SpecialQuestId then
    r0_5:InitSpecialQuest()
    r0_5.InSpecialQuest = true
    return 
  end
  local r2_5 = UE4.UGameplayStatics.GetGameMode(r0_5)
  local r3_5 = UE4.UGameplayStatics.GetGameState(r0_5)
  if r2_5 ~= nil and r3_5 ~= nil then
    if r3_5.GameModeType == "Training" then
      r0_5:InitTraining()
      r0_5.InTraining = true
      return 
    elseif r3_5.GameModeType == "Temple" then
      r0_5:InitTemple()
      r0_5.InTemple = true
      return 
    elseif r3_5.GameModeType == "Trial" then
      r0_5:InitTrail()
      r0_5.InTrail = true
      return 
    elseif r3_5.GameModeType == "Abyss" then
      r0_5:InitAbyss()
      r0_5.InAbyss = true
      return 
    elseif r3_5.GameModeType == "Party" then
      r0_5:InitParty()
      r0_5.InParty = true
      return 
    elseif r3_5.GameModeType == "FeinaEvent" then
      r0_5:InitFeinaEvent()
      r0_5.InFeinaEvent = true
      return 
    elseif r3_5.GameModeType == "Paotai" then
      r0_5:InitPaotaiEvent()
      r0_5.InPaotaiEvent = true
    end
  end
  r0_5.IsInCommonDungeon = true
  table.insert(r0_5.BtnName, "UI_HardBoss_TabName_2")
  table.insert(r0_5.ClickFunction, "OnClickExitGame")
end
function r1_0.InitFeinaEvent(r0_6)
  -- line: [156, 163] id: 6
  r0_6.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_6.WidgetSwitcher_Show:SetVisibility(UIConst.VisibilityOp.Collapsed)
  table.remove(r0_6.BtnName, 3)
  table.remove(r0_6.ClickFunction, 3)
  table.insert(r0_6.BtnName, "FeinaEvent_Exit_Title")
  table.insert(r0_6.ClickFunction, "OnClickExitGame")
end
function r1_0.InitPaotaiEvent(r0_7)
  -- line: [165, 172] id: 7
  r0_7.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_7.WidgetSwitcher_Show:SetVisibility(UIConst.VisibilityOp.Collapsed)
  table.remove(r0_7.BtnName, 3)
  table.remove(r0_7.ClickFunction, 3)
  table.remove(r0_7.BtnName, 2)
  table.remove(r0_7.ClickFunction, 2)
end
function r1_0.InitTemple(r0_8)
  -- line: [174, 261] id: 8
  r0_8.WidgetSwitcher_Type:SetActiveWidgetIndex(3)
  table.insert(r0_8.BtnName, "UI_TEMPLE_RESTART")
  table.insert(r0_8.BtnName, "UI_Esc_ExitTemple")
  table.insert(r0_8.ClickFunction, "TempleRestart")
  table.insert(r0_8.ClickFunction, "OnClickExitGame")
  local r1_8 = UE4.UGameplayStatics.GetGameState(r0_8)
  local r2_8 = DataMgr.Temple[r1_8.DungeonId]
  local r3_8 = r1_8.MaxTempleStar and 0
  local r4_8 = r2_8.RewardId
  local r5_8 = "Quit"
  local r6_8 = DataMgr.TempleEventLevel[r1_8.DungeonId] ~= nil
  if #r4_8 == 3 then
    r0_8.IsStarLevel = true
    if r3_8 < 0 or r3_8 > 3 then
      error("本关设置星级超出可获得的范围")
    end
  elseif #r4_8 == 1 then
    r0_8.IsStarLevel = false
  else
    error("本关奖励配置有误，请正确配置星级奖励或无星级奖励")
  end
  r0_8.SizeBox_Rewards:ClearChildren()
  r0_8.WidgetRewards = r0_8:CreateWidgetNew("TempleItem")
  r0_8.WidgetRewards.ParentUI = r0_8
  local r7_8 = {}
  if r6_8 then
    r0_8.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_8.IsStarLevel then
    local r8_8 = r1_8.MaxTempleStar and 0
    for r12_8 = 1, #r4_8, 1 do
      table.insert(r7_8, r0_8:NewTempleContent(r0_8:GetFirstRewardInfoById(r4_8[r12_8]), r12_8))
      r7_8[r12_8].bAsyncLoadIcon = true
    end
    r0_8.WidgetRewards:SetStarRewards(r7_8, r3_8, r8_8)
  else
    if r4_8[1] ~= nil then
      local r8_8 = RewardUtils:GetAllRewardByRewardId(r4_8[1])
      local r9_8 = {}
      r0_8:RewardsAddToArray(r9_8, r8_8, false)
      r0_8:SortRewardsArray(r9_8)
      r7_8 = r9_8
    end
    local r8_8 = GWorld:GetAvatar()
    if not r8_8 then
      error("Avatar is nil")
    end
    if r8_8.Dungeons[r1_8.DungeonId] then
      r0_8.WidgetRewards:SetNoStarRewards(r7_8, r8_8.Dungeons[r1_8.DungeonId].IsPass, 0, 0)
      r0_8.WidgetRewards:StartShowNoStarRewards()
    end
  end
  r0_8.WidgetRewards:SetVisibility(ESlateVisibility.Visable)
  r0_8.SizeBox_Rewards:AddChild(r0_8.WidgetRewards)
  r0_8.RewardItems = {
    r0_8.WidgetRewards.Item01,
    r0_8.WidgetRewards.Item02,
    r0_8.WidgetRewards.Item03,
    r0_8.WidgetRewards.Item_Repeat
  }
  r0_8.WidgetRewards.Btn_Qa:Init({
    OwnerWidget = r0_8.WidgetRewards,
    TextContent = GText("UI_Temple_RewardDetail"),
    OnMenuOpenChangedCallBack = r0_8.OnMenuOpenChangedCallBack,
  })
  r0_8.WidgetRewards.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
end
function r1_0.InitParty(r0_9)
  -- line: [263, 343] id: 9
  r0_9.WidgetSwitcher_Type:SetActiveWidgetIndex(3)
  table.insert(r0_9.BtnName, "UI_Esc_ExitTemple")
  table.insert(r0_9.ClickFunction, "OnClickExitGame")
  local r1_9 = UE4.UGameplayStatics.GetGameState(r0_9)
  local r2_9 = DataMgr.Party[r1_9.DungeonId]
  local r3_9 = r1_9.MaxTempleStar and 0
  local r4_9 = r2_9.RewardId
  local r5_9 = "Quit"
  if #r4_9 == 3 then
    r0_9.IsStarLevel = true
    if r3_9 < 0 or r3_9 > 3 then
      error("本关设置星级超出可获得的范围")
    end
  elseif #r4_9 == 1 then
    r0_9.IsStarLevel = false
  else
    error("本关奖励配置有误，请正确配置星级奖励或无星级奖励")
  end
  r0_9.SizeBox_Rewards:ClearChildren()
  r0_9.WidgetRewards = r0_9:CreateWidgetNew("TempleItem")
  local r6_9 = {}
  if r0_9.IsStarLevel then
    local r7_9 = GWorld:GetAvatar()
    local r8_9 = 0
    local r9_9 = r7_9.Dungeons[r1_9.DungeonId].MaxStar and 0
    for r13_9 = 1, #r4_9, 1 do
      table.insert(r6_9, r0_9:NewTempleContent(r0_9:GetFirstRewardInfoById(r4_9[r13_9]), r13_9))
      r6_9[r13_9].bAsyncLoadIcon = true
    end
    r0_9.WidgetRewards:SetStarRewards(r6_9, r3_9, r9_9)
  else
    if r4_9[1] ~= nil then
      local r7_9 = RewardUtils:GetAllRewardByRewardId(r4_9[1])
      local r8_9 = {}
      r0_9:RewardsAddToArray(r8_9, r7_9, false)
      r0_9:SortRewardsArray(r8_9)
      r6_9 = r8_9
    end
    local r7_9 = GWorld:GetAvatar()
    if not r7_9 then
      error("Avatar is nil")
    end
    if r7_9.Dungeons[r1_9.DungeonId] then
      r0_9.WidgetRewards:SetNoStarRewards(r6_9, true)
    end
  end
  r0_9.WidgetRewards:SetVisibility(ESlateVisibility.Visable)
  r0_9.SizeBox_Rewards:AddChild(r0_9.WidgetRewards)
  r0_9.RewardItems = {
    r0_9.WidgetRewards.Item01,
    r0_9.WidgetRewards.Item02,
    r0_9.WidgetRewards.Item03,
    r0_9.WidgetRewards.Item_Repeat
  }
  r0_9.WidgetRewards.Btn_Qa:Init({
    OwnerWidget = r0_9.WidgetRewards,
    TextContent = GText("UI_Party_RewardDetail"),
    OnMenuOpenChangedCallBack = r0_9.OnMenuOpenChangedCallBack,
  })
  r0_9.WidgetRewards.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
end
function r1_0.InitTraining(r0_10)
  -- line: [345, 350] id: 10
  r0_10.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_10.BtnName[3] = "UI_DUNGEON_DES_TRAINING_27"
  table.insert(r0_10.BtnName, "UI_DUNGEON_DES_TRAINING_28")
  table.insert(r0_10.ClickFunction, "OnClickExitGame")
end
function r1_0.InitTrail(r0_11)
  -- line: [352, 356] id: 11
  r0_11.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  table.insert(r0_11.BtnName, "UI_CharTrial_LeaveTitle")
  table.insert(r0_11.ClickFunction, "OnClickExitGame")
end
function r1_0.InitHardBoss(r0_12)
  -- line: [358, 362] id: 12
  r0_12.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  table.insert(r0_12.BtnName, "UI_HardBoss_TabName_2")
  table.insert(r0_12.ClickFunction, "OnClickExitGame")
end
function r1_0.InitSpecialQuest(r0_13)
  -- line: [364, 372] id: 13
  r0_13.WidgetSwitcher_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_13.Panel_ExpGain:SetVisibility(UIConst.VisibilityOp.Collapsed)
  table.remove(r0_13.BtnName, 3)
  table.remove(r0_13.ClickFunction, 3)
  table.insert(r0_13.BtnName, "UI_SpecialQuest_GiveUp")
  table.insert(r0_13.ClickFunction, "OnClickExitGame")
  r0_13.GamePadGiveUpKeyName = "UI_SpecialQuest_GiveUp"
end
function r1_0.InitRougeLike(r0_14)
  -- line: [373, 406] id: 14
  table.insert(r0_14.BtnName, "UI_Rouge_ESC_HalfwayOut")
  table.insert(r0_14.BtnName, "UI_Rouge_ESC_EndOut")
  table.insert(r0_14.ClickFunction, "OnClickHalfwayOut")
  table.insert(r0_14.ClickFunction, "OnClickExitGame")
  r0_14.WidgetSwitcher_Type:SetActiveWidgetIndex(1)
  if GWorld.RougeLikeManager then
    local r1_14 = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId].RoomRandom and 1
    local r2_14 = GWorld.RougeLikeManager.RoomIndex
    local r3_14 = GWorld.RougeLikeManager.RoomId
    local r4_14 = GWorld.RougeLikeManager.PassRooms
    local r5_14 = UWildcardGameInstanceSubsystem.GetSubsystem(GWorld.GameInstance)
    local r6_14 = r5_14:ReplaceWildcard(string.format(GText("UI_Rou_RoomCurrent"), r2_14))
    local r7_14 = r5_14:ReplaceWildcard(string.format(GText("UI_Rou_RoomTotal"), #r1_14))
    r0_14.Text_Now:SetText(r6_14)
    r0_14.Text_Total:SetText(r7_14)
    r0_14.List_Route:ClearChildren()
    for r11_14 = 0, r2_14 + -1, 1 do
      local r12_14 = r0_14:CreateWidgetNew("RougeRouteItem")
      r0_14.List_Route:AddChild(r12_14)
      if r11_14 == r2_14 + -1 then
        r12_14:InitRouteItem(r11_14 + 1, r3_14)
        r12_14:PlayPresentAnim()
      else
        r12_14:InitRouteItem(r11_14 + 1, r4_14[r11_14 + 1])
        r12_14:PlayPassAnim()
      end
    end
    r0_14.List_Route:ScrollToEnd()
    r0_14:InitContractHeatPanel()
  end
end
function r1_0.InitContractHeatPanel(r0_15)
  -- line: [408, 428] id: 15
  if GWorld.RougeLikeManager then
    r0_15.Contracts = GWorld.RougeLikeManager.Contract
  end
  local r1_15 = GWorld:GetAvatar()
  local r2_15 = require("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_Model")
  r2_15:InitModel(r1_15)
  local r3_15 = r2_15:GetCurrentHeatValue()
  if r0_15.Contracts:Length() > 0 and r3_15 > 0 then
    r0_15.SizeBox_HeatBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_15.Btn_Heat:OnListItemObjectSet({
      ParentWidget = r0_15,
      BtnName = GText("UI_Rougelike_Contract_Name"),
      OnClickFunction = "OpenContractHeatPanel",
    })
    r0_15.Text_Heat:SetText(r3_15)
  end
end
function r1_0.OpenContractHeatPanel(r0_16)
  -- line: [430, 432] id: 16
  UIManager(GWorld.GameInstance):LoadUINew("RougeLikeMenuContractPanel")
end
function r1_0.ReceiveEnterState(r0_17, r1_17)
  -- line: [434, 442] id: 17
  r0_17.Super.ReceiveEnterState(r0_17, r1_17)
  if r1_17 == 1 then
    r0_17:SetFocus()
    if r0_17.CloseByChild then
      r0_17:AddTimer(0.01, r0_17.CloseSelf, false, 0, nil, true)
    end
  end
end
function r1_0.InitSetupList(r0_18)
  -- line: [444, 470] id: 18
  r0_18.BtnNums = #r0_18.BtnName
  local r1_18 = r2_0.GetCommonItemContentClass()
  for r5_18 = 1, r0_18.BtnNums, 1 do
    local r6_18 = NewObject(r1_18)
    r6_18.Id = r5_18
    r6_18.BtnName = GText(r0_18.BtnName[r5_18])
    r6_18.BtnIconPath = r0_18.BtnIconPath[r0_18.BtnName[r5_18]]
    r6_18.ParentWidget = r0_18
    r6_18.IsInRougeLike = r0_18.InRougeLike
    if r0_18.ClickFunction[r5_18] ~= nil then
      r6_18.OnClickFunction = r0_18.ClickFunction[r5_18]
    end
    local r7_18 = "Btn_" .. tostring(r5_18)
    if r0_18[r7_18] then
      r0_18[r7_18]:OnListItemObjectSet(r6_18)
    end
  end
  for r5_18 = r0_18.BtnNums + 1, r0_18.MaxBtnNum, 1 do
    local r6_18 = "Btn_" .. tostring(r5_18)
    if r0_18[r6_18] then
      r0_18[r6_18]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r1_0.InitRoleItemInfos(r0_19)
  -- line: [472, 491] id: 19
  if r0_19.InAbyss or r0_19.InFeinaEvent or r0_19.InTemple or r0_19.InParty then
    return 
  end
  r0_19.RoleItemInfos = {
    Char = {
      Widget = r0_19.Settlement_Role,
    },
    MeleeWeapon = {
      Widget = r0_19.Settlement_Melee,
    },
    RangedWeapon = {
      Widget = r0_19.Settlement_Ranged,
    },
    Player = {
      Widget = r0_19.Settlement_Account,
    },
  }
  r0_19:CalcRoleAndRewardsInfo()
end
function r1_0.CalcRoleAndRewardsInfo(r0_20)
  -- line: [493, 506] id: 20
  local r1_20 = GWorld:GetAvatar()
  if not r1_20 then
    return 
  end
  r0_20:CalcRoleInfo(r1_20)
  if r0_20.WidgetSwitcher_Type:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    return 
  end
  r0_20.ScrollBox_RewardDrop:SetControlScrollbarInside(true)
  r0_20:PreInitPropInfo()
  r0_20:CalcPropInfo(r1_20)
end
function r1_0.CalcPropInfo(r0_21, r1_21)
  -- line: [508, 569] id: 21
  r0_21.Rewards = r1_21:GetCachedDungeonRewards()
  if r0_21.IsTemple then
    return 
  end
  r0_21.SpRewardsArray = {}
  r0_21.RewardsArray = {}
  r0_21.SpRewards = {}
  local r2_21 = UE4.UGameplayStatics.GetGameState(r0_21)
  local r3_21 = DataMgr.Dungeon[r2_21.DungeonId]
  if r3_21 then
    r0_21.IsDungeonTypeEndless = r3_21.DungeonWinMode == CommonConst.DungeonWinMode.Endless
  end
  if r0_21.IsDungeonTypeEndless then
    local r4_21 = r1_21:GetCachedDungeonProgressRewards()
    if r2_21.DungeonProgress > 1 then
      for r8_21 = 1, r2_21.DungeonProgress + -1, 1 do
        if not r4_21[r8_21] then
          return 
        end
        for r13_21, r14_21 in pairs(r4_21[r8_21]) do
          for r19_21, r20_21 in pairs(r14_21) do
            for r25_21, r26_21 in pairs(r20_21) do
              r0_21:FillSpRewards(r25_21, r13_21, r19_21, r26_21)
            end
            -- close: r21_21
          end
          -- close: r15_21
        end
        -- close: r9_21
      end
    end
  end
  r0_21:RewardsAddToArray(r0_21.SpRewardsArray, r0_21.SpRewards, true)
  r0_21:RewardsAddToArray(r0_21.RewardsArray, r0_21.Rewards, false)
  r0_21:SortRewardsArray(r0_21.SpRewardsArray)
  r0_21:SortRewardsArray(r0_21.RewardsArray)
  if #r0_21.SpRewardsArray > 0 then
    r0_21.Panel_Reward:SetVisibility(ESlateVisibility.Visible)
    r0_21.Text_RewardTitle:SetText(GText("UI_DUNGEON_ObtainType"))
  else
    r0_21.Panel_Reward:SetVisibility(ESlateVisibility.Collapsed)
  end
  if #r0_21.RewardsArray then
    if r1_21 and r1_21:IsInHardBoss() then
      r0_21.Panel_PropTitle:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_21.Panel_PropTitle:SetVisibility(ESlateVisibility.Visible)
      r0_21.Text_PropTitle:SetText(GText("UI_DUNGEON_Drops"))
    end
  end
  r0_21:AddTimer(0.01, function()
    -- line: [565, 568] id: 22
    r0_21:InitRewardsInfo(r0_21.SpRewardsArray, r0_21.TileView_Reward)
    r0_21:InitRewardsInfo(r0_21.RewardsArray, r0_21.TileView_Prop)
  end, false, 0, nil, true)
end
function r1_0.FillSpRewards(r0_23, r1_23, r2_23, r3_23, r4_23)
  -- line: [571, 585] id: 23
  DebugPrint("@@@ ESC FillSpRewards", r1_23, r2_23, r3_23, r4_23)
  if not r0_23.SpRewards[r2_23] then
    r0_23.SpRewards[r2_23] = {}
  end
  if not r0_23.SpRewards[r2_23][r3_23] then
    r0_23.SpRewards[r2_23][r3_23] = {}
    r0_23.SpRewards[r2_23][r3_23][tostring(r1_23)] = r4_23
  else
    if not r0_23.SpRewards[r2_23][r3_23][tostring(r1_23)] then
      r0_23.SpRewards[r2_23][r3_23][tostring(r1_23)] = 0
    end
    r0_23.SpRewards[r2_23][r3_23][tostring(r1_23)] = r0_23.SpRewards[r2_23][r3_23][tostring(r1_23)] + r4_23
  end
end
function r1_0.SortRewardsArray(r0_24, r1_24)
  -- line: [587, 616] id: 24
  table.sort(r1_24, function(r0_25, r1_25)
    -- line: [589, 615] id: 25
    if r0_25.IsFirst ~= r1_25.IsFirst then
      return r0_25.IsFirst
    end
    if r0_25.IsSpecial ~= r1_25.IsSpecial then
      return r0_25.IsSpecial
    end
    if r0_25.Rarity ~= r1_25.Rarity then
      return r1_25.Rarity < r0_25.Rarity
    end
    if r0_25.Priority ~= r1_25.Priority then
      return r1_25.Priority < r0_25.Priority
    end
    if r0_25.Id ~= r1_25.Id then
      return r1_25.Id < r0_25.Id
    end
    if r0_25.IsBonus ~= r1_25.IsBonus then
      return not r0_25.IsBonus
    end
    if r0_25.IsWalnut ~= r1_25.IsWalnut then
      return not r0_25.IsWalnut
    end
    if r0_25.Count ~= r1_25.Count then
      return r1_25.Count < r0_25.Count
    end
    return false
  end)
end
function r1_0.RewardsAddToArray(r0_26, r1_26, r2_26, r3_26)
  -- line: [619, 688] id: 26
  if not r2_26 then
    return 
  end
  for r9_26, r10_26 in pairs(DataMgr.RewardType) do
    if r10_26.DungeonRewardType then
      local r11_26 = r2_26[r9_26 .. "s"]
      if not r11_26 then
        DebugPrint("@@@ESC Add Reward not have ", r9_26)
      else
        for r16_26, r17_26 in pairs(r11_26) do
          local r18_26 = r0_0:FindCountByTag(r17_26, "Normal")
          local r19_26 = r0_0:FindCountByTag(r17_26, "Extra")
          local r20_26 = r0_0:FindCountByTag(r17_26, "Walnut")
          local r21_26 = r0_0:FindCountByTag(r17_26, "First")
          local r22_26 = r0_26:CreateOneReward(r9_26, r10_26, r16_26, r18_26, r3_26, false, false, false, "Normal")
          local r23_26 = r0_26:CreateOneReward(r9_26, r10_26, r16_26, r19_26, r3_26, true, false, false, "Extra")
          local r24_26 = r0_26:CreateOneReward(r9_26, r10_26, r16_26, r20_26, r3_26, false, true, false, "Walnut")
          local r25_26 = r0_26:CreateOneReward(r9_26, r10_26, r16_26, r21_26, r3_26, false, false, true, "First")
          if r22_26 then
            table.insert(r1_26, r22_26)
            DebugPrint("@@@ESC Add Resource Data:RewardType, RewardTypeValue, Id, NormalNum, IsSpecial", r9_26, r10_26, r16_26, r18_26, r3_26)
          end
          if r23_26 then
            DebugPrint("@@@ESC Add ExtraResourceData:RewardType, RewardTypeValue, Id, ExtraNum, IsSpecial", r9_26, r10_26, r16_26, r19_26, r3_26)
            table.insert(r1_26, r23_26)
          end
          if r24_26 then
            DebugPrint("@@@ESC Add WalnutResourceData:RewardType, RewardTypeValue, Id, WalnutNum, IsSpecial", r9_26, r10_26, r16_26, r20_26, r3_26)
            table.insert(r1_26, r24_26)
          end
          if r25_26 then
            DebugPrint("@@@ESC Add FirstRewardData:RewardType, RewardTypeValue, Id, FirstNum, IsSpecial", r9_26, r10_26, r16_26, r21_26, r3_26)
            table.insert(r1_26, r25_26)
          end
        end
        -- close: r12_26
      end
    end
  end
  -- close: r5_26
end
function r1_0.CreateOneReward(r0_27, r1_27, r2_27, r3_27, r4_27, r5_27, r6_27, r7_27, r8_27, r9_27)
  -- line: [690, 722] id: 27
  if r4_27 == 0 then
    return 
  end
  local r10_27 = nil
  if r9_27 == "Walnut" then
    r10_27 = 3
  elseif r9_27 == "Extra" then
    r10_27 = 1
  elseif r9_27 == "First" then
    r10_27 = 2
  end
  local r11_27 = DataMgr[r1_27][tonumber(r3_27)]
  if r11_27 then
    local r12_27 = {
      Priority = r2_27.DungeonRewardSeq and 0,
      Id = r3_27,
      Count = r4_27,
      Icon = r11_27.Icon,
      Rarity = r11_27.Rarity and r11_27[r1_27 .. "Rarity"] and 0,
      ItemType = r1_27,
      IsSpecial = r5_27,
      IsBonus = r6_27,
      IsWalnutBonus = r7_27,
      IsFirst = r8_27,
      BonusType = r10_27,
    }
    return r12_27
  else
    return 
  end
end
function r1_0.CalcRoleInfo(r0_28, r1_28)
  -- line: [725, 739] id: 28
  local r2_28 = r0_28:SetNowExps()
  local r3_28 = false
  for r8_28, r9_28 in pairs(r0_28.RoleItemInfos) do
    r3_28 = r9_28.Widget:SetItem(r0_28.PlayerState:GetOldBattleInfo(r8_28), r8_28, r0_28:CalcIncrsExps(r2_28)[r8_28], true, nil, not r0_28.IsInCommonDungeon)
    r9_28.Widget:SetVisibility(ESlateVisibility.Visible)
    r9_28.Widget:PlayInAnimation()
  end
  -- close: r4_28
  if not r3_28 then
    DebugPrint("ljh@:关卡ESC RoleInfo初始化失败")
    r0_28.Panel_ExpGain:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.SetNowExps(r0_29)
  -- line: [742, 759] id: 29
  local r1_29 = {}
  for r6_29, r7_29 in pairs(r0_29.RoleItemInfos) do
    r1_29[r6_29] = 0
  end
  -- close: r2_29
  if r0_29.Player then
    if r0_29.Player.RangedWeapon then
      r1_29.RangedWeapon = r0_29.Player.RangedWeapon:GetAttr("Exp")
      DebugPrint("ljh Current Exp:" .. tostring(r1_29.RangedWeapon))
    end
    if r0_29.Player.MeleeWeapon then
      r1_29.MeleeWeapon = r0_29.Player.MeleeWeapon:GetAttr("Exp")
      DebugPrint("ljh Current " .. tostring(r1_29.MeleeWeapon))
    end
    r1_29.Char = r0_29.Player:GetAttr("Exp")
  end
  return r1_29
end
function r1_0.CalcIncrsExps(r0_30, r1_30, r2_30)
  -- line: [762, 793] id: 30
  local r3_30 = {}
  for r8_30, r9_30 in pairs(r0_30.RoleItemInfos) do
    local r10_30 = 1
    if r8_30 ~= "Player" then
      if r8_30 == "Char" then
        r10_30 = r0_30.Player:GetAttr("Level")
      end
      if r8_30 == "MeleeWeapon" and r0_30.Player.MeleeWeapon then
        r10_30 = r0_30.Player.MeleeWeapon:GetAttr("Level")
      end
      if r8_30 == "RangedWeapon" and r0_30.Player.RangedWeapon then
        r10_30 = r0_30.Player.RangedWeapon:GetAttr("Level")
      end
      local r11_30 = r0_30.PlayerState:GetOldBattleInfo(r8_30)
      local r12_30 = 0
      if r11_30.Level < r10_30 then
        for r16_30 = r11_30.Level, r10_30 + -1, 1 do
          r12_30 = r12_30 + r0_30:GetRoleLevelMaxExp(r8_30, r16_30)
        end
      end
      r3_30[r8_30] = r1_30[r8_30] + r12_30 - r11_30.Exp
    end
  end
  -- close: r4_30
  return r3_30
end
function r1_0.GetRoleLevelMaxExp(r0_31, r1_31, r2_31)
  -- line: [795, 803] id: 31
  if r1_31 == "Char" then
    return DataMgr.LevelUp[r2_31].CharLevelMaxExp
  elseif r1_31 == "Player" then
    return DataMgr.PlayerLevelUp[r2_31].PlayerLevelMaxExp
  else
    return DataMgr.WeaponLevelUp[r2_31].WeaponLevelMaxExp
  end
end
function r1_0.InitTimeInfo(r0_32)
  -- line: [806, 824] id: 32
  local r1_32 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  r0_32.Player = UE4.UGameplayStatics.GetPlayerCharacter(r0_32, 0)
  r0_32.PlayerController = UE4.UGameplayStatics.GetPlayerController(r0_32, 0)
  r0_32.PlayerState = r0_32.PlayerController.PlayerState
  if r0_32.PlayerState then
    r0_32.PlayerTime = r0_32.PlayerState:GetPlayerEndTime()
  else
    DebugPrint("Ljh PlayerTime: Empty PlayerState")
    r0_32.PlayerTime = 0
  end
  local r2_32 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if r2_32 then
    r0_32.GameTime = r2_32.EMGameState:GetGameEndTime()
  end
  DebugPrint("Ljh PlayerTime:" .. tostring(r0_32.PlayerTime) .. " player start time" .. tostring(r0_32.PlayerState.PlayerStartTime) .. " Replicated Time Seconds:" .. tostring(r1_32.ReplicatedTimeSeconds))
end
function r1_0.InitStageInfo(r0_33)
  -- line: [826, 836] id: 33
  r0_33:InitTimeInfo()
  r0_33:InitDungeonClearanceTime()
  r0_33:InitDungeonName()
  r0_33.Time:SetTimeText(r0_33.Describe, r0_33.TimeDict)
end
function r1_0.InitDungeonLevelIndex(r0_34, r1_34)
  -- line: [838, 885] id: 34
  local r2_34 = r0_34:GetDungeonInfo(r1_34)
  if r2_34.DungeonType and r2_34.DungeonType == "Temple" then
    return 
  end
  local r3_34 = UE4.UGameplayStatics.GetGameState(r0_34)
  if not r3_34 then
    return 
  end
  local r4_34 = 1
  local r5_34 = DataMgr.Dungeon2Select[r3_34.DungeonId]
  if not r5_34 then
    r5_34 = DataMgr.DungeonId2ChapterId[r3_34.DungeonId]
    if not r5_34 then
      return 
    end
    local r6_34 = DataMgr.WeeklySelectDungeon[r5_34].DungeonList
    if not r6_34 then
      return 
    end
    for r11_34, r12_34 in pairs(r6_34) do
      if r12_34 == r3_34.DungeonId then
        r4_34 = r11_34
        break
      end
    end
    -- close: r7_34
  else
    local r6_34 = DataMgr.SelectDungeon[r5_34].DungeonList
    if not r6_34 then
      return 
    end
    for r11_34, r12_34 in pairs(r6_34) do
      if r12_34 == r3_34.DungeonId then
        r4_34 = r11_34
        break
      end
    end
    -- close: r7_34
  end
  r0_34.DungeonLevelIndex = GText(Const.RomanNum[r4_34])
end
function r1_0.PreInitPropInfo(r0_35)
  -- line: [887, 906] id: 35
  r0_35.IntervalTime = 0.06666666666666667
  r0_35.FirstDelayTime = 0.3333333333333333 - r0_35.IntervalTime
  r0_35.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  r0_35.TileView_Reward:ClearListItems()
  r0_35.TileView_Prop:ClearListItems()
  r0_35.TileView_Prop:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_35.TileView_Reward:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_35.Text_None:SetText(GText("UI_NONE"))
  r0_35.TileView_Reward.OnCreateEmptyContent:Bind(r0_35, function()
    -- line: [896, 900] id: 36
    local r0_36 = NewObject(r2_0.GetCommonItemContentClass())
    r0_36.ParentWidget = r0_35
    return r0_36
  end)
  r0_35.TileView_Reward.OnCreateEmptyContent:Bind(r0_35, function()
    -- line: [901, 905] id: 37
    local r0_37 = NewObject(r2_0.GetCommonItemContentClass())
    r0_37.ParentWidget = r0_35
    return r0_37
  end)
end
function r1_0.GetDungeonInfo(r0_38, r1_38)
  -- line: [909, 911] id: 38
  return DataMgr.Dungeon[r1_38]
end
function r1_0.GetDungeonName(r0_39, r1_39)
  -- line: [913, 915] id: 39
  return GText(r1_39.DungeonName)
end
function r1_0.InitDungeonName(r0_40)
  -- line: [917, 947] id: 40
  local r1_40 = GWorld:GetAvatar()
  if not r1_40 then
    return 
  end
  r0_40.Describe = ""
  if r1_40:IsInDungeon() then
    local r2_40 = GWorld.GameInstance:GetCurrentDungeonId()
    r0_40.DungeonInfo = r0_40:GetDungeonInfo(r2_40)
    r0_40.Describe = r0_40:GetDungeonName(r0_40.DungeonInfo)
    r0_40:InitDungeonLevelIndex(r2_40)
  elseif r1_40:IsInHardBoss() then
    local r2_40 = GWorld:GetAvatar()
    if not r2_40 then
      return 
    end
    r0_40.Describe = GText(DataMgr.HardBossMain[r2_40.HardBossInfo.HardBossId].HardBossName)
    r0_40.Describe = r0_40.Describe .. " " .. GText("UI_LEVEL_NAME")
    local r4_40 = r2_40.HardBossInfo.DifficultyId
    local r5_40 = ""
    if r4_40 and DataMgr.HardBossDifficulty[r4_40] then
      r5_40 = DataMgr.HardBossDifficulty[r4_40].DifficultyLevel
    end
    r0_40.Describe = r0_40.Describe .. r5_40
  end
  if r0_40.DungeonLevelIndex then
    r0_40.Describe = r0_40.Describe .. r0_40.DungeonLevelIndex
    r0_40.DungeonLevelIndex = nil
  end
end
function r1_0.InitDungeonClearanceTime(r0_41)
  -- line: [950, 959] id: 41
  if not r0_41.PlayerTime then
    return 
  end
  local r1_41 = math.floor(r0_41.PlayerTime / 60)
  local r2_41 = math.floor(r0_41.PlayerTime % 60)
  r0_41.TimeDict = {}
  table.insert(r0_41.TimeDict, 1, {
    TimeType = "Min",
    TimeValue = r1_41,
  })
  table.insert(r0_41.TimeDict, 2, {
    TimeType = "Sec",
    TimeValue = r2_41,
  })
end
function r1_0.InitRewardsInfo(r0_42, r1_42, r2_42)
  -- line: [961, 999] id: 42
  local r3_42, r4_42 = r2_0.GetTileViewContentMaxCount(r2_42, "XY", true)
  local r5_42 = #r1_42
  if r5_42 < 1 and #r0_42.SpRewardsArray == 0 and #r0_42.RewardsArray == 0 then
    r0_42.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    if CommonUtils.GetDeviceTypeByPlatformName(r0_42) == "PC" then
      r0_42:ShowOrHideGamepadRewardKey(false)
    end
  else
    if #r0_42.SpRewardsArray == 0 then
      r4_42 = math.max(r4_42, 2)
    end
    local r6_42 = r4_42 * r3_42
    if r6_42 < r5_42 then
      local r7_42 = r5_42 // r3_42
      if r5_42 % r3_42 ~= 0 then
        r7_42 = r7_42 + 1
      end
      r6_42 = r7_42 * r3_42
      DebugPrint("@@@Esc Init RewardsInfo,Show all Item and AddEmpty Content: Maxitemnum, Realrownum, Dropitemnumeachrow", r6_42, r7_42, r3_42)
    end
    DebugPrint("@@@Esc Init RewardsInfo: RewardTotalNum, Maxitemnum", r5_42, r6_42)
    for r10_42 = 1, r6_42, 1 do
      r2_42:AddItem(r0_42:NewPropContent(r1_42[r10_42]))
    end
    r2_42:SetEmptyGridItemCount(math.max(0, r6_42 - r5_42))
    r2_42:DisableScroll(true)
    r2_42:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end
function r1_0.NewPropContent(r0_43, r1_43)
  -- line: [1001, 1041] id: 43
  local r2_43 = NewObject(r2_0.GetCommonItemContentClass())
  if r1_43 ~= nil then
    r2_43.ParentWidget = r0_43
    r2_43.Id = r1_43.Id
    r2_43.Count = r1_43.Count
    r2_43.IsShowDetails = true
    function r2_43.AfterInitCallback(r0_44)
      -- line: [1009, 1019] id: 44
      if r0_43.IsAllowPropInAnimation and not r0_44.Content.IsPlayedInAnimation then
        r0_44:PlayInAnimation()
        r0_44.Content.IsPlayedInAnimation = true
      else
        r0_44:PlayAnimation(r0_44.Normal_In, r0_44.Normal_In:GetEndTime())
      end
      r0_43:OpenTipsBindEvents(r0_44)
    end
    if r1_43.Icon then
      r2_43.Icon = r1_43.Icon
    end
    DebugPrint("thy     Content.Icon", r1_43.Icon)
    r2_43.Rarity = r1_43.Rarity
    r2_43.IsShowDetails = true
    r2_43.ItemType = r1_43.ItemType
    r2_43.IsSpecial = r1_43.IsSpecial
    if r1_43.IsWalnutBonus then
      r2_43.BonusType = 3
    end
    if r1_43.IsBonus then
      r2_43.BonusType = 1
    end
    if r1_43.IsFirst then
      r2_43.BonusType = 2
    end
    r2_43.UIName = "MenuLevel"
  end
  return r2_43
end
function r1_0.OpenTipsBindEvents(r0_45, r1_45)
  -- line: [1043, 1047] id: 45
  r1_45:BindEvents(r0_45, {
    OnMenuOpenChanged = r0_45.ItemMenuAnchorChanged,
  })
end
function r1_0.ItemMenuAnchorChanged(r0_46)
  -- line: [1049, 1058] id: 46
  if UIManager(r0_46):IsHaveMenuAnchorOpen() then
    r0_46.KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif r0_46.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_46.KeyTips:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end
function r1_0.UpdateMainUIInGamePadClick(r0_47)
  -- line: [1060, 1063] id: 47
  r0_47.KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_47:ShowOrHideGamepadRewardKey(false)
end
function r1_0.SwitchMainUIPCToGamePad(r0_48)
  -- line: [1065, 1068] id: 48
  r0_48.KeyTips:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_48:ShowOrHideGamepadRewardKey(true)
end
function r1_0.UpdateMainUIWithPCOrMoble(r0_49)
  -- line: [1070, 1071] id: 49
end
function r1_0.SetFocusInGamePad(r0_50)
  -- line: [1073, 1082] id: 50
  if r0_50.InParty or r0_50.InTemple then
    if r0_50.IsStarLevel then
      r0_50.WidgetRewards.Item01:SetFocus()
    else
      r0_50.WidgetRewards.List_Reward:SetFocus()
    end
  end
end
function r1_0.UpdateBottomTabsInfo(r0_51)
  -- line: [1084, 1085] id: 51
end
function r1_0.SwitchSelectedMode(r0_52)
  -- line: [1087, 1125] id: 52
  if r0_52.IsInViewMode then
    r0_52.IsInViewMode = false
    r0_52.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_52.Btn_1.Button_Area)
    r0_52.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    r0_52.KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
          }
        },
        Desc = GText(r0_52.GamePadGiveUpKeyName),
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_Tips_Close"),
      }
    })
    r0_52:ShowOrHideGamepadRewardKey(true)
  else
    r0_52.IsInViewMode = true
    r0_52.SelectedIndex = 0
    if r0_52.WidgetSwitcher_State:GetActiveWidgetIndex() == 0 then
      r0_52.TileView_Prop:SetFocus()
      r0_52.KeyTips:UpdateKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
            }
          },
          Desc = GText("UI_Controller_CheckDetails"),
        },
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
            }
          },
          Desc = GText("UI_Tips_Close"),
        }
      })
    end
    r0_52:ShowOrHideGamepadRewardKey(false)
  end
end
function r1_0.OnKeyDown(r0_53, r1_53, r2_53)
  -- line: [1127, 1187] id: 53
  local r3_53 = UIManager(r0_53):GetUI("DungenonBattleCount")
  local r4_53 = UIManager(r0_53):GetUI("CommonConfirmPanel")
  local r5_53 = UIManager(r0_53):GetUI(UIConst.CommonDialogTip)
  local r6_53 = UIManager(r0_53):GetUI(UIConst.SkillDetails)
  local r7_53 = false
  if r3_53 ~= nil or r4_53 ~= nil or r5_53 or r6_53 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local r8_53 = UE4.UKismetInputLibrary.GetKey(r2_53)
  local r9_53 = UE4.UFormulaFunctionLibrary.Key_GetFName(r8_53)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r8_53) then
    if r9_53 == UIConst.GamePadKey.FaceButtonRight then
      r7_53 = true
      if r0_53.IsInViewMode then
        r0_53:SwitchSelectedMode()
      else
        r0_53:CloseSelf()
      end
    elseif r9_53 == UIConst.GamePadKey.FaceButtonLeft then
      r7_53 = true
      r0_53.PressedLogOut = true
    elseif r9_53 == UIConst.GamePadKey.LeftThumb then
      r7_53 = true
      r0_53:SwitchSelectedMode()
    end
  end
  if r0_53.InAbyss and r0_53:OnKeyDownAbyss(r9_53) then
    return true
  end
  if r9_53 == "Escape" and r0_53.CanCloseByHotKey then
    r7_53 = true
    r0_53:CloseSelf()
  end
  return r7_53
end
function r1_0.OnKeyUp(r0_54, r1_54, r2_54)
  -- line: [1189, 1209] id: 54
  local r3_54 = UE4.UKismetInputLibrary.GetKey(r2_54)
  local r4_54 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_54)
  r0_54.CanCloseByHotKey = true
  local r5_54 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_54) and r4_54 == UIConst.GamePadKey.FaceButtonLeft then
    r5_54 = true
    if r0_54.PressedLogOut then
      r0_54:OnClickExitGame()
      r0_54.PressedLogOut = false
    end
  end
  if r5_54 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnListBtnClicked(r0_55, r1_55)
  -- line: [1212, 1228] id: 55
  r2_0.PlayCommonBtnSe(r0_55)
  if not r0_55:IsPlayingAnimation(r0_55.Out) then
    local r2_55 = r1_55.SelfWidget
    (function()
      -- line: [1216, 1225] id: 56
      if r0_55[r1_55.OnClickFunction] == nil then
        return 
      end
      r0_55[r1_55.OnClickFunction](r0_55)
      if r1_55.Id then
        r0_55.BtnIdx = r1_55.Id + -1
      end
    end)()
  end
end
function r1_0.SetFirstSelect(r0_57)
  -- line: [1230, 1233] id: 57
  local r1_57 = r0_57.List_Btn:GetItemAt(0)
  r1_57.SelfWidget:PlayAnimation(r1_57.SelfWidget.Select)
end
function r1_0.OnClickContinueGame(r0_58)
  -- line: [1236, 1238] id: 58
  r0_58:CloseSelf()
end
function r1_0.OnClickShowStatistics(r0_59)
  -- line: [1240, 1242] id: 59
  UIManager(r0_59):LoadUI(UIConst.DUNGEONBATTLECOUNT, "DungenonBattleCount", UIConst.ZORDER_FOR_SECONDARY_POPUP, nil, true)
end
function r1_0.OnClickCommonSet(r0_60)
  -- line: [1244, 1249] id: 60
  if UIManager(r0_60):LoadUINew("Setting") then
    r0_60:PlayOutAnim()
  end
end
function r1_0.OnClickExitGame(r0_61)
  -- line: [1251, 1297] id: 61
  local r1_61 = 100001
  local r2_61 = {
    RightCallbackObj = r0_61,
    RightCallbackFunction = r0_61.ClickConfirmExitInBattle,
  }
  if r0_61.InHardBoss then
    r2_61.RightCallbackFunction = r0_61.ExitHardBossBattle
    r1_61 = 100028
  end
  if r0_61.InSpecialQuest then
    r2_61.RightCallbackFunction = r0_61.ExitHardBattle
    r1_61 = 100120
    local r3_61 = GWorld:GetAvatar()
    if r3_61 and r3_61.SpecialQuestId then
      local r4_61 = DataMgr.SpecialQuestConfig[r3_61.SpecialQuestId].PopupUIId
      if r4_61 then
        r1_61 = r4_61
      end
    end
  end
  if r0_61.InFeinaEvent then
    r1_61 = 100229
  end
  if r0_61.InRougeLike then
    r2_61.RightCallbackFunction = r0_61.ExitRougeLike
    r1_61 = 100058
  end
  if r0_61.InTemple then
    r1_61 = 100128
  end
  if r0_61.InTraining then
    r1_61 = 100102
  end
  if r0_61.InTrail then
    r1_61 = 100161
  end
  if r0_61.InPaotaiEvent then
    r2_61.RightCallbackFunction = r0_61.ExitPaotaiEvent
    r1_61 = 100226
  end
  local r3_61 = GWorld:GetAvatar()
  if r3_61 and r3_61:IsInTeam() then
    r1_61 = 100105
  end
  UIManager(r0_61):ShowCommonPopupUI(r1_61, r2_61, r0_61)
end
function r1_0.OnClickHalfwayOut(r0_62)
  -- line: [1299, 1304] id: 62
  if GWorld.RougeLikeManager then
    GWorld.RougeLikeManager:HalfWayOut()
  end
end
function r1_0.ExitRougeLike(r0_63)
  -- line: [1306, 1316] id: 63
  if r0_63.HasRequestedExit then
    return 
  end
  r0_63.HasRequestedExit = true
  local r1_63 = GWorld:GetAvatar()
  if r1_63 then
    r1_63:ExitBattle(false)
  end
  r0_63:CloseSelf()
end
function r1_0.OnClickSkill(r0_64)
  -- line: [1318, 1331] id: 64
  local r1_64 = r0_64:GetAnimationByName("Out")
  if r0_64:IsAnimationPlaying(r0_64.Out) then
    return 
  end
  r0_64:PlayAnimation(r1_64)
  r0_64:BindToAnimationFinished(r1_64, {
    r0_64,
    function()
      -- line: [1324, 1330] id: 65
      r0_64:UnbindAllFromAnimationFinished(r1_64)
      r2_0.LoadPreviewSkillDetails(r0_64, {
        OnClosedCallback = function()
          -- line: [1327, 1329] id: 66
          r0_64:PlayInAnim()
        end,
      })
    end
  })
end
function r1_0.ClickConfirmExitInBattle(r0_67)
  -- line: [1334, 1354] id: 67
  local r1_67 = UE4.UGameplayStatics.GetGameInstance(r0_67)
  if r1_67 ~= nil then
    local r2_67 = r1_67:GetGameUIManager()
    if r2_67 ~= nil then
      local r3_67 = r2_67:GetUIObj("DungenonExcavation")
      if r3_67 ~= nil then
        r3_67:StopWarning()
      end
    end
  end
  if r0_67.HasRequestedExit then
    return 
  end
  r0_67.HasRequestedExit = true
  r0_67:CloseSelf()
  local r2_67 = GWorld:GetAvatar()
  if r2_67 then
    r2_67:ExitBattle(false, true)
  end
end
function r1_0.ExitHardBossBattle(r0_68)
  -- line: [1356, 1370] id: 68
  local r1_68 = UIManager(r0_68):GetUIObj("CommonDialog")
  if r1_68 then
    r1_68:Close()
  end
  if r0_68.HasRequestedExit then
    return 
  end
  r0_68.HasRequestedExit = true
  r0_68:CloseSelf()
  local r2_68 = GWorld:GetAvatar()
  if r2_68 then
    r2_68:ExitBattle(false, true)
  end
end
function r1_0.ExitHardBattle(r0_69)
  -- line: [1372, 1386] id: 69
  local r1_69 = UIManager(r0_69):GetUIObj("CommonDialog")
  if r1_69 then
    r1_69:Close()
  end
  r0_69:SetInputUIOnly(false)
  local r2_69 = UE4.UGameplayStatics.GetPlayerCharacter(r0_69, 0)
  DebugPrint("gyy@SpecialQuestFail,ExitSpecialQuest")
  EventManager:FireEvent(EventID.OnSpecialQuestFail, "Exit")
  r0_69:CloseSelf()
end
function r1_0.ExitPaotaiEvent(r0_70)
  -- line: [1388, 1395] id: 70
  local r1_70 = UIManager(r0_70):GetUIObj("CommonDialog")
  if r1_70 then
    r1_70:Close()
  end
  EventManager:FireEvent(EventID.EndCanonMiniGame)
  r0_70:CloseSelf()
end
function r1_0.CloseSelf(r0_71)
  -- line: [1397, 1429] id: 71
  if r0_71:IsAnimationPlaying(r0_71.In) then
    return 
  end
  local r1_71 = UIManager(r0_71):GetUI("BattleMain")
  if r1_71 ~= nil then
    r1_71:SetRenderOpacity(1)
  end
  local r2_71 = UIManager(r0_71):GetUI("FeinaEventHUD")
  if r2_71 ~= nil then
    r2_71:PlayInAnim()
  end
  AudioManager(r0_71):SetEventSoundParam(r0_71, "EscMenuOpen", {
    ToEnd = 1,
  })
  local r3_71 = r0_71:GetAnimationByName("Out")
  if r0_71:IsAnimationPlaying(r0_71.Out) and not r0_71.CloseByChild then
    return 
  end
  r0_71.CloseBySelf = true
  local function r4_71()
    -- line: [1415, 1421] id: 72
    local r0_72 = UE4.UGameplayStatics.GetPlayerCharacter(r0_71, 0)
    if IsStandAlone(r0_72) then
      r0_72:SetCanInteractiveTrigger(true)
    end
    r0_71:Close()
  end
  if r0_71.CloseByChild then
    r4_71()
  else
    r0_71:PlayAnimation(r3_71)
    r0_71:BindToAnimationFinished(r3_71, {
      r0_71,
      r4_71
    })
  end
  r0_71:RemoveInputMethodChangedListen()
end
function r1_0.SetPlayerInfo(r0_73, r1_73)
  -- line: [1431, 1466] id: 73
  local r2_73 = GWorld:GetAvatar()
  if r2_73 then
    local r3_73 = r2_73.Nickname
    local r4_73 = r2_73.Level
    local r5_73 = r2_73.Exp
    local r6_73 = r2_73.HeadIconId
    local r7_73 = nil
    local r8_73 = DataMgr.PlayerLevelUp[r4_73]
    local r9_73 = GText("UI_Player_Level")
    if r8_73 then
      r7_73 = r8_73.PlayerLevelMaxExp
    end
    if r3_73 == nil or r4_73 == nil or r5_73 == nil or r7_73 == nil then
      DebugPrint("[Esc] PlayerInfo is nil")
    end
    if r4_73 then
      r0_73.Text_Level:SetText(GText(r4_73))
    end
    if r3_73 then
      r0_73.Text_Name:SetText(GText(r3_73))
    end
    if r9_73 then
      r0_73.Text_LevelName:SetText(GText(r9_73))
    end
    if r6_73 then
      local r11_73 = LoadObject(DataMgr.HeadSculpture[r6_73].HeadPath)
      if r11_73 ~= nil then
        r0_73.Image_Player:GetDynamicMaterial():SetTextureParameterValue("IconMap", r11_73)
      end
    end
    if r5_73 ~= nil and r7_73 ~= nil then
      r0_73.Progress_Exp:GetDynamicMaterial():SetScalarParameterValue("Percent", r5_73 / r7_73)
    end
  end
  r0_73.PlayerCurrentTag = r1_73:GetCharacterTag()
  if IsStandAlone(r1_73) then
    r1_73:SetCanInteractiveTrigger(false)
  end
end
function r1_0.TempleRestart(r0_74)
  -- line: [1468, 1481] id: 74
  local r1_74 = 100097
  local r2_74 = {
    RightCallbackObj = r0_74,
  }
  local r4_74 = UE4.UGameplayStatics.GetGameMode(UE4.UGameplayStatics.GetPlayerCharacter(r0_74, 0))
  if r4_74 then
    function r2_74.RightCallbackFunction()
      -- line: [1475, 1478] id: 75
      r4_74:TriggerDungeonComponentFun("ResetPlayerLocation")
      r0_74:CloseSelf()
    end
  end
  UIManager(r0_74):ShowCommonPopupUI(r1_74, r2_74, r0_74)
end
function r1_0.PlayInAnim(r0_76)
  -- line: [1484, 1487] id: 76
  r0_76:StopAnimation(r0_76.Out)
  r0_76:PlayAnimation(r0_76.In)
end
function r1_0.PlayOutAnim(r0_77)
  -- line: [1489, 1492] id: 77
  r0_77:StopAnimation(r0_77.In)
  r0_77:PlayAnimation(r0_77.Out)
end
function r1_0.AddInputMethodChangedListen(r0_78)
  -- line: [1497, 1501] id: 78
  if IsValid(r0_78.GameInputModeSubsystem) then
    r0_78.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_78, r0_78.RefreshOpInfoByInputDevice)
  end
end
function r1_0.RemoveInputMethodChangedListen(r0_79)
  -- line: [1503, 1507] id: 79
  if IsValid(r0_79.GameInputModeSubsystem) then
    r0_79.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_79, r0_79.RefreshOpInfoByInputDevice)
  end
end
function r1_0.RefreshOpInfoByInputDevice(r0_80, r1_80, r2_80)
  -- line: [1509, 1522] id: 80
  local r3_80 = r1_80 == ECommonInputType.MouseAndKeyboard
  if r0_80.InAbyss then
    r0_80:RefreshAbyssUiWhenInputChange(r1_80)
    return 
  end
  if r3_80 then
    r0_80:InitKeyBoardView()
  elseif r1_80 == ECommonInputType.Gamepad then
    r0_80:InitGamepadView()
  end
  r0_80.CurInputDeviceType = r1_80
end
function r1_0.InitGamepadView(r0_81)
  -- line: [1524, 1533] id: 81
  if r0_81:HasFocusedDescendants() or r0_81:HasAnyUserFocus() then
    r0_81.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_81.Btn_1.Button_Area)
    r0_81.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_81) == "PC" then
    r0_81.KeyTips:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  r0_81:ShowOrHideGamepadRewardKey(true)
end
function r1_0.ShowOrHideGamepadRewardKey(r0_82, r1_82)
  -- line: [1535, 1543] id: 82
  if r1_82 then
    if r0_82.WidgetSwitcher_State:GetActiveWidgetIndex() == 0 then
      r0_82.Key_Reward:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  else
    r0_82.Key_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.InitKeyBoardView(r0_83)
  -- line: [1545, 1550] id: 83
  if CommonUtils.GetDeviceTypeByPlatformName(r0_83) == "PC" then
    r0_83.KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_83:ShowOrHideGamepadRewardKey(false)
  end
end
function r1_0.InitCommonButton(r0_84)
  -- line: [1552, 1578] id: 84
  if CommonUtils.GetDeviceTypeByPlatformName(r0_84) == "PC" then
    r0_84.Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = "LS",
          Type = "Img",
        }
      },
    })
    r0_84.KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
          }
        },
        Desc = GText(r0_84.GamePadGiveUpKeyName),
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_Tips_Close"),
      }
    })
    r0_84.KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.GetFirstRewardInfoById(r0_85, r1_85)
  -- line: [1580, 1601] id: 85
  local r2_85 = {}
  local r3_85 = DataMgr.Reward[r1_85]
  if not r3_85 then
    return r2_85
  end
  local r4_85 = r3_85.Type
  local r5_85 = r3_85.Id
  local r6_85 = r3_85.Count
  if not r4_85 or not r5_85 or not r6_85 then
    return r2_85
  end
  r2_85.Type = r4_85[1]
  r2_85.Id = r5_85[1]
  r2_85.Count = r6_85[1][1]
  local r7_85 = DataMgr[r2_85.Type][r2_85.Id]
  if r7_85 then
    r2_85.Name = r7_85.Name and r7_85[r2_85.Type .. "Name"]
    r2_85.Rarity = r7_85.Rarity and r7_85[r2_85.Type .. "Rarity"]
  end
  return r2_85
end
function r1_0.NewTempleContent(r0_86, r1_86, r2_86)
  -- line: [1603, 1628] id: 86
  local r3_86 = NewObject(r2_0.GetCommonItemContentClass())
  if r1_86 ~= nil then
    r3_86.ParentWidget = r0_86
    r3_86.Id = r1_86.Id
    r3_86.ItemType = r1_86.Type
    r3_86.Count = r1_86.Count
    r3_86.Icon = ItemUtils.GetItemIconPath(r1_86.Id, r1_86.Type)
    r3_86.Rarity = r1_86.Rarity and 1
    r3_86.IsShowDetails = true
    r3_86.bHasGot = r1_86.IsGot and false
    r3_86.UIName = "DungeonSettlement"
    function r3_86.AfterInitCallback(r0_87)
      -- line: [1615, 1622] id: 87
      if r0_86.IsAllowPropInAnimation and not r0_87.Content.IsPlayedInAnimation then
        r0_87:PlayInAnimation()
        r0_87.Content.IsPlayedInAnimation = true
      end
    end
    r3_86.OnMouseButtonUpEvents = {
      Obj = r0_86,
      Callback = function()
        -- line: [1623, 1625] id: 88
        r0_86.TempleNeedFocusItemIndex = r2_86
      end,
    }
  end
  return r3_86
end
function r1_0.OnMenuOpenChangedCallBack(r0_89)
  -- line: [1630, 1632] id: 89
end
function r1_0.DoNavigateLeft(r0_90)
  -- line: [1634, 1639] id: 90
  if r0_90.InParty or r0_90.InTemple then
    r0_90.RewardItems[3]:SetFocus()
  end
  return true
end
AssembleComponents(r1_0)
return r1_0
