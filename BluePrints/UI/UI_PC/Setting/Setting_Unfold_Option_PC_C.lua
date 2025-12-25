-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Setting\Setting_Unfold_OptionBase_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("Utils.SettingUtils")
local r2_0 = Class("BluePrints.UI.BP_EMUserWidget_C")
function r2_0.Construct(r0_1)
  -- line: [13, 20] id: 1
  r0_1.Button_Area.OnClicked:Add(r0_1, r0_1.OnClickSubOptionList)
  r0_1.Button_Area.OnHovered:Add(r0_1, r0_1.OnBtnAreaHover)
  r0_1.Button_Area.OnUnhovered:Add(r0_1, r0_1.OnBtnAreaUnHoverBase)
  r0_1.Bg_Set.Button_Base.OnClicked:Add(r0_1, r0_1.OnMainBtnClicked)
  r0_1.Bg_Set.Button_Base.OnHovered:Add(r0_1, r0_1.OnMainBtnHovered)
end
function r2_0.Destruct(r0_2)
  -- line: [22, 31] id: 2
  if r0_2.bHavaChangeViewport ~= nil then
    EventManager:RemoveEvent(EventID.GameViewportSizeChanged, r0_2)
    EventManager:RemoveEvent(EventID.RefreshVoiceName, r0_2)
  end
end
function r2_0.Init(r0_3, r1_3, r2_3, r3_3)
  -- line: [33, 61] id: 3
  rawset(r0_3, "OptionContent", r1_3)
  local r4_3 = rawset
  local r5_3 = r0_3
  local r6_3 = "Parent"
  local r7_3 = r1_3.Content
  if r7_3 then
    r7_3 = r1_3.Content.ParentWidget.Parent and r1_3
  else
    goto label_16	-- block#2 is visited secondly
  end
  r4_3(r5_3, r6_3, r7_3)
  rawset(r0_3, "CacheName", r2_3)
  rawset(r0_3, "CacheInfo", r3_3)
  rawset(r0_3, "IsListOpen", false)
  rawset(r0_3, "HasBeenForbidden", false)
  rawset(r0_3, "UnFoldTextList", r3_3.UnFoldText)
  rawset(r0_3, "DefaultValue", r3_3.DefaultValue)
  rawset(r0_3, "SubListOffset", 15)
  rawset(r0_3, "NowOptionId", 1)
  rawset(r0_3, "OldOptionId", 1)
  r0_3.EMCacheName = r0_3.CacheInfo.EMCacheName
  r0_3.EMCacheKey = r0_3.CacheInfo.EMCacheKey
  r0_3.Text_Option:SetText(GText(r0_3.CacheInfo.CacheText))
  if CommonUtils.GetDeviceTypeByPlatformName(r0_3) == "Mobile" then
    if r0_3.CacheInfo.UnFoldTextM then
      r0_3.UnFoldTextList = r0_3.CacheInfo.UnFoldTextM
    end
    if r0_3.CacheInfo.DefaultValueM then
      r0_3.DefaultValue = r0_3.CacheInfo.DefaultValueM
    end
  end
  r0_3:UpdateDefaultValue()
  r0_3:InitOptionEMCache()
  r0_3:SetHoverVisibility()
  r0_3.Text_Current:SetText(GText(r0_3.UnFoldTextList[r0_3.NowOptionId]))
end
function r2_0.UpdateDefaultValue(r0_4)
  -- line: [63, 70] id: 4
  if not r0_4.EMCacheName then
    return 
  end
  if r0_4["Update" .. r0_4.EMCacheName .. "DefaultValue"] then
    r0_4["Update" .. r0_4.EMCacheName .. "DefaultValue"](r0_4)
  end
end
function r2_0.SetHoverVisibility(r0_5)
  -- line: [72, 81] id: 5
  if CommonUtils.GetDeviceTypeByPlatformName(r0_5) == "PC" then
    r0_5.Bg_Set:PlayAnimation(r0_5.Bg_Set.Normal)
    r0_5.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_5.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_5.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_5.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r2_0.OnMouseEnter(r0_6, r1_6, r2_6)
  -- line: [83, 88] id: 6
  if CommonUtils.GetDeviceTypeByPlatformName(r0_6) == "Mobile" then
    return 
  end
  r0_6.Parent:AddHoverContent(r0_6)
end
function r2_0.OnMouseLeave(r0_7, r1_7, r2_7)
  -- line: [90, 95] id: 7
  if CommonUtils.GetDeviceTypeByPlatformName(r0_7) == "Mobile" then
    return 
  end
  r0_7.Parent:RemoveHoverContent(r0_7)
end
function r2_0.OnBtnAreaHover(r0_8)
  -- line: [97, 100] id: 8
  r0_8.Bg_Set:StopAnimation(r0_8.Bg_Set.UnHover)
  r0_8.Bg_Set:PlayAnimation(r0_8.Bg_Set.Hover)
end
function r2_0.OnBtnAreaUnHover(r0_9)
  -- line: [102, 105] id: 9
end
function r2_0.OnBtnAreaUnHoverBase(r0_10)
  -- line: [107, 110] id: 10
  r0_10.Bg_Set:StopAnimation(r0_10.Bg_Set.Hover)
  r0_10.Bg_Set:PlayAnimation(r0_10.Bg_Set.UnHover)
end
function r2_0.OnBtnDragClicked(r0_11)
  -- line: [112, 114] id: 11
  r0_11.Parent:OnClickAllLeftMouseButton()
end
function r2_0.InitOptionEMCache(r0_12)
  -- line: [116, 129] id: 12
  if r0_12["Set" .. r0_12.CacheName .. "OldOptionId"] then
    r0_12.IsOverallPerformanceCustom = GWorld.GameInstance:GetOverallScalabilityLevel() == CommonConst.OverallPerformanceCustom
    r0_12["Set" .. r0_12.CacheName .. "OldOptionId"](r0_12)
  else
    r0_12.OldOptionId = tonumber(r0_12.DefaultValue)
  end
  r0_12.NowOptionId = r0_12.OldOptionId
  if r0_12.EMCacheName == "GameUserSettings" or r0_12.EMCacheName == "ConsoleVariable" or r0_12.EMCacheName == "AntiAliasing" or r0_12.EMCacheName == "ContentPerformance" or r0_12.CacheName == "MobileResolution" then
    r0_12["Save" .. r0_12.CacheName .. "OptionSetting"](r0_12)
  end
end
function r2_0.SetOldOptionId(r0_13, r1_13, r2_13, r3_13)
  -- line: [131, 144] id: 13
  for r8_13, r9_13 in pairs(r1_13) do
    if r3_13 and r9_13[1] == r2_13[1] and r9_13[2] == r2_13[2] then
      return r8_13
    elseif r9_13 == r2_13 then
      return r8_13
    end
  end
  -- close: r4_13
  return tonumber(r0_13.DefaultValue)
end
function r2_0.OnClickSubOptionList(r0_14)
  -- line: [146, 189] id: 14
  if r0_14:IsAnimationPlaying(r0_14.Openlist) then
    return 
  end
  UIUtils.PlayCommonBtnSe(r0_14)
  if r0_14.IsListOpen then
    r0_14.IsListOpen = false
    r0_14.Parent:SetSettingUnfoldListPC(false)
    r0_14:PlayAnimationReverse(r0_14.Openlist)
    if UIUtils.IsGamepadInput() then
      r0_14.Bg_Set:SetFocus()
    end
  else
    r0_14.Parent:ClearSettingListUnfoldState()
    r0_14.IsListOpen = true
    r0_14:InitUnfoldOptionList()
    r0_14.Parent:SetSettingUnfoldListPC(true)
    if UIUtils.IsGamepadInput() then
      r0_14.Parent:BindUnfoldListClosedCallback(function()
        -- line: [164, 167] id: 15
        r0_14:OnClickLeftMouseButton()
        r0_14.Bg_Set:SetFocus()
      end)
    end
    r0_14:StopAnimation(r0_14.Openlist)
    r0_14:PlayAnimation(r0_14.Openlist)
    local r1_14 = r0_14.Button_Area:GetCachedGeometry()
    local r2_14 = r0_14.Parent.Panel_Option:GetCachedGeometry()
    local r3_14 = USlateBlueprintLibrary.LocalToAbsolute(r1_14, FVector2D(0, 0))
    local r4_14 = USlateBlueprintLibrary.LocalToAbsolute(r2_14, FVector2D(0, 0))
    local r5_14 = USlateBlueprintLibrary.GetAbsoluteSize(r1_14)
    local r6_14 = USlateBlueprintLibrary.GetAbsoluteSize(r2_14)
    local r7_14 = nil
    local r8_14 = nil
    r0_14.Parent:UpdateUnfoldListPosition(USlateBlueprintLibrary.AbsoluteToLocal(r2_14, r7_14), r6_14.Y / 2 < r3_14.Y - r4_14.Y)
  end
end
function r2_0.InitUnfoldOptionList(r0_16)
  -- line: [191, 210] id: 16
  -- notice: unreachable block#8
  local r1_16 = r0_16.UnFoldTextList
  if not r1_16 then
    return 
  end
  local r2_16 = r0_16.Parent
  r2_16.WBP_Set_UnfoldList.SubOption_List:ClearListItems()
  for r7_16, r8_16 in pairs(r1_16) do
    if r0_16:CheckUnFoldItemIsValid(r7_16) then
      local r9_16 = NewObject(UIUtils.GetCommonItemContentClass())
      r9_16.Id = r7_16
      r9_16.Text = GText(r8_16)
      local r10_16 = r0_16.CacheName
      if r10_16 == "SystemVoice" then
        r10_16 = r0_16:GetVoiceResByIndex(r7_16) and GText("UI_Option_Language_Unload")
      else
        r10_16 = false
      end
      r9_16.IsDownloadText = r10_16
      r9_16.SelectedOptionId = r0_16.NowOptionId
      r9_16.ParentWidget = r0_16
      r9_16.ClickCallBack = "OnClickChangeSubOption"
      r2_16.WBP_Set_UnfoldList.SubOption_List:AddItem(r9_16)
    end
  end
  -- close: r3_16
end
function r2_0.CheckUnFoldItemIsValid(r0_17, r1_17)
  -- line: [212, 231] id: 17
  if r0_17.CacheName == "UpscalingMethod" then
    if UIUtils.IsMobileInput() then
      if string.find(r0_17.UnFoldTextList[r1_17], "MFSR") then
        return USRMBlueprintLibrary.IsSRTypeAvailable(ESuperResolutionType.MobileFSR)
      elseif string.find(r0_17.UnFoldTextList[r1_17], "GSR") then
        return USRMBlueprintLibrary.IsSRTypeAvailable(ESuperResolutionType.GSR)
      end
    elseif UIUtils.IsPCInput() then
      if string.find(r0_17.UnFoldTextList[r1_17], "DLSS") then
        return USRMBlueprintLibrary.IsSRTypeAvailable(ESuperResolutionType.DLSS)
      elseif string.find(r0_17.UnFoldTextList[r1_17], "FSR") then
        return USRMBlueprintLibrary.IsSRTypeAvailable(ESuperResolutionType.FSR)
      elseif string.find(r0_17.UnFoldTextList[r1_17], "XeSS") then
        return USRMBlueprintLibrary.IsSRTypeAvailable(ESuperResolutionType.XeSS)
      end
    end
  end
  return true
end
function r2_0.RefreshOptionOnClick(r0_18, r1_18)
  -- line: [233, 257] id: 18
  local r2_18 = false
  if r0_18.NowOptionId ~= r1_18 then
    r0_18.Parent:ChangeUnfoldListSelection(r1_18)
    r2_18 = true
  end
  local r3_18 = true
  if r0_18.CacheName == "AntiAliasing" and URuntimeCommonFunctionLibrary.IsDLSSSupported() then
    local r4_18 = 1
    if UDLSSLibrary then
      r4_18 = UDLSSLibrary.GetDLSSMode()
    end
    if r4_18 ~= 0 then
      r3_18 = false
    end
  end
  if r3_18 then
    r0_18.NowOptionId = r1_18
    r0_18.Text_Current:SetText(GText(r0_18.UnFoldTextList[r0_18.NowOptionId]))
  end
  r0_18:OnClickSubOptionList()
  if r2_18 then
    r0_18:SaveOptionSetting()
  end
end
function r2_0.OnClickChangeSubOption(r0_19, r1_19)
  -- line: [259, 265] id: 19
  if not r0_19:CheckOnClickChangeSubOption(r1_19) then
    return 
  end
  r0_19:RefreshOptionOnClick(r1_19)
end
function r2_0.CheckOnClickChangeSubOption(r0_20, r1_20)
  -- line: [267, 272] id: 20
  if r0_20["Check" .. r0_20.CacheName .. "OptionSetting"] then
    return r0_20["Check" .. r0_20.CacheName .. "OptionSetting"](r0_20, r1_20)
  end
  return true
end
function r2_0.ClearOpenListState(r0_21)
  -- line: [274, 279] id: 21
  if r0_21.IsListOpen then
    r0_21.IsListOpen = false
    r0_21:PlayAnimationReverse(r0_21.Openlist)
  end
end
function r2_0.OnClickLeftMouseButton(r0_22)
  -- line: [281, 290] id: 22
  if r0_22.IsListOpen then
    r0_22.IsListOpen = false
    r0_22:PlayAnimationReverse(r0_22.Openlist)
    r0_22.Parent:SetSettingUnfoldListPC(false)
    if UIUtils.IsGamepadInput() then
      r0_22.Bg_Set:SetFocus()
    end
  end
end
function r2_0.CheckSettingIsChange(r0_23)
  -- line: [292, 294] id: 23
  return r0_23.OldOptionId ~= r0_23.NowOptionId
end
function r2_0.RefreshNowOptionId(r0_24)
  -- line: [296, 298] id: 24
  r0_24.NowOptionId = tonumber(r0_24.DefaultValue)
end
function r2_0.RestoreDefaultOptionSet(r0_25)
  -- line: [300, 313] id: 25
  r0_25:RefreshNowOptionId()
  r0_25.Text_Current:SetText(GText(r0_25.UnFoldTextList[r0_25.NowOptionId]))
  if r0_25.IsListOpen then
    r0_25.IsListOpen = false
    r0_25.Parent:SetSettingUnfoldListPC(false)
  end
  if r0_25["RestoreDefault" .. r0_25.CacheName] then
    r0_25["RestoreDefault" .. r0_25.CacheName](r0_25)
  else
    r0_25.OldOptionId = tonumber(r0_25.DefaultValue)
  end
  r0_25.OldOptionId = r0_25.NowOptionId
end
function r2_0.SaveOptionSetting(r0_26)
  -- line: [315, 332] id: 26
  if r0_26["Save" .. r0_26.CacheName .. "OptionSetting"] then
    if r0_26.EMCacheName == "GameUserSettings" or r0_26.EMCacheName == "ConsoleVariable" or r0_26.EMCacheName == "AntiAliasing" or r0_26.EMCacheName == "ContentPerformance" or r0_26.CacheName == "MobileResolution" then
      GWorld.GameInstance.SetOverallScalabilityLevelSimple(CommonConst.OverallPerformanceCustom)
      if r0_26.Parent.OverallPreset then
        r0_26.Parent.OverallPreset:RefreshOverallPreset()
      end
    end
    r0_26["Save" .. r0_26.CacheName .. "OptionSetting"](r0_26)
  else
    r0_26.OldOptionId = tonumber(r0_26.DefaultValue)
  end
  r0_26.OldOptionId = r0_26.NowOptionId
end
function r2_0.SaveMiniOptionSetting(r0_27)
  -- line: [334, 345] id: 27
  if r0_27["Save" .. r0_27.CacheName .. "MiniOptionSetting"] then
    if r0_27.EMCacheName == "GameUserSettings" or r0_27.EMCacheName == "ConsoleVariable" or r0_27.EMCacheName == "AntiAliasing" or r0_27.EMCacheName == "ContentPerformance" then
      GWorld.GameInstance.SetOverallScalabilityLevelSimple(CommonConst.OverallPerformanceCustom)
      if r0_27.Parent.OverallPreset then
        r0_27.Parent.OverallPreset:RefreshOverallPreset()
      end
    end
    r0_27["Save" .. r0_27.CacheName .. "MiniOptionSetting"](r0_27)
  end
end
function r2_0.SetSystemLanguageOldOptionId(r0_28)
  -- line: [348, 361] id: 28
  r0_28.SystemLanguageList = {
    [1] = "CN",
    [2] = "EN",
    [3] = "JP",
    [4] = "KR",
    [5] = "TC",
    [6] = "DE",
    [7] = "FR",
    [8] = "ES",
  }
  r0_28.OldOptionId = r0_28:SetOldOptionId(r0_28.SystemLanguageList, r1_0.GetEMCache(r0_28.EMCacheName, r0_28.EMCacheKey, r0_28.SystemLanguageList[tonumber(r0_28.DefaultValue)]))
end
function r2_0.RestoreDefaultSystemLanguage(r0_29)
  -- line: [363, 365] id: 29
  r0_29:SaveSystemLanguageOptionSetting()
end
function r2_0.SaveSystemLanguageOptionSetting(r0_30)
  -- line: [367, 378] id: 30
  r0_30.OptionCache = r0_30.SystemLanguageList[r0_30.NowOptionId]
  r1_0.SaveEMCache(r0_30.EMCacheName, r0_30.EMCacheKey, r0_30.OptionCache)
  if r0_30:CheckSettingIsChange() then
    UIManager(r0_30):ShowCommonPopupUI(100075, {
      RightCallbackFunction = function()
        -- line: [374, 374] id: 31
        r0_30:OnClickConfirmReconnect()
      end,
    }, r0_30.Parent)
  end
end
function r2_0.OnClickConfirmReconnect(r0_32)
  -- line: [380, 384] id: 32
  UE4.UGameplayStatics.GetGameInstance(r0_32):InitGameSystemLanguage()
  GWorld.NetworkMgr:OnDisconnectAndLoginAgain()
end
function r2_0.InitGameSystemLanguage(r0_33)
  -- line: [386, 396] id: 33
  local r1_33 = UIManager(r0_33):GetUI("CommonSetup")
  if r1_33 then
    r1_33:InitSetupList()
  end
  local r2_33 = UIManager(r0_33):GetUI("BattleMain")
  if r2_33 then
    r2_33:InitBtnList()
  end
  r0_33.Parent:InitCommonTab(r0_33.Parent.NewTabId, true)
end
function r2_0.SetCameraBackOldOptionId(r0_34)
  -- line: [399, 407] id: 34
  r0_34.CameraBackList = {
    [1] = "Forbidden",
    [2] = "SkillOnly",
    [3] = "Enable",
  }
  r0_34.OldOptionId = r0_34:SetOldOptionId(r0_34.CameraBackList, r1_0.GetEMCache(r0_34.EMCacheName, r0_34.EMCacheKey, r0_34.CameraBackList[tonumber(r0_34.DefaultValue)]))
end
function r2_0.RestoreDefaultCameraBack(r0_35)
  -- line: [409, 411] id: 35
  r0_35:SaveCameraBackOptionSetting()
end
function r2_0.SaveCameraBackOptionSetting(r0_36)
  -- line: [413, 421] id: 36
  r0_36.OptionCache = r0_36.CameraBackList[r0_36.NowOptionId]
  r1_0.SaveEMCache(r0_36.EMCacheName, r0_36.EMCacheKey, r0_36.OptionCache)
  local r1_36 = UE4.UGameplayStatics.GetPlayerCharacter(r0_36, 0)
  if not IsValid(r1_36) then
    return 
  end
  r1_36:EnableAutoResetCameraPitch(r0_36.OptionCache)
end
function r2_0.SetInterfaceModeOldOptionId(r0_37)
  -- line: [424, 451] id: 37
  local r1_37 = UE4.UGameUserSettings:GetGameUserSettings()
  r0_37.InterfaceModeList = {
    [1] = EWindowMode.WindowedFullscreen,
    [2] = EWindowMode.Windowed,
    [3] = EWindowMode.Windowed,
    [4] = EWindowMode.Windowed,
    [5] = EWindowMode.Windowed,
  }
  r0_37.OldOptionId = r0_37:SetOldOptionId(r0_37.InterfaceModeList, r1_37:GetFullscreenMode())
  if r0_37.OldOptionId >= 2 then
    local r3_37 = {
      [12] = 2,
      [16] = 3,
      [21] = 4,
      [23] = 5,
    }
    local r4_37 = r1_37:GetScreenResolution()
    local r5_37 = math.floor(r4_37.X * CommonConst.ScreenScale / r4_37.Y + 0.5)
    if r3_37[r5_37] == nil then
      r5_37 = CommonConst.DefaultScreenScale
    end
    r0_37.OldOptionId = r3_37[r5_37]
  end
end
function r2_0.RestoreDefaultInterfaceMode(r0_38)
  -- line: [453, 455] id: 38
  r0_38:SaveInterfaceModeOptionSetting()
end
function r2_0.SaveInterfaceModeOptionSetting(r0_39)
  -- line: [457, 471] id: 39
  r0_39.OptionCache = r0_39.InterfaceModeList[r0_39.NowOptionId]
  local r1_39 = GWorld.GameInstance:GetSceneManager()
  if r1_39 == nil then
    return 
  end
  if r0_39.bHavaChangeViewport ~= true then
    r0_39.bHavaChangeViewport = true
  end
  if r0_39.OptionCache ~= EWindowMode.Windowed then
    r1_39:ResizeWindow(r0_39.OptionCache)
  end
end
function r2_0.SetOverallPresetOldOptionId(r0_40)
  -- line: [474, 486] id: 40
  r0_40.OverallPresetList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
    [6] = -1,
  }
  local r1_40 = GWorld.GameInstance:GetOverallScalabilityLevel()
  r0_40.Parent.OverallPreset = r0_40
  r0_40.OldOptionId = r0_40:SetOldOptionId(r0_40.OverallPresetList, r1_40)
end
function r2_0.RestoreDefaultOverallPreset(r0_41)
  -- line: [488, 490] id: 41
  r0_41:SaveOverallPresetOptionSetting(true)
end
function r2_0.SaveOverallPresetOptionSetting(r0_42, r1_42)
  -- line: [492, 511] id: 42
  r0_42.OptionCache = r0_42.OverallPresetList[r0_42.NowOptionId]
  if r0_42.OptionCache == CommonConst.OverallPerformanceCustom then
    r1_0.SaveEMCache(r0_42.EMCacheName, r0_42.EMCacheKey, r0_42.OptionCache)
  else
    r1_0.SaveEMCache(r0_42.EMCacheName, r0_42.EMCacheKey, r0_42.OptionCache)
    GWorld.GameInstance.SetOverallScalabilityLevel(r0_42.OptionCache)
    r1_0.InitAntiAliasingCache(r0_42.OptionCache)
    r1_0.InitMobileResolution(r0_42.OptionCache)
    r1_0.InitRealtimeSunlight(r0_42.OptionCache)
    if not r1_42 then
      r0_42.Parent:OnTabSelected(r0_42.Parent.CurrentWidget, true)
    end
    local r2_42 = UE4.URegionSyncSubsystem.GetInstance(r0_42)
    if r2_42 then
      r2_42:RefreshActivePlayerNum()
    end
  end
end
function r2_0.RefreshOverallPreset(r0_43)
  -- line: [513, 520] id: 43
  local r1_43 = GWorld.GameInstance:GetOverallScalabilityLevel()
  r0_43.NowOptionId = r0_43:SetOldOptionId(r0_43.OverallPresetList, r1_43)
  local r2_43 = GText(r0_43.UnFoldTextList[r0_43.NowOptionId])
  if r2_43 == nil then
    r2_43 = r0_43.UnFoldTextList[r0_43.NowOptionId]
  end
  r0_43.Text_Current:SetText(r2_43)
  r1_0.SaveEMCache(r0_43.EMCacheName, r0_43.EMCacheKey, r1_43)
end
function r2_0.SetContentPerformanceOldOptionId(r0_44)
  -- line: [523, 548] id: 44
  r0_44.ContentPerformanceList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  }
  local r1_44 = r0_0:Get(r0_44.CacheName)
  if r0_44.IsOverallPerformanceCustom and r1_44 ~= nil then
    r0_44.OldOptionId = r1_44
  else
    r0_44.OldOptionId = r0_44:SetOldOptionId(r0_44.ContentPerformanceList, GWorld.GameInstance:GetGameplayScalabilityLevel())
  end
end
function r2_0.RestoreDefaultContentPerformance(r0_45)
  -- line: [550, 552] id: 45
  r0_45:SaveContentPerformanceOptionSetting()
end
function r2_0.SaveContentPerformanceOptionSetting(r0_46)
  -- line: [554, 559] id: 46
  r0_46.OptionCache = r0_46.ContentPerformanceList[r0_46.NowOptionId]
  r1_0.SaveEMCache(r0_46.EMCacheName, r0_46.EMCacheKey, r0_46.OptionCache)
  r1_0.SaveEMCache(r0_46.CacheName, nil, r0_46.NowOptionId)
  GWorld.GameInstance.SetGameplayScalabilityLevel(r0_46.OptionCache)
end
function r2_0.SetDLSSOldOptionId(r0_47)
  -- line: [562, 581] id: 47
  r0_47.DLSSScaleList = {
    [1] = 0,
    [2] = 1,
    [3] = 4,
    [4] = 5,
    [5] = 6,
    [6] = 2,
  }
  local r1_47 = 1
  if UDLSSLibrary then
    r1_47 = UDLSSLibrary.GetDLSSMode()
  end
  if r1_47 == 7 then
    r1_47 = 6
  end
  r0_47.OldOptionId = r0_47:SetOldOptionId(r0_47.DLSSScaleList, r1_47)
end
function r2_0.RestoreDefaultDLSS(r0_48)
  -- line: [583, 585] id: 48
  r0_48:SaveDLSSOptionSetting()
end
function r2_0.SaveDLSSOptionSetting(r0_49)
  -- line: [587, 597] id: 49
  r0_49.OptionCache = r0_49.DLSSScaleList[r0_49.NowOptionId]
  r0_0:Set("DLSS", r0_49.OptionCache)
  if UDLSSLibrary then
    local r1_49 = r0_49.OptionCache
    if r1_49 == 3 then
      r1_49 = 1
    end
    UDLSSLibrary.SetDLSSMode(r1_49)
  end
end
function r2_0.SetDLSSOptionOldOptionId(r0_50)
  -- line: [601, 614] id: 50
  r0_50.DLSSFGList = {
    [1] = 0,
    [2] = 251,
    [3] = 17,
    [4] = 23,
    [5] = 31,
  }
  local r1_50 = r0_0:Get("DLSSFG")
  if r1_50 == nil then
    r1_50 = tonumber(r0_50.DefaultValue)
  end
  r0_50.OldOptionId = r0_50:SetOldOptionId(r0_50.DLSSFGList, r1_50)
end
function r2_0.RestoreDefaultDLSSOption(r0_51)
  -- line: [616, 618] id: 51
  r0_51:SaveDLSSOptionOptionSetting()
end
function r2_0.SaveDLSSOptionOptionSetting(r0_52)
  -- line: [620, 626] id: 52
  local r1_52 = r0_52.DLSSFGList[r0_52.NowOptionId]
  r0_0:Set("DLSSFG", r1_52)
  if UStreamlineLibraryDLSSG and UStreamlineLibraryDLSSG.IsDLSSGSupported() then
    UStreamlineLibraryDLSSG.SetDLSSGMode(r1_52)
  end
end
function r2_0.SetTeammateEffectsOldOptionId(r0_53)
  -- line: [629, 637] id: 53
  r0_53.TeammateEffectsList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
  }
  r0_53.OldOptionId = r0_53:SetOldOptionId(r0_53.TeammateEffectsList, r1_0.GetEMCache(r0_53.EMCacheName, r0_53.EMCacheKey, r0_53.TeammateEffectsList[tonumber(r0_53.DefaultValue)]))
end
function r2_0.RestoreDefaultTeammateEffects(r0_54)
  -- line: [639, 641] id: 54
  r0_54:SaveTeammateEffectsOptionSetting()
end
function r2_0.SaveTeammateEffectsOptionSetting(r0_55)
  -- line: [643, 648] id: 55
  r0_55.OptionCache = r0_55.TeammateEffectsList[r0_55.NowOptionId]
  r1_0.SaveEMCache(r0_55.EMCacheName, r0_55.EMCacheKey, r0_55.OptionCache)
  UEMGameInstance.SetFriendFXQuality(r0_55.OptionCache)
end
function r2_0.UpdateTeammateEffectsDefaultValue(r0_56)
  -- line: [650, 655] id: 56
  if GWorld.GameInstance:GetGameplayScalabilityLevel() <= 1 then
    r0_56.DefaultValue = "1"
  end
end
function r2_0.SetEffectQualityOldOptionId(r0_57)
  -- line: [659, 670] id: 57
  r0_57.EffectQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  }
  r0_57.OldOptionId = r0_57:SetOldOptionId(r0_57.EffectQualityList, UE4.UGameUserSettings:GetGameUserSettings():GetVisualEffectQuality())
end
function r2_0.RestoreDefaultEffectQuality(r0_58)
  -- line: [672, 674] id: 58
  r0_58:SaveEffectQualityOptionSetting()
end
function r2_0.SaveEffectQualityOptionSetting(r0_59)
  -- line: [676, 682] id: 59
  r0_59.OptionCache = r0_59.EffectQualityList[r0_59.NowOptionId]
  r1_0.SaveEMCache(r0_59.EMCacheName, "VisualEffectQuality", r0_59.OptionCache)
  local r1_59 = UE4.UGameUserSettings:GetGameUserSettings()
  r1_59:SetVisualEffectQuality(r0_59.OptionCache)
  r1_59:ApplySettings(true)
end
function r2_0.SetAntiAliasingOldOptionId(r0_60)
  -- line: [685, 703] id: 60
  if CommonUtils.GetDeviceTypeByPlatformName(r0_60) == "Mobile" and r0_60.CacheInfo.UnFoldTextM then
    r0_60.AntiAliasingList = {
      [1] = 4,
      [2] = 2,
    }
  else
    r0_60.AntiAliasingList = {
      [1] = 0,
      [2] = 2,
      [3] = 4,
    }
  end
  r0_60.OldOptionId = r0_60:SetOldOptionId(r0_60.AntiAliasingList, URuntimeCommonFunctionLibrary.GetAntiAliasingMethodType())
  EventManager:RemoveEvent(EventID.OnSwitchUpscalingMethod, r0_60)
  EventManager:AddEvent(EventID.OnSwitchUpscalingMethod, r0_60, r0_60.UpdateOptionOnSwitchUpscalingMethod)
end
function r2_0.UpdateOptionOnSwitchUpscalingMethod(r0_61, r1_61)
  -- line: [705, 714] id: 61
  if r1_61 == 1 then
    return 
  elseif r0_61.NowOptionId == 2 then
    return 
  end
  r0_61.RefreshByEvent = true
  r0_61:RefreshOptionOnClick(2)
  r0_61.RefreshByEvent = false
end
function r2_0.RestoreDefaultAntiAliasing(r0_62)
  -- line: [716, 718] id: 62
  r0_62:SaveAntiAliasingOptionSetting()
end
function r2_0.SaveAntiAliasingOptionSetting(r0_63)
  -- line: [720, 728] id: 63
  r0_63.OptionCache = r0_63.AntiAliasingList[r0_63.NowOptionId]
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_63, "r.DefaultFeature.AntiAliasing " .. r0_63.OptionCache)
  r1_0.SaveEMCache(r0_63.EMCacheName, r0_63.EMCacheKey, r0_63.OptionCache)
  if not r0_63.RefreshByEvent then
    EventManager:FireEvent(EventID.OnSwitchAntiAliasing, r0_63.OptionCache)
  end
end
function r2_0.SetMaterialQualityOldOptionId(r0_64)
  -- line: [732, 743] id: 64
  r0_64.MaterialQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  }
  r0_64.OldOptionId = r0_64:SetOldOptionId(r0_64.MaterialQualityList, UE4.UGameUserSettings:GetGameUserSettings():GetShadingQuality())
end
function r2_0.RestoreDefaultMaterialQuality(r0_65)
  -- line: [745, 747] id: 65
  r0_65:SaveMaterialQualityOptionSetting()
end
function r2_0.SaveMaterialQualityOptionSetting(r0_66)
  -- line: [749, 755] id: 66
  r0_66.OptionCache = r0_66.MaterialQualityList[r0_66.NowOptionId]
  r1_0.SaveEMCache(r0_66.EMCacheName, "ShadingQuality", r0_66.OptionCache)
  local r1_66 = UE4.UGameUserSettings:GetGameUserSettings()
  r1_66:SetShadingQuality(r0_66.OptionCache)
  r1_66:ApplySettings(true)
end
function r2_0.SetShadowQualityOldOptionId(r0_67)
  -- line: [759, 770] id: 67
  r0_67.ShadowQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  }
  r0_67.OldOptionId = r0_67:SetOldOptionId(r0_67.ShadowQualityList, UE4.UGameUserSettings:GetGameUserSettings():GetShadowQuality())
end
function r2_0.RestoreDefaultShadowQuality(r0_68)
  -- line: [772, 774] id: 68
  r0_68:SaveShadowQualityOptionSetting()
end
function r2_0.SaveShadowQualityOptionSetting(r0_69)
  -- line: [776, 782] id: 69
  r0_69.OptionCache = r0_69.ShadowQualityList[r0_69.NowOptionId]
  r1_0.SaveEMCache(r0_69.EMCacheName, "ShadowQuality", r0_69.OptionCache)
  local r1_69 = UE4.UGameUserSettings:GetGameUserSettings()
  r1_69:SetShadowQuality(r0_69.OptionCache)
  r1_69:ApplySettings(true)
end
function r2_0.SetDetailDistanceOldOptionId(r0_70)
  -- line: [786, 795] id: 70
  r0_70.DetailDistanceList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
  }
  r0_70.OldOptionId = r0_70:SetOldOptionId(r0_70.DetailDistanceList, UE4.UGameUserSettings:GetGameUserSettings():GetViewDistanceQuality())
end
function r2_0.RestoreDefaultDetailDistance(r0_71)
  -- line: [797, 799] id: 71
  r0_71:SaveDetailDistanceOptionSetting()
end
function r2_0.SaveDetailDistanceOptionSetting(r0_72)
  -- line: [801, 807] id: 72
  r0_72.OptionCache = r0_72.DetailDistanceList[r0_72.NowOptionId]
  r1_0.SaveEMCache(r0_72.EMCacheName, "ViewDistanceQuality", r0_72.OptionCache)
  local r1_72 = UE4.UGameUserSettings:GetGameUserSettings()
  r1_72:SetViewDistanceQuality(r0_72.OptionCache)
  r1_72:ApplySettings(true)
end
function r2_0.SetHUDSizeOldOptionId(r0_73)
  -- line: [810, 817] id: 73
  r0_73.HUDSizeList = {}
  for r5_73, r6_73 in ipairs(r0_73.UnFoldTextList) do
    table.insert(r0_73.HUDSizeList, tonumber(table.pack(string.gsub(r6_73, "%%", ""))[1]) * 0.01)
  end
  -- close: r1_73
  r0_73.OldOptionId = r0_73:SetOldOptionId(r0_73.HUDSizeList, r1_0.GetEMCache(r0_73.EMCacheName, r0_73.EMCacheKey, r0_73.HUDSizeList[tonumber(r0_73.DefaultValue)]))
end
function r2_0.RestoreDefaultHUDSize(r0_74)
  -- line: [819, 821] id: 74
  r0_74:SaveHUDSizeOptionSetting()
end
function r2_0.SaveHUDSizeOptionSetting(r0_75)
  -- line: [823, 827] id: 75
  r0_75.OptionCache = r0_75.HUDSizeList[r0_75.NowOptionId]
  r1_0.SaveEMCache(r0_75.EMCacheName, r0_75.EMCacheKey, r0_75.OptionCache)
  UE.UUIFunctionLibrary.SetGameDPI(r0_75.OptionCache)
end
function r2_0.SetMaterialFilterOldOptionId(r0_76)
  -- line: [831, 841] id: 76
  r0_76.MaterialFilterList = {
    [1] = 1,
    [2] = 2,
    [3] = 4,
    [4] = 8,
    [5] = 16,
  }
  r0_76.OldOptionId = r0_76:SetOldOptionId(r0_76.MaterialFilterList, UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.MaxAnisotropy"))
end
function r2_0.RestoreDefaultMaterialFilter(r0_77)
  -- line: [843, 845] id: 77
  r0_77:SaveMaterialFilterOptionSetting()
end
function r2_0.SaveMaterialFilterOptionSetting(r0_78)
  -- line: [847, 851] id: 78
  r0_78.OptionCache = r0_78.MaterialFilterList[r0_78.NowOptionId]
  r1_0.SaveEMCache(r0_78.EMCacheName, "r.MaxAnisotropy", r0_78.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.MaxAnisotropy", r0_78.OptionCache)
end
function r2_0.SetModelDetailsOldOptionId(r0_79)
  -- line: [855, 863] id: 79
  r0_79.ModelDetailsList = {
    [1] = 1,
    [2] = 1,
    [3] = 0,
  }
  r0_79.OldOptionId = r0_79:SetOldOptionId(r0_79.ModelDetailsList, UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.SkeletalMeshLODBias"))
end
function r2_0.RestoreDefaultModelDetails(r0_80)
  -- line: [865, 867] id: 80
  r0_80:SaveModelDetailsOptionSetting()
end
function r2_0.SaveModelDetailsOptionSetting(r0_81)
  -- line: [869, 873] id: 81
  r0_81.OptionCache = r0_81.ModelDetailsList[r0_81.NowOptionId]
  r1_0.SaveEMCache(r0_81.EMCacheName, "r.SkeletalMeshLODBias", r0_81.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.SkeletalMeshLODBias", r0_81.OptionCache)
end
function r2_0.SetLocalAtomizationOldOptionId(r0_82)
  -- line: [877, 903] id: 82
  r0_82.LocalAtomizationList = {
    [1] = {
      [1] = 0,
      [2] = 1,
      [3] = 1,
      [4] = 1,
    },
    [2] = {
      [2] = 32,
      [3] = 16,
      [4] = 16,
    },
    [3] = {
      [2] = 16,
      [3] = 32,
      [4] = 64,
    },
  }
  if UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.VolumetricFog") == r0_82.LocalAtomizationList[1][1] then
    r0_82.OldOptionId = 1
  else
    r0_82.OldOptionId = r0_82:SetOldOptionId(r0_82.LocalAtomizationList[3], UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.VolumetricFog.GridSizeZ"))
  end
end
function r2_0.RestoreDefaultLocalAtomization(r0_83)
  -- line: [905, 907] id: 83
  r0_83:SaveLocalAtomizationOptionSetting()
end
function r2_0.SaveLocalAtomizationOptionSetting(r0_84)
  -- line: [909, 919] id: 84
  r0_84.OptionCache = r0_84.LocalAtomizationList[r0_84.NowOptionId]
  r1_0.SaveEMCache(r0_84.EMCacheName, "r.VolumetricFog", r0_84.LocalAtomizationList[1][r0_84.NowOptionId])
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.VolumetricFog", r0_84.LocalAtomizationList[1][r0_84.NowOptionId])
  if r0_84.NowOptionId ~= 1 then
    r1_0.SaveEMCache(r0_84.EMCacheName, "r.VolumetricFog.GridPixelSize", r0_84.LocalAtomizationList[2][r0_84.NowOptionId])
    r1_0.SaveEMCache(r0_84.EMCacheName, "r.VolumetricFog.GridSizeZ", r0_84.LocalAtomizationList[3][r0_84.NowOptionId])
    GWorld.GameInstance:SetGameScalabilityLevelByName("r.VolumetricFog.GridPixelSize", r0_84.LocalAtomizationList[2][r0_84.NowOptionId])
    GWorld.GameInstance:SetGameScalabilityLevelByName("r.VolumetricFog.GridSizeZ", r0_84.LocalAtomizationList[3][r0_84.NowOptionId])
  end
end
function r2_0.SetDepthQualityOldOptionId(r0_85)
  -- line: [923, 933] id: 85
  r0_85.DepthQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  }
  r0_85.OldOptionId = r0_85:SetOldOptionId(r0_85.DepthQualityList, UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.DepthOfFieldQuality"))
end
function r2_0.RestoreDefaultDepthQuality(r0_86)
  -- line: [935, 937] id: 86
  r0_86:SaveDepthQualityOptionSetting()
end
function r2_0.SaveDepthQualityOptionSetting(r0_87)
  -- line: [939, 943] id: 87
  r0_87.OptionCache = r0_87.DepthQualityList[r0_87.NowOptionId]
  r1_0.SaveEMCache(r0_87.EMCacheName, "r.DepthOfFieldQuality", r0_87.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.DepthOfFieldQuality", r0_87.OptionCache)
end
function r2_0.SetRefractiveQualityOldOptionId(r0_88)
  -- line: [947, 956] id: 88
  r0_88.RefractiveQualityList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
  }
  r0_88.OldOptionId = r0_88:SetOldOptionId(r0_88.RefractiveQualityList, UE4.UKismetSystemLibrary.GetConsoleVariableIntValue("r.RefractionQuality"))
end
function r2_0.RestoreDefaultRefractiveQuality(r0_89)
  -- line: [958, 960] id: 89
  r0_89:SaveRefractiveQualityOptionSetting()
end
function r2_0.SaveRefractiveQualityOptionSetting(r0_90)
  -- line: [962, 966] id: 90
  r0_90.OptionCache = r0_90.RefractiveQualityList[r0_90.NowOptionId]
  r1_0.SaveEMCache(r0_90.EMCacheName, "r.RefractionQuality", r0_90.OptionCache)
  GWorld.GameInstance:SetGameScalabilityLevelByName("r.RefractionQuality", r0_90.OptionCache)
end
function r2_0.SetScreenQualityOldOptionId(r0_91)
  -- line: [969, 977] id: 91
  r0_91.ScreenQualityList = {
    [1] = 1,
    [2] = 2,
    [3] = 4,
  }
  r0_91.OldOptionId = r0_91:SetOldOptionId(r0_91.ScreenQualityList, r1_0.GetEMCache(r0_91.EMCacheName, r0_91.EMCacheKey, r0_91.ScreenQualityList[tonumber(r0_91.DefaultValue)]))
end
function r2_0.RestoreDefaultScreenQuality(r0_92)
  -- line: [979, 981] id: 92
  r0_92:SaveScreenQualityOptionSetting()
end
function r2_0.SaveScreenQualityOptionSetting(r0_93)
  -- line: [983, 986] id: 93
  r0_93.OptionCache = r0_93.ScreenQualityList[r0_93.NowOptionId]
  r1_0.SaveEMCache(r0_93.EMCacheName, r0_93.EMCacheKey, r0_93.OptionCache)
end
function r2_0.SetScreenFilterOldOptionId(r0_94)
  -- line: [989, 997] id: 94
  r0_94.ScreenFilterList = {
    [1] = 1,
    [2] = 2,
    [3] = 0,
  }
  r0_94.OldOptionId = r0_94:SetOldOptionId(r0_94.ScreenFilterList, r1_0.GetEMCache(r0_94.EMCacheName, r0_94.EMCacheKey, r0_94.ScreenFilterList[tonumber(r0_94.DefaultValue)]))
end
function r2_0.RestoreDefaultScreenFilter(r0_95)
  -- line: [999, 1001] id: 95
  r0_95:SaveScreenFilterOptionSetting()
end
function r2_0.SaveScreenFilterOptionSetting(r0_96)
  -- line: [1003, 1011] id: 96
  r0_96.OptionCache = r0_96.ScreenFilterList[r0_96.NowOptionId]
  r1_0.SaveEMCache(r0_96.EMCacheName, r0_96.EMCacheKey, r0_96.OptionCache)
  (UE4.UGameplayStatics.GetActorOfClass(r0_96, UE4.AEnvironmentManager:StaticClass()) and r0_96:GetWorld():SpawnActor(LoadClass("/Game/Asset/Scene/common/EnvirSystem/EnvirCreat.EnvirCreat_C"))):SetPosLUT(r0_96.OptionCache)
end
function r2_0.SetGamepadPresetOldOptionId(r0_97)
  -- line: [1014, 1016] id: 97
  r0_97.OldOptionId = r1_0.GetEMCache(r0_97.EMCacheName, r0_97.EMCacheKey, tonumber(r0_97.DefaultValue))
end
function r2_0.RestoreDefaultGamepadPreset(r0_98)
  -- line: [1018, 1020] id: 98
end
function r2_0.SaveGamepadPresetOptionSetting(r0_99)
  -- line: [1022, 1027] id: 99
  local r1_99 = r1_0.GetEMCache(r0_99.EMCacheName, r0_99.EMCacheKey, tonumber(r0_99.DefaultValue))
  local r2_99 = r0_99.Parent
  local r3_99 = r0_99.NowOptionId
  if r1_99 ~= r3_99 then
    r3_99 = "GamepadPresetSave" and false
  else
    goto label_14	-- block#2 is visited secondly
  end
  r2_99.HasBeenChanged = r3_99
  r0_99.Parent:UpdateKeyboardBottonKey()
  r0_99.Parent:RefreshAllGamePadOperator(r0_99.NowOptionId)
end
function r2_0.SaveGamepadPresetOptionSettingInLocal(r0_100)
  -- line: [1029, 1031] id: 100
  r0_100:SaveGamepadPreset()
end
function r2_0.RestoreDefaultGamepadPresetInLocal(r0_101)
  -- line: [1033, 1036] id: 101
  r0_101.NowOptionId = 1
  r0_101:SaveGamepadPreset()
end
function r2_0.SaveGamepadPreset(r0_102)
  -- line: [1038, 1046] id: 102
  local r1_102 = UE4.UGameplayStatics.GetPlayerCharacter(r0_102, 0)
  r1_0.SaveEMCache(r0_102.EMCacheName, r0_102.EMCacheKey, tonumber(r0_102.NowOptionId))
  if IsValid(r1_102) then
    r1_102:SwitchGamepadSet(tonumber(r0_102.NowOptionId))
  end
  r0_102.Text_Current:SetText(GText(r0_102.UnFoldTextList[r0_102.NowOptionId]))
  r0_102.Parent:RefreshAllGamePadOperator(tonumber(r0_102.NowOptionId))
end
function r2_0.GetGamepadPresetOptionContentText(r0_103)
  -- line: [1048, 1050] id: 103
  return GText("UI_OPTION_Gamepad_Preset" .. r0_103.NowOptionId)
end
function r2_0.RestoreOldGamepadPresetInLocal(r0_104)
  -- line: [1052, 1055] id: 104
  r0_104.NowOptionId = r1_0.GetEMCache(r0_104.EMCacheName, r0_104.EMCacheKey, tonumber(r0_104.DefaultValue))
  r0_104:SaveGamepadPreset()
end
function r2_0.SetFpsOldOptionId(r0_105)
  -- line: [1059, 1070] id: 105
  r0_105.FpsList = {
    [1] = 30,
    [2] = 45,
    [3] = 60,
    [4] = 90,
    [5] = 120,
    [6] = CommonConst.MaxFPS,
  }
  r0_105.OldOptionId = r0_105:SetOldOptionId(r0_105.FpsList, r1_0.GetEMCache(r0_105.EMCacheName, r0_105.EMCacheKey, r0_105.FpsList[tonumber(r0_105.DefaultValue)]))
end
function r2_0.RestoreDefaultFps(r0_106)
  -- line: [1072, 1074] id: 106
  r0_106:SaveFpsOptionSetting()
end
function r2_0.SaveFpsOptionSetting(r0_107)
  -- line: [1076, 1092] id: 107
  r0_107.OptionCache = r0_107.FpsList[r0_107.NowOptionId]
  r1_0.SaveEMCache(r0_107.EMCacheName, r0_107.EMCacheKey, r0_107.OptionCache)
  local r1_107 = UE4.UGameUserSettings:GetGameUserSettings()
  local r2_107 = r0_107.OptionCache
  if r0_107.OptionCache == 45 then
    r2_107 = 60
  end
  if r0_107.OptionCache == CommonConst.MaxFPS then
    GWorld.GameInstance:SetUnfixedFrameRate()
  else
    r1_107:SetFrameRateLimit(r0_107.OptionCache)
    r1_107:ApplySettings(true)
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_107, "r.SetFramePace " .. r2_107, nil)
  end
  DebugPrint("---jzn---SaveFpsOptionSetting----", r0_107.OptionCache)
end
function r2_0.Handle_KeyDownOnGamePad(r0_108, r1_108)
  -- line: [1094, 1096] id: 108
  return false
end
function r2_0.Handle_KeyUpOnGamePad(r0_109, r1_109)
  -- line: [1097, 1098] id: 109
end
function r2_0.Gamepad_SetHovered(r0_110, r1_110)
  -- line: [1100, 1101] id: 110
end
function r2_0.OnMainBtnClicked(r0_111)
  -- line: [1103, 1107] id: 111
  if UIUtils.IsGamepadInput() then
    r0_111:OnClickSubOptionList()
  end
end
function r2_0.OnMainBtnHovered(r0_112)
  -- line: [1109, 1115] id: 112
  r0_112.BottomKeyInfos = {
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
  r0_112.Parent:UpdateBottomKey(r0_112.BottomKeyInfos)
end
function r2_0.OnSubBtnHovered(r0_113)
  -- line: [1118, 1124] id: 113
  r0_113.BottomKeyInfos = {
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
  r0_113.Parent:UpdateBottomKey(r0_113.BottomKeyInfos)
end
function r2_0.GetBottomKeyInfos(r0_114)
  -- line: [1126, 1128] id: 114
  return r0_114.BottomKeyInfos and {}
end
function r2_0.GetFirstWidgetToNavigate(r0_115)
  -- line: [1130, 1132] id: 115
  return r0_115.Bg_Set
end
function r2_0.GetLastWidgetToNavigate(r0_116)
  -- line: [1134, 1136] id: 116
  return r0_116.Bg_Set
end
function r2_0.SetSystemVoiceOldOptionId(r0_117)
  -- line: [1139, 1145] id: 117
  r0_117:RefreshVoiceTextInfo()
  r0_117.OldOptionId = r0_117:SetOldOptionId(r0_117.VoiceTextMap, r1_0.GetEMCache(r0_117.EMCacheName, r0_117.EMCacheKey, r0_117.VoiceTextMap[tonumber(r0_117.DefaultValue)]))
  EventManager:RemoveEvent(EventID.RefreshVoiceName, r0_117)
  EventManager:AddEvent(EventID.RefreshVoiceName, r0_117, r0_117.SaveSystemVoiceCallBack)
end
function r2_0.RefreshVoiceTextInfo(r0_118)
  -- line: [1147, 1157] id: 118
  r0_118.VoiceTextMap = {}
  local r1_118 = TArray("")
  for r6_118, r7_118 in ipairs(r0_118.UnFoldTextList) do
    local r8_118 = string.split(r7_118, "_")
    r0_118.VoiceTextMap[r6_118] = r8_118[#r8_118]
    r1_118:Add(r0_118.VoiceTextMap[r6_118])
  end
  -- close: r2_118
  r0_118.VoiceDownloadedRes = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_118, UHotUpdateSubsystem):IsVoicesDownloaded(r1_118):ToTable()
end
function r2_0.SetVoiceResByIndex(r0_119, r1_119, r2_119)
  -- line: [1159, 1167] id: 119
  if not r0_119.VoiceTextMap then
    return 
  end
  if not r0_119.VoiceTextMap[r1_119] then
    return 
  end
  r0_119.VoiceDownloadedRes[r0_119.VoiceTextMap[r1_119]] = r2_119
end
function r2_0.GetVoiceResByIndex(r0_120, r1_120)
  -- line: [1169, 1180] id: 120
  if not r1_120 then
    return 
  end
  if not r0_120.VoiceTextMap then
    return 
  end
  if not r0_120.VoiceTextMap[r1_120] then
    return 
  end
  return r0_120.VoiceDownloadedRes[r0_120.VoiceTextMap[r1_120]]
end
function r2_0.RestoreDefaultSystemVoice(r0_121)
  -- line: [1182, 1184] id: 121
  r0_121:SaveSystemVoiceOptionSetting()
end
function r2_0.CheckSystemVoiceOptionSetting(r0_122, r1_122)
  -- line: [1186, 1194] id: 122
  r0_122.CheckSelectOptionId = r1_122
  if r0_122:GetVoiceResByIndex(r1_122) then
    return true
  else
    r0_122:ShowVoiceResourcePopup(r0_122.CheckSelectOptionId)
    return false
  end
end
function r2_0.SaveSystemVoiceOptionSetting(r0_123)
  -- line: [1196, 1202] id: 123
  r0_123.OptionCache = r0_123.VoiceTextMap[r0_123.NowOptionId]
  r1_0.SaveEMCache(r0_123.EMCacheName, r0_123.EMCacheKey, r0_123.OptionCache)
  r0_123.Text_Current:SetText(GText(r0_123.UnFoldTextList[r0_123.NowOptionId]))
  CommonConst.SystemVoice = r0_123.OptionCache
  AudioManager(r0_123):SetVoiceLanguage(CommonConst.SystemVoice)
end
function r2_0.SaveSystemVoiceCallBack(r0_124)
  -- line: [1204, 1218] id: 124
  r0_124:RefreshVoiceTextInfo()
  if r0_124.CheckSelectOptionId then
    if r0_124:GetVoiceResByIndex(r0_124.CheckSelectOptionId) then
      r0_124:RefreshOptionOnClick(r0_124.CheckSelectOptionId)
    elseif r0_124:GetVoiceResByIndex(r0_124.NowOptionId) then
      r0_124:RefreshOptionOnClick(r0_124.NowOptionId)
    else
      r0_124:RefreshOptionOnClick(1)
    end
    r0_124.CheckSelectOptionId = nil
  elseif not r0_124:GetVoiceResByIndex(r0_124.NowOptionId) then
    r0_124:RestoreDefaultOptionSet()
  end
end
function r2_0.ShowVoiceResourcePopup(r0_125, r1_125)
  -- line: [1220, 1289] id: 125
  local r2_125 = r1_125
  local r3_125 = nil
  if not r0_125.VoiceTextMap then
    r0_125.VoiceTextMap = {}
    for r8_125, r9_125 in ipairs(r0_125.UnFoldTextList) do
      local r10_125 = string.split(r9_125, "_")
      r0_125.VoiceTextMap[r8_125] = r10_125[#r10_125]
    end
    -- close: r4_125
  end
  for r8_125, r9_125 in pairs(r0_125.VoiceTextMap) do
    if r9_125 == CommonConst.SystemVoice then
      r3_125 = r8_125
      if not r2_125 then
        r2_125 = r8_125
        break
      else
        break
      end
    end
  end
  -- close: r4_125
  local r4_125 = nil
  local function r5_125(r0_126, r1_126)
    -- line: [1241, 1273] id: 126
    local r2_126 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_125, UHotUpdateSubsystem)
    if not r2_126 then
      return 
    end
    if not r1_126 then
      return 
    end
    local r3_126 = r1_126.Content_1
    if not r3_126 then
      return 
    end
    r4_125.DontCloseWhenRightBtnClicked = false
    local r4_126 = r3_126.OptionalPatchAssetState
    if r4_126 == EOptionalPatchAssetState.Downloading then
      r4_125.DontCloseWhenRightBtnClicked = true
      if r2_126:IsPatchOptionSignPaused(r3_126.OptionalPatchAssetSign) then
        r2_126:TryStartUpdate(r3_126.OptionalPatchAssetSign, {
          r3_126.OptionalPatchAssetSign
        }, true)
      else
        if not r2_126:PauseDownloadOptionalPatchAssets(r3_126.OptionalPatchAssetSign, r3_126.OptionalPatchAssetSign) then
          UIManager(r0_125):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Pause_Unable"))
        end
        r4_125.Contents[1]:RefreshDownloadedVoiceState(false)
      end
    elseif r4_126 == EOptionalPatchAssetState.Downloaded then
      r0_125:ShowUninstallPopup(r3_126.OptionalPatchAssetSign, r3_126.CurrentIndex, r4_125)
    elseif r3_126.BytesSoFar > 0 then
      r2_126:TryStartUpdate(r3_126.OptionalPatchAssetSign, {
        r3_126.OptionalPatchAssetSign
      }, true)
    else
      r0_125:ShowDownloadPopup(r3_126.OptionalPatchAssetSign, r3_126.OptionalPatchAssetSign, r3_126.CurrentIndex, r3_126.TotalBytes)
    end
  end
  local r6_125 = {
    OptionText = r0_125.UnFoldTextList,
    Options = r0_125.VoiceTextMap,
    CurrentLanguageIndex = r2_125 and 1,
    CurrentUseLanguageIndex = r3_125 and 1,
    RightCallbackFunction = r5_125,
    ForbiddenRightCallbackFunction = r5_125,
    OnCloseCallbackFunction = function()
      -- line: [1283, 1286] id: 127
      r0_125:SaveSystemVoiceCallBack()
    end,
  }
  r4_125 = UIManager(r0_125):ShowCommonPopupUI(100254, r6_125)
end
function r2_0.ShowDownloadPopup(r0_128, r1_128, r2_128, r3_128, r4_128)
  -- line: [1291, 1317] id: 128
  local r5_128 = r4_128 / 1024 / 1024
  if r5_128 < 1 then
    r5_128 = 1
  end
  UIManager(r0_128):ShowCommonPopupUI(100255, {
    ShortText = string.format(GText("UI_OPTION_Language_Download_Confirm"), GText(r0_128.UnFoldTextList[r3_128]), math.ceil(r5_128)),
    DontPlayOutAnimation = true,
    RightCallbackFunction = function()
      -- line: [1301, 1308] id: 129
      local r0_129 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_128, UHotUpdateSubsystem)
      if not r0_129 then
        return 
      end
      r0_129:TryStartUpdate(r1_128, {
        r2_128
      }, true)
      r0_128:ShowVoiceResourcePopup(r3_128)
    end,
    LeftCallbackFunction = function()
      -- line: [1309, 1311] id: 130
      r0_128:ShowVoiceResourcePopup(r3_128)
    end,
    CloseBtnCallbackFunction = function()
      -- line: [1312, 1314] id: 131
      r0_128:ShowVoiceResourcePopup(r3_128)
    end,
  })
end
function r2_0.ShowUninstallPopup(r0_132, r1_132, r2_132, r3_132)
  -- line: [1319, 1356] id: 132
  local r4_132 = r0_132.CheckSelectOptionId and 1
  for r9_132, r10_132 in pairs(r0_132.VoiceTextMap) do
    if r10_132 == CommonConst.SystemVoice then
      r4_132 = r9_132
      break
    end
  end
  -- close: r5_132
  if r4_132 == r2_132 then
    r3_132.DontCloseWhenRightBtnClicked = true
    UIManager(r0_132):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Unload_Using"))
    return 
  end
  UIManager(r0_132):ShowCommonPopupUI(100256, {
    ShortText = string.format(GText("UI_OPTION_Language_Unload_Confirm"), GText(r0_132.UnFoldTextList[r2_132])),
    DontPlayOutAnimation = true,
    RightCallbackFunction = function()
      -- line: [1336, 1347] id: 133
      local r0_133 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_132, UHotUpdateSubsystem)
      if not r0_133 then
        return 
      end
      if not r0_133:UninstallOptionalPatchAssets(r1_132) then
        UIManager(r0_132):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Unload_Fail"))
      else
        UIManager(r0_132):ShowUITip(UIConst.Tip_CommonTop, GText("UI_OPTION_Language_Unload_Success"))
      end
      r0_132:ShowVoiceResourcePopup(r2_132)
    end,
    LeftCallbackFunction = function()
      -- line: [1348, 1350] id: 134
      r0_132:ShowVoiceResourcePopup(r2_132)
    end,
    CloseBtnCallbackFunction = function()
      -- line: [1351, 1353] id: 135
      r0_132:ShowVoiceResourcePopup(r2_132)
    end,
  })
end
function r2_0.SetMobileResolutionOldOptionId(r0_136)
  -- line: [1359, 1381] id: 136
  local r1_136 = UE4.UUIFunctionLibrary.GetDevicePlatformName(r0_136)
  if r1_136 == "Android" then
    r0_136.MobileResolutionList = {
      [1] = {
        80,
        65,
        648
      },
      [2] = {
        85,
        65,
        684
      },
      [3] = {
        90,
        70,
        720
      },
      [4] = {
        95,
        75,
        764
      },
      [5] = {
        115,
        80,
        900
      },
    }
  elseif r1_136 == "IOS" then
    r0_136.MobileResolutionList = {
      [1] = {
        55,
        55,
        0
      },
      [2] = {
        60,
        60,
        0
      },
      [3] = {
        65,
        65,
        0
      },
      [4] = {
        70,
        70,
        0
      },
      [5] = {
        85,
        85,
        0
      },
    }
  else
    DebugPrint(ErrorTag, "----jzn---移动端分辨率 当前平台不是Anroid或IOS----", r1_136)
  end
  r0_136.OldOptionId = r1_0.GetEMCache(r0_136.CacheName, r0_136.EMCacheKey, tonumber(r0_136.DefaultValue))
end
function r2_0.RestoreDefaultMobileResolution(r0_137)
  -- line: [1383, 1385] id: 137
  r0_137:SaveMobileResolutionOptionSetting()
end
function r2_0.SaveMobileResolutionOptionSetting(r0_138)
  -- line: [1387, 1392] id: 138
  r0_138.OptionCache = r0_138.MobileResolutionList[r0_138.NowOptionId]
  if not r0_138.OptionCache then
    return 
  end
  GWorld.GameInstance.SetScreenPercentageLevel(r0_138.OptionCache[1], r0_138.OptionCache[2], r0_138.OptionCache[3])
  r1_0.SaveEMCache(r0_138.CacheName, r0_138.EMCacheKey, r0_138.NowOptionId)
end
function r2_0.SetRayTracingOldOptionId(r0_139)
  -- line: [1395, 1403] id: 139
  if r1_0.IsOpenRayTracing() then
    r0_139.OldOptionId = r1_0.GetEMCache(r0_139.CacheName, r0_139.EMCacheKey, tonumber(r0_139.DefaultValue))
    r0_139:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_139.OldOptionId = 0
    r0_139:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r2_0.RestoreDefaultRayTracing(r0_140)
  -- line: [1405, 1407] id: 140
  r0_140:SaveRayTracingOptionSetting()
end
function r2_0.SaveRayTracingOptionSetting(r0_141)
  -- line: [1409, 1421] id: 141
  if not r1_0.IsOpenRayTracing() then
    return 
  end
  local r1_141 = r1_0.GetEMCache(r0_141.CacheName, r0_141.EMCacheKey, tonumber(r0_141.DefaultValue))
  local r2_141 = r0_141.NowOptionId
  if r2_141 > 1 then
    r2_141 = true and false
  else
    goto label_18	-- block#4 is visited secondly
  end
  local r3_141 = UE4.URuntimeCommonFunctionLibrary.GetRayTracingShadowsEnabled()
  UE4.URuntimeCommonFunctionLibrary.SetRayTracingShadowsEnabled(r2_141)
  if r2_141 ~= r3_141 and r2_141 and r1_141 == 1 then
    r0_141:ShowRebootPop()
  end
  r1_0.SaveEMCache(r0_141.CacheName, r0_141.EMCacheKey, r0_141.NowOptionId)
end
function r2_0.ShowRebootPop(r0_142)
  -- line: [1423, 1432] id: 142
  UE4.UGameplayStatics.GetGameInstance(r0_142):GetGameUIManager():ShowCommonPopupUI(100271, {
    RightCallbackObj = r0_142,
    RightCallbackFunction = r0_142.RayReboot,
  })
end
function r2_0.RayReboot(r0_143)
  -- line: [1434, 1436] id: 143
  AHotUpdateGameMode.CreateRestartFile()
end
function r2_0.SetUpscalingMethodOldOptionId(r0_144)
  -- line: [1439, 1471] id: 144
  if CommonUtils.GetDeviceTypeByPlatformName(r0_144) == "Mobile" then
    r0_144.OptionId2SuperResolutionType = {
      ESuperResolutionType.MinValue,
      ESuperResolutionType.MobileFSR,
      ESuperResolutionType.GSR
    }
  else
    r0_144.OptionId2SuperResolutionType = {
      ESuperResolutionType.MinValue,
      ESuperResolutionType.DLSS,
      ESuperResolutionType.FSR,
      ESuperResolutionType.XeSS
    }
  end
  local r1_144 = r1_0.GetEMCache(r0_144.CacheName, r0_144.EMCacheKey, tonumber(r0_144.DefaultValue))
  if UE4.UKismetSystemLibrary.GetConsoleVariableFloatValue("r.ScreenPercentage") ~= 100 and CommonUtils.GetDeviceTypeByPlatformName(r0_144) ~= "Mobile" then
    r1_144 = 1
  end
  r0_144.UpscalingMethod, r0_144.OldOptionId = r0_144:GetCanSetOptionId(r0_144:GetUpscalingMethodByOptionId(r1_144), r1_144)
  EventManager:RemoveEvent(EventID.OnSwitchAntiAliasing, r0_144)
  EventManager:AddEvent(EventID.OnSwitchAntiAliasing, r0_144, r0_144.UpdateOptionOnSwitchAntiAliasing)
  EventManager:RemoveEvent(EventID.OnSwitchRendering, r0_144)
  EventManager:AddEvent(EventID.OnSwitchRendering, r0_144, r0_144.UpdateOptionOnOnSwitchRendering)
  if URuntimeCommonFunctionLibrary.GetAntiAliasingMethodType() ~= 2 then
    r0_144.OptionContent:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_144.OptionContent:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end
function r2_0.UpdateOptionOnSwitchAntiAliasing(r0_145, r1_145)
  -- line: [1473, 1488] id: 145
  if r1_145 == 2 then
    if r0_145.OptionContent:GetVisibility() == UE4.ESlateVisibility.Collapsed then
      r0_145.RefreshByEvent = true
      r0_145:RestoreDefaultOptionSet()
      r0_145.RefreshByEvent = false
      r0_145.OptionContent:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    return 
  elseif r0_145.NowOptionId == 1 then
    r0_145.OptionContent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  r0_145.OptionContent:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r2_0.UpdateOptionOnOnSwitchRendering(r0_146, r1_146)
  -- line: [1490, 1496] id: 146
  if r1_146 ~= 2 and r0_146.NowOptionId ~= 1 then
    r0_146.RefreshByEvent = true
    r0_146:RestoreDefaultOptionSet()
    r0_146.RefreshByEvent = false
  end
end
function r2_0.RestoreDefaultUpscalingMethod(r0_147)
  -- line: [1498, 1505] id: 147
  if URuntimeCommonFunctionLibrary.GetAntiAliasingMethodType() == 2 and r0_147.NowOptionId ~= 1 then
    r0_147:RefreshOptionOnClick(1)
  else
    r0_147:SaveUpscalingMethodOptionSetting()
  end
end
function r2_0.SaveUpscalingMethodOptionSetting(r0_148)
  -- line: [1507, 1515] id: 148
  local r1_148 = r0_148:GetUpscalingMethodByOptionId(r0_148.NowOptionId)
  r0_148.UpscalingMethod, r0_148.NowOptionId = r0_148:GetCanSetOptionId(r1_148, r0_148.NowOptionId)
  r1_0.SaveEMCache(r0_148.CacheName, r0_148.EMCacheKey, r0_148.NowOptionId)
  r1_0.SaveEMCache("UpscalingMethodValue", nil, r1_148)
  if not r0_148.RefreshByEvent then
    EventManager:FireEvent(EventID.OnSwitchUpscalingMethod, r0_148.NowOptionId)
  end
end
function r2_0.GetUpscalingMethodByOptionId(r0_149, r1_149)
  -- line: [1517, 1519] id: 149
  return r0_149.OptionId2SuperResolutionType[r1_149]
end
function r2_0.GetCanSetOptionId(r0_150, r1_150, r2_150)
  -- line: [1521, 1535] id: 150
  local r3_150 = r1_150
  local r4_150 = r2_150
  if not USRMBlueprintLibrary.IsSRTypeAvailable(r3_150) then
    r4_150 = 1
    for r8_150 = 2, #r0_150.OptionId2SuperResolutionType, 1 do
      local r9_150 = r0_150.OptionId2SuperResolutionType[r8_150]
      if USRMBlueprintLibrary.IsSRTypeAvailable(r9_150) then
        r3_150 = r9_150
        r4_150 = r8_150
      end
    end
  end
  return r3_150, r4_150
end
function r2_0.SetShowPlayerNameOldOptionId(r0_151)
  -- line: [1538, 1546] id: 151
  r0_151.ShowPlayerNameOptionList = {
    [1] = EMainPlayerNameWidgetOption.ENotShow,
    [2] = EMainPlayerNameWidgetOption.EOnlyInRegionOnline,
    [3] = EMainPlayerNameWidgetOption.EAlwaysShow,
  }
  r0_151.OldOptionId = r0_151:SetOldOptionId(r0_151.ShowPlayerNameOptionList, r1_0.GetEMCache(r0_151.EMCacheName, r0_151.EMCacheKey, r0_151.ShowPlayerNameOptionList[tonumber(r0_151.DefaultValue)]))
end
function r2_0.RestoreDefaultShowPlayerName(r0_152)
  -- line: [1548, 1550] id: 152
  r0_152:SaveShowPlayerNameOptionSetting()
end
function r2_0.SaveShowPlayerNameOptionSetting(r0_153)
  -- line: [1552, 1559] id: 153
  r0_153.OptionCache = r0_153.ShowPlayerNameOptionList[r0_153.NowOptionId]
  r1_0.SaveEMCache(r0_153.EMCacheName, r0_153.EMCacheKey, r0_153.OptionCache)
  local r1_153 = UE4.UGameplayStatics.GetPlayerCharacter(r0_153, 0)
  if r1_153 and r0_153.OptionCache then
    r1_153:ChangeNameWidgetOption(r0_153.OptionCache)
  end
end
function r2_0.SetWaterQualityOldOptionId(r0_154)
  -- line: [1562, 1564] id: 154
  r0_154.OldOptionId = r1_0.GetEMCache(r0_154.CacheName, r0_154.EMCacheKey, tonumber(r0_154.DefaultValue))
end
function r2_0.RestoreDefaultWaterQuality(r0_155)
  -- line: [1566, 1568] id: 155
  r0_155:SaveWaterQualityOptionSetting()
end
function r2_0.SaveWaterQualityOptionSetting(r0_156)
  -- line: [1570, 1573] id: 156
  r1_0.SaveEMCache(r0_156.EMCacheName, r0_156.EMCacheKey, r0_156.NowOptionId)
  URuntimeCommonFunctionLibrary.SetWaterQuality(math.tointeger(r0_156.NowOptionId + -1))
end
function r2_0.SetPlantEnhanceOldOptionId(r0_157)
  -- line: [1576, 1586] id: 157
  r0_157.PlantEnhanceOptionList = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  }
  r0_157.OldOptionId = r0_157:SetOldOptionId(r0_157.PlantEnhanceOptionList, r1_0.GetEMCache(r0_157.EMCacheName, r0_157.EMCacheKey, r0_157.PlantEnhanceOptionList[tonumber(r0_157.DefaultValue)]))
end
function r2_0.RestoreDefaultPlantEnhance(r0_158)
  -- line: [1588, 1590] id: 158
  r0_158:SavePlantEnhanceOptionSetting()
end
function r2_0.SavePlantEnhanceOptionSetting(r0_159)
  -- line: [1592, 1599] id: 159
  r0_159.OptionCache = r0_159.PlantEnhanceOptionList[r0_159.NowOptionId]
  r1_0.SaveEMCache(r0_159.EMCacheName, r0_159.EMCacheKey, r0_159.OptionCache)
  local r1_159 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r0_159, UE4.UWorldCompositionSubSystem)
  if r1_159 then
    r1_159:SetFoliageLevel(r0_159.OptionCache)
  end
end
function r2_0.SetRenderingOldOptionId(r0_160)
  -- line: [1602, 1617] id: 160
  r0_160.RenderingOptionList = {
    90,
    100,
    110,
    120
  }
  if USRMBlueprintLibrary.GetActiveSRTypeAndQualityMode().SRType == 0 then
    r0_160.OldOptionId = r1_0.GetEMCache(r0_160.CacheName, r0_160.EMCacheKey, tonumber(r0_160.DefaultValue))
  else
    r0_160.OldOptionId = 2
  end
  EventManager:RemoveEvent(EventID.OnSwitchUpscalingMethod, r0_160)
  EventManager:AddEvent(EventID.OnSwitchUpscalingMethod, r0_160, r0_160.UpdateRenderingOptionSetting)
end
function r2_0.RestoreDefaultRendering(r0_161)
  -- line: [1619, 1626] id: 161
  if USRMBlueprintLibrary.GetActiveSRTypeAndQualityMode().SRType ~= 0 and r0_161.NowOptionId ~= 2 then
    r0_161:RefreshOptionOnClick(2)
  else
    r0_161:SaveRenderingOptionSetting()
  end
end
function r2_0.SaveRenderingOptionSetting(r0_162)
  -- line: [1628, 1639] id: 162
  local r1_162 = r0_162.RenderingOptionList[r0_162.NowOptionId]
  if not r1_162 then
    return 
  end
  UKismetSystemLibrary.ExecuteConsoleCommand(r0_162, "r.ScreenPercentage " .. r1_162)
  r1_0.SaveEMCache(r0_162.CacheName, r0_162.EMCacheKey, r0_162.NowOptionId)
  r1_0.SaveEMCache("RenderingValue", nil, r1_162)
  if not r0_162.RefreshByEvent then
    EventManager:FireEvent(EventID.OnSwitchRendering, r0_162.NowOptionId)
  end
end
function r2_0.UpdateRenderingOptionSetting(r0_163, r1_163)
  -- line: [1641, 1647] id: 163
  if r1_163 ~= 1 and r0_163.NowOptionId ~= 2 then
    r0_163.RefreshByEvent = true
    r0_163:RefreshOptionOnClick(2)
    r0_163.RefreshByEvent = false
  end
end
return r2_0
