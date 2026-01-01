-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Managers\BP_UIManagerComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.Common.DataStructure")
local r1_0 = r0_0.Deque
local r2_0 = r0_0.Stack
local r3_0 = require("EMCache.EMCache")
local r4_0 = require("BluePrints.UI.GMInterface.GMVariable")
local r5_0 = require("Utils.CommonUtils")
local r6_0 = Class({
  "BluePrints.Common.TimerMgr"
})
local r7_0 = {
  NormalMode = "Normal",
  StoryMode = Const.TalkHideTag,
  SkillFeatureMode = Const.SkillFeatureHideTag,
  GMMode = "GM",
}
local r8_0 = {
  ExclusiveMode = "Exclusive",
  ConditionMode = "Condition",
  BlockedMode = "Blocked",
}
function r6_0.Initialize(r0_1, r1_1)
  -- line: [46, 75] id: 1
  r0_1.UniqueCount = {}
  r0_1.AllNotRenderWorldUI = {}
  r0_1.WidgetComponentList = {}
  r0_1.WaitToTriggerTipsInfo = {}
  r0_1.HideByStateTagUIList = {}
  r0_1.AllUIStateTagsCluster = {}
  r0_1.PopUpUIWidgetRecord = {}
  r0_1.ShortCutHudKeys = {}
  r0_1.BanActionCallbackMap = {}
  r0_1.GMShowUIOnly = nil
  r0_1.ShowInStoryUINames = {}
  r0_1.AllUIActorCameraHelper = {}
  r0_1.AllUINpcActor = {}
  r0_1.CacheModifyHiddenEntity = {}
  r0_1.IsMenuAnchorOpen = false
  r0_1.GameInputModeSubsystem = nil
  r0_1.FlowList = {}
  r0_1.AsyncLoadHandlers = {}
  r0_1.AsyncGetUIContexts = {}
  r0_1.AsyncUnloadFlags = {}
  r0_1.SystemOpenFrameFlag = 0
  r0_1:InitAllContainerData()
  r0_1:InitUIConfigBySetting()
end
function r6_0.InitUIConfigBySetting(r0_2)
  -- line: [79, 88] id: 2
  if r3_0 then
    local r1_2 = r3_0:Get("GMInfo")
    if r1_2 and r1_2.DisableScreenMessages then
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(nil, "DisableAllScreenMessages")
    else
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(nil, "EnableAllScreenMessages")
    end
  end
end
function r6_0.InitAllContainerData(r0_3)
  -- line: [91, 105] id: 3
  r0_3.UILoadingDeque = r1_0.New()
  r0_3.UIJumpToDeque = r1_0.New()
  r0_3._CommonToastQueue = r1_0.New()
  r0_3._CommonToastTimer = "UIManager_CommonToastTimer"
  r0_3._CommonToastSet = {}
  r0_3._StoryToastQueue = r1_0.New()
  r0_3._StoryToastTimer = "UIManager_StoryToastTimer"
  r0_3._StoryToastSet = {}
  r0_3.UIManagerModeTagsStack = r2_0.New()
  r0_3:PushCurrentModeStateTag(r7_0.NormalMode)
end
function r6_0.InitUIStates(r0_4)
  -- line: [108, 132] id: 4
  r0_4:_InitGameDPI()
  local r1_4 = GWorld.GameInstance:GetSceneManager()
  if not UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(GWorld.GameInstance) and not UUCloudGameInstanceSubsystem.IsCloudGame() and r1_4 then
    r1_4:SetWindowDeactivatedEventDelegate()
    r1_4:SetOnWindowResizedDelegate()
    r1_4:SetOnWindowMovedDelegate()
  elseif r1_4 then
    if UE4.UInputSettings.GetInputSettings().GetInputSettings().bUseMouseForTouch then
      r1_4:UpdateUIDPIStandValue(UIConst.DPIBaseOnSize.Mobile.X, UIConst.DPIBaseOnSize.Mobile.Y)
    else
      r1_4:UpdateUIDPIStandValue(UIConst.DPIBaseOnSize.PC.X, UIConst.DPIBaseOnSize.PC.Y)
    end
  end
  r0_4.Overridden.InitUIStates(r0_4)
  UE4.UMainBar.SetIsForbidenShowBloodUI(false)
end
function r6_0.PreloadUI(r0_5)
  -- line: [135, 163] id: 5
  local r1_5 = r5_0.GetDeviceTypeByPlatformName(r0_5) == "Mobile"
  for r6_5, r7_5 in pairs(DataMgr.SystemUI) do
    if r7_5.IsPreloadBP then
      local r8_5 = nil
      if r1_5 then
        r8_5 = LoadClass(r7_5.MobileBPPath)
      else
        r8_5 = LoadClass(r7_5.PCBPPath)
      end
      if r8_5 then
        r0_5.PreLoadUIStates:Add(r6_5, r8_5)
      end
    end
  end
  -- close: r2_5
  for r6_5, r7_5 in pairs(DataMgr.WidgetUI) do
    if r7_5.PreCreateNum and r7_5.PreCreateNum > 0 then
      local r8_5 = nil
      if r1_5 then
        r8_5 = LoadClass(r7_5.MobileBPPath)
      else
        r8_5 = LoadClass(r7_5.BPPath)
      end
      if r8_5 then
        r0_5:PreCreateWidgetUI(r6_5, r8_5, r7_5.PreCreateNum)
      end
    end
  end
  -- close: r2_5
end
function r6_0._InitGameDPI(r0_6)
  -- line: [166, 180] id: 6
  local r1_6 = DataMgr.Option.HUDSize
  if not r1_6 then
    return 
  end
  local r2_6 = r3_0:Get(r1_6.EMCacheName)
  if not r2_6 or r2_6 == 0 then
    for r7_6, r8_6 in ipairs(r1_6.UnFoldText) do
      if r7_6 == math.floor(tonumber(r1_6.DefaultValue)) then
        r2_6 = tonumber(table.pack(string.gsub(r8_6, "%%", ""))[1]) * 0.01
        r3_0:Set(r1_6.EMCacheName, r2_6)
        break
      end
    end
    -- close: r3_6
  end
  UE.UUIFunctionLibrary.SetGameDPI(r2_6)
end
function r6_0.AddWidgetComponentToList(r0_7, r1_7, r2_7, r3_7)
  -- line: [195, 225] id: 7
  if not r0_7.WidgetComponentList[r1_7] then
    r0_7.WidgetComponentList[r1_7] = {}
  end
  r0_7.WidgetComponentList[r1_7][r2_7] = r3_7
  EventManager:FireEvent(EventID.OnAddWidgetComponent, {
    WidgetName = r2_7,
    WidgetComponent = r3_7,
  })
  if r0_7:CheckUIMgrIsInSpecialState() == r7_0.GMMode and r2_7 ~= r0_7.GMShowUIOnly then
    if type(r3_7.SetWidgetHiddenByTag) == "function" then
      r3_7:SetWidgetHiddenByTag(true, UIConst.CommonHideTagName.GMShowUIOnly)
    else
      local r4_7 = r3_7:GetWidget()
      if r4_7 then
        r4_7:Hide(UIConst.CommonHideTagName.GMShowUIOnly)
      end
    end
  end
  if r0_7.HideWidgetComponentTags then
    local r4_7 = {
      [r1_7] = {
        [r2_7] = r3_7,
      },
    }
    for r9_7, r10_7 in pairs(r0_7.HideWidgetComponentTags) do
      for r15_7, r16_7 in pairs(r10_7) do
        r0_7:PrivateHideAllComponentUI(r16_7, r9_7, r15_7, r4_7)
      end
      -- close: r11_7
    end
    -- close: r5_7
  end
end
function r6_0.RemoveWidgetComponentToList(r0_8, r1_8, r2_8)
  -- line: [228, 235] id: 8
  if r0_8.WidgetComponentList[r1_8] ~= nil then
    r0_8.WidgetComponentList[r1_8][r2_8] = nil
    if IsEmptyTable(r0_8.WidgetComponentList[r1_8]) then
      r0_8.WidgetComponentList[r1_8] = nil
    end
  end
end
function r6_0.CreateAndAttachToParentWidget(r0_9, r1_9, r2_9, r3_9, r4_9)
  -- line: [238, 261] id: 9
  local r5_9 = UIConst.AllUIConfig[r2_9] and {}
  local r6_9 = r0_9:GetUI(r2_9)
  if r6_9 ~= nil and not r5_9.allowmulti then
    return r6_9
  end
  if r1_9 == nil then
    print(r0_9:GetLogMask(), "The UI Whitch Named " .. r2_9 .. "BPClass is nil !!!!!!!")
    return 
  end
  local r7_9 = nil
  if type(r1_9) == "string" then
    r7_9 = UE4.UClass.Load(r1_9)
  elseif type(r1_9) == "userdata" then
    r7_9 = r1_9
  elseif type(r1_9) == "table" then
    r7_9 = r1_9
  else
    print(r0_9:GetLogMask(), "BPClassPath is not valid")
    return 
  end
  return r0_9.Overridden.CreateAndAttachToParentWidget(r0_9, r7_9, r2_9, r3_9, r4_9)
end
function r6_0._CreateWidgetNew(r0_10, r1_10)
  -- line: [265, 282] id: 10
  local r2_10 = DataMgr.WidgetUI[r1_10]
  assert(r2_10, "UI:" .. r1_10 .. "不在WidgetUI表中")
  local r3_10 = r5_0.GetDeviceTypeByPlatformName(r0_10)
  local r4_10 = nil
  if r3_10 == CommonConst.CLIENT_DEVICE_TYPE.PC then
    r4_10 = r2_10.BPPath
  elseif r3_10 == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    r4_10 = r2_10.MobileBPPath and r2_10.BPPath
  else
    r4_10 = r2_10.BPPath
  end
  local r6_10 = r0_10:CreateWidget(r4_10, r2_10.NeedShowInWindow, r2_10.ZOrder, nil, UIConst.OptimizeSwitch[r3_10].UI_ADD_IN_CACHE and r2_10.IsAddToCachePool)
  r0_10:UpdateArgs(r6_10, r2_10.Params)
  return r6_10
end
function r6_0.CreateWidgetAsync(r0_11, r1_11, r2_11, r3_11, ...)
  -- line: [289, 361] id: 11
  if not r2_11 then
    if r1_11 then
      return r0_11:_CreateWidgetNew(r1_11)
    elseif r3_11 then
      return r0_11:CreateWidget(r3_11, ...)
    end
  end
  local r4_11 = nil
  local r5_11 = nil
  local r6_11 = r5_0.GetDeviceTypeByPlatformName(r0_11)
  local r7_11 = nil	-- notice: implicit variable refs by block#[7]
  local r8_11 = nil	-- notice: implicit variable refs by block#[7]
  local r10_11 = nil	-- notice: implicit variable refs by block#[7]
  if r3_11 then
    r5_11 = r3_11
    ... = ... -- error: untaken top expr
    r4_11 = UIConst.AllUIConfig[r1_11]
    if r4_11 then
      local r11_11 = {
        NeedShowInWindow = r7_11,
        ZOrder = r8_11,
        IsAddToCachePool = r10_11 and UIConst.OptimizeSwitch[r6_11].UI_ADD_IN_CACHE,
      }
      r4_11 = r11_11
    end
  else
    r4_11 = DataMgr.WidgetUI[r1_11]
    r10_11 = r1_11
    assert(r4_11, "UI:" .. r10_11 .. "不在WidgetUI表中")
    r7_11 = CommonConst.CLIENT_DEVICE_TYPE.PC
    if r6_11 == r7_11 then
      r5_11 = r4_11.BPPath
    else
      r7_11 = CommonConst.CLIENT_DEVICE_TYPE.MOBILE
      if r6_11 == r7_11 then
        r7_11 = r4_11.MobileBPPath
        r5_11 = r7_11 and r4_11.BPPath
      else
        r5_11 = r4_11.BPPath
      end
    end
  end
  function r7_11(r0_12, r1_12)
    -- line: [323, 332] id: 12
    local r2_12 = r0_11:_CreateWidgetByUMGClass(r0_12, r4_11.NeedShowInWindow, r4_11.ZOrder, nil, r4_11.IsAddToCachePool)
    if r2_12 == nil then
      DebugPrint(ErrorTag, "BP_UIManagerComponent_C: CreateWidget Error, BPClassPath is ", r5_11)
      r0_11:ShowUIError(UIConst.ErrorCategory.BasicModule, string.format("::Error::  Widget创建失败，界面名称：%s", r1_11 and "None"))
    end
    if r1_12 then
      r1_12(r2_12)
    end
    return r2_12
  end
  r8_11 = nil
  DebugPrint("CreateWidget 开始异步加载UMGCLass", r1_11)
  local r9_11 = nil
  r10_11 = UE.UResourceLibrary.LoadClassAsync
  r10_11 = r10_11(r0_11, r5_11, {
    r0_11,
    function(r0_13, r1_13)
      -- line: [336, 348] id: 13
      DebugPrint("CreateWidget 异步加载UMGCLass完成", r1_11)
      r8_11 = r1_13
      if type(r2_11) == "function" and r9_11 then
        r7_11(r1_13, r2_11)
      elseif type(r2_11) == "thread" and coroutine.status(r2_11) == "suspended" then
        coroutine.resume(r2_11, r1_13)
      end
    end
  })
  r9_11 = r10_11
  if not r8_11 then
    r10_11 = UResourceLibrary.IsValidResource(r0_11, r9_11)
    if not r10_11 then
      return 
    end
    DebugPrint("CreateWidget 等待异步加载UMGCLass...", r1_11)
    r10_11 = type(r2_11)
    if r10_11 == "thread" then
      r10_11 = coroutine.yield()
      r8_11 = r10_11
    else
      r10_11 = type(r2_11)
      if r10_11 == "function" then
        return 
      end
    end
  end
  return r7_11(r8_11)
end
function r6_0.CreateWidget(r0_14, r1_14, r2_14, r3_14, r4_14, r5_14)
  -- line: [368, 382] id: 14
  local r6_14 = nil
  if type(r1_14) == "string" then
    r6_14 = LoadClass(r1_14)
  else
    r6_14 = r1_14
  end
  r5_14 = UIConst.OptimizeSwitch[r5_0.GetDeviceTypeByPlatformName(r0_14)].UI_ADD_IN_CACHE and r5_14
  local r8_14 = r0_14:_CreateWidgetByUMGClass(r6_14, r2_14, r3_14, r4_14, r5_14)
  if r8_14 == nil then
    DebugPrint(ErrorTag, "BP_UIManagerComponent_C: CreateWidget fail, Maybe The Current World is Null or tearing down, BPClassPath is ", r1_14)
  end
  return r8_14
end
function r6_0._CreateWidgetByUMGClass(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15)
  -- line: [384, 402] id: 15
  if r1_15 == nil then
    return 
  end
  local r6_15 = nil
  if r4_15 ~= nil then
    r6_15 = r0_15:CreateWidgetAndAddToMgr(r1_15, r4_15, r5_15)
  else
    r6_15 = r0_15:CreateWidgetWithParams(r1_15, nil, nil, r5_15)
  end
  if r6_15 ~= nil then
    if r2_15 then
      r6_15:AddToViewport(r3_15)
    elseif r3_15 ~= nil then
      r6_15:SetZOrder(r3_15)
    end
  end
  return r6_15
end
function r6_0.AddUIToStateTagsCluster(r0_16, r1_16, r2_16, r3_16)
  -- line: [406, 417] id: 16
  if r3_16 then
    if r0_16.AllUIStateTagsCluster[r1_16] == nil then
      r0_16.AllUIStateTagsCluster[r1_16] = {}
    end
    r0_16.AllUIStateTagsCluster[r1_16][r2_16] = 1
  elseif r0_16.AllUIStateTagsCluster[r1_16] ~= nil then
    r0_16.AllUIStateTagsCluster[r1_16][r2_16] = nil
  end
end
function r6_0.GenerateSpecialUIListBeforeUICreate(r0_17, r1_17, r2_17)
  -- line: [419, 465] id: 17
  local r3_17 = r8_0.ConditionMode
  local r4_17 = {}
  if r2_17 == UIConst.WidgetAllStateTag.Queue then
    for r9_17, r10_17 in pairs(r0_17.AllUIStateTagsCluster[r2_17]) do
      table.insert(r4_17, r9_17)
    end
    -- close: r5_17
  elseif r2_17 == UIConst.WidgetAllStateTag.Precedence then
    for r9_17, r10_17 in pairs(r0_17.AllUIStateTagsCluster[r2_17]) do
      local r11_17 = DataMgr.SystemUI[r9_17]
      if r11_17 ~= nil and r11_17.SpecialUINameList ~= nil then
        for r16_17, r17_17 in ipairs(r11_17.SpecialUINameList) do
          if r4_17[r17_17] == nil then
            r4_17[r17_17] = {
              r9_17
            }
          else
            table.insert(r4_17[r17_17], r9_17)
          end
        end
        -- close: r12_17
      end
    end
    -- close: r5_17
  elseif r2_17 == UIConst.WidgetAllStateTag.Mutual then
    local r5_17 = DataMgr.SystemUI[r1_17]
    if r5_17 ~= nil and r5_17.SpecialUINameList ~= nil then
      for r10_17, r11_17 in ipairs(r5_17.SpecialUINameList) do
        table.insert(r4_17, r11_17)
      end
      -- close: r6_17
    end
  elseif r2_17 == UIConst.WidgetAllStateTag.Group then
    for r9_17, r10_17 in pairs(r0_17.AllUIStateTagsCluster[r2_17]) do
      local r11_17 = DataMgr.SystemUI[r9_17]
      if r11_17 ~= nil and r11_17.SpecialUINameList ~= nil then
        for r16_17, r17_17 in ipairs(r11_17.SpecialUINameList) do
          if r4_17[r9_17] == nil then
            r4_17[r9_17] = {
              r17_17
            }
          else
            table.insert(r4_17[r9_17], r17_17)
          end
        end
        -- close: r12_17
      end
    end
    -- close: r5_17
  end
  return r3_17, r4_17
end
function r6_0.CheckUIMgrIsInSpecialState(r0_18)
  -- line: [468, 481] id: 18
  local r1_18 = UGameplayStatics.GetCurrentLevelName(r0_18)
  if r1_18 == "Login" or r1_18 == "Game_Start" then
    return r7_0.NormalMode
  end
  if r0_18.GMShowUIOnly then
    return r7_0.GMMode
  end
  return r0_18:GetCurrentModeStateTag()
end
function r6_0.GetSubTagInNormalState(r0_19, r1_19)
  -- line: [484, 525] id: 19
  local r2_19 = nil
  local r3_19 = {}
  if r0_19:CheckUIMgrIsInSpecialState() == r7_0.GMMode then
    return r2_19, r3_19
  end
  if not IsEmptyTable(r0_19.AllUIStateTagsCluster) then
    local r4_19 = nil
    if not IsEmptyTable(r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Exclusive]) then
      r2_19 = r8_0.ExclusiveMode
    elseif not IsEmptyTable(r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Blocked]) then
      r2_19 = r8_0.BlockedMode
    else
      if not IsEmptyTable(r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Precedence]) then
        r2_19, r4_19 = r0_19:GenerateSpecialUIListBeforeUICreate(r1_19, UIConst.WidgetAllStateTag.Precedence)
        r3_19[UIConst.WidgetAllStateTag.Precedence] = r4_19
      end
      if not IsEmptyTable(r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Mutual]) and r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Mutual][r1_19] ~= nil then
        r2_19, r4_19 = r0_19:GenerateSpecialUIListBeforeUICreate(r1_19, UIConst.WidgetAllStateTag.Mutual)
        r3_19[UIConst.WidgetAllStateTag.Mutual] = r4_19
      end
      if not IsEmptyTable(r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Queue]) then
        r2_19, r4_19 = r0_19:GenerateSpecialUIListBeforeUICreate(r1_19, UIConst.WidgetAllStateTag.Queue)
        r3_19[UIConst.WidgetAllStateTag.Queue] = r4_19
      end
      if not IsEmptyTable(r0_19.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Group]) then
        r2_19, r4_19 = r0_19:GenerateSpecialUIListBeforeUICreate(r1_19, UIConst.WidgetAllStateTag.Group)
        r3_19[UIConst.WidgetAllStateTag.Group] = r4_19
      end
    end
  end
  return r2_19, r3_19
end
function r6_0.AddUIManagerCurrentModeTag(r0_20, r1_20)
  -- line: [528, 541] id: 20
  r0_20:PushCurrentModeStateTag(r1_20)
  if r1_20 == r7_0.SkillFeatureMode or r1_20 == r7_0.StoryMode then
    r0_20:RefreshAllUIVisibilityBySpecialTag(true, r1_20)
    local r2_20 = MissionIndicatorManager:GetAllIndicatorUIObjs()
    if not IsEmptyTable(r2_20) then
      for r7_20, r8_20 in pairs(r2_20) do
        r8_20:Hide(r1_20)
      end
      -- close: r3_20
    end
  end
end
function r6_0.RemoveUIManagerCurrentModeTag(r0_21, r1_21)
  -- line: [544, 562] id: 21
  if r1_21 == nil then
    r1_21 = r0_21:GetCurrentModeStateTag()
  end
  if r0_21:PopCurrentModeStateTag(r1_21) ~= nil and (r1_21 == r7_0.SkillFeatureMode or r1_21 == r7_0.StoryMode) then
    r0_21:RefreshAllUIVisibilityBySpecialTag(false, r1_21)
    local r3_21 = MissionIndicatorManager:GetAllIndicatorUIObjs()
    if not IsEmptyTable(r3_21) then
      for r8_21, r9_21 in pairs(r3_21) do
        r9_21:Show(r1_21)
      end
      -- close: r4_21
    end
  end
end
function r6_0.GetCurrentModeStateTag(r0_22)
  -- line: [565, 567] id: 22
  return r0_22.UIManagerModeTagsStack:Peek()
end
function r6_0.PushCurrentModeStateTag(r0_23, r1_23)
  -- line: [570, 572] id: 23
  r0_23.UIManagerModeTagsStack:Push(r1_23)
end
function r6_0.PopCurrentModeStateTag(r0_24, r1_24)
  -- line: [575, 583] id: 24
  local r2_24 = nil
  if r1_24 ~= nil then
    r2_24 = r0_24.UIManagerModeTagsStack:FindAndRemove(r1_24)
  else
    r2_24 = r0_24.UIManagerModeTagsStack:Pop()
  end
  return r2_24
end
function r6_0.PlaceJumpUIToTop(r0_25, r1_25, r2_25)
  -- line: [587, 590] id: 25
  r0_25:PlaceItemToQueueBack(r1_25)
  r0_25:PlaceUIStateToTop(r2_25)
end
function r6_0.PrintJumpPageDequeInfo(r0_26)
  -- line: [592, 604] id: 26
  for r5_26 = 1, r0_26.UIJumpToDeque:Size(), 1 do
    local r6_26 = r0_26.UIJumpToDeque:Get(r5_26)
    if type(r6_26.GetCameraViewCurrentTarget) == "function" then
      DebugPrint("BP_UIManagerComponent_C: PrintJumpPageDequeInfo, The Info is: ", r6_26:GetName(), r6_26:GetCameraViewCurrentTarget():GetName())
    else
      DebugPrint("BP_UIManagerComponent_C: PrintJumpPageDequeInfo, The Info is: ", r6_26:GetName(), "Has No CameraViewTarget")
    end
  end
end
function r6_0.AddToJumpPageDeque(r0_27, r1_27)
  -- line: [607, 634] id: 27
  if not r1_27 then
    return 
  end
  if r0_27.UIJumpToDeque:Size() >= 3 then
    local r3_27 = r0_27.UIJumpToDeque:PopFront()
    if IsValid(r3_27) then
      r3_27.IsNeedSearchInStack = true
      if type(r3_27.Close) == "function" then
        r3_27:Close()
      else
        r0_27:UnLoadUI(r3_27.ConfigName, r3_27.WidgetName)
      end
    end
  end
  r1_27.IsAddInDeque = true
  r0_27.UIJumpToDeque:PushBack(r1_27)
  EventManager:FireEvent(EventID.OnJumpToPage, r0_27:GetLastJumpPage(), r1_27)
end
function r6_0.RemoveToJumpPageDeque(r0_28, r1_28)
  -- line: [637, 643] id: 28
  if r0_28.UIJumpToDeque:Back() == r1_28 then
    r0_28.UIJumpToDeque:PopBack()
    EventManager:FireEvent(EventID.OnJumpBackToPage, r1_28, r0_28:GetLastJumpPage())
  end
end
function r6_0.GetLastJumpPage(r0_29)
  -- line: [646, 648] id: 29
  return r0_29.UIJumpToDeque:Back()
end
function r6_0.PlaceItemToQueueBack(r0_30, r1_30)
  -- line: [651, 667] id: 30
  if r1_30 == nil then
    return 
  end
  local r2_30 = r0_30:CheckIsInJumpPageDeque(r1_30)
  local r3_30 = r0_30.UIJumpToDeque:Size()
  if r2_30 == nil then
    r0_30:AddToJumpPageDeque(r1_30)
  else
    for r7_30 = r2_30, r3_30 + -1, 1 do
      r0_30.UIJumpToDeque:Set(r7_30, r0_30.UIJumpToDeque:Get(r7_30 + 1))
    end
    r0_30.UIJumpToDeque:Set(r3_30, r1_30)
  end
end
function r6_0.CheckIsInJumpPageDeque(r0_31, r1_31)
  -- line: [670, 681] id: 31
  local r2_31 = r0_31.UIJumpToDeque:Size()
  local r3_31 = nil
  for r7_31 = 1, r2_31, 1 do
    if r0_31.UIJumpToDeque:Get(r7_31) == r1_31 then
      r3_31 = r7_31
      break
    end
  end
  return r3_31
end
function r6_0.CheckIsInLoadingDeque(r0_32, r1_32, r2_32)
  -- line: [684, 699] id: 32
  if #r1_32 == 1 and r1_32[1] == r2_32 then
    return true
  end
  local r3_32 = r0_32.UILoadingDeque:Size()
  local r4_32 = false
  for r8_32 = 1, r3_32, 1 do
    local r9_32 = r0_32.UILoadingDeque:Get(r8_32)
    if r9_32 and r9_32.UIName == r2_32 then
      r4_32 = true
      break
    end
  end
  return r4_32
end
function r6_0.LoadUINew(r0_33, r1_33, ...)
  -- line: [706, 710] id: 33
  local r2_33 = DataMgr.SystemUI[r1_33]
  assert(r2_33, "UI:" .. r1_33 .. "不在SystemUI表中")
  return r0_33:LoadUI(UIConst.LoadInConfig, r1_33, r2_33.ZOrder, ...)
end
function r6_0.LoadUIAsync(r0_34, r1_34, r2_34, ...)
  -- line: [715, 722] id: 34
  local r3_34 = DataMgr.SystemUI[r1_34]
  assert(r3_34, "UI:" .. r1_34 .. "不在SystemUI表中")
  local r4_34 = {
    ...
  }
  table.insert(r4_34, r2_34)
  table.insert(r4_34, "Async")
  return r0_34:LoadUI(UIConst.LoadInConfig, r1_34, r3_34.ZOrder, table.unpack(r4_34))
end
function r6_0.LoadUI(r0_35, r1_35, r2_35, r3_35, ...)
  -- line: [730, 929] id: 35
  if IsDedicatedServer(r0_35) then
    return 
  end
  local r4_35 = r2_35
  local r5_35 = nil
  local r6_35 = nil
  if string.find(r2_35, "#") ~= nil then
    local r8_35 = Split(r2_35, "#")
    r2_35 = r8_35[1]
    r4_35 = r8_35[2]
  end
  r5_35 = r0_35:GetUI(r4_35)
  if IsValid(r5_35) then
    DebugPrint("The Widget is Already Exist, Name is ", r2_35)
    return r5_35
  end
  if UIUtils.CheckCdnHide(r2_35, true) then
    return 
  end
  local r8_35 = DataMgr.SystemUI[r2_35]
  if r8_35 ~= nil then
    local r9_35, r10_35 = r0_35:CheckCombatcondition(r8_35.CombatconditionIdList, r8_35.ConditiontextList)
    if not r9_35 then
      if r10_35 then
        r0_35:ShowUITip(UIConst.Tip_CommonTop, GText(r10_35))
        return 
      else
        DebugPrint("The UI Load in fail, Because Combatcondition is not met, UIName is", r2_35)
        return 
      end
    end
    if r8_35.IfDevOnly and not r4_0.IsInDebugMode then
      DebugPrint("The UI Load in fail, Because IfDevOnly Set in SystemUI Config, UIName is", r2_35)
      return 
    end
  end
  r6_35, r1_35 = r0_35:SetUIConfig(r1_35, r2_35, r8_35)
  if r6_35.allowmulti then
    local r9_35 = r0_35.UniqueCount[r2_35] and 0
    if r9_35 + 1 <= (r6_35.limitcount and UIConst.MAXEXISTNUM) then
      r0_35.UniqueCount[r2_35] = r9_35 + 1
    else
      r0_35.UniqueCount[r2_35] = 1
    end
    r4_35 = r2_35 .. tostring(r0_35.UniqueCount[r2_35])
  end
  if r6_35.statetag ~= nil then
    r0_35:AddUIToStateTagsCluster(r6_35.statetag, r2_35, true)
  end
  local r9_35 = {
    ...
  }
  local r10_35, r11_35 = r0_35:GetSubTagInNormalState(r2_35)
  if r6_35.specialvisiblemode ~= "forceshow" then
    if r10_35 == r8_0.BlockedMode then
      DebugPrint("The UI Whitch Named " .. r2_35 .. " Create Fail, It has been Blocked")
      return 
    elseif r10_35 == r8_0.ConditionMode and r6_35.statetag == UIConst.WidgetAllStateTag.Queue then
      local r12_35 = r11_35[UIConst.WidgetAllStateTag.Queue]
      if r12_35 ~= nil and #r12_35 > 0 and not r0_35:CheckIsInLoadingDeque(r12_35, r2_35) then
        r0_35.UILoadingDeque:PushBack({
          UIName = r2_35,
          Params = r9_35,
        })
        DebugPrint("The UI Whitch Named " .. r2_35 .. " Create Fail, It has been Added in Loading Queue, It Will show when Condition met")
        return 
      end
    end
  end
  if type(r1_35) == "table" and r6_35.haschildBP then
    r1_35 = r1_35[r9_35[1]]
    table.remove(r9_35, 1)
  end
  if r1_35 == nil then
    DebugPrint("The UI Whitch Named " .. r2_35 .. " BPClass is nil !!!!!!!")
    r0_35:ShowUIError(UIConst.ErrorCategory.BasicModule, string.format("::Error::  系统界面创建失败，BPClassPath找不到，系统名称：%s", r2_35))
    return 
  end
  if r3_35 == nil then
    r3_35 = r6_35.zorder and UIConst.ZORDER_FOR_ZERO
  end
  local function r12_35(r0_36, r1_36)
    -- line: [825, 874] id: 36
    local r2_36 = nil
    if not r0_35.AsyncUnloadFlags[r2_35] and r0_36 then
      if r6_35.IsGlobalUI then
        r2_36 = UE4.UGameplayStatics.GetGameInstance(r0_35):LoadGlobalUI(r0_36, r4_35, r3_35)
        if r2_36 ~= nil then
          r2_36.IsGlobalUI = true
        end
      else
        r2_36 = r0_35.Overridden.LoadUI(r0_35, r0_36, r4_35, r3_35, not not r6_35.addtostack)
      end
      if r2_36 ~= nil then
        r0_35:UpdateUIObjByConfig(r2_36, r6_35, r2_35, r4_35, r9_35, r0_35:CheckUIMgrIsInSpecialState(), r10_35, r11_35)
        r0_35:OnUIObjLoadCompleted(r2_35, r6_35)
      end
    end
    if not r0_36 then
      DebugPrint(ErrorTag, "BPClassPath is not valid")
      r0_35:ShowUIError(UIConst.ErrorCategory.BasicModule, string.format("::Error::  系统界面异步创建传进来的Class对象是个空，系统名称：%s", r2_35))
    end
    if r0_35.AsyncLoadHandlers[r2_35] then
      r0_35.AsyncLoadHandlers[r2_35] = nil
    end
    if r0_35.AsyncGetUIContexts[r2_35] then
      r0_35:AddTimer(0.01, function()
        -- line: [856, 868] id: 37
        DebugPrint(LXYTag, "GetUIObjAsync异步回调处理")
        for r4_37, r5_37 in ipairs(r0_35.AsyncGetUIContexts[r2_35]) do
          if type(r5_37) == "function" then
            r5_37(r2_36)
          elseif type(r5_37) == "thread" and coroutine.status(r5_37) == "suspended" then
            coroutine.resume(r5_37, r2_36)
          end
        end
        -- close: r0_37
        r0_35.AsyncGetUIContexts[r2_35] = nil
      end, false, 0, nil, true)
    end
    r0_35.AsyncUnloadFlags[r2_35] = nil
    if r1_36 then
      r1_36(r2_36)
    end
    return r2_36
  end
  local r13_35 = r0_35:GetPreloadUIClass(r2_35)
  if r13_35 == nil then
    if type(r1_35) == "string" then
      local r14_35 = nil
      if r9_35[#r9_35] == "Async" then
        table.remove(r9_35, #r9_35)
        r14_35 = r9_35[#r9_35]
        table.remove(r9_35, #r9_35)
      end
      if r14_35 then
        DebugPrint(LXYTag, "开始异步加载UMGClass", r2_35, r1_35)
        local r15_35 = UE.UResourceLibrary.LoadClassAsync(r0_35, r1_35, {
          r0_35,
          function(r0_38, r1_38)
            -- line: [888, 904] id: 38
            if not IsValid(r1_38) then
              DebugPrint(LXYTag, "回调内，异步加载UMGCLass失败", r2_35, r1_35)
              return 
            end
            DebugPrint(LXYTag, "异步加载UMGCLass完成", r2_35, r1_35)
            r13_35 = r1_38
            if (type(r14_35) == "function" or type(r14_35) == "nil") and r0_38.AsyncLoadHandlers[r2_35] then
              r12_35(r1_38, r14_35)
            elseif type(r14_35) == "thread" and coroutine.status(r14_35) == "suspended" then
              coroutine.resume(r14_35, r1_38)
            end
          end
        })
        if not r13_35 then
          if UResourceLibrary.IsValidResource(r0_35, r15_35) then
            DebugPrint(LXYTag, "等待异步加载UMGCLass...", r2_35)
            r0_35.AsyncLoadHandlers[r2_35] = r15_35
          else
            DebugPrint(LXYTag, "异步加载UMGCLass失败，估计路径有问题", r2_35, r1_35)
            return 
          end
          if type(r14_35) == "thread" then
            r13_35 = coroutine.yield()
          elseif type(r14_35) == "function" then
            return 
          end
        end
      else
        r13_35 = UE4.UClass.Load(r1_35)
      end
      -- close: r14_35
    elseif type(r1_35) == "userdata" then
      r13_35 = r1_35
    elseif type(r1_35) == "table" then
      r13_35 = r1_35
    end
  end
  return r12_35(r13_35)
end
function r6_0.RevertRealStopGame(r0_39, r1_39)
  -- line: [932, 944] id: 39
  if r1_39 == nil then
    return false
  end
  if r1_39 == true then
    return true
  end
  local r2_39 = GWorld:GetAvatar()
  local r3_39 = nil	-- notice: implicit variable refs by block#[17]
  if r2_39 then
    r3_39 = r2_39.CurrentOnlineType
    if r3_39 then
      r3_39 = r2_39.CurrentOnlineType
      if r3_39 ~= -1 then
        if r1_39 > 0 then
          r3_39 = r1_39 < 2
        else
          goto label_23	-- block#9 is visited secondly
        end
        return r3_39
      end
    end
  end
  if r1_39 ~= nil and r1_39 ~= false then
    r3_39 = r1_39 > 0
  else
    goto label_32	-- block#15 is visited secondly
  end
  return r3_39
end
function r6_0.SetUIConfig(r0_40, r1_40, r2_40, r3_40)
  -- line: [947, 999] id: 40
  local r4_40 = UIConst.AllUIConfig[r2_40] and {}
  if not r1_40 then
    r1_40 = r4_40.resource
  end
  if r1_40 == UIConst.LoadInConfig and r3_40 ~= nil then
    r4_40.zorder = r3_40.ZOrder
    r4_40.popup = r3_40.Popup
    r4_40.statetag = r3_40.StateTag
    r4_40.ExtraArgs = r3_40.Params
    r4_40.IsStopGame = r0_40:RevertRealStopGame(r3_40.IsStopGame)
    r4_40.GlobalGameUITag = r3_40.GlobalGameUITag
    r4_40.IsHideBattleUnit = r3_40.IsHideBattleUnit
    r4_40.IgnoreHideTags = r3_40.IgnoreHideTags
    r4_40.KeyboardSetName = r3_40.KeyboardSetName
    r4_40.IsHideDrop = r3_40.IsHideDrop
    r4_40.ShowInStory = r3_40.ShowInStory
    r4_40.ConditionShowStateTags = r3_40.ConditionShowStateTags
    r4_40.System = r3_40.System
    r4_40.PauseAfterLoadingState = r3_40.PauseAfterLoadingState
    r4_40.IsHideInImmersionMode = r3_40.IsHideInImmersionMode
    r4_40.IsGlobalUI = r3_40.IsGlobalUI
    if r3_40.ConfigName then
      local r5_40 = DataMgr.SystemUIConfig[r3_40.ConfigName]
      if r5_40 then
        r4_40.addtostack = r5_40.AddToStack
        local r6_40 = r5_40.AllowMulti
        if r6_40 ~= nil then
          r6_40 = r5_40.AllowMulti and false
        else
          goto label_67	-- block#10 is visited secondly
        end
        r4_40.allowmulti = r6_40
        r6_40 = r5_40.HasChildBP
        if r6_40 ~= nil then
          r6_40 = r5_40.HasChildBP and false
        else
          goto label_75	-- block#13 is visited secondly
        end
        r4_40.haschildBP = r6_40
        r4_40.limitcount = r5_40.limitcount and UIConst.MAXEXISTNUM
        r4_40.specialvisiblemode = r5_40.SpecialVisibleMode
        r4_40.StopWorldRender = r5_40.StopWorldRender
        r4_40.eventlist = r5_40.EventList
        r6_40 = r5_40.NeedUIMode
        if r6_40 ~= nil then
          r6_40 = r5_40.NeedUIMode and false
        else
          goto label_95	-- block#18 is visited secondly
        end
        r4_40.needuimode = r6_40
      end
    end
    local r5_40 = r5_0.GetDeviceTypeByPlatformName(r0_40)
    if r4_40.haschildBP then
      r1_40 = r4_40.resource
    elseif r5_40 == "PC" then
      r1_40 = r3_40.PCBPPath
      r4_40.resource = r1_40
    elseif r5_40 == "Mobile" then
      r1_40 = r3_40.MobileBPPath and r3_40.PCBPPath
      r4_40.resource = r1_40
    end
  end
  r0_40:RecordShowInStoryConfig(r4_40, r2_40)
  return r4_40, r1_40
end
function r6_0.UpdateUIObjByConfig(r0_41, r1_41, r2_41, r3_41, r4_41, r5_41, r6_41, r7_41, r8_41)
  -- line: [1002, 1067] id: 41
  if r2_41.popup == true then
    r1_41.IsUIPopUp = true
    r0_41:CloseResidentUI(r4_41)
  end
  if r2_41.IgnoreHideTags then
    r1_41.IgnoreHideTags = r2_41.IgnoreHideTags
  end
  local r9_41 = false
  if r2_41.specialvisiblemode ~= "forceshow" then
    r9_41 = r0_41:HideUIByAllFlag(r1_41)
  end
  r0_41:UpdateArgs(r1_41, r2_41.ExtraArgs)
  if type(r1_41.InitUIInfo) == "function" then
    r1_41:InitUIInfo(r3_41, r2_41.needuimode, r2_41.eventlist, table.unpack(r5_41, 1, 15))
  end
  if r2_41.StopWorldRender then
    r1_41:SetIsPauseWorldRendering(true)
    r0_41:SetPauseWorldRenderingSwitch(r3_41, true)
  end
  if r2_41.statetag ~= nil then
    r1_41:SetUIStateTag(r2_41.statetag)
  end
  if r2_41.System == "Battle" or r2_41.System == "Common" then
    r1_41:SetIsFrequentlyUI(true)
  end
  if r2_41.IsHideInImmersionMode then
    r9_41 = r0_41:SetIsHideInImmersionMode(r1_41)
  end
  if not r9_41 then
    r9_41 = r0_41:DealWithOtherWidgetsVisibilityByUIShow(r3_41, r1_41, r2_41, r6_41, r7_41, r8_41)
  end
  if r2_41.IsStopGame then
    r1_41.IsStopGame = true
    if not r9_41 then
      r1_41:UISetGamePaused(r3_41, true)
    end
  end
  if r2_41.GlobalGameUITag then
    UE4.UGameplayStatics.GetGameInstance(r0_41):SetGlobalGameUITag(r2_41.GlobalGameUITag)
    r1_41.GlobalGameUITag = r2_41.GlobalGameUITag
  end
  if r2_41.KeyboardSetName then
    r1_41.KeyboardSetName = r2_41.KeyboardSetName
    UIManager(r0_41):SetBannedActionCallback(r2_41.KeyboardSetName, true, r1_41:GetName())
    r1_41.IsBanningAction = true
  end
  if r2_41.PauseAfterLoadingState and r1_41 then
    r0_41:TryPauseAfterLoadingMgr(r2_41.PauseAfterLoadingState)
  end
end
function r6_0.DealWithOtherWidgetsVisibilityByUIShow(r0_42, r1_42, r2_42, r3_42, r4_42, r5_42, r6_42)
  -- line: [1070, 1108] id: 42
  local r7_42 = false
  if r3_42.specialvisiblemode ~= "forceshow" then
    if r4_42 ~= r7_0.NormalMode then
      local r8_42 = r3_42.ConditionShowStateTags
      local r9_42 = true
      if r8_42 then
        for r14_42, r15_42 in ipairs(r8_42) do
          if r15_42 == r4_42 then
            r9_42 = false
            break
          end
        end
        -- close: r10_42
      end
      if r9_42 then
        DebugPrint("The UI Whitch Named " .. r1_42 .. " Will Hide And delay to Show, Now is in " .. r4_42 .. " State!")
        r7_42 = true
        r2_42:Hide(r4_42)
        r0_42:HandleUIWidgetsVisibilityByUIShow(r1_42, r2_42, r5_42, r6_42)
      end
    else
      r7_42 = r0_42:HandleUIWidgetsVisibilityByUIShow(r1_42, r2_42, r5_42, r6_42)
    end
  end
  return r7_42
  -- warn: not visited block [3, 4, 5]
  -- block#3:
  -- r7_42 = true
  -- r2_42:Hide(_ENV.UIConst.CommonHideTagName.GMShowUIOnly)
  -- if r0_42.HideByStateTagUIList[r4_42] == nil
  -- block#4:
  -- r8_42 = r0_42.HideByStateTagUIList
  -- r9_42 = {} -- #list: 1 #map: 0
  -- r10_42 = r2_42
  -- -- error: unreachable: SetList { t: Reg { index: 9, flags: 0, version: 0 }, from: 0, count: 1 }
  -- r8_42[r4_42] = r9_42
  -- goto label_80
  -- block#5:
  -- _ENV.table.insert(r0_42.HideByStateTagUIList[r4_42], r2_42)
  -- goto label_80
end
function r6_0.HandleUIWidgetsVisibilityByUIShow(r0_43, r1_43, r2_43, r3_43, r4_43)
  -- line: [1111, 1193] id: 43
  local r5_43 = "InUIConfigure"
  local r6_43 = false
  if r3_43 == r8_0.ExclusiveMode then
    r6_43 = true
    r2_43:Hide(r5_43 .. r3_43)
    if r0_43.HideByStateTagUIList[r3_43] == nil then
      r0_43.HideByStateTagUIList[r3_43] = {
        r2_43
      }
    else
      table.insert(r0_43.HideByStateTagUIList[r3_43], r2_43)
    end
  elseif r3_43 == r8_0.ConditionMode then
    local function r7_43(r0_44, r1_44, r2_44, r3_44)
      -- line: [1124, 1134] id: 44
      r0_44:Hide(r2_44 .. r1_44)
      if r0_43.HideByStateTagUIList[r3_44] == nil then
        r0_43.HideByStateTagUIList[r3_44] = {}
        r0_43.HideByStateTagUIList[r3_44][r1_44] = {
          r0_44
        }
      elseif r0_43.HideByStateTagUIList[r3_44][r1_44] == nil then
        r0_43.HideByStateTagUIList[r3_44][r1_44] = {
          r0_44
        }
      else
        table.insert(r0_43.HideByStateTagUIList[r3_44][r1_44], r0_44)
      end
    end
    local r12_43 = nil	-- notice: implicit variable refs by block#[33]
    local r13_43 = nil	-- notice: implicit variable refs by block#[33]
    if r4_43[UIConst.WidgetAllStateTag.Precedence] ~= nil then
      for r12_43, r13_43 in pairs(r4_43[UIConst.WidgetAllStateTag.Precedence]) do
        if r12_43 == r1_43 then
          r6_43 = true
          for r18_43, r19_43 in ipairs(r13_43) do
            if r0_43:GetUIObj(r12_43) ~= nil then
              DebugPrint("UIManagerComponent PrecedenceMode: The UI Which Named " .. r1_43 .. " Hide, The Reason is Effected by " .. r19_43)
              r7_43(r2_43, r19_43, r5_43, r3_43)
            end
          end
          -- close: r14_43
        else
          local r14_43 = false
          local r15_43 = r0_43:GetUIObj(r12_43)
          for r20_43, r21_43 in ipairs(r13_43) do
            if r21_43 == r1_43 then
              r14_43 = true
              break
            end
          end
          -- close: r16_43
          if r14_43 then
            if r15_43 == nil then
              r0_43:GetUIObjAsync(r12_43, function(r0_45)
                -- line: [1157, 1162] id: 45
                if r0_45 then
                  DebugPrint("UIManagerComponent PrecedenceMode: The UI Which Named " .. r12_43 .. " Hide, The Reason is Effected by " .. r1_43)
                  r7_43(r0_45, r1_43, r5_43, r3_43)
                end
              end)
            else
              DebugPrint("UIManagerComponent PrecedenceMode: The UI Which Named " .. r12_43 .. " Hide, The Reason is Effected by " .. r1_43)
              r7_43(r15_43, r1_43, r5_43, r3_43)
            end
          end
        end
        -- close: r12_43
      end
      -- close: r8_43
    end
    if r4_43[UIConst.WidgetAllStateTag.Mutual] ~= nil then
      for r12_43, r13_43 in ipairs(r4_43[UIConst.WidgetAllStateTag.Mutual]) do
        local r14_43 = r0_43:GetUIObj(r13_43)
        if r14_43 == nil then
          r0_43:GetUIObjAsync(r13_43, function(r0_46)
            -- line: [1176, 1181] id: 46
            if r0_46 then
              DebugPrint("UIManagerComponent MutualMode: The UI Which Named " .. r13_43 .. " Hide, The Reason is Effected by " .. r1_43)
              r7_43(r0_46, r1_43, r5_43, r3_43)
            end
          end)
        else
          DebugPrint("UIManagerComponent MutualMode: The UI Which Named " .. r13_43 .. " Hide, The Reason is Effected by " .. r1_43)
          r7_43(r14_43, r1_43, r5_43, r3_43)
        end
        -- close: r12_43
      end
      -- close: r8_43
    end
    if r4_43[UIConst.WidgetAllStateTag.Group] ~= nil then
      r12_43 = r2_43
      r13_43 = r3_43
      r6_43 = r0_43:DealWithGroupUIVisibility(r4_43[UIConst.WidgetAllStateTag.Group], r1_43, r12_43, r13_43, r5_43)
    end
    -- close: r7_43
  end
  return r6_43
end
function r6_0.SetIsHideInImmersionMode(r0_47, r1_47)
  -- line: [1195, 1201] id: 47
  local r2_47 = UE4.UGameplayStatics.GetPlayerCharacter(r0_47, 0)
  if r2_47 and r2_47.IsImmersionModel then
    r1_47:Hide("ImmersionMode")
    r1_47:SetRenderOpacity(0)
  end
end
function r6_0.LoadGuideIconAsync(r0_48, r1_48, r2_48, r3_48, r4_48, ...)
  -- line: [1204, 1209] id: 48
  local r5_48 = {
    ...
  }
  table.insert(r5_48, r4_48)
  table.insert(r5_48, "Async")
  return r0_48:LoadUI(r1_48, r2_48, r3_48, table.unpack(r5_48))
end
function r6_0.UpdateArgs(r0_49, r1_49, r2_49)
  -- line: [1212, 1221] id: 49
  if not r1_49 or not r1_49.UpdateArgs then
    return 
  end
  if not r2_49 then
    return 
  end
  r1_49:UpdateArgs(r2_49)
end
function r6_0.GetBannedActionNameList(r0_50, r1_50)
  -- line: [1225, 1249] id: 50
  local r2_50 = DataMgr.UIKeyboardSet[r1_50]
  if not r2_50 then
    DebugPrint("Tianyi@ 找不到按键禁用组: " .. r1_50)
    return nil
  end
  if r2_50.IsWhiteList then
    local r4_50 = {}
    for r9_50, r10_50 in pairs(DataMgr.KeyboardMap) do
      for r15_50, r16_50 in ipairs(r2_50.ActionNameList and {}) do
        if r9_50 == r16_50 then
          goto label_42
        end
      end
      -- close: r11_50
      table.insert(r4_50, r9_50)
      ::label_42::
      -- close: r11_50
    end
    -- close: r5_50
    return r4_50
  else
    return r2_50.ActionNameList
  end
end
function r6_0.CheckCombatcondition(r0_51, r1_51, r2_51)
  -- line: [1252, 1269] id: 51
  if r1_51 == nil then
    return true
  end
  if not r2_51 then
    r2_51 = {}
  end
  local r3_51 = UE4.UGameplayStatics.GetPlayerCharacter(r0_51, 0)
  local r4_51 = true
  local r5_51 = nil
  local r6_51 = "From BP_UIManagerComponent_C:CheckCombatcondition"
  for r11_51, r12_51 in ipairs(r1_51) do
    if not Battle(r0_51):CheckConditionNew(r12_51, r3_51, nil, r6_51) then
      r4_51 = false
      r5_51 = r2_51[r11_51]
      break
    end
  end
  -- close: r7_51
  return r4_51, r5_51
end
function r6_0.SetBannedActionCallback(r0_52, r1_52, r2_52, r3_52)
  -- line: [1273, 1336] id: 52
  if not r3_52 then
    r3_52 = "Common"
  end
  r0_52.ActivateBannedUI = r0_52.ActivateBannedUI and {}
  if r0_52.ActivateBannedUI[r3_52] and r2_52 == true then
    return 
  end
  r0_52.ActivateBannedUI[r3_52] = true
  local r4_52 = UE4.UGameplayStatics.GetPlayerCharacter(r0_52, 0)
  if not r4_52 then
    DebugPrint("Tianyi@ Player is not valid")
    return 
  end
  local r5_52 = r0_52:GetBannedActionNameList(r1_52)
  if not r5_52 then
    return 
  end
  if r2_52 then
    local r7_52 = TArray(FName)
    for r12_52, r13_52 in pairs(DataMgr.KeyboardMap) do
      local r14_52 = false
      for r19_52, r20_52 in ipairs(r5_52) do
        if r13_52.ActionName == r20_52 then
          r14_52 = true
          break
        end
      end
      -- close: r15_52
      if not r14_52 then
        r7_52:Add(r13_52.ActionName)
      end
    end
    -- close: r8_52
    r4_52:FlushInputKeyExcept(r7_52)
  end
  DebugPrint("Tianyi@ 设置禁用Action: , IsBanned = " .. tostring(r2_52))
  r0_52.BanActionCallbackMap = r0_52.BanActionCallbackMap and {}
  for r10_52, r11_52 in ipairs(r5_52) do
    if r2_52 then
      r4_52:AddToActionGroups("UI", r11_52)
      r0_52.BanActionCallbackMap[r11_52] = (r0_52.BanActionCallbackMap[r11_52] and 0) + 1
    else
      r4_52:RemoveFromGroups("UI", r11_52)
      r0_52.BanActionCallbackMap[r11_52] = (r0_52.BanActionCallbackMap[r11_52] and 0) + -1
      if r0_52.BanActionCallbackMap[r11_52] <= 0 then
        r0_52.BanActionCallbackMap[r11_52] = nil
      end
    end
  end
  -- close: r6_52
  if r2_52 then
    r4_52:AddForbidTag("UI")
  else
    r4_52:MinusForbidTag("UI")
    r0_52.ActivateBannedUI[r3_52] = nil
  end
end
function r6_0.SetAllBattleEntityHidden(r0_53, r1_53, r2_53, r3_53)
  -- line: [1339, 1360] id: 53
  local r4_53 = Battle(r0_53):GetAllEntities()
  if r1_53 then
    for r9_53, r10_53 in pairs(r4_53) do
      if IsValid(r10_53) and r10_53.UnitType == r3_53 and not r10_53.bHidden then
        r10_53:SetActorHiddenInGame(true)
      end
    end
    -- close: r5_53
    r0_53.CacheModifyHiddenEntity[r2_53] = 1
  else
    r0_53.CacheModifyHiddenEntity[r2_53] = nil
    if IsEmptyTable(r0_53.CacheModifyHiddenEntity) then
      for r9_53, r10_53 in pairs(r4_53) do
        if IsValid(r10_53) and r10_53.UnitType == r3_53 and r10_53.bHidden then
          r10_53:SetActorHiddenInGame(false)
        end
      end
      -- close: r5_53
    end
  end
end
function r6_0.CheckIsActionBanned(r0_54, r1_54)
  -- line: [1363, 1366] id: 54
  return r0_54.BanActionCallbackMap and r0_54.BanActionCallbackMap[r1_54]
end
function r6_0.DealWithGroupUIVisibility(r0_55, r1_55, r2_55, r3_55, r4_55, r5_55)
  -- line: [1369, 1424] id: 55
  local r6_55 = false
  for r11_55, r12_55 in pairs(r1_55) do
    if type(r12_55) == "table" then
      if r2_55 == r11_55 then
        for r18_55, r19_55 in pairs(r0_55.UIInstances:ToTable()) do
          local r20_55 = true
          for r25_55, r26_55 in ipairs(r12_55) do
            if r18_55 == r26_55 or r18_55 == r2_55 then
              r20_55 = false
              break
            end
          end
          -- close: r21_55
          if r20_55 then
            DebugPrint("UIManagerComponent GroupMode: The UI Which Named " .. r18_55 .. " Hide, The Reason is Effected by " .. r2_55)
            r19_55:Hide(r5_55 .. r2_55)
            if r0_55.HideByStateTagUIList[r4_55] == nil then
              r0_55.HideByStateTagUIList[r4_55] = {}
              r0_55.HideByStateTagUIList[r4_55][r2_55] = {
                r19_55
              }
            elseif r0_55.HideByStateTagUIList[r4_55][r2_55] == nil then
              r0_55.HideByStateTagUIList[r4_55][r2_55] = {
                r19_55
              }
            else
              table.insert(r0_55.HideByStateTagUIList[r4_55][r2_55], r19_55)
            end
          end
        end
        -- close: r14_55
      else
        local r13_55 = true
        for r18_55, r19_55 in ipairs(r12_55) do
          if r19_55 == r2_55 then
            r13_55 = false
          end
        end
        -- close: r14_55
        if r13_55 then
          DebugPrint("UIManagerComponent GroupMode: The UI Which Named " .. r2_55 .. " Hide, The Reason is Effected by " .. r11_55)
          r6_55 = true
          r3_55:Hide(r5_55 .. r11_55)
          if r0_55.HideByStateTagUIList[r4_55] == nil then
            r0_55.HideByStateTagUIList[r4_55] = {}
            r0_55.HideByStateTagUIList[r4_55][r11_55] = {
              r3_55
            }
          elseif r0_55.HideByStateTagUIList[r4_55][r11_55] == nil then
            r0_55.HideByStateTagUIList[r4_55][r11_55] = {
              r3_55
            }
          else
            table.insert(r0_55.HideByStateTagUIList[r4_55][r11_55], r3_55)
          end
        end
      end
    end
  end
  -- close: r7_55
  return r6_55
end
function r6_0.OnUIObjLoadCompleted(r0_56, r1_56, r2_56)
  -- line: [1486, 1525] id: 56
  local r5_56 = r1_56
  local r6_56 = r2_56.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll
  r0_56:SetEntitiesVisibility(r5_56, r6_56, r2_56.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf, true)
  if r2_56.IsHideDrop then
    r0_56:SetAllBattleEntityHidden(true, r1_56, "Drop")
  end
  EventManager:FireEvent(EventID.LoadUI, r1_56)
end
function r6_0.UnLoadUINew(r0_57, r1_57)
  -- line: [1527, 1536] id: 57
  assert(DataMgr.SystemUI[r1_57], "UI:" .. r1_57 .. "不在SystemUI表中")
  if UIConst.AllUIConfig[r1_57] then
    UIConst.AllUIConfig[r1_57] = {
      resource = UIConst.LoadInConfig,
    }
  end
  return r0_57:UnLoadUI(r1_57, r1_57)
end
function r6_0.UnLoadUI(r0_58, r1_58, r2_58)
  -- line: [1538, 1645] id: 58
  if IsDedicatedServer(r0_58) then
    return 
  end
  if not r2_58 then
    r2_58 = r1_58
  end
  local r3_58 = UIConst.AllUIConfig[r1_58] and {}
  local r4_58 = DataMgr.SystemUI[r2_58]
  if r4_58 == nil then
    r4_58 = DataMgr.SystemUI[r1_58]
  end
  if r4_58 ~= nil then
    r3_58.popup = r4_58.Popup and r3_58.popup
    r3_58.statetag = r4_58.StateTag
    r3_58.IsStopGame = r0_58:RevertRealStopGame(r4_58.IsStopGame)
    r3_58.GlobalGameUITag = r4_58.GlobalGameUITag
    r3_58.IsHideBattleUnit = r4_58.IsHideBattleUnit
    r3_58.IsHideDrop = r4_58.IsHideDrop
    r3_58.PauseAfterLoadingState = r4_58.PauseAfterLoadingState
    if r4_58.ConfigName then
      local r5_58 = DataMgr.SystemUIConfig[r4_58.ConfigName]
      if r5_58 then
        r3_58.addtostack = r5_58.AddToStack
        r3_58.StopWorldRender = r5_58.StopWorldRender
      end
    end
  end
  if r3_58.popup == true then
    r0_58:OpenResidentUI(r2_58)
  end
  r0_58:DealWithOtherWidgetsVisibilityByUIHide(r1_58, r2_58, r3_58.statetag)
  local r5_58 = r0_58:GetUIObj(r2_58)
  if r5_58 and r5_58.IsAddInDeque then
    r0_58:RemoveToJumpPageDeque(r5_58)
  end
  local r8_58 = r2_58
  local r9_58 = r3_58.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll
  r0_58:SetEntitiesVisibility(r8_58, r9_58, r3_58.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf, false)
  if r3_58.IsHideDrop then
    r0_58:SetAllBattleEntityHidden(false, r2_58, "Drop")
  end
  if r3_58.PauseAfterLoadingState and r5_58 then
    r0_58:TryResumeAfterLoadingMgr(r3_58.PauseAfterLoadingState)
  end
  if r3_58.IsGlobalUI then
    UE4.UGameplayStatics.GetGameInstance(r0_58):CloseGlobalUI(r2_58)
  else
    r0_58:UnLoadUI_CPP(r2_58, not not r3_58.addtostack, r5_58 and r5_58.IsNeedSearchInStack)
  end
  if r0_58.AsyncLoadHandlers[r2_58] then
    r0_58.AsyncUnloadFlags[r2_58] = true
  end
  if r0_58.FlowList[r2_58] then
    r0_58.FlowList[r2_58] = nil
    USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager):RemoveFlow(r0_58.FlowList[r2_58])
    DebugPrint("WXT UIManagerComponent_C:RemoveFlow", r2_58)
  end
  EventManager:FireEvent(EventID.UnLoadUI, r2_58)
end
function r6_0.DealWithOtherWidgetsVisibilityByUIHide(r0_59, r1_59, r2_59, r3_59)
  -- line: [1650, 1664] id: 59
  if r3_59 == nil or r3_59 == UIConst.WidgetAllStateTag.Blocked then
    return 
  end
  r0_59:AddUIToStateTagsCluster(r3_59, r2_59, false)
  if r3_59 == UIConst.WidgetAllStateTag.Queue then
    if r0_59.UILoadingDeque:Size() > 0 then
      local r4_59 = r0_59.UILoadingDeque:PopFront()
      r0_59:AddTimer(0.1, r0_59.LoadUINew, false, 0, "LoadUIInQueue", nil, r4_59.UIName, table.unpack(r4_59.Params))
    end
  else
    r0_59:HandleUIWidgetsVisibilityByUIHide(r1_59, r2_59, r3_59)
  end
end
function r6_0.HandleUIWidgetsVisibilityByUIHide(r0_60, r1_60, r2_60, r3_60)
  -- line: [1667, 1717] id: 60
  local r4_60 = nil
  local r5_60 = "InUIConfigure"
  if r3_60 == UIConst.WidgetAllStateTag.Exclusive then
    if IsEmptyTable(r0_60.AllUIStateTagsCluster[r3_60]) then
      r0_60:ReShowUIWithReason(r0_60.HideByStateTagUIList[r8_0.ExclusiveMode], r5_60 .. r8_0.ExclusiveMode)
      r0_60.HideByStateTagUIList[r8_0.ExclusiveMode] = nil
    end
    return 
  end
  local r6_60 = r0_60.HideByStateTagUIList[r8_0.ConditionMode]
  if (r3_60 == UIConst.WidgetAllStateTag.Precedence or r3_60 == UIConst.WidgetAllStateTag.Group) and r6_60 ~= nil then
    if r1_60 ~= nil then
      r6_60[r1_60] = nil
      r0_60:ReShowUIWithReason(r6_60[r1_60], r5_60 .. r1_60)
    else
      r6_60[r2_60] = nil
      r0_60:ReShowUIWithReason(r6_60[r2_60], r5_60 .. r2_60)
    end
  end
  if not IsEmptyTable(r6_60) then
    for r11_60, r12_60 in pairs(r6_60) do
      if type(r12_60) == "table" then
        local r13_60 = nil
        for r18_60, r19_60 in ipairs(r12_60) do
          if r19_60 == r1_60 then
            r13_60 = r18_60
            break
          end
        end
        -- close: r14_60
        if r13_60 then
          local r14_60 = r0_60:GetUIObj(r11_60)
          if r14_60 then
            r14_60:Show(r5_60 .. r12_60[r13_60])
          end
          table.remove(r12_60, r13_60)
        end
      end
    end
    -- close: r7_60
  end
end
function r6_0.ReShowUIWithReason(r0_61, r1_61, r2_61)
  -- line: [1720, 1733] id: 61
  if r1_61 == nil or type(r1_61) ~= "table" then
    return 
  end
  for r7_61, r8_61 in ipairs(r1_61) do
    local r9_61 = r8_61
    if type(r8_61) == "string" then
      r9_61 = r0_61:GetUIObj(r8_61)
    end
    if IsValid(r9_61) then
      r9_61:Show(r2_61)
    end
  end
  -- close: r3_61
end
function r6_0.GetUIObj(r0_62, r1_62, r2_62)
  -- line: [1736, 1749] id: 62
  if r2_62 then
    local r3_62 = r0_62:GetUIPathFromString(r1_62)
    local r4_62 = #r3_62
    if r4_62 > 1 then
      local r5_62 = r0_62:GetUI(r3_62[1])
      for r9_62 = 2, r4_62, 1 do
        r5_62 = r5_62[r3_62[r9_62]]
      end
      return r5_62
    end
  end
  return r0_62:GetUI(r1_62)
end
function r6_0.GetUIObjAsync(r0_63, r1_63, r2_63)
  -- line: [1754, 1771] id: 63
  local r3_63 = r0_63:GetUIObj(r1_63)
  if not r3_63 and r0_63.AsyncLoadHandlers[r1_63] then
    DebugPrint(LXYTag, "开始异步GetUIObj...", r1_63)
    if not r0_63.AsyncGetUIContexts[r1_63] then
      r0_63.AsyncGetUIContexts[r1_63] = {}
    end
    table.insert(r0_63.AsyncGetUIContexts[r1_63], r2_63)
    if type(r2_63) == "thread" then
      r3_63 = coroutine.yield()
      return r3_63
    end
  end
  if type(r2_63) == "function" then
    r2_63(r3_63)
  end
  return r3_63
end
function r6_0.GetUIObjIsAsyncLoading(r0_64, r1_64)
  -- line: [1774, 1776] id: 64
  return r0_64.AsyncLoadHandlers[r1_64] ~= nil
end
function r6_0.GetUIPathFromString(r0_65, r1_65)
  -- line: [1779, 1788] id: 65
  if not r1_65 then
    return nil
  end
  local r2_65 = {}
  for r7_65 in string.gmatch(r1_65, "%a+[_%a+%d*]*") do
    table.insert(r2_65, r7_65)
  end
  -- close: r3_65
  return r2_65
end
function r6_0.GetUIObjCountByBaseName(r0_66, r1_66)
  -- line: [1791, 1793] id: 66
  return r0_66.Overridden.GetUIObjCountByBaseName(r0_66, r1_66)
end
function r6_0.HideOrShowUIByBaseName(r0_67, r1_67, r2_67)
  -- line: [1796, 1821] id: 67
  if (UIConst.AllUIConfig[r1_67] and {}).allowmulti then
    for r8_67 = 1, r0_67.UniqueCount[r1_67] and 1, 1 do
      local r10_67 = r0_67:GetUI(r1_67 .. tostring(r8_67))
      if r10_67 ~= nil then
        if r2_67 then
          r10_67:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        else
          r10_67:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
    end
  else
    local r4_67 = r0_67:GetUI(r1_67)
    if r4_67 ~= nil then
      if r2_67 then
        r4_67:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        r4_67:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end
function r6_0.GetTexture2DResource(r0_68, r1_68)
  -- line: [1824, 1830] id: 68
  if string.find(r1_68, "/Game/") == nil then
    r1_68 = "/Game/" .. r1_68
  end
  return LoadObject(r1_68)
end
function r6_0.GetLogMask(r0_69)
  -- line: [1833, 1835] id: 69
  return _G.LogTag
end
function r6_0.CloseResidentUI(r0_70, r1_70)
  -- line: [1855, 1914] id: 70
  if not IsEmptyTable(r0_70.PopUpUIWidgetRecord) then
    if r1_70 ~= nil then
      r0_70.PopUpUIWidgetRecord[r1_70] = 1
    end
    return 
  end
  local r2_70 = UE4.UGameplayStatics.GetPlayerCharacter(r0_70, 0)
  if r2_70 then
    r2_70:SetCanInteractiveTrigger(false)
  end
  local r4_70 = UE4.UGameplayStatics.GetGameInstance(r0_70):GetSceneManager()
  if IsValid(r4_70) then
    r4_70:ShowOrHideAllSceneGuideIcon(false, "UIPopUp")
  end
  r0_70:HideAllComponentUI(true, "UIPopUp")
  local r5_70 = r0_70:GetCurrnetAllUIBySystem(UIConst.PopUpUIName.SpecificSystemList)
  for r10_70, r11_70 in ipairs(UIConst.PopUpUIName.SpecificUIList) do
    if r5_70[r11_70] == nil then
      local r12_70 = r0_70:GetUI(r11_70)
      if r12_70 ~= nil then
        r5_70[r11_70] = r12_70
      end
    end
  end
  -- close: r6_70
  for r10_70, r11_70 in pairs(r5_70) do
    if r10_70 == "BattleMain" then
      if not r11_70.IsPlayOutAnim then
        r11_70:Hide("UIPopUp")
        r11_70:AddPlayInOutSystems(r1_70)
      end
    else
      r11_70:Hide("UIPopUp")
    end
  end
  -- close: r6_70
  local r6_70 = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(r6_70) then
    for r11_70, r12_70 in pairs(r6_70) do
      r12_70:Hide("UIPopUp")
    end
    -- close: r7_70
  end
  if r1_70 ~= nil then
    r0_70.PopUpUIWidgetRecord[r1_70] = 1
  end
end
function r6_0.OpenResidentUI(r0_71, r1_71)
  -- line: [1917, 1971] id: 71
  if r1_71 ~= nil then
    r0_71.PopUpUIWidgetRecord[r1_71] = nil
  end
  if not IsEmptyTable(r0_71.PopUpUIWidgetRecord) then
    return 
  end
  local r2_71 = UE4.UGameplayStatics.GetPlayerCharacter(r0_71, 0)
  if r2_71 then
    r2_71:SetCanInteractiveTrigger(true)
  end
  local r4_71 = UE4.UGameplayStatics.GetGameInstance(r0_71):GetSceneManager()
  if IsValid(r4_71) then
    r4_71:ShowOrHideAllSceneGuideIcon(true, "UIPopUp")
  end
  r0_71:HideAllComponentUI(false, "UIPopUp")
  local r5_71 = r0_71:GetCurrnetAllUIBySystem(UIConst.PopUpUIName.SpecificSystemList)
  for r10_71, r11_71 in ipairs(UIConst.PopUpUIName.SpecificUIList) do
    if r5_71[r11_71] == nil then
      local r12_71 = r0_71:GetUI(r11_71)
      if r12_71 ~= nil then
        r5_71[r11_71] = r12_71
      end
    end
  end
  -- close: r6_71
  for r10_71, r11_71 in pairs(r5_71) do
    if r10_71 == "BattleMain" then
      local r12_71 = UE4.UGameplayStatics.GetPlayerCharacter(r0_71, 0)
      if r12_71 and r12_71.CleanInputWhenEnterTalk then
        r12_71:CleanInputWhenEnterTalk(false)
      end
    end
    r11_71:Show("UIPopUp")
  end
  -- close: r6_71
  local r6_71 = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(r6_71) then
    for r11_71, r12_71 in pairs(r6_71) do
      r12_71:Show("UIPopUp")
    end
    -- close: r7_71
  end
end
function r6_0.CheckNeedExitPopUp(r0_72, r1_72)
  -- line: [1974, 1983] id: 72
  local r2_72 = true
  for r7_72, r8_72 in pairs(r0_72.PopUpUIWidgetRecord) do
    if r7_72 ~= r1_72 and r8_72 == 1 then
      r2_72 = false
      break
    end
  end
  -- close: r3_72
  return r2_72
end
function r6_0.GetCurrnetAllUIBySystem(r0_73, r1_73)
  -- line: [1986, 2005] id: 73
  local r2_73 = r0_73.UIInstances:ToTable()
  local r3_73 = {}
  for r8_73, r9_73 in pairs(r2_73) do
    local r10_73 = r9_73.ConfigName and r9_73.WidgetName
    local r11_73 = DataMgr.SystemUI[r10_73]
    if r11_73 ~= nil then
      local r12_73 = false
      for r17_73, r18_73 in ipairs(r1_73) do
        if r11_73.System == r18_73 then
          r12_73 = true
          break
        end
      end
      -- close: r13_73
      if r12_73 then
        r3_73[r10_73] = r9_73
      end
    end
  end
  -- close: r4_73
  return r3_73
end
function r6_0.GetUIManagerShowStateInViewport(r0_74)
  -- line: [2007, 2016] id: 74
  local r1_74 = r0_74:GetUIObj("BattleMain")
  if r1_74 then
    if r1_74:IsInViewport() and r1_74:IsVisible() then
      return UIConst.GameUIShowState.HUD
    else
      return UIConst.GameUIShowState.System
    end
  end
end
function r6_0.IsInHUDShowMode(r0_75)
  -- line: [2019, 2021] id: 75
  return r0_75:GetUIManagerShowStateInViewport() == UIConst.GameUIShowState.HUD
end
function r6_0.ShowCommonPopupUI_Old(r0_76, r1_76, r2_76, r3_76, r4_76, r5_76, r6_76)
  -- line: [2025, 2037] id: 76
  return r0_76:ShowCommonPopupUI(r1_76, {
    LeftCallbackFunction = r4_76,
    LeftCallbackObj = r2_76,
    RightCallbackFunction = r3_76,
    RightCallbackObj = r2_76,
    CloseBtnCallbackFunction = r5_76,
    CloseBtnCallbackObj = r2_76,
    ShortText = r6_76,
    LongText = r6_76,
  })
end
function r6_0.ShowDisconnectUIConfirm(r0_77, r1_77, r2_77, r3_77)
  -- line: [2039, 2063] id: 77
  local r4_77 = "NetDisConnectedDialog"
  if UIConst.AllUIConfig[r4_77] == nil then
    UIConst.AllUIConfig[r4_77] = r0_77:SetUIConfig(UIConst.LoadInConfig, r4_77, DataMgr.SystemUI[r4_77])
  end
  UIConst.AllUIConfig[r4_77].IsStopGame = r2_77
  local r5_77 = r0_77:LoadUI(UIConst.AllUIConfig[r4_77].resource, r4_77)
  if r5_77 ~= nil then
    if not r3_77 then
      r3_77 = {}
    end
    function r3_77.OnCloseCallbackFunction()
      -- line: [2051, 2053] id: 78
      EventManager:FireEvent(EventID.OnToggleDisconnectUI, false)
    end
    EventManager:FireEvent(EventID.OnToggleDisconnectUI, true)
    r5_77:ShowPopup(r1_77, r3_77)
    local r6_77 = UEMCommonInputSubsystem.Get(r0_77)
    if r6_77 then
      r6_77:ClearUIInputBlock()
    end
  end
  return r5_77
end
function r6_0.ShowCommonPopupUI(r0_79, r1_79, r2_79, r3_79, r4_79)
  -- line: [2066, 2089] id: 79
  local r5_79 = UE4.UGameplayStatics.GetGameInstance(r0_79)
  if not r5_79:CheckCanShowPopup() then
    r5_79:RequestShowPopup(r1_79, r2_79, r3_79)
    return 
  end
  local r7_79 = DataMgr.CommonPopupUIStyle[DataMgr.CommonPopupUIContext[r1_79].Style]
  local r8_79 = nil
  if r4_79 then
    r8_79 = r0_79:LoadUIAsync("CommonDialog", r4_79, r2_79, r3_79)
  else
    r8_79 = r0_79:LoadUINew("CommonDialog", r1_79, r2_79, r3_79)
  end
  r8_79:ShowPopup(r1_79, r2_79, r3_79)
  if r2_79 and r2_79.BindScript and r8_79.Script then
    return r8_79.Script
  else
    return r8_79
  end
end
function r6_0.ShowCommonPopupUI_Interrupt(r0_80, r1_80, r2_80, r3_80)
  -- line: [2093, 2101] id: 80
  local r4_80 = r0_80:GetUI("CommonDialog")
  if not r4_80 then
    DebugPrint("Tianyi@ ShowCommonPopupUI_Interrupt 只能在通用弹窗显示出来的时候调用!")
    return 
  end
  r4_80:ShowPopupInterrupt(r1_80, r2_80, r3_80)
end
function r6_0.PreviewCommonPopupStyle(r0_81, r1_81)
  -- line: [2104, 2114] id: 81
  if not DataMgr.CommonPopupUIStyle[r1_81] then
    DebugPrint("TianyI@ PopupStyle is nil")
    return 
  end
  local r3_81 = r0_81:LoadUINew("CommonDialog")
  r3_81:PlayAnimation(r3_81.In)
  r3_81:UpdateView(r1_81)
end
function r6_0.GetGameInputModeSubsystem(r0_82)
  -- line: [2117, 2122] id: 82
  if not r0_82.GameInputModeSubsystem then
    r0_82.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  end
  return r0_82.GameInputModeSubsystem
end
function r6_0.ShowError(r0_83, r1_83, r2_83, r3_83, ...)
  -- line: [2129, 2143] id: 83
  if r3_83 == nil then
    r3_83 = UIConst.Tip_CommonTop
  end
  if DataMgr.ErrorCode[r1_83] then
    local r5_83 = string.format(ErrorCode:GetText(r1_83) and "", ...)
    if not r5_83 or r5_83 == "" then
      r0_83:ShowUITip(r3_83, "Unconfigured ErrorCode：" .. tostring(r1_83), r2_83)
    else
      r0_83:ShowUITip(r3_83, r5_83, r2_83)
    end
  else
    r0_83:ShowUITip(r3_83, "Unknown ErrorCode：" .. tostring(r1_83), r2_83)
  end
end
function r6_0.ShowUITip(r0_84, r1_84, r2_84, r3_84, r4_84, r5_84)
  -- line: [2151, 2259] id: 84
  if not r5_84 then
    r5_84 = {}
  end
  if not r3_84 then
    r3_84 = 2
  end
  local r6_84 = UIConst.Tip_Quest
  if r1_84 == r6_84 then
    r6_84 = type(r2_84)
    if r6_84 == "table" then
      r6_84 = r5_84.TaskStateStr
      UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(r0_84, r2_84[1], r6_84[1], r3_84).OnGuideEnd:Add(r0_84, function()
        -- line: [2161, 2161] id: 85
        UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(r0_84, r2_84[2], r6_84[2], r3_84)
      end)
      -- close: r6_84
    elseif r4_84 then
      r6_84 = r0_84.WaitToTriggerTipsInfo
      r6_84[r1_84] = {
        Content = r2_84,
        Extra = r5_84,
      }
    else
      r6_84 = r0_84.WaitToTriggerTipsInfo
      r6_84 = r6_84[r1_84]
      if r6_84 then
        UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(r0_84, r6_84.Content, r6_84.Extra.TaskStateStr, r3_84).OnGuideEnd:Add(r0_84, function()
          -- line: [2170, 2170] id: 86
          UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(r0_84, r2_84, r5_84.TaskStateStr, r3_84)
        end)
        r0_84.WaitToTriggerTipsInfo[r1_84] = nil
      else
        local r7_84 = r0_84:GetUI("QuestBeginEnd")
        if r7_84 and r7_84.IsShowing then
          print(_G.LogTag, "BP_UIManagerComponent_C:ShowUITip Now Tip Is Showing,Discard This Tip, Id: ", r2_84)
          return 
        end
        UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(r0_84, r2_84, r5_84.TaskStateStr, r3_84)
      end
    end
  else
    r6_84 = UIConst
    r6_84 = r6_84.Tip_CommonTop
    if r1_84 ~= r6_84 then
      r6_84 = UIConst
      r6_84 = r6_84.Tip_CommonToast
      if r1_84 == r6_84 then
        ::label_95::
        r6_84 = GText
        r6_84 = r6_84(r2_84)
        r2_84 = r6_84
        r6_84 = r0_84:GetUI("CommonTopToastList")
        if r6_84 == nil then
          r6_84 = r0_84:LoadUINew("CommonTopToastList", r2_84, r3_84)
        elseif r6_84:IsHide() then
          r6_84:ClearAllHideTags()
          r6_84:Show()
        end
        RunAsyncTask(r0_84, r2_84 .. tostring(r6_84:AddAndUpdateCurrentUITips()), function(r0_87)
          -- line: [2194, 2206] id: 87
          local r1_87 = r0_84:CreateWidgetAsync(DataMgr.WidgetUI.CommonToastItem.UIName, r0_87)
          if r1_87 ~= nil then
            r1_87:SetNeedPaintDeferred(r0_84.IsMenuAnchorOpen and not r0_84:IsInHUDShowMode())
            r6_84:AddNewUITips(r1_87)
            r1_87:OnLoaded(r2_84, r3_84)
            if r5_84.Color then
              r1_87:ChangeFlashColor(r5_84.Color)
            end
            AudioManager(r0_84):PlayUISound(r1_87, "event:/ui/common/toast_normal", nil, nil)
          end
        end)
        -- close: r6_84
      else
        r6_84 = UIConst
        r6_84 = r6_84.Tip_CommonWarning
        if r1_84 == r6_84 then
          function r6_84()
            -- line: [2209, 2224] id: 88
            if IsValid(r0_84.WarningToastUI) and not r0_84.WarningToastUI.IsClose then
              r0_84.WarningToastUI:Close()
            end
            local r0_88 = r0_84:LoadUINew("WarningToast", r2_84, r3_84)
            AudioManager(r0_84):PlayUISound(r0_88, "event:/ui/common/toast_warning", nil, nil)
            r0_88.Panel_Toast:SetRenderTranslation(FVector2D(0, 0))
            r0_84.WarningToastUI = r0_88
            r0_84.WarningToastUI.Panel_Toast:SetRenderOpacity(1)
            if r5_84 then
              r0_84:HideWarningUITip(r5_84)
              r0_88.MessageId = r5_84
            end
          end
          if IsValid(r0_84.WarningToastUI) and not r0_84.WarningToastUI.IsClose then
            r0_84.WarningToastUI:BindToAnimationFinished(r0_84.WarningToastUI.Out, {
              r0_84.WarningToastUI,
              r6_84
            })
            r0_84.WarningToastUI:PlayAnimation(r0_84.WarningToastUI.Out)
          else
            r6_84()
          end
        else
          r6_84 = UIConst
          r6_84 = r6_84.Tip_StoryToast
          if r1_84 == r6_84 then
            r6_84 = r0_84._StoryToastSet
            r6_84 = r6_84[r2_84]
            if r6_84 then
              r6_84 = DebugPrint
              r6_84("UIManager:ShowUItip StoryToast, Repeat Toast", r2_84)
              return 
            end
            r6_84 = r0_84._StoryToastSet
            r6_84[r2_84] = true
            r6_84 = r0_84._StoryToastQueue
            r6_84 = r6_84:Size()
            if r6_84 > 0 then
              r6_84 = r5_84.bPopWait
              if not r6_84 then
                r0_84:_BreakInTopToastInQueue("_StoryToastQueue", "_StoryToastSet", "_StoryToastTimer", "CommonStoryToast", r5_84)
              end
            end
            r6_84 = r0_84._StoryToastQueue
            r6_84:PushFront({
              r2_84,
              r3_84
            })
            r6_84 = r0_84:IsExistTimer(r0_84._StoryToastTimer)
            if not r6_84 then
              r0_84:_ProcessCommonToastQueue("_StoryToastQueue", "_StoryToastSet", "_StoryToastTimer", "CommonStoryToast", r5_84)
            end
          else
            r6_84 = UIConst
            r6_84 = r6_84.Tip_ExcavationToast
            if r1_84 == r6_84 then
              r6_84 = r0_84:GetUI("CommonTopToastList")
              if r6_84 == nil then
                r6_84 = r0_84:LoadUINew("CommonTopToastList", r2_84, r3_84)
              end
              local r7_84 = r0_84:CreateWidget(UIConst.EXCAVATIONDUNGEONTEXTFLOAT, false)
              r6_84.VerticalBox_Toast:AddChildToVerticalBox(r7_84)
              r7_84:OnLoaded(r3_84, r2_84, r5_84.Level, r5_84.OrderText)
            end
          end
        end
      end
    else
      goto label_95	-- block#17 is visited secondly
    end
  end
end
function r6_0._ProcessCommonToastQueue(r0_89, r1_89, r2_89, r3_89, r4_89, r5_89)
  -- line: [2262, 2273] id: 89
  local r6_89, r7_89 = table.unpack(r0_89[r1_89]:Back())
  local r8_89 = nil	-- notice: implicit variable refs by block#[3]
  if r5_89 then
    r8_89 = r5_89.SoundEvent
    if not r8_89 then
      ::label_11::
      r8_89 = nil
    end
  else
    goto label_11	-- block#2 is visited secondly
  end
  r0_89:LoadUINew(r4_89, r6_89, r7_89, r8_89)
  r0_89:AddTimer(r7_89 + 0.1, function()
    -- line: [2266, 2272] id: 90
    local r0_90 = r0_89:GetUI(r4_89)
    if IsValid(r0_90) then
      r0_90:Close()
    end
    r0_89:_DoPopNextToastQueue(r1_89, r2_89, r3_89, r4_89, r5_89)
  end, false, 0, r0_89[r3_89], true)
end
function r6_0._DoPopNextToastQueue(r0_91, r1_91, r2_91, r3_91, r4_91, r5_91)
  -- line: [2276, 2287] id: 91
  local r6_91 = table.unpack(r0_91[r1_91]:Back())
  r0_91[r1_91]:PopBack()
  if r0_91[r2_91] ~= nil then
    r0_91[r2_91][r6_91] = nil
  end
  if not r0_91[r1_91]:IsEmpty() then
    r0_91:_ProcessCommonToastQueue(r1_91, r2_91, r3_91, r4_91, r5_91)
  else
    r0_91[r2_91] = {}
  end
end
function r6_0._BreakInTopToastInQueue(r0_92, r1_92, r2_92, r3_92, r4_92, r5_92)
  -- line: [2290, 2297] id: 92
  local r6_92 = r0_92:GetUI(r4_92)
  if r6_92 then
    r6_92:Close()
  end
  r0_92:RemoveTimer(r0_92[r3_92])
  r0_92:_DoPopNextToastQueue(r1_92, r2_92, r3_92, r4_92, r5_92)
end
function r6_0.ShowUITip_BattleCommonTop(r0_93, r1_93, r2_93, r3_93, r4_93, r5_93)
  -- line: [2300, 2312] id: 93
  if r1_93 == UIConst.Tip_CommonTop then
    if not r0_93[("BattleCommonTopInCD_" .. r2_93)] then
      r0_93:ShowUITip(r1_93, GText(r2_93), r3_93, r4_93, r5_93)
      r0_93["BattleCommonTopInCD_" .. r2_93] = true
      r0_93:AddTimer(Const.BattleTip_CommonTop_CD, function()
        -- line: [2305, 2307] id: 94
        r0_93["BattleCommonTopInCD_" .. r2_93] = false
      end, false, 0, r2_93, true)
    end
    return 
  end
end
function r6_0.HideWarningUITip(r0_95, r1_95)
  -- line: [2316, 2320] id: 95
  if r0_95.WarningToastUI and r0_95.WarningToastUI.MessageId == r1_95 then
    r0_95.WarningToastUI:PlayOutAnim()
  end
end
function r6_0.ShowCommonBlackScreen(r0_96, r1_96)
  -- line: [2325, 2346] id: 96
  local r2_96 = r1_96.BlackScreenHandle
  if r2_96 == nil then
    r0_96.CommonBlackScreenAutoCounter = (r0_96.CommonBlackScreenAutoCounter and 0) + 1
    r2_96 = "AutoGenBlackScreenHandle" .. r0_96.CommonBlackScreenAutoCounter
    r1_96.BlackScreenHandle = r2_96
  end
  if r0_96.CommonBlackScreenInstances == nil then
    r0_96.CommonBlackScreenInstances = {}
  end
  if IsValid(r0_96.CommonBlackScreenInstances[r2_96]) then
    DebugPrint("Common_BlackScreen: 相同的HandleName已存在！")
    return r2_96
  end
  local r3_96 = r0_96:LoadUINew("CommonBlackScreen", r1_96)
  DebugPrint("Common_BlackScreen: NewBlackScreen", r2_96)
  return r2_96
end
function r6_0.RegisterBlackScreenInstance(r0_97, r1_97, r2_97)
  -- line: [2349, 2355] id: 97
  if r0_97.CommonBlackScreenInstances == nil then
    r0_97.CommonBlackScreenInstances = {}
  end
  r0_97.CommonBlackScreenInstances[r1_97] = r2_97
  DebugPrint("Common_BlackScreen: RegisterBlackScreenInstance", r1_97)
end
function r6_0.HideCommonBlackScreen(r0_98, r1_98)
  -- line: [2358, 2367] id: 98
  assert(r1_98, "HideCommonBlackScreen必须输入BlackScreenHandle！")
  if r0_98.CommonBlackScreenInstances == nil then
    r0_98.CommonBlackScreenInstances = {}
  end
  local r2_98 = r0_98.CommonBlackScreenInstances[r1_98]
  if IsValid(r2_98) then
    r2_98:HideCommonBlackScreen()
  end
end
function r6_0.OnCommonBlackScreenClosed(r0_99, r1_99)
  -- line: [2370, 2376] id: 99
  if r0_99.CommonBlackScreenInstances == nil then
    r0_99.CommonBlackScreenInstances = {}
  end
  r0_99.CommonBlackScreenInstances[r1_99] = nil
  DebugPrint("Common_BlackScreen: OnCommonBlackScreenClosed", r1_99)
end
function r6_0.IsCommonBlackScreenExist(r0_100, r1_100)
  -- line: [2379, 2385] id: 100
  assert(r1_100, "IsCommonBlackScreenExist必须输入BlackScreenHandle！")
  if r0_100.CommonBlackScreenInstances == nil then
    r0_100.CommonBlackScreenInstances = {}
  end
  return IsValid(r0_100.CommonBlackScreenInstances[r1_100])
end
function r6_0.CloseCommonBlackScreenWithoutCB(r0_101, r1_101)
  -- line: [2388, 2399] id: 101
  assert(r1_101, "CloseCommonBlackScreenWithoutCB必须输入BlackScreenHandle！")
  if r0_101.CommonBlackScreenInstances == nil then
    r0_101.CommonBlackScreenInstances = {}
  end
  local r2_101 = r0_101.CommonBlackScreenInstances[r1_101]
  if IsValid(r2_101) then
    r0_101:OnCommonBlackScreenClosed(r1_101)
    r2_101:Close()
    DebugPrint("Common_BlackScreen: CloseCommonBlackScreenWithoutCB", r1_101)
  end
end
function r6_0.IsHaveMenuAnchorOpen(r0_102)
  -- line: [2404, 2406] id: 102
  return r0_102.IsMenuAnchorOpen
end
function r6_0.SetIsMenuAnchorOpen(r0_103, r1_103)
  -- line: [2409, 2411] id: 103
  r0_103.IsMenuAnchorOpen = r1_103
end
function r6_0.ShowLevelUpToast(r0_104, r1_104, r2_104, r3_104)
  -- line: [2417, 2420] id: 104
  r0_104:CacheLevelUpInfo(r1_104, r2_104, r3_104)
  local r4_104 = r0_104:LoadUIAsync("CharLevelUp", function()
    -- line: [2419, 2419] id: 105
  end, false)
end
function r6_0.ShowPlayerLevelUpToast(r0_106, r1_106)
  -- line: [2422, 2428] id: 106
  if r1_106 then
    r0_106:LoadUIAsync("CharLevelUp_System", function()
      -- line: [2424, 2424] id: 107
    end, true)
  else
    r0_106:LoadUIAsync("CharLevelUp", function()
      -- line: [2426, 2426] id: 108
    end, true)
  end
end
function r6_0.CacheLevelUpInfo(r0_109, r1_109, r2_109, r3_109)
  -- line: [2431, 2442] id: 109
  local r4_109 = UE4.UGameplayStatics.GetGameInstance(r0_109)
  if r4_109.LevelUpToastQueue == nil then
    r4_109.LevelUpToastQueue = {
      Player = nil,
      Role = nil,
      MeleeWeapon = nil,
      RangedWeapon = nil,
    }
  end
  r4_109.LevelUpToastQueue[r2_109] = {
    r1_109,
    r2_109,
    r3_109
  }
end
function r6_0.TryShowPlayerLevelUpInfo(r0_110, r1_110)
  -- line: [2445, 2490] id: 110
  local r2_110 = GWorld:GetAvatar()
  local r3_110 = UE4.UGameplayStatics.GetGameInstance(r0_110)
  local r4_110 = UE4.UGameplayStatics.GetGameState(r0_110)
  if not r2_110 then
    return 
  end
  if not r3_110.LevelUpToastQueue then
    r3_110.LevelUpToastQueue = {}
  end
  r3_110.LevelUpToastQueue.Player = r1_110
  if r2_110:IsInDungeon() and r1_110.ShowProgressBar then
    return 
  end
  if r4_110 and (r4_110.GameModeType == "Temple" or r4_110.GameModeType == "Party") then
    return 
  end
  if not r0_110:IsInHUDShowMode() then
    local r5_110 = DataMgr.SystemUI.CharLevelUp_System.Params.SupportUIName
    if r5_110 then
      for r10_110, r11_110 in ipairs(r5_110) do
        if r0_110:GetUI(r11_110) then
          r0_110:ShowPlayerLevelUpToast(true)
          return 
        end
      end
      -- close: r6_110
    end
    if not r0_110.WaitToShowPlayerLevelUpTimerHandle then
      r0_110.WaitToShowPlayerLevelUpTimerHandle = r0_110:AddTimer(1, function()
        -- line: [2475, 2483] id: 111
        if r0_110:IsInHUDShowMode() then
          r0_110:ShowPlayerLevelUpToast()
          if r0_110.WaitToShowPlayerLevelUpTimerHandle then
            r0_110:RemoveTimer(r0_110.WaitToShowPlayerLevelUpTimerHandle)
            r0_110.WaitToShowPlayerLevelUpTimerHandle = nil
          end
        end
      end, true)
    end
    return 
  end
  r0_110:ShowPlayerLevelUpToast()
end
function r6_0.CreateOrGetArmoryPlayerActor(r0_112, r1_112, r2_112)
  -- line: [2496, 2528] id: 112
  local r3_112 = false
  if not r0_112.ArmoryPlayer or not r0_112.ArmoryPlayer:IsValid() then
    local r4_112 = UE4.UGameplayStatics.GetPlayerCharacter(r0_112, 0)
    local r5_112 = r0_112:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"), r4_112:GetTransform(), UE4.ESpawnActorCollisionHandlingMethod.Default, r4_112, r4_112, nil)
    if r5_112 then
      r5_112:RemoveBuffManager()
      r5_112:SetTickableWhenPaused(true)
      local r6_112 = r2_112 and GWorld:GetAvatar()
      if not r1_112 then
        r1_112 = r6_112.Chars[r6_112.CurrentChar]
      end
      local r7_112 = AvatarUtils:GetDefaultBattleInfo(r6_112, {
        Char = r1_112,
      })
      local r8_112 = UE4.UGameplayStatics.GetGameMode(r0_112)
      if r8_112 then
        r7_112 = r8_112:SimplifyInfoForInit(r7_112)
        r7_112.FromOtherWorld = true
        r7_112.FromArmory = true
        r5_112:InitCharacterInfo(r7_112)
      end
      r5_112:ForceClearActorHideTag()
      r5_112.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      r5_112.Mesh:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      r5_112.Mesh:SetTickableWhenPaused(true)
      r5_112.DitherDisabled = true
    end
    r0_112.ArmoryPlayer = r5_112
    r3_112 = true
  end
  return r0_112.ArmoryPlayer, r3_112
end
function r6_0.CreateShowWeapon(r0_113, r1_113, r2_113, r3_113)
  -- line: [2531, 2554] id: 113
  r0_113.ShowWeaponOwners = r0_113.ShowWeaponOwners and {}
  r0_113.ShowWeaponOwners[r1_113] = r2_113
  if r0_113.ShowWeapon then
    r0_113.ShowWeapon:SetActorHideTag("CreateShowWeapon", true)
  end
  UE4.UGameplayStatics.GetPlayerCharacter(r0_113, 0):SpawnShowWeaponAsync(r2_113.WeaponId, r2_113.Transform, r2_113.ReplaceAttrs, r2_113.SkillInfos, r2_113.AppearanceInfo, r2_113.WeaponInfo, function(r0_114)
    -- line: [2540, 2553] id: 114
    r0_113:ForceDestroyShowWeapon()
    r0_113.ShowWeapon = r0_114
    if not r0_113.ShowWeaponOwners[r1_113] then
      r0_113:DestroyShowWeapon(r1_113)
      return 
    end
    if r0_113.ShowWeapon then
      r0_113.ShowWeapon:SetActorHideTag("CreateShowWeapon", false)
    end
    if r3_113 then
      r3_113(r0_113.ShowWeapon)
    end
  end)
end
function r6_0.DestroyShowWeapon(r0_115, r1_115)
  -- line: [2556, 2566] id: 115
  r0_115.ShowWeaponOwners = r0_115.ShowWeaponOwners and {}
  if r1_115 then
    r0_115.ShowWeaponOwners[r1_115] = nil
  end
  if next(r0_115.ShowWeaponOwners) then
    return 
  end
  r0_115:ForceDestroyShowWeapon()
end
function r6_0.ForceDestroyShowWeapon(r0_116)
  -- line: [2569, 2577] id: 116
  if IsValid(r0_116.ShowWeapon) then
    if r0_116.ShowWeapon.ChildWeapon then
      r0_116.ShowWeapon.ChildWeapon:K2_DestroyActor()
    end
    r0_116.ShowWeapon:K2_DestroyActor()
    r0_116.ShowWeapon = nil
  end
end
function r6_0.CreateAndGetUINpcActor(r0_117, r1_117)
  -- line: [2582, 2669] id: 117
  local r2_117 = r0_117.AllUINpcActor[r1_117]
  if r2_117 ~= nil and IsValid(r2_117) and r2_117.NpcId == r1_117 then
    if r2_117.IsInOutAnim then
      r2_117:DestroyActorTemp()
    else
      return r2_117
    end
  end
  local r3_117 = DataMgr.SpawnNPC[r1_117]
  if r3_117 == nil then
    return 
  end
  local r4_117 = r3_117.SpawnRadius
  local r5_117 = tonumber(r3_117.SpawnAngle)
  local r6_117 = UE4.UGameplayStatics.GetPlayerCharacter(r0_117, 0)
  local r7_117 = r6_117:GetActorForwardVector()
  r7_117:Normalize()
  local r8_117 = r6_117:GetTransform()
  local r9_117 = UE4.UKismetMathLibrary.RotateAngleAxis(r7_117, r5_117, r6_117:GetActorUpVector())
  r8_117.Translation.X = r8_117.Translation.X + r4_117 * r9_117.X
  r8_117.Translation.Y = r8_117.Translation.Y + r4_117 * r9_117.Y
  local r13_117 = UE4.UKismetSystemLibrary.LineTraceSingle(r0_117, r8_117.Translation, r8_117.Translation + UE4.UKismetMathLibrary.RotateAngleAxis(r7_117, 180, r6_117:GetActorUpVector()) * r3_117.DetectionDiatance, ETraceTypeQuery.TraceExceptChar, false, nil, 0, FHitResult(), true)
  local r14_117 = r8_117.Rotation:ToRotator()
  if r13_117 then
    r14_117.Roll = 0
    r14_117.Yaw = r14_117.Yaw + -90
    r14_117.Pitch = 0
  else
    r14_117.Roll = 0
    r14_117.Yaw = r14_117.Yaw + 90
    r14_117.Pitch = 0
  end
  r8_117.Rotation = r14_117:ToQuat()
  r2_117 = r0_117:GetWorld():SpawnActor(LoadClass(r3_117.BPPath), r8_117, UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, r6_117, r6_117, nil)
  local function r15_117(r0_118)
    -- line: [2620, 2633] id: 118
    local r1_118 = r0_118.CapsuleComponent:GetUnscaledCapsuleRadius()
    local r2_118 = r0_118.CapsuleComponent:K2_GetComponentLocation()
    local r3_118 = r0_118.CapsuleComponent:K2_GetComponentLocation()
    r2_118.Z = r2_118.Z + r0_118.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
    r3_118.Z = r3_118.Z - r0_118.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 0.5
    local r4_118 = FHitResult()
    if UE4.UKismetSystemLibrary.SphereTraceSingle(r0_118, r2_118, r3_118, r1_118, ETraceTypeQuery.TraceExceptChar, true, nil, 0, r4_118, true, UE4.FLinearColor(1, 0, 0, 1), UE4.FLinearColor(0, 1, 0, 1), 5) then
      return r4_118.ImpactPoint
    else
      return nil
    end
  end
  local r16_117 = r15_117(r2_117)
  if r16_117 ~= nil then
    r8_117.Translation.X = r16_117.X
    r8_117.Translation.Y = r16_117.Y
    r8_117.Translation.Z = r16_117.Z + r2_117.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
    r2_117:K2_SetActorTransform(r8_117, false, nil, false)
    if r15_117(r2_117) ~= nil then
      local r19_117 = UE.UNavigationFunctionLibrary.ProjectPointToNavigation(r8_117.Translation, r2_117)
      if r19_117.X > 0 and r19_117.Y > 0 and r19_117.Z > 0 then
        r8_117.Translation.X = r19_117.X
        r8_117.Translation.Y = r19_117.Y
        r8_117.Translation.Z = r19_117.Z + r2_117.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
        r2_117:K2_SetActorTransform(r8_117, false, nil, false)
      end
    end
  end
  if r2_117 then
    r2_117.NpcId = r1_117
    r2_117.ModelId = DataMgr.Npc[r1_117].ModelId
    r2_117.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    r2_117.Mesh:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    r2_117:SetTickableWhenPaused(true)
    r2_117.Mesh:SetTickableWhenPaused(true)
  end
  r2_117.IsNeedSetPos = false
  r0_117.AllUINpcActor[r1_117] = r2_117
  return r2_117
end
function r6_0.GetUINpcActor(r0_119, r1_119)
  -- line: [2674, 2676] id: 119
  return r0_119.AllUINpcActor[r1_119]
end
function r6_0.HideOrShowPlayerFX(r0_120, r1_120, r2_120, r3_120)
  -- line: [2682, 2687] id: 120
  if r1_120 and r1_120.Mesh then
    URuntimeCommonFunctionLibrary.SetSceneComponentHiddenInGame(r1_120.Mesh, r2_120, true, r3_120, TArray(USceneComponent))
  end
end
function r6_0.HideOrShowOtherUINpcActor(r0_121, r1_121, r2_121, r3_121)
  -- line: [2693, 2707] id: 121
  for r8_121, r9_121 in pairs(r0_121.AllUINpcActor) do
    if r8_121 ~= r3_121 then
      if r9_121.SetActorHideTag then
        r9_121:SetActorHideTag(r2_121, r1_121)
      else
        r9_121:SetActorHiddenInGame(r1_121)
      end
    end
  end
  -- close: r4_121
  if IsValid(r0_121.ArmoryPlayer) then
    r0_121.ArmoryPlayer:SetActorHideTag(r2_121, r1_121)
    r0_121.ArmoryPlayer:HideAllEffectCreature(r2_121, r1_121)
  end
end
function r6_0.HideNpcActor(r0_122, r1_122, r2_122, r3_122)
  -- line: [2713, 2723] id: 122
  for r8_122, r9_122 in pairs(r0_122.AllUINpcActor) do
    if r8_122 ~= r3_122 then
      if r9_122.SetActorHideTag then
        r9_122:SetActorHideTag(r2_122, r1_122)
      else
        r9_122:SetActorHiddenInGame(r1_122)
      end
    end
  end
  -- close: r4_122
end
function r6_0.HideNpcById(r0_123, r1_123, r2_123, r3_123)
  -- line: [2729, 2742] id: 123
  local r4_123 = r0_123.AllUINpcActor and r0_123.AllUINpcActor[r1_123]
  if not r4_123 then
    DebugPrint("HideNpcById  找不到npc")
    return 
  end
  if r4_123.SetActorHideTag then
    r4_123:SetActorHideTag(r3_123 and "DefaultHideTag", r2_123)
  else
    r4_123:SetActorHiddenInGame(r2_123)
  end
end
function r6_0.CreateUIActorCameraHelper(r0_124, r1_124)
  -- line: [2748, 2754] id: 124
  local r2_124 = r0_124:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacterArmoryHelper.BP_PlayerCharacterArmoryHelper_C"), r1_124:GetTransform(), UE4.ESpawnActorCollisionHandlingMethod.Default)
  r2_124:K2_AttachToActor(r1_124, "Root", UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, true)
  r2_124:K2_AddActorLocalOffset(FVector(0, 0, 0), false, nil, false)
  return r2_124
end
function r6_0.GetUIActorCameraHelper(r0_125, r1_125)
  -- line: [2759, 2761] id: 125
  return r0_125.AllUIActorCameraHelper[r1_125]
end
function r6_0.PlayUINpcAnimation(r0_126, r1_126, r2_126, r3_126, r4_126)
  -- line: [2768, 2881] id: 126
  local r5_126 = r0_126:GetUINpcActor(r3_126)
  local r6_126 = DataMgr.SpawnNPC[r3_126]
  if r5_126 == nil or r6_126 == nil then
    return 
  end
  local r7_126 = r4_126.bDestroyNpc
  local r8_126 = r4_126.IsHaveInOutAnim
  local r9_126 = nil	-- notice: implicit variable refs by block#[16, 17, 18]
  if r1_126 then
    r9_126 = r4_126.OnInActionFinished
    if r5_126.IsNeedSetPos then
      local r10_126 = UE4.UGameplayStatics.GetPlayerCharacter(r0_126, 0)
      local r11_126 = r6_126.SpawnRadius
      local r12_126 = r6_126.SpawnAngle
      local r13_126 = r10_126:GetActorForwardVector()
      r13_126:Normalize()
      local r14_126 = r10_126:GetTransform()
      local r15_126 = UE4.UKismetMathLibrary.RotateAngleAxis(r13_126, r12_126, r10_126:GetActorUpVector())
      r14_126.Translation.X = r14_126.Translation.X + r11_126 * r15_126.X
      r14_126.Translation.Y = r14_126.Translation.Y + r11_126 * r15_126.Y
      local r19_126 = UE4.UKismetSystemLibrary.LineTraceSingle(r0_126, r14_126.Translation, r14_126.Translation + UE4.UKismetMathLibrary.RotateAngleAxis(r13_126, 180, r10_126:GetActorUpVector()) * r6_126.DetectionDiatance, ETraceTypeQuery.TraceExceptChar, false, nil, 0, FHitResult(), true)
      local r20_126 = r14_126.Rotation:ToRotator()
      if r19_126 then
        r20_126.Roll = 0
        r20_126.Yaw = r20_126.Yaw + -90
        r20_126.Pitch = 0
      else
        r20_126.Roll = 0
        r20_126.Yaw = r20_126.Yaw + 90
        r20_126.Pitch = 0
      end
      r14_126.Rotation = r20_126:ToQuat()
      r5_126:K2_SetActorTransform(r14_126, false, nil, false)
      local function r21_126(r0_127)
        -- line: [2801, 2814] id: 127
        local r1_127 = r0_127.CapsuleComponent:GetUnscaledCapsuleRadius()
        local r2_127 = r0_127.CapsuleComponent:K2_GetComponentLocation()
        local r3_127 = r0_127.CapsuleComponent:K2_GetComponentLocation()
        r2_127.Z = r2_127.Z + r0_127.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
        r3_127.Z = r3_127.Z - r0_127.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 0.5
        local r4_127 = FHitResult()
        if UE4.UKismetSystemLibrary.SphereTraceSingle(r0_127, r2_127, r3_127, r1_127, ETraceTypeQuery.TraceExceptChar, true, nil, 0, r4_127, true, UE4.FLinearColor(1, 0, 0, 1), UE4.FLinearColor(0, 1, 0, 1), 5) then
          return r4_127.ImpactPoint
        else
          return nil
        end
      end
      local r22_126 = r21_126(r5_126)
      if r22_126 ~= nil then
        r14_126.Translation.X = r22_126.X
        r14_126.Translation.Y = r22_126.Y
        r14_126.Translation.Z = r22_126.Z + r5_126.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
        r5_126:K2_SetActorTransform(r14_126, false, nil, false)
        if r21_126(r5_126) ~= nil then
          local r25_126 = UE.UNavigationFunctionLibrary.ProjectPointToNavigation(r14_126.Translation, r5_126)
          r14_126.Translation.X = r25_126.X
          r14_126.Translation.Y = r25_126.Y
          r14_126.Translation.Z = r25_126.Z + r5_126.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
          r5_126:K2_SetActorTransform(r14_126, false, nil, false)
        end
      end
    end
    r0_126:HideOrShowOtherUINpcActor(true, r2_126, r3_126)
    local function r10_126()
      -- line: [2835, 2840] id: 128
      r5_126:SetCharacterTag("Interactive")
      if r9_126 then
        r9_126()
      end
    end
    if r8_126 and r6_126.StartDialogue ~= nil then
      r5_126:PlayUITalkAction(r6_126.StartDialogue, {
        r0_126,
        r10_126
      })
    else
      r10_126()
    end
    -- close: r9_126
  else
    r9_126 = r5_126.BaiBox
    if r9_126 then
      r9_126 = r5_126.BaiBox
      r9_126:SetHiddenInGame(true, false)
    end
    r9_126 = r0_126.AllUIActorCameraHelper
    r9_126 = r9_126[r3_126]
    local function r10_126()
      -- line: [2851, 2872] id: 129
      if r7_126 and IsValid(r5_126) then
        r5_126:DestroyActorTemp()
        r0_126.AllUINpcActor[r3_126] = nil
      else
        r5_0:SetActorTickableWhenPaused(r5_126, false)
        if type(r5_126.SetEmoIdleEnabled) == "function" then
          r5_126:SetEmoIdleEnabled(true)
        end
        if type(r5_126.KawaiiSwitch) == "function" then
          r5_126:KawaiiSwitch(true)
        end
        r5_126.IsNeedSetPos = true
        r5_126:SetCharacterTag("Idle")
        r5_126:K2_SetActorLocation(FVector(-1000000, -1000000, -1000000), false, nil, false)
        r5_126:SetActorHiddenInGame(true)
      end
      r0_126:HideOrShowOtherUINpcActor(false, r2_126, r3_126)
      r9_126:K2_DestroyActor()
    end
    if r8_126 and r6_126.EndDialogue ~= nil then
      r5_126.IsInOutAnim = true
      r5_126:PlayUITalkAction(r6_126.EndDialogue, {
        r0_126,
        r10_126
      })
    else
      r10_126()
    end
    -- close: r9_126
  end
end
function r6_0.SwitchUINpcCamera(r0_130, r1_130, r2_130, r3_130, r4_130)
  -- line: [2887, 2973] id: 130
  local r5_130 = DataMgr.SpawnNPC[r3_130]
  local r6_130 = nil
  if r5_130 == nil then
    DebugPrint("BP_UIManagerComponent_C SwitchUINpcCamera SpawnNpcConfig is nil, NpcId is ", r3_130)
    return 
  end
  if r5_130.ConditionID ~= nil then
    local r7_130 = GWorld:GetAvatar()
    if r7_130 ~= nil and not ConditionUtils.CheckCondition(r7_130, r5_130.ConditionID) then
      return 
    end
  end
  local r7_130 = r5_130.IsOnlyMoveCamera
  if r7_130 == nil then
    r6_130 = r0_130:CreateAndGetUINpcActor(r3_130)
    if r6_130 == nil or not IsValid(r6_130) then
      DebugPrint("BP_UIManagerComponent_C SwitchUINpcCamera Create UIActor failed, The NpcId is", r3_130)
      return 
    end
    if r6_130.BaiBox then
      r6_130.BaiBox:SetHiddenInGame(false, false)
    end
  end
  if not r4_130 then
    r4_130 = {}
  end
  local r8_130 = r4_130.RecoverTime
  local r9_130 = r4_130.IsHaveInOutAnim
  local r10_130 = UE4.UGameplayStatics.GetPlayerCharacter(r0_130, 0)
  local r11_130 = r0_130:GetUIActorCameraHelper(r3_130)
  if r11_130 == nil or not IsValid(r11_130) then
    r11_130 = r0_130:CreateUIActorCameraHelper(r10_130)
    r0_130.AllUIActorCameraHelper[r3_130] = r11_130
  end
  if not IsValid(r11_130) then
    DebugPrint("SwitchUINpcCamera UIActorCameraHelper Create Failed, Npc Id is ", r3_130)
    return 
  end
  local r12_130 = r0_130:GetUINpcActor(r3_130)
  if r7_130 then
    if r12_130 == nil then
      local r13_130 = r10_130:GetComponentByClass(UCameraComponent:StaticClass())
      r11_130:SetCameraStartTrans(r13_130:K2_GetComponentToWorld(), r13_130.FieldOfView, r10_130)
    end
    r0_130:SetCameraParamWithConfigData(r11_130, r5_130)
    return 
  end
  if r1_130 then
    r0_130:SetTargetActorState(true, r6_130, r2_130, r9_130)
    r0_130:PlayUINpcAnimation(true, r2_130, r3_130, r4_130)
    local r13_130 = r10_130:GetComponentByClass(UCameraComponent:StaticClass())
    r11_130:SetCameraStartTrans(r13_130:K2_GetComponentToWorld(), r13_130.FieldOfView, r6_130)
    r0_130:SetCameraParamWithConfigData(r11_130, r5_130)
  else
    if r9_130 then
      if IsValid(r10_130) and r10_130.IsInAir then
        r9_130 = false
      end
      local r13_130 = r0_130:GetUIObj(r2_130)
      if r13_130 ~= nil and r13_130.IsAddInDeque then
        r9_130 = false
      end
    end
    r0_130:SetTargetActorState(false, r6_130, r2_130, r9_130)
    r0_130:PlayUINpcAnimation(false, r2_130, r3_130, r4_130)
    if r8_130 ~= nil then
      r11_130:RecorverCamera(r0_130, function()
        -- line: [2964, 2969] id: 131
        local r0_131 = r0_130:GetUIObj(r2_130)
        if r0_131 and r0_131.OnRecorverCameraEnd then
          r0_131:OnRecorverCameraEnd()
        end
      end, r8_130)
    end
  end
end
local r9_0 = {}
function r6_0.SwitchFixedCamera(r0_132, r1_132, r2_132, r3_132, r4_132, r5_132, r6_132)
  -- line: [2982, 3087] id: 132
  if r2_132 == nil then
    ScreenPrint("SwitchFixedCamera:跳转镜头失败NpcId为空")
    DebugPrint("SwitchFixedCamera Failed NpcId is nil ")
    return 
  end
  local r7_132 = UGameplayStatics.GetPlayerController(r0_132, 0)
  local r8_132 = UGameplayStatics.GetPlayerCharacter(r0_132, 0)
  local r9_132 = DataMgr.SpawnNPC[r2_132]
  local r10_132 = nil
  if r9_132 == nil then
    ScreenPrint("SwitchFixedCamera:没有找到表内数据，请检查NpcId" .. (r2_132 and "NpcId为空"))
    DebugPrint("SwitchFixedCamera:没有找到表内数据 SpawnNpcConfig 为空 ")
    return 
  end
  local function r11_132()
    -- line: [2997, 3003] id: 133
    if r5_132 then
      r0_132:SwitchUINpcCamera(r1_132, r5_132, r2_132, r6_132)
    else
      ScreenPrint("生成NPC镜头UIName为空")
    end
  end
  local r12_132 = nil
  if r5_0.GetDeviceTypeByPlatformName(r0_132) == "Mobile" and r9_132.FixedCameraM then
    r12_132 = r9_132.FixedCameraM
  elseif r9_132.FixedCamera then
    r12_132 = r9_132.FixedCamera
  else
    DebugPrint("SwitchFixedCamera:表内没有配置固定镜头：生成NPC镜头")
    r11_132()
    return 
  end
  local function r14_132()
    -- line: [3025, 3050] id: 134
    if r9_0[r12_132] and IsValid(r9_0[r12_132].actor) then
      return r9_0[r12_132].actor
    end
    local r0_134 = LoadClass(r12_132)
    if not r0_134 then
      ScreenPrint("SwitchFixedCamera:无法加载相机蓝图类，请检查路径是否正确：" .. r12_132)
      return nil
    end
    local r1_134 = UGameplayStatics.GetActorOfClass(r4_132, r0_134)
    if not r1_134 then
      ScreenPrint("SwitchFixedCamera:[WARNING] 未找到相机实例")
      return 
    end
    r9_0[r12_132] = {
      class = r0_134,
      actor = r1_134,
    }
    return r1_134
  end
  if not r14_132() then
    ScreenPrint("未找到相机实例")
    r11_132()
    return 
  end
  if r1_132 then
    local r16_132 = r14_132()
    if r16_132 then
      r16_132.Camera:K2_SetRelativeLocation(r16_132.DefaultLocation, false, nil, false)
      r7_132:SetViewTargetWithBlend(r16_132, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
      r0_132.MoveFixedCamera(r4_132, r16_132.Camera)
    end
    if r8_132 and r3_132 then
      r8_132:SetActorHideTag(r3_132, true)
    end
  else
    if IsValid(r4_132.CameraHandle) then
      ULTweenBPLibrary.KillIfIsTweening(r4_132, r4_132.CameraHandle)
    end
    local r16_132 = rawget(r4_132, "OriginalViewTarget")
    if IsValid(r16_132) then
      r7_132:SetViewTargetWithBlend(r16_132, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
    else
      DebugPrint("SwitchFixedCamera:UIState的OriginalViewTarget为空  " .. (r5_132 and "UIName为空"))
      r4_132:GetOwningPlayer():SetViewTargetWithBlend(r8_132, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
    end
    if r8_132 and r3_132 then
      r8_132:SetActorHideTag(r3_132, false)
    end
  end
end
function r6_0.MoveFixedCamera(r0_135, r1_135)
  -- line: [3091, 3097] id: 135
  r0_135.CameraHandle = ULTweenBPLibrary.Vector3To(r0_135, {
    r0_135,
    function(r0_136, r1_136)
      -- line: [3094, 3096] id: 136
      r1_135:K2_SetRelativeLocation(r1_136, false, nil, false)
    end
  }, r1_135.RelativeLocation, FVector(0), 0.5, 0, 17)
end
function r6_0.SetCameraParamWithConfigData(r0_137, r1_137, r2_137)
  -- line: [3104, 3136] id: 137
  local r3_137 = nil
  local r4_137 = nil
  local r5_137 = nil
  local r6_137 = nil
  if r5_0.GetDeviceTypeByPlatformName(r0_137) == "Mobile" and r2_137.CameraPositionStartM then
    r3_137 = r2_137.CameraPositionStartM
    r4_137 = r2_137.CameraRotationStartM
    r5_137 = r2_137.CameraPositionM
    r6_137 = r0_137:CalculatorCameraRotationbyResolution(r2_137, r2_137.CameraRotationM, true)
  else
    r3_137 = r2_137.CameraPositionStart
    r4_137 = r2_137.CameraRotationStart
    r5_137 = r2_137.CameraPosition
    r6_137 = r0_137:CalculatorCameraRotationbyResolution(r2_137, r2_137.CameraRotation)
  end
  local r8_137 = FVector(r3_137[1], r3_137[2], r3_137[3])
  local r9_137 = FRotator(r4_137[1], r4_137[2], r4_137[3])
  UE4.UGameplayStatics.GetPlayerController(r0_137, 0):SetViewTargetWithBlend(r1_137, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  if r2_137.CameraFov then
    r1_137:StartFOVAnim(r2_137.CameraFov, r2_137.CameraTime, 14)
  end
  DebugPrint("小白镜头 相机位置" .. r5_137[1] .. "," .. r5_137[2] .. "," .. r5_137[3])
  DebugPrint("小白镜头 相机旋转" .. r6_137[1] .. "," .. r6_137[2] .. "," .. r6_137[3])
  r1_137:TransformCamera(FVector(r5_137[1], r5_137[2], r5_137[3]), FRotator(r6_137[1], r6_137[2], r6_137[3]), r2_137.CameraTime, 17, r8_137, r9_137)
end
function r6_0.CalculatorCameraRotationbyResolution(r0_138, r1_138, r2_138, r3_138)
  -- line: [3140, 3177] id: 138
  local r4_138 = nil	-- notice: implicit variable refs by block#[3, 5, 6, 7, 8, 10, 28]
  if r3_138 then
    r4_138 = r1_138.CameraRotationDeltaM
    if not r4_138 then
      ::label_5::
      r4_138 = r1_138.CameraRotationDelta
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  if r4_138 == nil then
    return r2_138
  end
  if type(r4_138) ~= "table" or not r4_138[1] or not r4_138[2] or not r4_138[3] then
    ScreenPrint("SpawnNpc表中的CameraRotationDelta数据有误，没找到对应的3个坐标")
    return r2_138
  end
  local r5_138 = {
    r2_138[1] + r4_138[1],
    r2_138[2] + r4_138[2],
    r2_138[3] + r4_138[3]
  }
  local r6_138 = UWidgetLayoutLibrary.GetViewportSize(r0_138) / UWidgetLayoutLibrary.GetViewportScale(r0_138)
  local r7_138 = r6_138.X
  local r8_138 = r6_138.Y
  local r9_138 = r7_138 / r8_138
  local r10_138 = 2.5555555555555554
  local r11_138 = 1.7777777777777777
  local r13_138 = math.clamp((r9_138 - r11_138) / (r10_138 - r11_138), (1.3333333333333333 - r11_138) / (r10_138 - r11_138), 1)
  local r16_138 = {}
  local r17_138 = math.lerp
  local r18_138 = r2_138[1] and 0
  r17_138 = r17_138(r18_138, r5_138[1] and 0, r13_138) and 0
  r18_138 = math.lerp
  local r19_138 = r2_138[2] and 0
  r18_138 = r18_138(r19_138, r5_138[2] and 0, r13_138) and 0
  r19_138 = math.lerp
  local r20_138 = r2_138[3] and 0
  r19_138 = r19_138(r20_138, r5_138[3] and 0, r13_138) and 0
  -- setlist for #16 failed
  DebugPrint("小白镜头 相机旋转" .. r2_138[1] .. "," .. r2_138[2] .. "," .. r2_138[3])
  DebugPrint("小白镜头 相机旋转偏移" .. r4_138[1] .. "," .. r4_138[2] .. "," .. r4_138[3])
  DebugPrint("小白镜头 相机旋转最终" .. r16_138[1] .. "," .. r16_138[2] .. "," .. r16_138[3])
  r17_138 = DebugPrint
  r18_138 = "小白镜头 屏幕参数 Aspectratio:"
  r19_138 = r9_138 and "nil"
  r20_138 = " Alalpha:"
  local r21_138 = r13_138 and "nil"
  local r22_138 = "resolution X:"
  local r23_138 = r7_138 and "nil"
  r17_138(r18_138 .. r19_138 .. r20_138 .. r21_138 .. r22_138 .. r23_138 .. " Y:" .. (r8_138 and "nil"))
  return r16_138
end
function r6_0.TweenToMoveCamera(r0_139, r1_139, r2_139)
  -- line: [3182, 3194] id: 139
  if not IsValid(r1_139) then
    return 
  end
  if r0_139.UINpcCameraHandle then
    ULTweenBPLibrary.KillIfIsTweening(r0_139, r0_139.UINpcCameraHandle)
  end
  r0_139.UINpcCameraHandle = ULTweenBPLibrary.Vector3To(r0_139, {
    r0_139,
    function(r0_140, r1_140)
      -- line: [3190, 3192] id: 140
      r1_139:K2_SetRelativeLocation(r1_140, false, nil, false)
    end
  }, r1_139.RelativeLocation, r2_139, 0.5, 0, 17)
end
function r6_0.SetTargetActorState(r0_141, r1_141, r2_141, r3_141, r4_141)
  -- line: [3201, 3221] id: 141
  if IsValid(r2_141) and not r4_141 then
    r5_0:SetActorTickableWhenPaused(r2_141, r1_141)
    if r2_141.MeleeWeapon then
      r5_0:SetActorTickableWhenPaused(r2_141.MeleeWeapon, r1_141)
    end
    if r2_141.RangedWeapon then
      r5_0:SetActorTickableWhenPaused(r2_141.RangedWeapon, r1_141)
    end
    if r2_141.UltraWeapon then
      r5_0:SetActorTickableWhenPaused(r2_141.UltraWeapon, r1_141)
    end
    if type(r2_141.SetEmoIdleEnabled) == "function" then
      r2_141:SetEmoIdleEnabled(not r1_141)
    end
    if type(r2_141.KawaiiSwitch) == "function" then
      r2_141:KawaiiSwitch(r1_141)
    end
    r2_141:SetActorHiddenInGame(not r1_141)
  end
end
function r6_0.RegisterBattleShortCutHudKey(r0_142, r1_142)
  -- line: [3224, 3230] id: 142
  DebugPrint("RegisterBattleShortCutHudKey:" .. tostring(r1_142))
  if r1_142 == nil then
    return 
  end
  r0_142.ShortCutHudKeys[r1_142] = true
end
function r6_0.UnRegisterBattleShortCutHudKey(r0_143, r1_143)
  -- line: [3233, 3239] id: 143
  DebugPrint("UnRegisterBattleShortCutHudKey:" .. tostring(r1_143))
  if r1_143 == nil then
    return 
  end
  r0_143.ShortCutHudKeys[r1_143] = nil
end
function r6_0.SetBattleShortCutHudKeysHidden(r0_144, r1_144)
  -- line: [3242, 3256] id: 144
  if r1_144 then
    for r6_144, r7_144 in pairs(r0_144.ShortCutHudKeys) do
      if IsValid(r6_144) then
        r6_144:SetVisibility(UE4.ESlateVisibility.Hidden)
      end
    end
    -- close: r2_144
  else
    for r6_144, r7_144 in pairs(r0_144.ShortCutHudKeys) do
      if IsValid(r6_144) then
        r6_144:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    -- close: r2_144
  end
end
function r6_0.PrivateHideAllComponentUI(r0_145, r1_145, r2_145, r3_145, r4_145)
  -- line: [3258, 3292] id: 145
  for r9_145, r10_145 in pairs(r4_145) do
    for r15_145, r16_145 in pairs(r10_145) do
      if (not r3_145 or r3_145 == "" or r3_145 == r15_145) and IsValid(r16_145) then
        local r17_145 = r16_145:GetWidget()
        if r15_145 ~= "Billboard" or r1_145 or not r17_145 then
          if type(r16_145.SetWidgetHiddenByTag) == "function" then
            r16_145:SetWidgetHiddenByTag(r1_145, r2_145)
          elseif r17_145 then
            if r1_145 then
              r17_145:Hide(r2_145)
            else
              r17_145:Show(r2_145)
            end
          end
        end
      end
    end
    -- close: r11_145
  end
  -- close: r5_145
  -- warn: not visited block [12]
  -- block#12:
  -- goto label_60
end
function r6_0.HideAllComponentUI(r0_146, r1_146, r2_146, r3_146)
  -- line: [3298, 3321] id: 146
  if r3_146 == "Billboard" or r3_146 == nil then
    DebugPrint("BP_UIManagerComponent_C:HideAllComponentUI SetIsForbidenShowBloodUI", r1_146, r2_146)
    UE4.UMainBar.SetIsForbidenShowBloodUI(r1_146)
  end
  r0_146:PrivateHideAllComponentUI(r1_146, r2_146, r3_146, r0_146.WidgetComponentList)
  r0_146.HideWidgetComponentTags = r0_146.HideWidgetComponentTags and {}
  if r3_146 == nil or r3_146 == "" then
    r3_146 = ""
  end
  local r5_146 = r0_146.HideWidgetComponentTags[r2_146] and {}
  r0_146.HideWidgetComponentTags[r2_146] = r5_146
  if r1_146 then
    r5_146[r3_146] = true
  else
    r5_146[r3_146] = nil
  end
  EventManager:FireEvent(EventID.OnHideAllComponentUI, r1_146, r2_146)
end
function r6_0.PlayScreenEffectAnim(r0_147, r1_147, r2_147, r3_147)
  -- line: [3327, 3351] id: 147
  local r4_147 = r0_147:LoadUI(r1_147, r2_147, UIConst.ZORDER_SCREEN_EFFECT)
  if r4_147 == nil then
    return 
  end
  r4_147:Show()
  if #r3_147 > 1 then
    if not r4_147:IsAnimationPlaying(r4_147[r3_147[1].AnimName]) and not r4_147:IsAnimationPlaying(r4_147[r3_147[2].AnimName]) then
      r4_147:BindToAnimationFinished(r4_147[r3_147[1].AnimName], {
        r4_147,
        function(r0_148)
          -- line: [3336, 3340] id: 148
          if IsValid(r0_148) then
            r0_148:PlayAnimation(r0_148[r3_147[2].AnimName], r3_147[2].StartTime, r3_147[2].LoopNums)
          end
        end
      })
      r4_147:PlayAnimation(r4_147[r3_147[1].AnimName], r3_147[1].StartTime, r3_147[1].LoopNums)
    end
  else
    local r5_147 = r3_147[1]
    if not r4_147:IsAnimationPlaying(r4_147[r5_147.AnimName]) then
      r4_147:PlayAnimation(r4_147[r5_147.AnimName], r5_147.StartTime, r5_147.LoopNums)
    end
  end
  return r4_147
end
function r6_0.CheckNeedExitUIMode(r0_149, r1_149)
  -- line: [3357, 3371] id: 149
  local r3_149 = UE4.UGameplayStatics.GetGameInstance(r0_149):TryGetTalkContext()
  if r3_149 and r3_149:HasHiddenGameUI() then
    return false
  end
  for r9_149, r10_149 in pairs(r0_149.UIInstances:ToTable()) do
    if r10_149.IsInUIMode and r10_149 ~= r1_149 and (r10_149:GetParent() or r10_149:IsInViewport()) then
      return false
    end
  end
  -- close: r5_149
  return true
end
function r6_0.GetTopUIModeUI(r0_150, r1_150)
  -- line: [3373, 3387] id: 150
  local r2_150 = r0_150.UIInstances:ToTable()
  local r3_150 = -10000
  local r4_150 = nil
  for r9_150, r10_150 in pairs(r2_150) do
    if r10_150.IsInUIMode and r10_150 ~= r1_150 and (r10_150:GetParent() or r10_150:IsInViewport()) then
      local r11_150 = r10_150:GetZOrder()
      if r3_150 <= r11_150 then
        r3_150 = r11_150
        r4_150 = r10_150
      end
    end
  end
  -- close: r5_150
  return r4_150
end
function r6_0.SetPauseWorldRenderingSwitch(r0_151, r1_151, r2_151)
  -- line: [3389, 3402] id: 151
  if r2_151 then
    r0_151.AllNotRenderWorldUI[r1_151] = 1
    if UE4.UGameplayStatics.GetEnableWorldRendering(r0_151) then
      UE4.UGameplayStatics.SetEnableWorldRendering(r0_151, false)
    end
  else
    r0_151.AllNotRenderWorldUI[r1_151] = nil
    if IsEmptyTable(r0_151.AllNotRenderWorldUI) then
      UE4.UGameplayStatics.SetEnableWorldRendering(r0_151, true)
    end
  end
end
function r6_0.ShowBossBattleOpenTitle(r0_152, r1_152)
  -- line: [3404, 3411] id: 152
  local r2_152 = r0_152:GetUIObj("HardBossBattleOpen")
  if r2_152 then
    r2_152:ShowHardBossTitle(r1_152)
  else
    DebugPrint("找不到Boss战开战UI")
  end
end
function r6_0.RecordShowInStoryConfig(r0_153, r1_153, r2_153)
  -- line: [3413, 3418] id: 153
  r0_153.ShowInStoryUINames = r0_153.ShowInStoryUINames and {}
  if r1_153.ShowInStory then
    r0_153.ShowInStoryUINames[r2_153] = r2_153
  end
end
function r6_0.GetShowInStoryUINames(r0_154)
  -- line: [3420, 3422] id: 154
  return r0_154.ShowInStoryUINames and {}
end
function r6_0.LoadBossSkillTipsUI(r0_155, r1_155)
  -- line: [3428, 3443] id: 155
  local r3_155 = string.lower(DataMgr.BossSkillToast[r1_155].TipsStyle and "Common")
  local r4_155 = nil
  if r3_155 == "common" then
    r4_155 = "BossSkillToast"
  else
    r4_155 = "SpecialBossSkillToast"
  end
  local r5_155 = r0_155:GetUIObj(r4_155)
  if r5_155 then
    r5_155:Close()
  end
  return r0_155:LoadUINew(r4_155, r1_155)
end
function r6_0.GetArmoryUIObj(r0_156)
  -- line: [3445, 3447] id: 156
  return r0_156:GetUI("ArmoryDetail") and r0_156:GetUI("ArmoryMain")
end
function r6_0.ShowDispatchTip(r0_157, r1_157)
  -- line: [3450, 3470] id: 157
  local r2_157 = GWorld:GetAvatar()
  if not r2_157 then
    return 
  end
  if ConditionUtils.CheckCondition(r2_157, DataMgr.Region[DataMgr.Dispatch[r1_157].RegionId].RegionDispCondition) == false then
    DebugPrint("事件所在区域未解锁")
    return 
  end
  local r7_157 = DataMgr.DispatchUI[DataMgr.Dispatch[r1_157].DispatchUIId].DispatchName
  r0_157:AddTimer(1.8, function()
    -- line: [3465, 3469] id: 158
    UIManager(r0_157):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("UI_Dispatch_Toast_Unlock"), "【" .. GText(r7_157) .. "】"))
    DebugPrint("lkkkShowDispatchTip ", r1_157)
  end, false, 0, nil, false)
end
function r6_0.LaunchAfterLoadingMgr(r0_159)
  -- line: [3474, 3487] id: 159
  DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, 启动状态机")
  r0_159:DestroyAfterLoadingMgr()
  r0_159.AfterLoadingMgr = require("BluePrints.UI.Common.AfterLoadingMgr").New()
  EventManager:AddEvent(EventID.OnGuideEnd, r0_159.AfterLoadingMgr, function(r0_160, r1_160)
    -- line: [3481, 3484] id: 160
    r0_159.AfterLoadingMgr.bGuideEndPending = true
    r0_159:TryResumeAfterLoadingMgr({
      "TriggerGuide",
      "MainLineQuest",
      "DynamicQuest"
    })
  end)
  r0_159.AfterLoadingMgr:Continue()
end
function r6_0.DestroyAfterLoadingMgr(r0_161)
  -- line: [3489, 3500] id: 161
  if r0_161.AfterLoadingMgr and not r0_161.AfterLoadingMgr:IsEnd() then
    DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, 强制清理掉上次没执行完的状态机")
  end
  if r0_161.AfterLoadingMgr then
    EventManager:RemoveEvent(EventID.OnGuideEnd, r0_161.AfterLoadingMgr)
  end
  r0_161.AfterLoadingMgr = nil
end
function r6_0.TryPauseAfterLoadingMgr(r0_162, r1_162)
  -- line: [3502, 3511] id: 162
  if not r0_162.AfterLoadingMgr then
    return 
  end
  for r6_162, r7_162 in ipairs(r1_162) do
    if r0_162.AfterLoadingMgr:IsCurrentState(r7_162) then
      DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, UI打开触发继续状态机暂停")
      r0_162.AfterLoadingMgr:Pause()
      return 
    end
  end
  -- close: r2_162
end
function r6_0.FallbackAfterLoadingMgr(r0_163)
  -- line: [3513, 3518] id: 163
  if not r0_163.AfterLoadingMgr then
    return 
  end
  if r0_163.AfterLoadingMgr.bPause then
    return 
  end
  DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, 保底继续执行状态机，避免卡住")
  r0_163.AfterLoadingMgr:Fallback()
end
function r6_0.TryResumeAfterLoadingMgr(r0_164, r1_164)
  -- line: [3520, 3534] id: 164
  if not r0_164.AfterLoadingMgr then
    return 
  end
  for r6_164, r7_164 in ipairs(r1_164) do
    if r0_164.AfterLoadingMgr:IsCurrentState(r7_164) then
      r0_164:AddTimer(0.01, function()
        -- line: [3524, 3530] id: 165
        if r0_164.AfterLoadingMgr and not r0_164.AfterLoadingMgr:IsEnd() then
          DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, UI关闭触发继续执行状态机")
          r0_164.AfterLoadingMgr:Continue()
        end
      end, false, 0, r7_164)
      return 
    end
  end
  -- close: r2_164
end
function r6_0.AddTimer(r0_166, r1_166, r2_166, r3_166, r4_166, r5_166, r6_166, ...)
  -- line: [3538, 3541] id: 166
  if r6_166 == nil then
    r6_166 = true
  end
  return r6_0.Super.AddTimer(r0_166, r1_166, r2_166, r3_166, r4_166, r5_166, r6_166, ...)
end
function r6_0.SetUIPauseGame(r0_167, r1_167, r2_167)
  -- line: [3543, 3548] id: 167
  if not r0_167.UIPauseGameMap then
    r0_167.UIPauseGameMap = {}
  end
  local r3_167 = r0_167.UIPauseGameMap
  local r4_167 = nil	-- notice: implicit variable refs by block#[5]
  if r2_167 then
    r4_167 = true
    if not r4_167 then
      ::label_12::
      r4_167 = nil
    end
  else
    goto label_12	-- block#4 is visited secondly
  end
  r3_167[r1_167] = r4_167
end
function r6_0.IsUIPauseGame(r0_168)
  -- line: [3550, 3556] id: 168
  if not r0_168.UIPauseGameMap then
    return false
  end
  return r5_0.TableLength(r0_168.UIPauseGameMap) > 0
end
function r6_0.NotifyClientShowDungeonToast(r0_169, r1_169)
  -- line: [3562, 3565] id: 169
  local r2_169 = UE4.UGameplayStatics.GetGameInstance(r0_169)
  UE4.UGameplayStatics.GetGameMode():NotifyClientShowDungeonToast("AvailablePet_Empty", 1, EToastType.Common, r1_169 and EToastColor.Yellow)
end
function r6_0.LoadTitleFrameWidget(r0_170, r1_170)
  -- line: [3567, 3580] id: 170
  local r2_170 = DataMgr.TitleFrame[r1_170]
  if not r2_170 then
    ScreenPrint("称号加载失败：TitleFrame 表内没有配置TitleFrameID=" .. r1_170 and "空")
    return 
  end
  local r3_170 = r2_170.FramePath
  if not r3_170 then
    ScreenPrint("称号加载失败：TitleFrame 表内没有配置资源地址，先用默认的=" .. r1_170 and "空")
    r3_170 = "WidgetBlueprint\'/Game/UI/WBP/PersonalInfo/Widget/Title/Title/WBP_PersonalInfo_Title_01.WBP_PersonalInfo_Title_01\'"
  end
  return r0_170:CreateWidget(r3_170, false)
end
function r6_0.GetCurrentWindowSize(r0_171)
  -- line: [3581, 3583] id: 171
  return GWorld.GameInstance:GetSceneManager():GetWindowSize()
end
function r6_0.AddFlow(r0_172, r1_172, r2_172)
  -- line: [3585, 3588] id: 172
  r0_172.FlowList[r1_172] = r2_172
  DebugPrint("WXT UIManagerComponent_C:AddFlow", r1_172)
end
function r6_0.TryOpenSystem(r0_173, r1_173)
  -- line: [3593, 3603] id: 173
  local r2_173 = UKismetSystemLibrary.GetFrameCount()
  if r0_173.SystemOpenFrameFlag ~= r2_173 and r0_173.SystemOpenFrameFlag ~= r2_173 + -1 then
    r0_173.SystemOpenFrameFlag = r2_173
    return true
  end
  DebugPrint("防止同一帧打开多个系统:", "来源:", r1_173, "帧号:", r2_173)
  return false
end
function r6_0.InitGlobalVersionDisplay(r0_174)
  -- line: [3605, 3620] id: 174
  if UE.URuntimeCommonFunctionLibrary.IsDistribution() then
    return 
  end
  local r1_174 = "WidgetBlueprint\'/Game/UI/WBP/Battle/Widget/WBP_Battle_Version.WBP_Battle_Version\'"
  r0_174:LoadUIAsync("WBP_Battle_Version", function(r0_175)
    -- line: [3610, 3617] id: 175
    if r0_175 then
      r0_174.GlobalVersionWidget = r0_175
      UE4.UGameplayStatics.GetGameInstance(r0_174).GlobalVersionWidget = r0_175
      r0_175:InitVersionDisplay()
    end
  end)
end
function r6_0.ShowGlobalVersion(r0_176)
  -- line: [3622, 3627] id: 176
  local r1_176 = UE4.UGameplayStatics.GetGameInstance(r0_176)
  if r1_176.GlobalVersionWidget then
    r1_176.GlobalVersionWidget:Show()
  end
end
function r6_0.HideGlobalVersion(r0_177)
  -- line: [3628, 3633] id: 177
  local r1_177 = UE4.UGameplayStatics.GetGameInstance(r0_177)
  if r1_177.GlobalVersionWidget then
    r1_177.GlobalVersionWidget:Hide()
  end
end
function r6_0.ShowUIError(r0_178, r1_178, r2_178, r3_178)
  -- line: [3639, 3641] id: 178
  r0_178:ShowUIErrorLua(r2_178, r1_178, r3_178)
end
function r6_0.ShowUIErrorLua(r0_179, r1_179, r2_179, r3_179)
  -- line: [3643, 3710] id: 179
  if r1_179 == nil then
    DebugPrint(ErrorTag, "ShowUIErrorLua:参数Text为nil")
    return 
  end
  if r2_179 == nil then
    DebugPrint(ErrorTag, "ShowUIErrorLua:参数ErrorCategory为nil")
    return 
  end
  local r4_179 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local r5_179 = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if r4_179 and not r5_179 then
    return 
  end
  local r6_179 = "=========================================================\n"
  local r7_179 = {
    r6_179,
    "报错文本:\n\t",
    tostring(r1_179),
    "\n"
  }
  if r3_179 == nil or r3_179 == true then
    table.insert(r7_179, r6_179)
    table.insert(r7_179, "Traceback:\n\t")
    table.insert(r7_179, debug.traceback())
    table.insert(r7_179, "\n")
  end
  table.insert(r7_179, r6_179)
  r0_179:_FillUIErrorLog(r7_179)
  table.insert(r7_179, r6_179)
  local r8_179 = table.concat(r7_179)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_179) then
    ScreenPrint("UI报错:\n" .. r8_179)
  end
  GWorld.ErrorDict = GWorld.ErrorDict and {}
  if GWorld.ErrorDict[r1_179] then
    return 
  end
  GWorld.ErrorDict[r1_179] = true
  local r9_179 = {
    first = "UI报错",
    second = r2_179,
    third = r1_179,
  }
  local r10_179 = {
    title = "UI报错",
    trace_content = r8_179,
  }
  local r11_179 = GWorld:GetAvatar()
  if r11_179 then
    local r13_179 = "设备名：" .. UE.UKismetSystemLibrary:GetPlatformUserName() .. "\n" .. r8_179
    r11_179:SendTraceToQaWeb(r9_179, r10_179)
    return 
  end
  local r12_179 = GWorld:GetDSEntity()
  if r12_179 then
    r12_179:SendTraceToQaWeb(r9_179, r10_179)
    return 
  end
end
function r6_0._FillUIErrorLog(r0_180, r1_180)
  -- line: [3712, 3812] id: 180
  if not r1_180 and type(r1_180) ~= "table" then
    return 
  end
  local r2_180 = GWorld:GetAvatar()
  table.insert(r1_180, "环境:")
  if IsClient(r0_180) then
    table.insert(r1_180, "联机客户端\n")
  elseif IsDedicatedServer(r0_180) then
    table.insert(r1_180, "联机服务端\n")
  elseif r2_180 and r2_180:IsInHardBoss() then
    table.insert(r1_180, "梦魇残声")
    if r2_180.HardBossInfo then
      table.insert(r1_180, ":编号[")
      local r3_180 = r2_180.HardBossInfo.HardBossId
      table.insert(r1_180, r3_180)
      table.insert(r1_180, "]")
      local r4_180 = nil
      if DataMgr.HardBossMain[r3_180] then
        local r5_180 = DataMgr.HardBossMain[r3_180].HardBossName
        if DataMgr.TextMap[r5_180] then
          r4_180 = GText(r5_180)
        end
      end
      if r4_180 then
        table.insert(r1_180, "[")
        table.insert(r1_180, r4_180)
        table.insert(r1_180, "]")
      end
      local r5_180 = r2_180.HardBossInfo.DifficultyId
      local r6_180 = nil
      if r5_180 and DataMgr.HardBossDifficulty[r5_180] then
        r6_180 = DataMgr.HardBossDifficulty[r5_180].DifficultyLevel
      end
      table.insert(r1_180, ":难度等级[")
      table.insert(r1_180, r6_180)
      table.insert(r1_180, "]")
    end
    table.insert(r1_180, "\n")
  else
    table.insert(r1_180, "单机\n")
  end
  local r3_180 = UE4.UGameplayStatics.GetGameMode(r0_180)
  if IsDedicatedServer(r0_180) then
    for r9_180, r10_180 in pairs(r3_180:GetAllPlayer()) do
      table.insert(r1_180, "[")
      table.insert(r1_180, r9_180)
      table.insert(r1_180, "]")
      r0_180:_FillCharacterLog_UI(r1_180, r10_180)
      table.insert(r1_180, "\n")
    end
    -- close: r5_180
  else
    local r4_180 = UE4.UGameplayStatics.GetPlayerCharacter(r0_180, 0)
    local r5_180 = nil
    if r4_180 then
      r5_180 = r4_180.CurrentRoleId
    end
    r0_180:_FillCharacterLog_UI(r1_180, r4_180)
    table.insert(r1_180, "\n")
  end
  local r4_180 = UE.UGameplayStatics.GetGameState(r0_180.Player)
  if IsValid(r4_180) then
    local r5_180 = r4_180.DungeonId
    if r5_180 and r5_180 > 0 then
      table.insert(r1_180, "副本ID:")
      table.insert(r1_180, tostring(r5_180))
      local r6_180 = DataMgr.Dungeon[r5_180]
      if r6_180 then
        local r7_180 = r6_180.DungeonName
        if DataMgr.TextMap[r7_180] then
          r7_180 = GText(r7_180)
        end
        table.insert(r1_180, "(")
        table.insert(r1_180, tostring(r7_180))
        table.insert(r1_180, ")")
      end
      table.insert(r1_180, "\n")
    end
  end
  if IsValid(r3_180) and r3_180.IsInRegion and r3_180:IsInRegion() and r2_180 then
    local r5_180 = r2_180:GetCurrentRegionId()
    table.insert(r1_180, "子区域ID:")
    table.insert(r1_180, tostring(r5_180))
    local r6_180 = DataMgr.SubRegion[r5_180]
    if r6_180 then
      local r7_180 = r6_180.SubRegionName
      if DataMgr.TextMap[r7_180] then
        r7_180 = GText(r7_180)
      end
      table.insert(r1_180, "(")
      table.insert(r1_180, tostring(r7_180))
      table.insert(r1_180, ")")
    end
    table.insert(r1_180, "\n")
  end
end
function r6_0._FillCharacterLog_UI(r0_181, r1_181, r2_181)
  -- line: [3814, 3844] id: 181
  if not r1_181 and type(r1_181) ~= "table" then
    return 
  end
  if not r2_181 then
    return 
  end
  local r3_181 = r2_181.CurrentRoleId
  table.insert(r1_181, "使用角色ID:")
  table.insert(r1_181, tostring(r3_181))
  if DataMgr.BattleChar[r3_181] then
    local r4_181 = GText(DataMgr.BattleChar[r3_181].CharName)
    table.insert(r1_181, "(")
    table.insert(r1_181, tostring(r4_181))
    table.insert(r1_181, ")")
  end
  if r2_181:IsPlayer() then
    local r4_181 = false
    for r10_181, r11_181 in pairs(r2_181:GetPhantomTeammates()) do
      if r11_181 ~= r2_181 then
        if not r4_181 then
          table.insert(r1_181, "\n正在使用的魅影信息:")
          r4_181 = true
        end
        table.insert(r1_181, "\n\t")
        r0_181:_FillCharacterLog_UI(r1_181, r11_181)
      end
    end
    -- close: r6_181
  end
end
function r6_0.StartScriptDetectionCheck(r0_182)
  -- line: [3847, 3857] id: 182
  if Const.bOpenScriptDetectionCheck then
    local r1_182 = GWorld.GameInstance:GetSceneManager()
    if r1_182 and r1_182:GetIsEnableScriptDetectionCheck() then
      r1_182:StartScriptDetectionCheck(Const.ScriptDetectionCheckType.OnMouse)
      r1_182:StartScriptDetectionCheck(Const.ScriptDetectionCheckType.OnKeyboard)
    end
  end
end
return r6_0
