-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\BattlePass\WBP_CharSkinPreview_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
r0_0._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}
r0_0.State_Tab = 1
r0_0.State_List = 2
local r1_0 = 100210
local r2_0 = 100264
r0_0.PreviewBehaviorType = {
  BattlePassPreview = "BattlePassPreview",
  SkinSelect = "SkinSelect",
  SelectWeaponSkin = "SelectWeaponSkin",
  SelectCharAccessory = "SelectCharAccessory",
  SelectWeaponAccessory = "SelectWeaponAccessory",
  SelectGestureItem = "SelectGestureItem",
  ShopRecommend = "ShopRecommend",
}
local r3_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r4_0 = require("BluePrints.UI.WBP.BattlePass.Controller.BattlePassController")
function r0_0.Construct(r0_1, ...)
  -- line: [28, 103] id: 1
  r0_0.Super.Construct(r0_1, ...)
  r0_1.KeyDownEvents = r0_1.KeyDownEvents and {}
  r0_1.RepeatKeyDownEvents = r0_1.RepeatKeyDownEvents and {}
  local r1_1 = EKeys
  if r1_1 then
    r1_1 = EKeys.Escape and EKeys.Escape.KeyName and "Escape"
  else
    goto label_30	-- block#7 is visited secondly
  end
  r0_1.EscapeKey = r1_1
  if UIConst.GamePadKey then
    r0_1.GamePadBackKey = UIConst.GamePadKey.FaceButtonRight
    r0_1.GamePadConfirmKey = UIConst.GamePadKey.FaceButtonBottom
    r0_1.GamePadHideUIKey = UIConst.GamePadKey.FaceButtonLeft
    r0_1.LeftTriggerKey = UIConst.GamePadKey.LeftTriggerThreshold
    r0_1.RightTriggerKey = UIConst.GamePadKey.RightTriggerThreshold
    r0_1.RightThumbstickX = "Gamepad_RightX"
  end
  r0_1.ZoomKey = "Mouse_Button"
  r0_1.bSelfHidden = false
  r0_1.bConsumeFocused = false
  r0_1.EMListView_Role.BP_OnItemClicked:Clear()
  r0_1.EMListView_Role.BP_OnItemClicked:Add(r0_1, function(r0_2, r1_2)
    -- line: [48, 50] id: 2
    r0_2:OnRoleListItemClicked(r1_2)
  end)
  r0_1.CurRoleContent = nil
  r0_1.EMListView_Role.BP_OnItemSelectionChanged:Clear()
  r0_1.EMListView_Role.BP_OnItemSelectionChanged:Add(r0_1, function(r0_3, r1_3, r2_3)
    -- line: [54, 58] id: 3
    if r2_3 and r0_3:IsGamepadInput() and r1_3 and r1_3 ~= r0_3.CurRoleContent then
      r0_3:OnRoleListItemClicked(r1_3)
    end
  end)
  r0_1.EMListView_Role.BP_OnEntryInitialized:Clear()
  r0_1.EMListView_Role.BP_OnEntryInitialized:Add(r0_1, r0_1.OnRoleListEntryInitialized)
  r0_1.Btn_List:UnBindEventOnClicked(r0_1)
  r0_1.Btn_List:BindEventOnClicked(r0_1, function()
    -- line: [64, 66] id: 4
    r0_1:ToggleRoleListPanel()
  end)
  r0_1.Btn_Confirm:UnBindEventOnClicked(r0_1)
  r0_1.Btn_Confirm:SetText(GText("UI_CONFIRM_SELECTION"))
  r0_1.Btn_Confirm:BindEventOnClicked(r0_1, r0_1.OnConfirmClicked)
  r0_1.TileView_Pendant.BP_OnItemClicked:Clear()
  r0_1.TileView_Pendant.BP_OnItemClicked:Add(r0_1, r0_1.OnAccessoryItemClicked)
  r0_1.TileView_Pendant.BP_OnItemSelectionChanged:Clear()
  r0_1.TileView_Pendant.BP_OnItemSelectionChanged:Add(r0_1, function(r0_5, r1_5, r2_5)
    -- line: [75, 79] id: 5
    if r2_5 and r0_5:IsGamepadInput() and r1_5 and r1_5 ~= r0_5.CurRoleContent then
      r0_5:OnAccessoryItemClicked(r1_5)
    end
  end)
  r0_1.List_Skin.BP_OnItemClicked:Clear()
  r0_1.List_Skin.BP_OnItemClicked:Add(r0_1, r0_1.OnSkinItemClicked)
  r0_1.List_Skin.BP_OnItemSelectionChanged:Clear()
  r0_1.List_Skin.BP_OnItemSelectionChanged:Add(r0_1, function(r0_6, r1_6, r2_6)
    -- line: [84, 88] id: 6
    if r2_6 and r0_6:IsGamepadInput() and r1_6 and r1_6 ~= r0_6.CurRoleContent then
      r0_6:OnSkinItemClicked(r1_6)
    end
  end)
  r0_1.List_Skin.OnCreateEmptyContent:Bind(r0_1, function(r0_7)
    -- line: [90, 94] id: 7
    local r1_7 = NewObject(UIUtils.GetCommonItemContentClass())
    rawset(r1_7, "IsEmpty", true)
    return r1_7
  end)
  r0_1.TileView_Pendant.OnCreateEmptyContent:Bind(r0_1, function(r0_8)
    -- line: [95, 99] id: 8
    local r1_8 = NewObject(UIUtils.GetCommonItemContentClass())
    rawset(r1_8, "IsEmpty", true)
    return r1_8
  end)
  r0_1.Tab_Change.Text_Alive:SetText(GText("UI_Armory_Meleeweapon"))
  r0_1.Tab_Change.Text_Dying:SetText(GText("UI_Armory_Longrange"))
end
function r0_0.OnLoaded(r0_9, ...)
  -- line: [105, 168] id: 9
  local r1_9 = nil	-- notice: implicit variable refs by block#[0]
  r0_9.Super.OnLoaded(r0_9, ...)
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnLoaded", ...)
  ... = ... -- error: untaken top expr
  r0_9.Params = r1_9
  r0_9.bIsFocusable = true
  r0_9:SetFocus()
  r1_9 = r0_9.Params.Type
  if r1_9 == "SelectCharAccessory" then
    r0_9:InitAccessoryParams()
  else
    r1_9 = r0_9.Params.Type
    if r1_9 == "SelectWeaponAccessory" then
      r0_9:InitWeaponAccessoryParams()
    else
      r1_9 = r0_9.Params.Type
      if r1_9 == "SelectWeaponSkin" then
        r0_9:InitWeaponParams()
      else
        r1_9 = r0_9.Params.Type
        if r1_9 == "SelectSkin" then
          r0_9:InitCharParams()
        else
          r1_9 = r0_9.Params.Type
          if r1_9 == "SelectGestureItem" then
            r0_9:InitGestureItemParams()
          else
            r0_9:InitParams()
          end
        end
      end
    end
  end
  r0_9:InitTabInfo()
  r0_9:InitSelectiveListing()
  r0_9:InitInputSettings()
  r0_9.bRoleListOpen = false
  r0_9.CurState = r0_0.State_Tab
  r0_9:PlayAnimation(r0_9.In)
  r1_9 = r0_9.Params.Type
  if r1_9 ~= "SkinSelect" then
    r1_9 = r0_9.Params.Type
    if r1_9 ~= "BattlePassPreview" then
      r1_9 = r0_9.Params.Type
      if r1_9 == "ShopRecommend" then
        ::label_76::
        r0_9:InitRoleList()
        r0_9:RefreshDetailPanel()
        r1_9 = r0_9.CurRoleContent
        if r1_9 then
          r1_9 = r0_9.CurRoleContent
          r0_9.CurRoleContent = nil
          r0_9:OnRoleListItemClicked(r1_9)
        end
      end
    end
  else
    goto label_76	-- block#14 is visited secondly
  end
  r1_9 = r0_9.Params.Type
  if r1_9 == "SelectWeaponAccessory" then
    r0_9.Tab_Change:SetVisibility(ESlateVisibility.Visable)
  else
    r0_9.Tab_Change:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_9:InitKeySetting()
  r0_9:ApplyRoleListVisibility()
  r0_9:InitConsumeInfo()
  r0_9.Tab_Change:Init({
    Parent = r0_9,
    TabIdx = 1,
    OnTabClicked = r0_9.OnTabChangeClicked,
  })
end
function r0_0.InitParams(r0_10)
  -- line: [170, 272] id: 10
  -- error: decompile function#10: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r0_0.InitRoleList(r0_11)
  -- line: [275, 287] id: 11
  r0_11:BuildRoleItemContents()
  r0_11.EMListView_Role:ClearListItems()
  for r5_11, r6_11 in ipairs(r0_11.RoleItemContentsArray) do
    r0_11.EMListView_Role:AddItem(r6_11)
    if r6_11.IsSelect then
      r0_11.EMListView_Role:BP_ScrollItemIntoView(r6_11)
      r0_11.CurRoleContent = r6_11
    end
  end
  -- close: r1_11
  r0_11.EMListView_Role:RegenerateAllEntries()
end
function r0_0.BuildRoleItemContents(r0_12)
  -- line: [290, 497] id: 12
  local r1_12 = GWorld:GetAvatar()
  if not r1_12 or not r1_12.Chars then
    return 
  end
  r0_12.RoleItemContentsMap = {}
  r0_12.RoleItemContentsArray = {}
  r0_12.CharId2SkinId = {}
  r0_12.UnownedCharContentMap = {}
  local r2_12 = nil
  local r3_12 = Const and Const.DefaultAttributeMaster
  if r1_12 and r3_12 and r1_12.Sex ~= nil then
    r2_12 = r3_12[1 - r1_12.Sex]
  end
  local function r4_12(r0_13)
    -- line: [305, 312] id: 13
    if not r0_13 then
      return false
    end
    if r2_12 and r0_13 == r2_12 then
      return false
    end
    local r1_13 = DataMgr.Char and DataMgr.Char[r0_13]
    if not r1_13 then
      return false
    end
    if r1_13.IsNotOpen then
      return false
    end
    return true
  end
  local r5_12 = nil
  if r0_12.bUseOptRewardSkinList and r0_12.SkinOptRewardId then
    local r6_12 = DataMgr.OptReward and DataMgr.OptReward[r0_12.SkinOptRewardId]
    if r6_12 and r6_12.Id and r6_12.Type then
      local r7_12 = false
      for r12_12, r13_12 in pairs(r6_12.Type) do
        if r13_12 == "Skin" then
          r7_12 = true
          break
        end
      end
      -- close: r8_12
      if r7_12 then
        r5_12 = {}
        for r12_12, r13_12 in pairs(r6_12.Id) do
          local r14_12 = DataMgr.Skin[r13_12]
          local r15_12 = r14_12 and r14_12.CharId
          if r15_12 and r4_12(r15_12) then
            r5_12[r15_12] = true
            if not r0_12.CharId2SkinId[r15_12] then
              r0_12.CharId2SkinId[r15_12] = r13_12
            end
          else
            DebugPrint("WBP_CharSkinPreview_C BuildRoleItemContents 奖励过滤排除", r13_12, r15_12)
          end
        end
        -- close: r8_12
        DebugPrint("gmy@WBP_CharSkinPreview_C M:BuildRoleItemContents UseOptReward", r0_12.SkinOptRewardId)
      else
        DebugPrint("gmy@WBP_CharSkinPreview_C M:BuildRoleItemContents OptReward Type not Skin", r0_12.SkinOptRewardId)
      end
    end
  end
  if not r5_12 and r0_12.SkinSeriesId then
    local r6_12 = DataMgr.SkinConverter
    local r7_12 = r6_12 and r6_12.SkinSeries2SkinId
    local r8_12 = r7_12 and r7_12[tostring(r0_12.SkinSeriesId)]
    if r8_12 then
      r5_12 = {}
      for r13_12, r14_12 in pairs(r8_12) do
        local r15_12 = DataMgr.Skin[r14_12]
        local r16_12 = r15_12 and r15_12.CharId
        if r16_12 and r4_12(r16_12) then
          r5_12[r16_12] = true
          r0_12.CharId2SkinId[r16_12] = r14_12
        else
          DebugPrint("WBP_CharSkinPreview_C BuildRoleItemContents 系列过滤排除", r14_12, r16_12)
        end
      end
      -- close: r9_12
    end
  end
  local r6_12 = {}
  for r11_12, r12_12 in pairs(r1_12.Chars) do
    if r12_12 and r4_12(r12_12.CharId) and (not r5_12 or r5_12[r12_12.CharId]) then
      local r13_12 = r3_0:NewCharOrWeaponItemContent(r12_12, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, nil)
      r13_12.Level = nil
      r13_12.IsOwned = true
      local r14_12 = r0_12.CharId2SkinId[r12_12.CharId]
      local r15_12 = false
      if r14_12 then
        r15_12 = r0_12:HasSkin(r12_12.CharId, r14_12)
      end
      local r16_12 = not r15_12
      r13_12.bHideLevelPanel = r16_12
      if r15_12 then
        r16_12 = 2 and 0
      else
        goto label_222	-- block#57 is visited secondly
      end
      r13_12.CharSkinPreViewLockType = r16_12
      r13_12.LockType = 0
      r13_12.GotType = r15_12
      r13_12.bHideRarity = true
      r13_12.bSet = r15_12
      if r15_12 then
        r16_12 = GText("UI_Skin_HasSkin_Short") and nil
      else
        goto label_235	-- block#60 is visited secondly
      end
      r13_12.SetOwnText = r16_12
      r13_12.bShadow = r15_12
      r13_12.SortHasSkin = r15_12
      r13_12.SortIsOwned = true
      r13_12.SortSkinId = r14_12
      r0_12.RoleItemContentsMap[r11_12] = r13_12
      table.insert(r0_12.RoleItemContentsArray, r13_12)
      r6_12[r12_12.CharId] = true
    end
  end
  -- close: r7_12
  if r5_12 then
    r3_0:DontResetUuid(true)
    for r11_12, r12_12 in pairs(r5_12) do
      if r4_12(r11_12) and not r6_12[r11_12] then
        local r13_12 = r3_0:CreateNewDummyAvatar(r3_0.PreviewTargetStates.Prime, {
          CharIds = {
            r11_12
          },
        })
        local r14_12, r15_12 = next(r13_12.Chars)
        if r15_12 then
          local r16_12 = r0_12.CharId2SkinId[r11_12]
          local r17_12 = false
          if r16_12 then
            r17_12 = r0_12:HasSkin(r11_12, r16_12)
          end
          local r18_12 = r3_0:NewCharOrWeaponItemContent(r15_12, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, true)
          r18_12.IsOwned = false
          r18_12.CharSkinPreViewLockType = 2
          local r19_12 = nil	-- notice: implicit variable refs by block#[73, 76]
          if r17_12 then
            r19_12 = 0
            if not r19_12 then
              ::label_316::
              r19_12 = 2
            end
          else
            goto label_316	-- block#72 is visited secondly
          end
          r18_12.LockType = r19_12
          r18_12.GotType = r17_12
          r18_12.bHideRarity = true
          r18_12.bSet = r17_12
          if r17_12 then
            r19_12 = GText("UI_Skin_HasSkin_Short")
            if not r19_12 then
              ::label_328::
              r19_12 = nil
            end
          else
            goto label_328	-- block#75 is visited secondly
          end
          r18_12.SetOwnText = r19_12
          r18_12.bShadow = r17_12
          r18_12.Level = nil
          r18_12.Target = r15_12
          r18_12.Avatar = r13_12
          r18_12.SortHasSkin = r17_12
          r18_12.SortIsOwned = false
          r18_12.SortSkinId = r16_12
          r0_12.RoleItemContentsMap[r18_12.Uuid] = r18_12
          r0_12.UnownedCharContentMap[r11_12] = r18_12
          table.insert(r0_12.RoleItemContentsArray, r18_12)
        end
      end
    end
    -- close: r7_12
    r3_0:DontResetUuid(false)
  end
  table.sort(r0_12.RoleItemContentsArray, function(r0_14, r1_14)
    -- line: [435, 459] id: 14
    local r2_14 = r0_14.SortHasSkin
    if r2_14 then
      r2_14 = 1 and 0
    else
      goto label_6	-- block#2 is visited secondly
    end
    local r3_14 = r1_14.SortHasSkin
    if r3_14 then
      r3_14 = 1 and 0
    else
      goto label_13	-- block#5 is visited secondly
    end
    local r4_14 = r0_14.SortIsOwned
    if r4_14 then
      r4_14 = 1 and 0
    else
      goto label_20	-- block#8 is visited secondly
    end
    local r5_14 = r1_14.SortIsOwned
    if r5_14 then
      r5_14 = 1 and 0
    else
      goto label_27	-- block#11 is visited secondly
    end
    local function r6_14(r0_15, r1_15)
      -- line: [440, 446] id: 15
      if r0_15 == 1 then
        if r1_15 == 0 then
          return 1
        else
          return 2
        end
      elseif r1_15 == 0 then
        return 3
      else
        return 4
      end
    end
    local r7_14 = r6_14(r4_14, r2_14)
    local r8_14 = r6_14(r5_14, r3_14)
    if r7_14 ~= r8_14 then
      return r7_14 < r8_14
    end
    local r9_14 = r0_14.SortSkinId and math.huge
    local r10_14 = r1_14.SortSkinId and math.huge
    if r9_14 ~= r10_14 then
      return r9_14 < r10_14
    end
    local r11_14 = r0_14.CharId
    if not r11_14 then
      r11_14 = r0_14.Char
      if r11_14 then
        r11_14 = r0_14.Char.CharId and r0_14.UnitId and 0
      else
        goto label_71	-- block#29 is visited secondly
      end
    end
    local r12_14 = r1_14.CharId
    if not r12_14 then
      r12_14 = r1_14.Char
      if r12_14 then
        r12_14 = r1_14.Char.CharId and r1_14.UnitId and 0
      else
        goto label_85	-- block#34 is visited secondly
      end
    end
    if r11_14 ~= r12_14 then
      return r11_14 < r12_14
    end
    return tostring((r0_14.Uuid and "")) < tostring((r1_14.Uuid and ""))
  end)
  local r7_12 = nil
  if r0_12.InitSkinId then
    local r8_12 = DataMgr.Skin[r0_12.InitSkinId]
    local r9_12 = r8_12 and r8_12.CharId
    if r9_12 and r4_12(r9_12) then
      for r14_12, r15_12 in ipairs(r0_12.RoleItemContentsArray) do
        if r15_12.Char and r15_12.Char.CharId == r9_12 or r15_12.CharId == r9_12 then
          r7_12 = r15_12
          break
        end
      end
      -- close: r10_12
    end
  end
  if not r7_12 then
    local r8_12 = r1_12.CurrentChar
    local r9_12 = r8_12 and r0_12.RoleItemContentsMap[r8_12]
    if r9_12 and r9_12.Char and r4_12(r9_12.Char.CharId) then
      r7_12 = r9_12
    else
      r7_12 = r0_12.RoleItemContentsArray[1]
    end
  end
  if r7_12 then
    r3_0:SetItemIsSelected(r7_12, true)
    r7_12.IsSelect = true
    r0_12.CurRoleContent = r7_12
  end
  if r0_12.RoleItemContentsArray then
    for r12_12, r13_12 in ipairs(r0_12.RoleItemContentsArray) do
      r13_12.RedDotType = nil
    end
    -- close: r8_12
  end
end
function r0_0.OnRoleListEntryInitialized(r0_16, r1_16, r2_16)
  -- line: [499, 516] id: 16
  local r3_16 = r1_16
  local r4_16 = r2_16
  if r3_16 then
    r3_16.RedDotType = nil
  end
  if r4_16 then
    if r4_16.SetReddot then
      r4_16:SetReddot(nil)
    else
      if r4_16.Reddot and r4_16.Reddot.SetVisibility then
        r4_16.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      if r4_16.New and r4_16.New.SetVisibility then
        r4_16.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
end
function r0_0.OnRoleListItemClicked(r0_17, r1_17)
  -- line: [519, 537] id: 17
  if r0_17.CurRoleContent == r1_17 then
    return 
  end
  if r0_17.CurRoleContent then
    r3_0:SetItemIsSelected(r0_17.CurRoleContent, false)
    r0_17.CurRoleContent.IsSelect = false
    if r0_17.CurRoleContent.Widget and r0_17.CurRoleContent.Widget.SetIsSelected then
      r0_17.CurRoleContent.Widget:SetIsSelected(false)
    end
  end
  r3_0:SetItemIsSelected(r1_17, true)
  r1_17.IsSelect = true
  if r1_17.Widget and r1_17.Widget.SetIsSelected then
    r1_17.Widget:SetIsSelected(true)
  end
  r0_17.CurRoleContent = r1_17
  r0_17:UpdatePreviewSkinActorForContent(r1_17)
  r0_17:RefreshDetailPanel()
end
function r0_0.UpdatePreviewSkinActorForContent(r0_18, r1_18)
  -- line: [540, 559] id: 18
  local r2_18 = GWorld:GetAvatar()
  local r3_18 = r2_18.Chars[r1_18.Uuid]
  local r4_18 = nil
  if r3_18 then
    r4_18 = r3_18.CharId and r1_18.CharId and r1_18.UnitId
    r4_0:GetModelData("BagActorController"):ChangeCharModel(r3_18)
  elseif r1_18.Target then
    if r1_18.Avatar then
      r4_0:GetModelData("BagActorController"):SetAvatar(r1_18.Avatar)
    end
    r4_0:GetModelData("BagActorController"):ChangeCharModel(r1_18.Target)
    if r1_18.Target then
      r4_18 = r1_18.Target.CharId and r1_18.CharId and r1_18.UnitId
    else
      goto label_51	-- block#10 is visited secondly
    end
    r4_0:GetModelData("BagActorController"):SetAvatar(r2_18)
  end
  if r4_18 then
    r0_18:ApplyCurrentSkinAppearance(r4_18)
  end
  r0_18:EnterSkinCameraAnimation()
end
function r0_0.Close(r0_19)
  -- line: [561, 569] id: 19
  r0_0.Super.Close(r0_19)
  DebugPrint("gmy@@@WBP_CharSkinPreview_C M:Close111")
  if r0_19.BehaviorType == r0_0.PreviewBehaviorType.BattlePassPreview then
    EventManager:FireEvent(EventID.BattlePassSkinClose)
  end
end
function r0_0.Destruct(r0_20, ...)
  -- line: [571, 600] id: 20
  if IsValid(r0_20.GameInputModeSubsystem) then
    r0_20.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_20, r0_20.OnUpdateUIStyleByInputTypeChange)
  end
  if UIManager(r0_20):GetUI("BattlePassMain") and r0_20.BehaviorType == r0_0.PreviewBehaviorType.BattlePassPreview and r0_20.InitSkinId and r4_0:GetModelData("BagActorController") then
    local r2_20 = DataMgr.Skin[r0_20.InitSkinId]
    local r3_20 = GWorld:GetAvatar()
    local r4_20 = nil
    for r9_20, r10_20 in pairs(r3_20.Chars) do
      if r10_20.CharId == r2_20.CharId then
        r4_20 = r10_20
        break
      end
    end
    -- close: r5_20
    if r4_20 then
      r4_0:GetModelData("BagActorController"):ChangeCharModel(r4_20)
      r4_0:GetModelData("BagActorController"):ChangeCharAppearance({
        CharId = r2_20.CharId,
        SkinId = r0_20.InitSkinId,
        AccessorySuit = {},
      })
    end
  end
  r0_0.Super.Destruct(r0_20, ...)
  r4_0:GetModel():RemoveModelDataRefCount("BagActorController", function(r0_21)
    -- line: [595, 599] id: 21
    if not r0_21 or not IsValid(r0_21) then
      return 
    end
    r0_21:OnClosed()
    r0_21:OnDestruct()
  end)
end
function r0_0.InitTabInfo(r0_22)
  -- line: [602, 636] id: 22
  r0_22.MainTabsStyle = {
    TitleName = GText("UI_Armory_Appearance"),
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = {},
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    BottomKeyInfo = {},
    StyleName = "Text",
    OwnerPanel = r0_22,
    LastFocusWidget = r0_22,
    BackCallback = r0_22.ExitSkin,
  }
  r0_22.BackKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = r0_22.ExitSkin,
        Owner = r0_22,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = r0_22.ExitSkin,
        Owner = r0_22,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r0_22.Tab_SkinPreview:Init(r0_22.MainTabsStyle)
end
function r0_0.ExitSkin(r0_23)
  -- line: [638, 641] id: 23
  r0_23:BindToAnimationFinished(r0_23.Out, {
    r0_23,
    r0_23.Close
  })
  r0_23:PlayAnimation(r0_23.Out)
end
function r0_0.UpdatePreviewSkinActor(r0_24)
  -- line: [644, 667] id: 24
  local r1_24 = GWorld:GetAvatar()
  local r2_24 = r1_24.CurrentChar
  if r0_24.CurRoleContent and r0_24.CurRoleContent.Uuid then
    r2_24 = r0_24.CurRoleContent.Uuid
  end
  local r3_24 = r1_24.Chars[r2_24]
  local r4_24 = nil
  if r3_24 then
    r4_24 = r3_24.CharId
    r4_0:GetModelData("BagActorController"):ChangeCharModel(r3_24)
  elseif r0_24.CurRoleContent and r0_24.CurRoleContent.Target then
    if r0_24.CurRoleContent.Avatar then
      r4_0:GetModelData("BagActorController"):SetAvatar(r0_24.CurRoleContent.Avatar)
    end
    r4_0:GetModelData("BagActorController"):ChangeCharModel(r0_24.CurRoleContent.Target)
    if r0_24.CurRoleContent.Target then
      r4_24 = r0_24.CurRoleContent.Target.CharId and r0_24.CurRoleContent.CharId and r0_24.CurRoleContent.UnitId
    else
      goto label_63	-- block#11 is visited secondly
    end
    r4_0:GetModelData("BagActorController"):SetAvatar(r1_24)
  end
  if r4_24 then
    r0_24:ApplyCurrentSkinAppearance(r4_24)
  end
  r0_24:EnterSkinCameraAnimation()
end
function r0_0.EnterSkinCameraAnimation(r0_25)
  -- line: [669, 671] id: 25
  r4_0:GetModelData("BagActorController"):SetMontageAndCamera(CommonConst.ArmoryType.Char)
end
function r0_0.GetPreviewSkinIdForChar(r0_26, r1_26)
  -- line: [674, 687] id: 26
  if not r1_26 then
    return nil
  end
  local r2_26 = nil
  if r0_26.CharId2SkinId then
    r2_26 = r0_26.CharId2SkinId[r1_26]
  end
  if not r2_26 and r0_26.InitSkinId then
    local r3_26 = DataMgr.Skin[r0_26.InitSkinId]
    if r3_26 and r3_26.CharId == r1_26 then
      r2_26 = r0_26.InitSkinId
    end
  end
  return r2_26
end
function r0_0.ApplyCurrentSkinAppearance(r0_27, r1_27)
  -- line: [690, 696] id: 27
  if not r4_0:GetModelData("BagActorController") or not r1_27 then
    return 
  end
  local r2_27 = r0_27:GetPreviewSkinIdForChar(r1_27)
  if not r2_27 then
    return 
  end
  r4_0:GetModelData("BagActorController"):ChangeCharAppearance({
    CharId = r1_27,
    SkinId = r2_27,
    AccessorySuit = {},
  })
end
function r0_0.InitInputSettings(r0_28)
  -- line: [699, 721] id: 28
  r0_28.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_28, 0))
  if IsValid(r0_28.GameInputModeSubsystem) then
    r0_28.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_28, r0_28.OnUpdateUIStyleByInputTypeChange)
    r0_28.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_28, r0_28.OnUpdateUIStyleByInputTypeChange)
  end
  r0_28:OnUpdateUIStyleByInputTypeChange(r0_28.GameInputModeSubsystem:GetCurrentInputType(), r0_28.GameInputModeSubsystem:GetCurrentGamepadName())
  r0_28.Image_Click.OnMouseButtonDownEvent:Unbind()
  r0_28.Image_Click.OnMouseButtonDownEvent:Bind(r0_28, r0_28.On_Image_Click_MouseButtonDown)
  r0_28.Key_List_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "View",
      }
    },
    Desc = GText("UI_CTL_ExpandList"),
  })
  if r0_28.Key_Consume_GamePad then
    r0_28.Key_Consume_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
    })
  end
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_29, r1_29, r2_29)
  -- line: [723, 748] id: 29
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnUpdateUIStyleByInputTypeChange", r1_29, r2_29)
  if r1_29 == ECommonInputType.Gamepad then
    r0_29.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    r0_29:FocusFirstForInputMode()
    if r0_29.Key_Consume_GamePad then
      if r0_29.bRoleListOpen then
        r0_29.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      else
        r0_29.Key_Consume_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
    if r0_29.bRoleListOpen then
      r0_29.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r0_29.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    r0_29.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    if r0_29.Key_Consume_GamePad then
      r0_29.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_29.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.FocusFirstForInputMode(r0_30)
  -- line: [751, 787] id: 30
  DebugPrint("gmy@WBP_CharSkinPreview_C M:FocusFirstForInputMode111")
  if r0_30.Params.Type == "SelectWeaponSkin" or r0_30.Params.Type == "SelectSkin" then
    if r0_30:HasAnyFocus() then
      r0_30.List_Skin:SetFocus()
      r0_30.List_Skin:SetSelectedIndex(0)
    end
  elseif r0_30.Params.Type == "SelectWeaponAccessory" or r0_30.Params.Type == "SelectCharAccessory" or r0_30.Params.Type == "SelectGestureItem" then
    if r0_30:HasAnyFocus() then
      r0_30.TileView_Pendant:SetFocus()
      r0_30.TileView_Pendant:SetSelectedIndex(0)
    end
  elseif r0_30.bRoleListOpen then
    local r1_30 = r0_30.CurRoleContent
    if r1_30 then
      r0_30.TileView_Select_Role:BP_SetSelectedItem(r1_30)
      r0_30.TileView_Select_Role:BP_ScrollItemIntoView(r1_30)
    end
    if r0_30:HasAnyFocus() then
      r0_30.TileView_Select_Role:SetFocus()
    end
  else
    local r1_30 = r0_30.CurRoleContent
    if r1_30 then
      if r0_30.EMListView_Role.BP_SetSelectedItem then
        r0_30.EMListView_Role:BP_SetSelectedItem(r1_30)
      end
      r0_30.EMListView_Role:BP_ScrollItemIntoView(r1_30)
    end
    if r0_30:HasAnyFocus() then
      r0_30.EMListView_Role:SetFocus()
    end
  end
  r0_30.bConsumeFocused = false
end
function r0_0.OnMouseWheel(r0_31, r1_31, r2_31)
  -- line: [790, 792] id: 31
  return r0_31:OnMouseWheelScroll(r1_31, r2_31)
end
function r0_0.On_Image_Click_MouseButtonDown(r0_32, r1_32, r2_32)
  -- line: [795, 803] id: 32
  DebugPrint("gmy@WBP_CharSkinPreview_C M:On_Image_Click_MouseButtonDown")
  if r0_32.bRoleListOpen then
    r0_32:CloseRoleListPanel()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return r0_32:OnPointerDown(r1_32, r2_32)
end
function r0_0.OnMouseButtonUp(r0_33, r1_33, r2_33)
  -- line: [805, 807] id: 33
  return r0_33:OnPointerUp(r1_33, r2_33)
end
function r0_0.OnMouseMove(r0_34, r1_34, r2_34)
  -- line: [809, 811] id: 34
  return r0_34:OnPointerMove(r1_34, r2_34)
end
function r0_0.OnTouchEnded(r0_35, r1_35, r2_35)
  -- line: [813, 815] id: 35
  return r0_35:OnPointerUp(r1_35, r2_35)
end
function r0_0.OnTouchMoved(r0_36, r1_36, r2_36)
  -- line: [817, 819] id: 36
  return r0_36:OnPointerMove(r1_36, r2_36)
end
function r0_0.OnMouseCaptureLost(r0_37)
  -- line: [821, 823] id: 37
  r0_37:OnPointerCaptureLost()
end
function r0_0.OnKeyDown(r0_38, r1_38, r2_38)
  -- line: [825, 875] id: 38
  local r4_38 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_38))
  if r0_38.bConsumeFocused and r0_38.Item_Consume and (r4_38 == "Escape" or r4_38 == r0_38.EscapeKey or r4_38 == r0_38.GamePadBackKey or r4_38 == Const.GamepadFaceButtonRight) then
    if r0_38.bRoleListOpen and r0_38.TileView_Select_Role then
      r0_38.TileView_Select_Role:SetFocus()
    elseif r0_38.EMListView_Role then
      r0_38.EMListView_Role:SetFocus()
    end
    r0_38.bConsumeFocused = false
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if r0_38.KeyDownEvents and r0_38.KeyDownEvents[r4_38] then
    local r5_38 = r0_38.KeyDownEvents[r4_38]
    if r5_38 then
      r5_38(r0_38)
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnKeyDown", r4_38)
  if r4_38 == "Escape" or r4_38 == Const.GamepadFaceButtonRight then
    if r0_38.bRoleListOpen then
      r0_38:CloseRoleListPanel()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    r0_38:ExitSkin()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if r4_38 == Const.GamepadFaceButtonBottom and r0_38.Btn_Confirm.IsEnabled ~= false then
    r0_38:OnConfirmClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if r4_38 == Const.GamepadFaceButtonTop then
    r0_38:ToggleRoleListPanel()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if r4_38 == Const.GamepadRightTrigger then
    r0_38:OnTabChangeClicked(2)
    return UE4.UWidgetBlueprintLibrary.Handled()
  elseif r4_38 == Const.GamepadLeftTrigger then
    r0_38:OnTabChangeClicked(1)
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r0_0.OnRepeatKeyDown(r0_39, r1_39, r2_39)
  -- line: [879, 885] id: 39
  local r4_39 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_39))
  local r5_39 = r0_39.RepeatKeyDownEvents and r0_39.RepeatKeyDownEvents[r4_39]
  if r5_39 then
    r5_39(r0_39)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r0_0.InitKeySetting(r0_40)
  -- line: [887, 920] id: 40
  r0_40.KeyDownEvents[r0_40.EscapeKey] = r0_40.OnBackKeyDown
  r0_40.KeyDownEvents[r0_40.GamePadBackKey] = r0_40.OnBackKeyDown
  r0_40.KeyDownEvents[r0_40.GamePadHideUIKey] = r0_40.OnHideUIKeyDown
  r0_40.KeyDownEvents[r0_40.GamePadConfirmKey] = r0_40.OnConfirmKeyDown
  r0_40.KeyDownEvents.U = r0_40.OnHideUIKeyDown
  r0_40.KeyDownEvents[Const.GamepadSpecialLeft] = function(r0_41)
    -- line: [894, 894] id: 41
    r0_41:ToggleRoleListPanel()
  end
  r0_40.KeyDownEvents[Const.GamepadLeftThumbstick] = function(r0_42)
    -- line: [896, 914] id: 42
    if r0_42.bRoleListOpen then
      if r0_42.Key_Consume_GamePad then
        r0_42.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
      r0_42.bConsumeFocused = false
    else
      r0_42.Item_Consume:SetFocus()
      r0_42.bConsumeFocused = true
      if r0_42.Key_Consume_GamePad then
        if r0_42:IsGamepadInput() then
          r0_42.Key_Consume_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        else
          r0_42.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
        end
      end
    end
  end
  r0_40.RepeatKeyDownEvents[r0_40.LeftTriggerKey] = r0_40.OnCameraScrollBackwardKeyDown
  r0_40.RepeatKeyDownEvents[r0_40.RightTriggerKey] = r0_40.OnCameraScrollForwardKeyDown
  r0_40:BuildBottomKeyInfo()
end
function r0_0.BuildBottomKeyInfo(r0_43)
  -- line: [922, 987] id: 43
  r0_43.ESCKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(r0_43.EscapeKey),
        ClickCallback = r0_43.OnBackKeyDown,
        Owner = r0_43,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = r0_43.OnBackKeyDown,
        Owner = r0_43,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r0_43.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = r0_43.OnHideUIKeyDown,
        Owner = r0_43,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
    Desc = GText("UI_Dye_HideUI"),
  }
  local r1_43 = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(r0_43.ZoomKey),
        Owner = r0_43,
      }
    },
  }
  local r2_43 = {
    {
      Type = "Or",
    }
  }
  r1_43.GamePadInfoList = r2_43
  r1_43.Desc = GText("UI_Dye_Zoom")
  r1_43.bLongPress = false
  r0_43.ZoomKeyInfoList = r1_43
  r0_43.RightThumbstickAnalogBottomKeyInfoList = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RH",
      }
    },
    Desc = GText("UI_CTL_RotatePreview"),
  }
  r0_43.BottomKeyInfo = {}
  table.insert(r0_43.BottomKeyInfo, r0_43.HideUI_KeyInfoList)
  table.insert(r0_43.BottomKeyInfo, r0_43.ZoomKeyInfoList)
  table.insert(r0_43.BottomKeyInfo, r0_43.RightThumbstickAnalogBottomKeyInfoList)
  table.insert(r0_43.BottomKeyInfo, r0_43.ESCKeyInfoList)
  if r0_43.Tab_SkinPreview and r0_43.Tab_SkinPreview.UpdateBottomKeyInfo then
    r0_43.Tab_SkinPreview:UpdateBottomKeyInfo(r0_43.BottomKeyInfo)
  end
end
function r0_0.OnBackKeyDown(r0_44)
  -- line: [990, 998] id: 44
  if r0_44.bSelfHidden then
    r0_44:OnHideUIKeyDown()
  elseif r0_44.bRoleListOpen then
    r0_44:CloseRoleListPanel()
  else
    r0_44:ExitSkin()
  end
end
function r0_0.OnConfirmKeyDown(r0_45)
  -- line: [1001, 1005] id: 45
  if r0_45.Btn_Confirm.IsEnabled ~= false then
    r0_45:OnConfirmClicked()
  end
end
function r0_0.OnGamepadConfirmKeyDonw(r0_46, r1_46)
  -- line: [1007, 1013] id: 46
  if r0_46:IsGamepadInput() then
    r0_46:OnConfirmKeyDown()
  else
    r0_46:OnSkinItemClicked(r1_46)
  end
end
function r0_0.OnHideUIKeyDown(r0_47)
  -- line: [1016, 1033] id: 47
  r0_47.bSelfHidden = not r0_47.bSelfHidden
  if r0_47.bSelfHidden then
    r0_47:SetRenderOpacity(0)
    if r0_47.Image_Click and r0_47.Image_Click.Slot then
      r0_47.Image_Click.Slot:SetZOrder(10)
    end
    r0_47.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
  else
    r0_47:SetRenderOpacity(1)
    if r0_47.Image_Click and r0_47.Image_Click.Slot then
      r0_47.Image_Click.Slot:SetZOrder(-1)
    end
    r0_47.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
  end
end
function r0_0.OnCameraScrollBackwardKeyDown(r0_48)
  -- line: [1036, 1040] id: 48
  if not r0_48.bSelfHidden then
    r0_48:ScrollCamera(1)
  end
end
function r0_0.OnCameraScrollForwardKeyDown(r0_49)
  -- line: [1041, 1045] id: 49
  if not r0_49.bSelfHidden then
    r0_49:ScrollCamera(-1)
  end
end
function r0_0.InitSelectiveListing(r0_50)
  -- line: [1047, 1112] id: 50
  if r0_50.bSelectiveInited then
    return 
  end
  r0_50.bSelectiveInited = true
  r0_50.TileView_Select_Role.BP_OnItemClicked:Clear()
  r0_50.TileView_Select_Role.BP_OnItemClicked:Add(r0_50, function(r0_51, r1_51)
    -- line: [1052, 1054] id: 51
    r0_51:OnTileRoleItemClicked(r1_51)
  end)
  r0_50.TileView_Select_Role.BP_OnItemSelectionChanged:Clear()
  r0_50.TileView_Select_Role.BP_OnItemSelectionChanged:Add(r0_50, function(r0_52, r1_52, r2_52)
    -- line: [1057, 1061] id: 52
    if r2_52 and r0_52:IsGamepadInput() and r1_52 and r1_52 ~= r0_52.CurRoleContent then
      r0_52:OnRoleListItemClicked(r1_52)
    end
  end)
  r0_50.CharFilterTags, r0_50.CharFilterNames = UIUtils.GetAllElementTypes()
  r0_50.CharFilterIcons = {}
  for r5_50, r6_50 in pairs(r0_50.CharFilterTags) do
    local r7_50 = "Armory_" .. r6_50
    table.insert(r0_50.CharFilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r7_50 .. ".T_" .. r7_50)
  end
  -- close: r1_50
  r0_50.Filters = r0_50:CreateFilters(r0_50.CharFilterTags, r0_50.CharFilterNames, r0_50.CharFilterIcons, r0_50.ExcelWeaponTags)
  r0_50.FilterMod = "Single"
  r0_50.FilterIdxes = {}
  r0_50.SelectedFilterContents = {}
  r0_50.LastSelectedFilterContent = nil
  r0_50.EMListView_Filter.BP_OnItemClicked:Clear()
  r0_50.EMListView_Filter.BP_OnItemClicked:Add(r0_50, r0_50.OnFilterListItemClicked)
  local r1_50 = {
    GText("UI_RARITY_NAME")
  }
  r0_50:BuildFilterContents()
  r0_50:FillSelectiveTileView()
end
function r0_0.BuildFilterContents(r0_53)
  -- line: [1114, 1153] id: 53
  r0_53.EMListView_Filter:ClearListItems()
  r0_53.FilterContents = {}
  r0_53.SelectedFilterContents = {}
  r0_53.FilterContentObj_All = NewObject(UIUtils.GetCommonItemContentClass())
  r0_53.FilterContentObj_All.IsSelect = true
  r0_53.FilterContentObj_All.Index = 0
  r0_53.FilterContentObj_All.Tag = "ALL"
  r0_53.FilterContentObj_All.Text = GText("UI_ALL")
  r0_53.FilterContentObj_All.Icon = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select"
  r0_53.FilterContentObj_All.IsSelected = true
  r0_53.FilterContentObj_All.Owner = r0_53
  r0_53.LastSelectedFilterContent = r0_53.FilterContentObj_All
  table.insert(r0_53.FilterContents, r0_53.FilterContentObj_All)
  r0_53.EMListView_Filter:AddItem(r0_53.FilterContentObj_All)
  for r5_53, r6_53 in ipairs(r0_53.Filters) do
    local r7_53 = NewObject(UIUtils.GetCommonItemContentClass())
    if type(r6_53) == "table" then
      for r12_53, r13_53 in pairs(r6_53) do
        r7_53[r12_53] = r13_53
      end
      -- close: r8_53
    else
      r7_53.Text = r6_53
      r7_53.Tag = r6_53
    end
    r7_53.Index = r5_53
    r7_53.IsSelected = false
    r7_53.Owner = r0_53
    table.insert(r0_53.FilterContents, r7_53)
    r0_53.EMListView_Filter:AddItem(r7_53)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:BuildFilterContents", r7_53.Text, r7_53.Tag)
  end
  -- close: r1_53
  r0_53.CurrentFilterTag = "ALL"
  r0_53.EMListView_Filter:RegenerateAllEntries()
end
function r0_0.OnFilterEntryInitialized(r0_54, r1_54, r2_54)
  -- line: [1156, 1184] id: 54
  if r2_54 and r2_54.SetIsSelected then
    r2_54:SetIsSelected(r1_54.IsSelected == true)
    r1_54.UI = r2_54
  end
end
function r0_0.GetSelectiveSourceContents(r0_55)
  -- line: [1186, 1188] id: 55
  return r0_55.RoleItemContentsArray and {}
end
function r0_0.FillSelectiveTileView(r0_56)
  -- line: [1190, 1228] id: 56
  local r1_56 = r0_56:GetSelectiveSourceContents()
  local r2_56 = r0_56.CurrentFilterTag
  r0_56.TileView_Select_Role:ClearListItems()
  r0_56.SelectiveDisplayedContents = {}
  for r7_56, r8_56 in ipairs(r1_56) do
    local r9_56 = r8_56.CharId
    if not r9_56 then
      r9_56 = r8_56.Char
      if r9_56 then
        r9_56 = r8_56.Char.CharId and r8_56.UnitId
      else
        goto label_23	-- block#4 is visited secondly
      end
    end
    local r10_56 = DataMgr.BattleChar[r9_56].Attribute
    if r2_56 == "ALL" or r10_56 == r2_56 then
      r8_56.OnFocusReceivedEvent = {
        Obj = r0_56,
        Callback = r0_56.OnFocusReceivedEvent,
      }
      table.insert(r0_56.SelectiveDisplayedContents, r8_56)
      r0_56.TileView_Select_Role:AddItem(r8_56)
    end
  end
  -- close: r3_56
  if r0_56.CurRoleContent then
    local r3_56 = false
    for r8_56, r9_56 in ipairs(r0_56.SelectiveDisplayedContents) do
      if r9_56 == r0_56.CurRoleContent then
        r3_56 = true
        break
      end
    end
    -- close: r4_56
    if r3_56 then
      r0_56.TileView_Select_Role:BP_SetSelectedItem(r0_56.CurRoleContent)
      r0_56.TileView_Select_Role:BP_ScrollItemIntoView(r0_56.CurRoleContent)
    else
      local r4_56 = r0_56.SelectiveDisplayedContents[1]
      if r4_56 then
        r0_56:OnRoleListItemClicked(r4_56)
        r0_56.TileView_Select_Role:BP_SetSelectedItem(r4_56)
        r0_56.TileView_Select_Role:BP_ScrollItemIntoView(r4_56)
      end
    end
  end
  r0_56:SetIsEmpty(#r0_56.SelectiveDisplayedContents == 0)
  if #r0_56.SelectiveDisplayedContents == 0 then
    r0_56.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_56.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end
function r0_0.SetIsEmpty(r0_57, r1_57)
  -- line: [1230, 1236] id: 57
  if r1_57 then
    r0_57.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_57.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.OnTileRoleItemClicked(r0_58, r1_58)
  -- line: [1238, 1240] id: 58
  r0_58:OnRoleListItemClicked(r1_58)
end
function r0_0.OnFilterListItemClicked(r0_59, r1_59)
  -- line: [1242, 1264] id: 59
  if r1_59.Tag == r0_59.CurrentFilterTag then
    return 
  end
  local r2_59 = r0_59.EMListView_Filter:GetListItems()
  for r7_59 = 1, r2_59:Length(), 1 do
    local r8_59 = r2_59[r7_59]
    if r8_59.Tag == r0_59.CurrentFilterTag then
      r8_59.IsSelected = false
      if r8_59.UI and r8_59.UI.SetIsSelected then
        r8_59.UI:SetIsSelected(false)
        break
      else
        break
      end
    end
  end
  r0_59.CurrentFilterTag = r1_59.Tag
  r1_59.IsSelected = true
  if r1_59.UI and r1_59.UI.SetIsSelected then
    r1_59.UI:SetIsSelected(true)
  end
  r0_59:FillSelectiveTileView()
end
function r0_0.OnSelectiveSortChanged(r0_60)
  -- line: [1266, 1272] id: 60
end
function r0_0.CreateFilters(r0_61, r1_61, r2_61, r3_61, r4_61)
  -- line: [1274, 1285] id: 61
  local r5_61 = {}
  for r10_61, r11_61 in ipairs(r1_61) do
    local r12_61 = table.insert
    local r13_61 = r5_61
    local r14_61 = {
      Tag = r11_61,
      Text = r2_61[r10_61],
      Icon = r3_61[r10_61],
      bShowRecommend = r4_61 and CommonUtils.HasValue(r4_61, r11_61),
    }
    r12_61(r13_61, r14_61)
  end
  -- close: r6_61
  return r5_61
end
function r0_0.HasSkin(r0_62, r1_62, r2_62)
  -- line: [1288, 1313] id: 62
  if not r1_62 or not r2_62 then
    return false
  end
  local r3_62 = GWorld:GetAvatar()
  if not r3_62 or not r3_62.CommonChars then
    return false
  end
  local r4_62 = r3_62.CommonChars[r1_62]
  local r5_62 = r3_62.OtherCharSkins[r1_62]
  if r4_62 and r4_62.OwnedSkins then
    for r10_62, r11_62 in pairs(r4_62.OwnedSkins) do
      if r10_62 == r2_62 then
        return true
      end
    end
    -- close: r6_62
  end
  if r5_62 then
    for r10_62, r11_62 in pairs(r5_62) do
      if r11_62 == r2_62 then
        return true
      end
    end
    -- close: r6_62
  end
  return false
end
function r0_0.HasWeaponSkin(r0_63, r1_63)
  -- line: [1316, 1324] id: 63
  if not r1_63 then
    return false
  end
  if GWorld:GetAvatar().OwnedWeaponSkins[r1_63] then
    return true
  else
    return false
  end
end
function r0_0.HasAccessory(r0_64, r1_64, r2_64)
  -- line: [1326, 1338] id: 64
  local r3_64 = GWorld:GetAvatar()
  if not r3_64 then
    return false
  end
  local r4_64 = r3_64[r1_64 .. "s"]
  if r4_64 then
    for r9_64, r10_64 in pairs(r4_64) do
      if r10_64 == r2_64 then
        return true
      end
    end
    -- close: r5_64
  end
  return false
end
function r0_0.RefreshDetailPanel(r0_65)
  -- line: [1340, 1438] id: 65
  local r1_65 = r0_65.CurRoleContent
  local r2_65 = r1_65.UnitId
  local r3_65 = r0_65.CharId2SkinId[r2_65] and r0_65.InitSkinId
  DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", r0_65.CurRoleContent, r2_65, r3_65)
  local r4_65 = DataMgr.Skin[r3_65]
  r0_65.Text_CharName:SetText(GText(DataMgr.Char[r2_65].CharName))
  r0_65.Text_SkinName:SetText(GText(r4_65.SkinName))
  local r6_65 = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if r4_65.Rarity and r6_65[r4_65.Rarity] and r0_65[r6_65[r4_65.Rarity]] then
    r0_65.Text_SkinName:SetFont(r0_65[r6_65[r4_65.Rarity]])
  end
  r0_65.Text_SkinName_World:SetText(EnText(r4_65.SkinName))
  r0_65.Text_Info:SetText(GText(r4_65.SkinDescribe))
  r0_65.Tag_Quality:Init(r4_65.Rarity)
  r0_65.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r7_65 = DataMgr.BattleChar[r2_65].Attribute
  if r7_65 then
    local r8_65 = "Armory_" .. r7_65
    r0_65.Icon_Element:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r8_65 .. ".T_" .. r8_65))
    r0_65.Icon_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_65.Icon_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
  DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel IsOwned", r1_65.IsOwned)
  if r1_65.IsOwned then
    r0_65.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_65.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    r0_65.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  local r8_65 = r0_65:HasSkin(r2_65, r3_65)
  local r9_65 = r1_65.IsOwned
  DebugPrint("SkinOwnCheck", r2_65, r3_65, r8_65)
  if r8_65 then
    r0_65.Text_Consume:SetText(GText("UI_Already_Have_Char_Skin"))
  elseif not r9_65 then
    r0_65.Text_Consume:SetText(GText("UI_Skin_Not_Have_Char"))
  else
    r0_65.Text_Consume:SetText(GText("UI_Consume_Select_Skin"))
  end
  if r9_65 and not r8_65 then
    r0_65.Icon_Hint:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_65.Icon_Hint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  r0_65:PlayAnimation(r0_65.Change)
  if r0_65.SkinOptRewardId then
    r0_65.Panel_Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_65.Btn_Confirm:SetVisibility(ESlateVisibility.Visible)
  else
    r0_65.Panel_Consume:SetVisibility(ESlateVisibility.Collapsed)
    r0_65.Btn_Confirm:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  local r10_65 = r4_65 and r4_65.Icon
  if r4_65 then
    local r11_65 = r4_65.Rarity and 0
  else
    goto label_219	-- block#28 is visited secondly
  end
  if r10_65 then
    DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", r3_65)
    local r12_65 = {
      Id = r3_65,
      ItemType = "Skin",
      Rarity = r11_65,
      Icon = r10_65,
      bAsyncLoadIcon = true,
      IsShowDetails = true,
      bDisableCommonClick = true,
      Des = GText("ASJHKAJKADSJFSJKDF"),
    }
    if not r0_65.Item_Consume.Content or r0_65.Item_Consume.Content.Id ~= r3_65 then
      if r0_65.Item_Consume.Init then
        r0_65.Item_Consume:Init(r12_65)
      elseif r0_65.Item_Consume.OnListItemObjectSet then
        r0_65.Item_Consume:OnListItemObjectSet(r12_65)
      end
    elseif r0_65.Item_Consume.SetIcon then
      r0_65.Item_Consume:SetIcon(r10_65)
    end
    r0_65.Item_Consume:SetIsGot(r8_65)
  else
    DebugPrint("WBP_CharSkinPreview_C RefreshDetailPanel 皮肤缺少图标", r3_65)
  end
end
function r0_0.OnConfirmClicked(r0_66)
  -- line: [1442, 1531] id: 66
  local r1_66 = nil
  if r0_66.Params.Type == "SkinSelect" then
    local r2_66 = r0_66.CurRoleContent
    local r3_66 = r2_66.UnitId
    local r4_66 = r0_66.CharId2SkinId[r3_66] and r0_66.InitSkinId
    local r5_66 = r2_66.IsOwned == true
    local r6_66 = r0_66:HasSkin(r3_66, r4_66)
    r1_66 = r1_0
    local r7_66 = GText(DataMgr.Char[r3_66].CharName)
    local r8_66 = GText(DataMgr.Skin[r4_66].SkinName)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:OnConfirmClicked111", r3_66, r4_66, r5_66, r6_66, r1_66)
    local r9_66 = nil
    local r10_66 = nil
    if r6_66 then
      r9_66 = string.format(GText("UI_Consumable_Choose_Confirm_Have_Skin"), r8_66)
      r1_66 = r2_0
      local r11_66 = DataMgr.Skin[r4_66].RegainItemNum
      local r12_66 = DataMgr.Skin[r4_66].RegainItemId
      if r12_66 and r11_66 then
        r10_66 = {
          {
            ItemId = r12_66,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = r11_66,
          }
        }
      end
    elseif r5_66 then
      r9_66 = string.format(GText("UI_Consumable_Choose_Confirm"), r8_66)
    else
      r9_66 = string.format(GText("UI_Skin_CharHasnotGottenReminder"), r7_66, r8_66)
    end
    DebugPrint("WBP_CharSkinPreview_C OnConfirmClicked", r1_66, r3_66, r4_66, r5_66, r6_66, r9_66)
    local r11_66 = {
      CharId = r3_66,
      SkinId = r4_66,
      bHasChar = r5_66,
      bHasSkin = r6_66,
      SkinOptRewardId = r0_66.SkinOptRewardId,
      ResourceId = r0_66.ResourceId,
      Content = r2_66,
    }
    r0_66.SecondConfirmPopup = UIManager(r0_66):ShowCommonPopupUI(r1_66, {
      RightCallbackObj = r0_66,
      RightCallbackFunction = function()
        -- line: [1498, 1503] id: 67
        if r0_66._ApplyingSkin then
          return 
        end
        r0_66._ApplyingSkin = true
        r0_66:DoApplySkinOptReward(r11_66)
        r0_66._ApplyingSkin = nil
      end,
      LeftCallbackObj = r0_66,
      LeftCallbackFunction = function()
        -- line: [1505, 1505] id: 68
      end,
      CloseBtnCallbackObj = r0_66,
      CloseBtnCallbackFunction = function()
        -- line: [1507, 1507] id: 69
      end,
      ShortText = r9_66,
      LongText = r9_66,
      ItemList = r10_66,
    }, r0_66.EMListView_Role)
    -- close: r2_66
  elseif r0_66.Params.Type == "SelectWeaponSkin" then
    r0_66:OnConfirmClicked_WeaponSkin()
    return 
  elseif r0_66.Params.Type == "SelectCharAccessory" or r0_66.Params.Type == "SelectWeaponAccessory" then
    r0_66:OnConfirmClicked_Accessory()
    return 
  elseif r0_66.Params.Type == "SelectSkin" then
    r0_66:OnConfirmClicked_CharSkin()
    return 
  elseif r0_66.Params.Type == "SelectGestureItem" then
    r0_66:OnConfirmClicked_Gesture()
    return 
  end
  if r1_66 == r2_0 then
    r0_66:PopupUIGamepadSetting()
  end
end
function r0_0.OnConfirmClicked_WeaponSkin(r0_70)
  -- line: [1533, 1602] id: 70
  if r0_70.Params.Type == "SelectWeaponSkin" then
    local r1_70 = r0_70.CurRoleContent
    local r2_70 = r1_70.Id
    local r3_70 = r0_70:HasWeaponSkin(r2_70)
    local r4_70 = r1_0
    local r5_70 = GText(DataMgr.WeaponSkin[r2_70].Name)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:OnConfirmClicked111", r2_70, r3_70, r4_70)
    local r6_70 = nil
    local r7_70 = nil
    if r3_70 then
      r6_70 = string.format(GText("UI_Consumable_Choose_Confirm_Have_Skin"), r5_70)
      r4_70 = r2_0
      local r8_70 = DataMgr.WeaponSkin[r2_70].RegainItemNum
      local r9_70 = DataMgr.WeaponSkin[r2_70].RegainItemId
      if r9_70 and r8_70 then
        r7_70 = {
          {
            ItemId = r9_70,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = r8_70,
          }
        }
      end
    else
      r6_70 = string.format(GText("UI_Skin_CharHasnotGottenReminder"), r5_70, r5_70)
    end
    DebugPrint("WBP_CharSkinPreview_C OnConfirmClicked", r4_70, r2_70, r3_70, r6_70)
    local r8_70 = {
      SkinId = r2_70,
      bHasSkin = r3_70,
      WeaponSkinOptRewardId = r0_70.WeaponSkinOptRewardId,
      ResourceId = r0_70.ResourceId,
      Content = r1_70,
    }
    r0_70.SecondConfirmPopup = UIManager(r0_70):ShowCommonPopupUI(r4_70, {
      RightCallbackObj = r0_70,
      RightCallbackFunction = function()
        -- line: [1581, 1586] id: 71
        if r0_70._ApplyingSkin then
          return 
        end
        r0_70._ApplyingSkin = true
        r0_70:DoApplyWeaponSkinOptReward(r8_70)
        r0_70._ApplyingSkin = nil
      end,
      LeftCallbackObj = r0_70,
      LeftCallbackFunction = function()
        -- line: [1588, 1588] id: 72
      end,
      CloseBtnCallbackObj = r0_70,
      CloseBtnCallbackFunction = function()
        -- line: [1590, 1590] id: 73
      end,
      ShortText = r6_70,
      LongText = r6_70,
      ItemList = r7_70,
    }, r0_70.List_Skin)
    if r4_70 == r2_0 then
      r0_70:PopupUIGamepadSetting()
    end
    -- close: r1_70
  end
end
function r0_0.OnConfirmClicked_CharSkin(r0_74)
  -- line: [1604, 1673] id: 74
  if r0_74.Params.Type == "SelectSkin" then
    local r1_74 = r0_74.CurRoleContent
    local r2_74 = r1_74.SkinId
    local r4_74 = r0_74:HasSkin(r1_74.CharId, r2_74)
    local r5_74 = r1_0
    local r6_74 = GText(DataMgr.Skin[r2_74].SkinName)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:OnConfirmClicked111", r2_74, r4_74, r5_74)
    local r7_74 = nil
    local r8_74 = nil
    if r4_74 then
      r7_74 = string.format(GText("UI_Consumable_Choose_Confirm_Have_Skin"), r6_74)
      r5_74 = r2_0
      local r9_74 = DataMgr.Skin[r2_74].RegainItemNum
      local r10_74 = DataMgr.Skin[r2_74].RegainItemId
      if r10_74 and r9_74 then
        r8_74 = {
          {
            ItemId = r10_74,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = r9_74,
          }
        }
      end
    else
      r7_74 = string.format(GText("UI_Skin_CharHasnotGottenReminder"), r6_74, r6_74)
    end
    DebugPrint("WBP_CharSkinPreview_C OnConfirmClicked", r5_74, r2_74, r4_74, r7_74)
    local r9_74 = {
      SkinId = r2_74,
      bHasSkin = r4_74,
      CharSkinOptRewardId = r0_74.CharSkinOptRewardId,
      ResourceId = r0_74.ResourceId,
      Content = r1_74,
    }
    r0_74.SecondConfirmPopup = UIManager(r0_74):ShowCommonPopupUI(r5_74, {
      RightCallbackObj = r0_74,
      RightCallbackFunction = function()
        -- line: [1652, 1657] id: 75
        if r0_74._ApplyingSkin then
          return 
        end
        r0_74._ApplyingSkin = true
        r0_74:DoApplyCharSkinOptReward(r9_74)
        r0_74._ApplyingSkin = nil
      end,
      LeftCallbackObj = r0_74,
      LeftCallbackFunction = function()
        -- line: [1659, 1659] id: 76
      end,
      CloseBtnCallbackObj = r0_74,
      CloseBtnCallbackFunction = function()
        -- line: [1661, 1661] id: 77
      end,
      ShortText = r7_74,
      LongText = r7_74,
      ItemList = r8_74,
    }, r0_74.List_Skin)
    if r5_74 == r2_0 then
      r0_74:PopupUIGamepadSetting()
    end
    -- close: r1_74
  end
end
function r0_0.OnConfirmClicked_Accessory(r0_78)
  -- line: [1675, 1745] id: 78
  if r0_78.Params.Type == "SelectCharAccessory" or r0_78.Params.Type == "SelectWeaponAccessory" then
    local r1_78 = r0_78.CurRoleContent
    local r2_78 = r1_78.Id
    local r3_78 = r0_78.Params.Type
    if r3_78 == "SelectCharAccessory" then
      r3_78 = "CharAccessory" and "WeaponAccessory"
    else
      goto label_17	-- block#4 is visited secondly
    end
    local r4_78 = r0_78:HasAccessory(r3_78, r2_78)
    local r5_78 = r1_0
    local r6_78 = GText(DataMgr[r3_78][r2_78].Name)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:OnConfirmClicked111", r2_78, r4_78, r5_78)
    local r7_78 = nil
    local r8_78 = nil
    if r4_78 then
      r7_78 = string.format(GText("UI_Consumable_Choose_Confirm_Have_Skin"), r6_78)
      r5_78 = r2_0
      local r9_78 = DataMgr[r3_78][r2_78].RegainItemNum
      local r10_78 = DataMgr[r3_78][r2_78].RegainItemId
      if r10_78 and r9_78 then
        r8_78 = {
          {
            ItemId = r10_78,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = r9_78,
          }
        }
      end
    else
      r7_78 = string.format(GText("UI_Skin_CharHasnotGottenReminder"), r6_78, r6_78)
    end
    DebugPrint("WBP_CharSkinPreview_C OnConfirmClicked", r5_78, r2_78, r4_78, r7_78)
    local r9_78 = {
      SkinId = r2_78,
      bHasSkin = r4_78,
      AccessoryOptRewardId = r0_78.AccessoryOptRewardId,
      ResourceId = r0_78.ResourceId,
      Content = r1_78,
      Type = r3_78,
    }
    r0_78.SecondConfirmPopup = UIManager(r0_78):ShowCommonPopupUI(r5_78, {
      RightCallbackObj = r0_78,
      RightCallbackFunction = function()
        -- line: [1724, 1729] id: 79
        if r0_78._ApplyingSkin then
          return 
        end
        r0_78._ApplyingSkin = true
        r0_78:DoApplyAccessoryOptReward(r9_78)
        r0_78._ApplyingSkin = nil
      end,
      LeftCallbackObj = r0_78,
      LeftCallbackFunction = function()
        -- line: [1731, 1731] id: 80
      end,
      CloseBtnCallbackObj = r0_78,
      CloseBtnCallbackFunction = function()
        -- line: [1733, 1733] id: 81
      end,
      ShortText = r7_78,
      LongText = r7_78,
      ItemList = r8_78,
    }, r0_78.TileView_Pendant)
    if r5_78 == r2_0 then
      r0_78:PopupUIGamepadSetting()
    end
    -- close: r1_78
  end
end
function r0_0.OnConfirmClicked_Gesture(r0_82)
  -- line: [1747, 1823] id: 82
  if r0_82.Params.Type == "SelectGestureItem" then
    local r1_82 = GWorld:GetAvatar()
    if not r1_82 then
      return 
    end
    local r2_82 = r0_82.CurRoleContent
    local r3_82 = r2_82.Id
    local r4_82 = r2_82.ItemType
    local r5_82 = r1_82.Resources[r3_82] and r1_82.Resources[r3_82].Count > 0
    local r6_82 = r1_0
    local r7_82 = GText(r2_82.Name)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:OnConfirmClicked111", r3_82, r5_82, r6_82)
    local r8_82 = nil
    local r9_82 = nil
    if r5_82 then
      r8_82 = string.format(GText("UI_Consumable_Choose_Confirm_Have_Skin"), r7_82)
      r6_82 = r2_0
      local r10_82 = DataMgr[r4_82][r3_82].RegainItemNum
      local r11_82 = DataMgr[r4_82][r3_82].RegainItemId
      if r11_82 and r10_82 then
        r9_82 = {
          {
            ItemId = r11_82,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = r10_82,
          }
        }
      else
        Traceback(ErrorTag, string.format("商品Id %s 不存在，策划还没配重复获取的相关信息，别急", r3_82))
      end
    else
      r8_82 = string.format(GText("UI_Skin_CharHasnotGottenReminder"), r7_82, r7_82)
    end
    DebugPrint("WBP_CharSkinPreview_C OnConfirmClicked", r6_82, r3_82, r5_82, r8_82)
    local r10_82 = {
      SkinId = r3_82,
      bHasSkin = r5_82,
      GeatureOptRewardId = r0_82.GestureOptRewardId,
      ResourceId = r0_82.ResourceId,
      Content = r2_82,
      Type = r4_82,
    }
    r0_82.SecondConfirmPopup = UIManager(r0_82):ShowCommonPopupUI(r6_82, {
      RightCallbackObj = r0_82,
      RightCallbackFunction = function()
        -- line: [1802, 1807] id: 83
        if r0_82._ApplyingSkin then
          return 
        end
        r0_82._ApplyingSkin = true
        r0_82:DoApplyGestureOptReward(r10_82)
        r0_82._ApplyingSkin = nil
      end,
      LeftCallbackObj = r0_82,
      LeftCallbackFunction = function()
        -- line: [1809, 1809] id: 84
      end,
      CloseBtnCallbackObj = r0_82,
      CloseBtnCallbackFunction = function()
        -- line: [1811, 1811] id: 85
      end,
      ShortText = r8_82,
      LongText = r8_82,
      ItemList = r9_82,
    }, r0_82.TileView_Pendant)
    if r6_82 == r2_0 then
      r0_82:PopupUIGamepadSetting()
    end
    -- close: r1_82
  end
end
function r0_0.DoApplySkinOptReward(r0_86, r1_86)
  -- line: [1825, 1885] id: 86
  DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward", r1_86.CharId, r1_86.SkinId, r1_86.SkinOptRewardId, r1_86.bHasSkin)
  local r2_86 = GWorld:GetAvatar()
  if not r2_86 then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward 无法获取 Avatar")
    return 
  end
  local r3_86 = r1_86.ResourceId
  local r4_86 = r1_86.SkinOptRewardId
  local r5_86 = r1_86.SkinId
  local r6_86 = r1_86.bHasSkin
  if not r3_86 or not r4_86 or not r5_86 then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward 参数缺失", r3_86, r4_86, r5_86)
    return 
  end
  local r7_86 = DataMgr.OptReward and DataMgr.OptReward[r4_86]
  if not r7_86 or not r7_86.Id then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward 找不到自选奖励配置", r4_86)
    return 
  end
  local r8_86 = nil
  for r13_86, r14_86 in ipairs(r7_86.Id) do
    if r14_86 == r5_86 then
      r8_86 = r13_86
      break
    end
  end
  -- close: r9_86
  if not r8_86 then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward 未找到对应皮肤索引", r5_86)
    return 
  end
  local r9_86 = {
    r8_86
  }
  DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward 调用RPC UseOptResourceInBag", r3_86, r8_86)
  r2_86:UseOptResourceInBag(r3_86, r9_86, function(r0_87)
    -- line: [1859, 1879] id: 87
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward 回调成功", r0_87, r3_86, r5_86, r8_86, r6_86)
    if r0_87 == ErrorCode.RET_SUCCESS then
      local r1_87 = UIManager(r0_86):GetUIObj("BagMain")
      if r1_87 then
        r1_87:AddTimer(0.3, function()
          -- line: [1865, 1874] id: 88
          if r6_86 then
            UIUtils.ShowGetItemPage(CommonConst.ItemType.Resource, DataMgr.Skin[r5_86].RegainItemId, DataMgr.Skin[r5_86].RegainItemNum, nil, nil, nil, nil, true, true)
          else
            UIUtils.ShowGetItemPage("Skin", r5_86, 1, nil, nil, nil, nil, true, true)
          end
        end)
      end
    end
    r0_86:Close()
  end)
  r0_86:Close()
end
function r0_0.DoApplyWeaponSkinOptReward(r0_89, r1_89)
  -- line: [1887, 1947] id: 89
  DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward", r1_89.SkinId, r1_89.WeaponSkinOptRewardId, r1_89.bHasSkin)
  local r2_89 = GWorld:GetAvatar()
  if not r2_89 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 无法获取 Avatar")
    return 
  end
  local r3_89 = r1_89.ResourceId
  local r4_89 = r1_89.WeaponSkinOptRewardId
  local r5_89 = r1_89.SkinId
  local r6_89 = r1_89.bHasSkin
  if not r3_89 or not r4_89 or not r5_89 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 参数缺失", r3_89, r4_89, r5_89)
    return 
  end
  local r7_89 = DataMgr.OptReward and DataMgr.OptReward[r4_89]
  if not r7_89 or not r7_89.Id then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 找不到自选奖励配置", r4_89)
    return 
  end
  local r8_89 = nil
  for r13_89, r14_89 in ipairs(r7_89.Id) do
    if r14_89 == r5_89 then
      r8_89 = r13_89
      break
    end
  end
  -- close: r9_89
  if not r8_89 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 未找到对应皮肤索引", r5_89)
    return 
  end
  local r9_89 = {
    r8_89
  }
  DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 调用RPC UseOptResourceInBag", r3_89, r8_89)
  r2_89:UseOptResourceInBag(r3_89, r9_89, function(r0_90)
    -- line: [1921, 1941] id: 90
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 回调成功", r0_90, r3_89, r5_89, r8_89, r6_89)
    if r0_90 == ErrorCode.RET_SUCCESS then
      local r1_90 = UIManager(r0_89):GetUIObj("BagMain")
      if r1_90 then
        r1_90:AddTimer(0.3, function()
          -- line: [1927, 1936] id: 91
          if r6_89 then
            UIUtils.ShowGetItemPage(CommonConst.ItemType.Resource, DataMgr.WeaponSkin[r5_89].RegainItemId, DataMgr.WeaponSkin[r5_89].RegainItemNum, nil, nil, nil, nil, true, true)
          else
            UIUtils.ShowGetItemPage("WeaponSkin", r5_89, 1, nil, nil, nil, nil, true, true)
          end
        end)
      end
    end
    r0_89:Close()
  end)
  r0_89:Close()
end
function r0_0.DoApplyCharSkinOptReward(r0_92, r1_92)
  -- line: [1949, 2009] id: 92
  DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward", r1_92.SkinId, r1_92.CharSkinOptRewardId, r1_92.bHasSkin)
  local r2_92 = GWorld:GetAvatar()
  if not r2_92 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 无法获取 Avatar")
    return 
  end
  local r3_92 = r1_92.ResourceId
  local r4_92 = r1_92.CharSkinOptRewardId
  local r5_92 = r1_92.SkinId
  local r6_92 = r1_92.bHasSkin
  if not r3_92 or not r4_92 or not r5_92 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 参数缺失", r3_92, r4_92, r5_92)
    return 
  end
  local r7_92 = DataMgr.OptReward and DataMgr.OptReward[r4_92]
  if not r7_92 or not r7_92.Id then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 找不到自选奖励配置", r4_92)
    return 
  end
  local r8_92 = nil
  for r13_92, r14_92 in ipairs(r7_92.Id) do
    if r14_92 == r5_92 then
      r8_92 = r13_92
      break
    end
  end
  -- close: r9_92
  if not r8_92 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 未找到对应皮肤索引", r5_92)
    return 
  end
  local r9_92 = {
    r8_92
  }
  DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 调用RPC UseOptResourceInBag", r3_92, r8_92)
  r2_92:UseOptResourceInBag(r3_92, r9_92, function(r0_93)
    -- line: [1983, 2003] id: 93
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 回调成功", r0_93, r3_92, r5_92, r8_92, r6_92)
    if r0_93 == ErrorCode.RET_SUCCESS then
      local r1_93 = UIManager(r0_92):GetUIObj("BagMain")
      if r1_93 then
        r1_93:AddTimer(0, function()
          -- line: [1989, 1998] id: 94
          if r6_92 then
            UIUtils.ShowGetItemPage(CommonConst.ItemType.Resource, DataMgr.Skin[r5_92].RegainItemId, DataMgr.Skin[r5_92].RegainItemNum, nil, nil, nil, nil, true, true)
          else
            UIUtils.ShowGetItemPage("Skin", r5_92, 1, nil, nil, nil, nil, true, true)
          end
        end)
      end
    end
    r0_92:Close()
  end)
  r0_92:Close()
end
function r0_0.DoApplyAccessoryOptReward(r0_95, r1_95)
  -- line: [2011, 2072] id: 95
  DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward", r1_95.SkinId, r1_95.AccessoryOptRewardId, r1_95.bHasSkin)
  local r2_95 = GWorld:GetAvatar()
  if not r2_95 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 无法获取 Avatar")
    return 
  end
  local r3_95 = r1_95.ResourceId
  local r4_95 = r1_95.AccessoryOptRewardId
  local r5_95 = r1_95.SkinId
  local r6_95 = r1_95.bHasSkin
  local r7_95 = r1_95.Type
  if not r3_95 or not r4_95 or not r5_95 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 参数缺失", r3_95, r4_95, r5_95)
    return 
  end
  local r8_95 = DataMgr.OptReward and DataMgr.OptReward[r4_95]
  if not r8_95 or not r8_95.Id then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 找不到自选奖励配置", r4_95)
    return 
  end
  local r9_95 = nil
  for r14_95, r15_95 in ipairs(r8_95.Id) do
    if r15_95 == r5_95 then
      r9_95 = r14_95
      break
    end
  end
  -- close: r10_95
  if not r9_95 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 未找到对应皮肤索引", r5_95)
    return 
  end
  local r10_95 = {
    r9_95
  }
  DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 调用RPC UseOptResourceInBag", r3_95, r9_95)
  r2_95:UseOptResourceInBag(r3_95, r10_95, function(r0_96)
    -- line: [2046, 2066] id: 96
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 回调成功", r0_96, r3_95, r5_95, r9_95, r6_95)
    if r0_96 == ErrorCode.RET_SUCCESS then
      local r1_96 = UIManager(r0_95):GetUIObj("BagMain")
      if r1_96 then
        r1_96:AddTimer(0.3, function()
          -- line: [2052, 2061] id: 97
          if r6_95 then
            UIUtils.ShowGetItemPage(CommonConst.ItemType.Resource, DataMgr[r7_95][r5_95].RegainItemId, DataMgr[r7_95][r5_95].RegainItemNum, nil, nil, nil, nil, true, true)
          else
            UIUtils.ShowGetItemPage(r7_95, r5_95, 1, nil, nil, nil, nil, true, true)
          end
        end)
      end
    end
    r0_95:Close()
  end)
  r0_95:Close()
end
function r0_0.DoApplyGestureOptReward(r0_98, r1_98)
  -- line: [2074, 2135] id: 98
  DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward", r1_98.SkinId, r1_98.ResourceId, r1_98.bHasSkin)
  local r2_98 = GWorld:GetAvatar()
  if not r2_98 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 无法获取 Avatar")
    return 
  end
  local r3_98 = r1_98.ResourceId
  local r4_98 = r1_98.SkinId
  local r5_98 = r1_98.bHasSkin
  local r6_98 = r1_98.Type
  local r7_98 = r1_98.GeatureOptRewardId
  if not r3_98 or not r4_98 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 参数缺失", r3_98, r4_98)
    return 
  end
  local r8_98 = DataMgr.OptReward and DataMgr.OptReward[r7_98]
  if not r8_98 or not r8_98.Id then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 找不到自选奖励配置", r7_98)
    return 
  end
  local r9_98 = nil
  for r14_98, r15_98 in ipairs(r8_98.Id) do
    if r15_98 == r4_98 then
      r9_98 = r14_98
      break
    end
  end
  -- close: r10_98
  if not r9_98 then
    DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 未找到对应皮肤索引", r4_98)
    return 
  end
  local r10_98 = {
    r9_98
  }
  DebugPrint("WBP_CharSkinPreview_C DoApplyAccessoryOptReward 调用RPC UseOptResourceInBag", r3_98, r9_98)
  r2_98:UseOptResourceInBag(r3_98, r10_98, function(r0_99)
    -- line: [2109, 2129] id: 99
    DebugPrint("WBP_CharSkinPreview_C DoApplyWeaponSkinOptReward 回调成功", r0_99, r3_98, r4_98, r9_98, r5_98)
    if r0_99 == ErrorCode.RET_SUCCESS then
      local r1_99 = UIManager(r0_98):GetUIObj("BagMain")
      if r1_99 then
        r1_99:AddTimer(0.3, function()
          -- line: [2115, 2124] id: 100
          if r5_98 then
            UIUtils.ShowGetItemPage(CommonConst.ItemType.Resource, DataMgr[r6_98][r4_98].RegainItemId, DataMgr[r6_98][r4_98].RegainItemNum, nil, nil, nil, nil, true, true)
          else
            UIUtils.ShowGetItemPage(r6_98, r4_98, 1, nil, nil, nil, nil, true, true)
          end
        end)
      end
    end
    r0_98:Close()
  end)
  r0_98:Close()
end
function r0_0.ToggleRoleListPanel(r0_101)
  -- line: [2139, 2145] id: 101
  if r0_101.bRoleListOpen then
    r0_101:CloseRoleListPanel()
  else
    r0_101:OpenRoleListPanel()
  end
end
function r0_0.PlayRoleListAnimation(r0_102)
  -- line: [2149, 2156] id: 102
  DebugPrint("gmy@WBP_CharSkinPreview_C M:PlayRoleListAnimation", r0_102.Change_List)
  r0_102:StopAllAnimations()
  if r0_102.Change_List then
    r0_102:PlayAnimation(r0_102.Change_List)
  end
end
function r0_0.PlayTabAnimation(r0_103)
  -- line: [2159, 2165] id: 103
  DebugPrint("gmy@WBP_CharSkinPreview_C M:PlayTabAnimation", r0_103.Change_Tab)
  r0_103:StopAllAnimations()
  if r0_103.Change_Tab then
    r0_103:PlayAnimation(r0_103.Change_Tab)
  end
end
function r0_0.ResetFilterToDefault(r0_104)
  -- line: [2168, 2224] id: 104
  DebugPrint("gmy@WBP_CharSkinPreview_C M:ResetFilterToDefault", r0_104.CurrentFilterTag)
  if not r0_104.EMListView_Filter or not r0_104.EMListView_Filter.GetListItems then
    r0_104.CurrentFilterTag = "ALL"
    r0_104:FillSelectiveTileView()
    return 
  end
  local r1_104 = r0_104.EMListView_Filter:GetListItems()
  if not r1_104 then
    r0_104.CurrentFilterTag = "ALL"
    r0_104:FillSelectiveTileView()
    return 
  end
  if r0_104.CurrentFilterTag == "ALL" then
    for r6_104 = 1, r1_104:Length(), 1 do
      local r7_104 = r1_104[r6_104]
      if r7_104 and r7_104.Tag == "ALL" then
        r7_104.IsSelected = true
        if r7_104.UI and r7_104.UI.SetIsSelected then
          r7_104.UI:SetIsSelected(true)
          break
        else
          break
        end
      end
    end
    r0_104:FillSelectiveTileView()
    return 
  end
  local r2_104 = r1_104:Length()
  local r3_104 = nil
  for r7_104 = 1, r2_104, 1 do
    local r8_104 = r1_104[r7_104]
    if r8_104 and r8_104.Tag == "ALL" then
      r3_104 = r8_104
      break
    end
  end
  if r3_104 then
    r0_104:OnFilterListItemClicked(r3_104)
  else
    r0_104.CurrentFilterTag = "ALL"
    if r0_104.FilterContentObj_All then
      r0_104.FilterContentObj_All.IsSelected = true
      if r0_104.FilterContentObj_All.UI and r0_104.FilterContentObj_All.UI.SetIsSelected then
        r0_104.FilterContentObj_All.UI:SetIsSelected(true)
      end
    end
    r0_104:FillSelectiveTileView()
  end
end
function r0_0.OpenRoleListPanel(r0_105)
  -- line: [2226, 2243] id: 105
  if r0_105.bRoleListOpen then
    return 
  end
  r0_105.bRoleListOpen = true
  r0_105.CurState = r0_0.State_List
  r0_105:ApplyRoleListVisibility()
  r0_105:ResetFilterToDefault()
  r0_105:PlayRoleListAnimation()
  if r0_105.CurRoleContent then
    r0_105.TileView_Select_Role:BP_SetSelectedItem(r0_105.CurRoleContent)
    r0_105.TileView_Select_Role:BP_ScrollItemIntoView(r0_105.CurRoleContent)
  end
  r0_105.TileView_Select_Role:SetFocus()
  r0_105.bConsumeFocused = false
end
function r0_0.CloseRoleListPanel(r0_106)
  -- line: [2245, 2262] id: 106
  if not r0_106.bRoleListOpen then
    return 
  end
  r0_106.bRoleListOpen = false
  r0_106.CurState = r0_0.State_Tab
  r0_106:ApplyRoleListVisibility()
  r0_106:PlayTabAnimation()
  if r0_106.CurRoleContent then
    if r0_106.EMListView_Role.BP_SetSelectedItem then
      r0_106.EMListView_Role:BP_SetSelectedItem(r0_106.CurRoleContent)
    end
    r0_106.EMListView_Role:BP_ScrollItemIntoView(r0_106.CurRoleContent)
  end
  if r0_106.EMListView_Role then
    r0_106.EMListView_Role:SetFocus()
  end
  r0_106.bConsumeFocused = false
end
function r0_0.ApplyRoleListVisibility(r0_107)
  -- line: [2264, 2308] id: 107
  DebugPrint("gmy@WBP_CharSkinPreview_C M:ApplyRoleListVisibility", r0_107.bRoleListOpen)
  local r1_107 = r0_107.bRoleListOpen
  local r2_107 = ESlateVisibility.SelfHitTestInvisible
  local r3_107 = ESlateVisibility.Collapsed
  local r4_107 = r0_107.Panel_List
  local r6_107 = nil	-- notice: implicit variable refs by block#[3, 6, 9, 12, 15, 18]
  if r1_107 then
    r6_107 = r2_107
    if r6_107 then
      ::label_15::
      r6_107 = r3_107
    end
  else
    goto label_15	-- block#2 is visited secondly
  end
  r4_107:SetVisibility(r6_107)
  r4_107 = r0_107.Panel_List_L
  if r1_107 then
    r6_107 = r2_107
    if r6_107 then
      ::label_23::
      r6_107 = r3_107
    end
  else
    goto label_23	-- block#5 is visited secondly
  end
  r4_107:SetVisibility(r6_107)
  r4_107 = r0_107.WS_List
  if r1_107 then
    r6_107 = 0
    if not r6_107 then
      ::label_32::
      r6_107 = 1
    end
  else
    goto label_32	-- block#8 is visited secondly
  end
  r4_107:SetActiveWidgetIndex(r6_107)
  r4_107 = r0_107.EMListView_Filter
  if r1_107 then
    r6_107 = r2_107
    if r6_107 then
      ::label_40::
      r6_107 = r3_107
    end
  else
    goto label_40	-- block#11 is visited secondly
  end
  r4_107:SetVisibility(r6_107)
  r4_107 = r0_107.TileView_Select_Role
  if r1_107 then
    r6_107 = r2_107
    if r6_107 then
      ::label_48::
      r6_107 = r3_107
    end
  else
    goto label_48	-- block#14 is visited secondly
  end
  r4_107:SetVisibility(r6_107)
  r4_107 = r0_107.EMListView_Role
  if not r1_107 then
    r6_107 = r2_107
    if r6_107 then
      ::label_56::
      r6_107 = r3_107
    end
  else
    goto label_56	-- block#17 is visited secondly
  end
  r4_107:SetVisibility(r6_107)
  if r0_107.Key_Consume_GamePad then
    if r1_107 then
      r0_107.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    elseif r0_107:IsGamepadInput() then
      r0_107.Key_Consume_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_107.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r1_107 then
    r0_107.Btn_Confirm.IsEnabled = false
  else
    r0_107.Btn_Confirm.IsEnabled = true
  end
  if r0_107:IsGamepadInput() then
    if r1_107 then
      r0_107.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r0_107.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    r0_107.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r0_0.OnAnalogValueChanged(r0_108, r1_108, r2_108)
  -- line: [2310, 2319] id: 108
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_108)) == "Gamepad_RightX" and r4_0:GetModelData("BagActorController") then
    r4_0:GetModelData("BagActorController"):OnDragging({
      X = UKismetInputLibrary.GetAnalogValue(r2_108) * 10,
    })
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r0_0.IsGamepadInput(r0_109)
  -- line: [2322, 2324] id: 109
  return r0_109.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
end
function r0_0.PopupUIGamepadSetting(r0_110)
  -- line: [2326, 2365] id: 110
  r0_110.SecondConfirmPopup.OpenTipsButtonIndex = r0_110.SecondConfirmPopup:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.LeftThumb,
      }
    },
    Desc = GText("UI_Controller_CheckDetails"),
  })
  r0_110.SecondConfirmPopup.ConfirmButtonIndex = r0_110.SecondConfirmPopup:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
      }
    },
    Desc = GText("UI_Tips_Ensure"),
  })
  r0_110.SecondConfirmPopup.CancelButtonIndex = r0_110.SecondConfirmPopup:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight,
      }
    },
    Desc = GText("UI_BACK"),
  })
  r0_110.SecondConfirmPopup:HideGamepadShortcut(r0_110.SecondConfirmPopup.ConfirmButtonIndex)
  r0_110.SecondConfirmPopup:HideGamepadShortcut(r0_110.SecondConfirmPopup.CancelButtonIndex)
  local r1_110 = r0_110.SecondConfirmPopup:GetContentWidgetByName("ItemSubsize")
  if r1_110 then
    r1_110.OnContentKeyDown = r0_110.OnContentKeyDown
    local r2_110 = r1_110.Item:GetChildAt(0)
    if r2_110 then
      r2_110:BindEventOnMenuOpenChanged(r0_110, r0_110.ItemMenuAnchorChanged)
    end
  end
end
function r0_0.OnContentKeyDown(r0_111, r1_111, r2_111)
  -- line: [2367, 2393] id: 111
  local r4_111 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_111))
  local r5_111 = false
  local r6_111 = r0_111.Item:GetChildAt(0)
  if r4_111 == UIConst.GamePadKey.LeftThumb and r6_111 then
    r6_111:SetFocus()
    r0_111.Owner.ButtonBar:SetGamepadBtnKeyVisibility(false)
    r0_111.Owner:ShowGamepadShortcut(r0_111.Owner.ConfirmButtonIndex)
    r0_111.Owner:ShowGamepadShortcut(r0_111.Owner.CancelButtonIndex)
    r0_111.Owner:HideGamepadShortcut(r0_111.Owner.OpenTipsButtonIndex)
    r5_111 = true
  elseif r4_111 == UIConst.GamePadKey.FaceButtonRight and r6_111:HasAnyFocus() then
    r0_111.Owner.ButtonBar:SetGamepadBtnKeyVisibility(true)
    r0_111.Owner:HideGamepadShortcut(r0_111.Owner.ConfirmButtonIndex)
    r0_111.Owner:HideGamepadShortcut(r0_111.Owner.CancelButtonIndex)
    r0_111.Owner:ShowGamepadShortcut(r0_111.Owner.OpenTipsButtonIndex)
    r0_111.Owner:SetFocus()
    r5_111 = true
  end
  return r5_111
end
function r0_0.OnFocusReceivedEvent(r0_112)
  -- line: [2395, 2397] id: 112
  r0_112.IsFromListContent = true
end
function r0_0.InitWeaponParams(r0_113)
  -- line: [2400, 2428] id: 113
  r0_113.Switch_Type:SetActiveWidgetIndex(1)
  if r0_113.Params then
    r0_113.BehaviorType = r0_113.Params.Type
    r0_113.WeaponSkinOptRewardId = r0_113.Params.WeaponSkinOptRewardId
    r0_113.ResourceId = r0_113.Params.ResourceId
  end
  if GWorld:GetAvatar() then
    local r2_113 = DataMgr.OptReward[r0_113.WeaponSkinOptRewardId]
    local r4_113 = {
      Type = "Weapon",
      SkinId = r2_113 and r2_113.Id[1],
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      ViewUI = r0_113,
    }
    r4_113.Target = r0_113:CreatePreviewTargetData(r4_113)
    r0_113.ActorController = r0_113:CreatePreviewActor(r4_113)
    r4_0:SetModelData("BagActorController", r0_113.ActorController)
    r4_0:GetModelData("BagActorController"):OnOpened()
    r4_0:GetModel():AddModelDataRefCount("BagActorController")
    r0_113.IsPreviewMode = true
  end
  r0_113:InitWeaponSkinList()
end
function r0_0.InitWeaponSkinList(r0_114)
  -- line: [2430, 2474] id: 114
  r0_114.WeaponSkinContents = {}
  for r6_114, r7_114 in pairs(DataMgr.OptReward[r0_114.WeaponSkinOptRewardId].Id) do
    local r8_114 = DataMgr.WeaponSkin[r7_114]
    if r8_114 then
      local r9_114 = NewObject(UIUtils.GetCommonItemContentClass())
      r9_114.ItemType = CommonConst.DataType.WeaponSkin
      r9_114.Icon = r8_114.Icon and ""
      r9_114.IconPath = r8_114.LongIcon
      r9_114.Id = r8_114.SkinID
      r9_114.SortPriority = r8_114.SortPriority and 0
      r9_114.IsHide = r8_114.IsHide
      r9_114.LockType = false
      r9_114.Rarity = r8_114.Rarity and 0
      r9_114.bSelectTag = false
      r9_114.IsSelect = false
      r9_114.Parent = r0_114
      r9_114.Name = r8_114.Name
      r9_114.Des = r8_114.Dec
      r9_114.ApplicationType = r8_114.ApplicationType
      r9_114.IsOwned = false
      r9_114.Owner = r0_114
      r9_114.IsPreviewMode = false
      r9_114.OnClicked = r0_114.OnGamepadConfirmKeyDonw
      r9_114.IsNew = false
      r9_114.bHasGot = r0_114:HasWeaponSkin(r8_114.SkinID)
      table.insert(r0_114.WeaponSkinContents, r9_114)
    end
  end
  -- close: r2_114
  table.sort(r0_114.WeaponSkinContents, function(r0_115, r1_115)
    -- line: [2463, 2472] id: 115
    local r2_115 = r0_115.bHasGot
    if r2_115 then
      r2_115 = 1 and 0
    else
      goto label_6	-- block#2 is visited secondly
    end
    local r3_115 = r1_115.bHasGot
    if r3_115 then
      r3_115 = 1 and 0
    else
      goto label_13	-- block#5 is visited secondly
    end
    if r2_115 ~= r3_115 then
      return r2_115 < r3_115
    end
    local r4_115 = r0_115.Id and 0
    return r4_115 < (r1_115.Id and 0)
  end)
  r0_114:InitSkinList(r0_114.WeaponSkinContents)
end
function r0_0.InitSkinList(r0_116, r1_116)
  -- line: [2476, 2510] id: 116
  r0_116.FilteredContents = r1_116
  r0_116.List_Skin:ClearListItems()
  r0_116:UpdateAccessoryDetails(r1_116[1])
  r0_116.List_Skin:SetVisibility(UIConst.VisibilityOp.Visible)
  local r2_116 = false
  for r7_116, r8_116 in ipairs(r1_116) do
    if r0_116.JumpToAccessoryId and r0_116.JumpToAccessoryId == r8_116.AccessoryId then
      r0_116.ComparedContent = r8_116
    end
    if r8_116.bSelectTag then
      r0_116.CurrentContent = r8_116
      if r0_116.IsCharacterTrialMode then
        r8_116.TryOutText = GText("UI_CharPreview_Accessory_In_Trial")
      end
    end
    if not r2_116 then
      r8_116.IsSelect = true
      r2_116 = true
    end
    r0_116.List_Skin:AddItem(r8_116)
  end
  -- close: r3_116
  r0_116.List_Skin:RequestFillEmptyContent()
  local r3_116 = r0_116.List_Skin:GetListItems()[1]
  if r3_116 then
    r0_116:OnSkinItemClicked(r3_116)
  end
end
function r0_0.InitCharParams(r0_117)
  -- line: [2514, 2542] id: 117
  r0_117.Switch_Type:SetActiveWidgetIndex(1)
  if r0_117.Params then
    r0_117.BehaviorType = r0_117.Params.Type
    r0_117.CharSkinOptRewardId = r0_117.Params.CharSkinOptRewardId
    r0_117.ResourceId = r0_117.Params.ResourceId
  end
  if GWorld:GetAvatar() then
    local r2_117 = DataMgr.OptReward[r0_117.WeaponSkinOptRewardId]
    local r4_117 = {
      Type = "Char",
      SkinId = r2_117 and r2_117.Id[1],
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      ViewUI = r0_117,
    }
    r4_117.Target = r0_117:CreatePreviewTargetData(r4_117)
    r0_117.ActorController = r0_117:CreatePreviewActor(r4_117)
    r4_0:SetModelData("BagActorController", r0_117.ActorController)
    r4_0:GetModelData("BagActorController"):OnOpened()
    r4_0:GetModel():AddModelDataRefCount("BagActorController")
    r0_117.IsPreviewMode = true
  end
  r0_117:InitCharSkinList()
end
function r0_0.InitCharSkinList(r0_118)
  -- line: [2544, 2587] id: 118
  r0_118.CharSkinContents = {}
  for r6_118, r7_118 in pairs(DataMgr.OptReward[r0_118.CharSkinOptRewardId].Id) do
    local r8_118 = DataMgr.Skin[r7_118]
    if r8_118 then
      local r9_118 = NewObject(UIUtils.GetCommonItemContentClass())
      r9_118.ItemType = CommonConst.DataType.Skin
      r9_118.Icon = r8_118.Icon and ""
      r9_118.IconPath = r8_118.LongIcon
      r9_118.SkinId = r8_118.SkinId
      r9_118.CharId = r8_118.CharId
      r9_118.SortPriority = r8_118.SortPriority and 0
      r9_118.IsHide = r8_118.IsHide
      r9_118.LockType = false
      r9_118.Rarity = r8_118.Rarity and 0
      r9_118.IsSelect = false
      r9_118.Parent = r0_118
      r9_118.Name = r8_118.SkinName
      r9_118.Des = r8_118.SkinDescribe
      r9_118.ApplicationType = r8_118.ApplicationType
      r9_118.Owner = r0_118
      r9_118.OnClicked = r0_118.OnGamepadConfirmKeyDonw
      r9_118.IsPreviewMode = false
      r9_118.IsOwned = false
      r9_118.bHasGot = r0_118:HasSkin(r8_118.CharId, r8_118.SkinId)
      table.insert(r0_118.CharSkinContents, r9_118)
    end
  end
  -- close: r2_118
  table.sort(r0_118.CharSkinContents, function(r0_119, r1_119)
    -- line: [2576, 2585] id: 119
    local r2_119 = r0_119.bHasGot
    if r2_119 then
      r2_119 = 1 and 0
    else
      goto label_6	-- block#2 is visited secondly
    end
    local r3_119 = r1_119.bHasGot
    if r3_119 then
      r3_119 = 1 and 0
    else
      goto label_13	-- block#5 is visited secondly
    end
    if r2_119 ~= r3_119 then
      return r2_119 < r3_119
    end
    local r4_119 = r0_119.Id and 0
    return r4_119 < (r1_119.Id and 0)
  end)
  r0_118:InitSkinList(r0_118.CharSkinContents)
end
function r0_0.InitAccessoryParams(r0_120)
  -- line: [2591, 2630] id: 120
  r0_120.Switch_Type:SetActiveWidgetIndex(2)
  if r0_120.Params then
    r0_120.BehaviorType = r0_120.Params.Type
    r0_120.AccessoryOptRewardId = r0_120.Params.AccessoryOptRewardId
    r0_120.ResourceId = r0_120.Params.ResourceId
  end
  local r1_120 = DataMgr.OptReward[r0_120.Params.AccessoryOptRewardId]
  if r1_120 then
    local r2_120 = r1_120.Type[1]
  end
  r0_120.AccessoryContents = {}
  r0_120.Map_AccessoryContents = {}
  local r3_120 = GWorld:GetAvatar()
  for r8_120, r9_120 in pairs(r1_120.Id) do
    local r10_120 = r0_120:CreateCharAccessoryContent(DataMgr.CharAccessory[r9_120])
    if r10_120 then
      r10_120.SoundDataName = "CharAccessory"
      table.insert(r0_120.AccessoryContents, r10_120)
      r0_120.Map_AccessoryContents[r9_120] = r10_120
    end
  end
  -- close: r4_120
  if GWorld:GetAvatar() then
    if r1_120 then
      local r5_120 = r1_120.Id[1]
    end
    local r6_120 = {
      Type = "Char",
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      ViewUI = r0_120,
    }
    r6_120.Target = r0_120:CreatePreviewTargetData(r6_120)
    r0_120.ActorController = r0_120:CreatePreviewActor(r6_120)
    r4_0:SetModelData("BagActorController", r0_120.ActorController)
    r4_0:GetModelData("BagActorController"):OnOpened()
    r4_0:GetModel():AddModelDataRefCount("BagActorController")
    r0_120.IsPreviewMode = true
  end
  r0_120:InitAccessoryList()
end
function r0_0.CreateCharAccessoryContent(r0_121, r1_121)
  -- line: [2632, 2667] id: 121
  if not GWorld:GetAvatar() then
    return 
  end
  if r1_121.AccessoryType and true then
    local r4_121 = NewObject(UIUtils.GetCommonItemContentClass())
    r4_121.ItemType = CommonConst.DataType.CharAccessory
    r4_121.Icon = r1_121.Icon and ""
    r4_121.Id = r1_121.AccessoryId
    r4_121.AccessoryId = r1_121.AccessoryId
    r4_121.SortPriority = r1_121.SortPriority and 0
    r4_121.IsHide = r1_121.IsHide
    r4_121.LockType = 0
    r4_121.Rarity = r1_121.Rarity and 0
    r4_121.bSelectTag = false
    r4_121.IsSelect = false
    r4_121.AccessoryType = r1_121.AccessoryType
    r4_121.PartName = r1_121.PartName
    r4_121.UnlockOptionText = GText(r1_121.UnlockOption and "")
    r4_121.Parent = r0_121
    r4_121.Name = r1_121.Name
    r4_121.Des = r1_121.Des
    r4_121.ItemName = r0_121:HasAccessory(CommonConst.DataType.CharAccessory, r1_121.AccessoryId) and GText("UI_SHOP_ALREADYOWNED")
    r4_121.OnMouseButtonDownEvent = {
      Obj = r0_121,
      Callback = r0_121.OnGamepadConfirmKeyDonw,
      Params = {
        Content = r4_121,
        bIgnoreRightMouseDown = true,
      },
    }
    return r4_121
  end
end
function r0_0.InitAccessoryList(r0_122)
  -- line: [2669, 2679] id: 122
  local r2_122 = {}
  for r6_122 = 1, #r0_122.AccessoryContents, 1 do
    local r7_122 = r0_122.AccessoryContents[r6_122]
    if r7_122.AccessoryId then
      table.insert(r2_122, r7_122)
    end
  end
  r0_122:InitList(r2_122)
end
function r0_0.InitList(r0_123, r1_123)
  -- line: [2681, 2722] id: 123
  r0_123.FilteredContents = r1_123
  r0_123.TileView_Pendant:ClearListItems()
  table.sort(r1_123, function(r0_124, r1_124)
    -- line: [2686, 2695] id: 124
    local r2_124 = r0_124.ItemName
    if r2_124 then
      r2_124 = r0_124.ItemName
      if r2_124 ~= "" then
        r2_124 = 1 and 0
      end
    else
      goto label_9	-- block#3 is visited secondly
    end
    local r3_124 = r1_124.ItemName
    if r3_124 then
      r3_124 = r1_124.ItemName
      if r3_124 ~= "" then
        r3_124 = 1 and 0
      end
    else
      goto label_19	-- block#7 is visited secondly
    end
    if r2_124 ~= r3_124 then
      return r2_124 < r3_124
    end
    local r4_124 = r0_124.Id and 0
    return r4_124 < (r1_124.Id and 0)
  end)
  r0_123:UpdateAccessoryDetails(r1_123[1])
  r0_123.TileView_Pendant:SetVisibility(UIConst.VisibilityOp.Visible)
  for r6_123, r7_123 in ipairs(r1_123) do
    if r0_123.JumpToAccessoryId and r0_123.JumpToAccessoryId == r7_123.AccessoryId then
      r0_123.ComparedContent = r7_123
    end
    if r7_123.bSelectTag then
      r0_123.CurrentContent = r7_123
      if r0_123.IsCharacterTrialMode then
        r7_123.TryOutText = GText("UI_CharPreview_Accessory_In_Trial")
      end
    end
    r0_123.TileView_Pendant:AddItem(r7_123)
  end
  -- close: r2_123
  r0_123.TileView_Pendant:RequestFillEmptyContent()
  local r2_123 = r0_123.TileView_Pendant:GetListItems()[1]
  if r2_123 then
    r0_123:OnAccessoryItemClicked(r2_123)
  end
end
function r0_0.InitWeaponAccessoryParams(r0_125)
  -- line: [2726, 2766] id: 125
  r0_125.Switch_Type:SetActiveWidgetIndex(2)
  if r0_125.Params then
    r0_125.BehaviorType = r0_125.Params.Type
    r0_125.AccessoryOptRewardId = r0_125.Params.AccessoryOptRewardId
    r0_125.ResourceId = r0_125.Params.ResourceId
  end
  local r1_125 = DataMgr.OptReward[r0_125.Params.AccessoryOptRewardId]
  if r1_125 then
    local r2_125 = r1_125.Type[1]
  end
  r0_125.AccessoryContents = {}
  r0_125.Map_AccessoryContents = {}
  local r3_125 = GWorld:GetAvatar()
  for r8_125, r9_125 in pairs(r1_125.Id) do
    local r10_125 = r0_125:CreateWeaponAccessoryContent(DataMgr.WeaponAccessory[r9_125])
    if r10_125 then
      r10_125.SoundDataName = "WeaponAccessory"
      table.insert(r0_125.AccessoryContents, r10_125)
      r0_125.Map_AccessoryContents[r9_125] = r10_125
    end
  end
  -- close: r4_125
  if GWorld:GetAvatar() then
    if r1_125 then
      local r5_125 = r1_125.Id[1]
    end
    local r6_125 = {
      Type = "Weapon",
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      ViewUI = r0_125,
    }
    r6_125.Target = r0_125:CreatePreviewTargetData(r6_125)
    r0_125.ActorController = r0_125:CreatePreviewActor(r6_125)
    r4_0:SetModelData("BagActorController", r0_125.ActorController)
    r4_0:GetModelData("BagActorController"):OnOpened()
    r4_0:GetModel():AddModelDataRefCount("BagActorController")
    r0_125.IsPreviewMode = true
  end
  r0_125:InitAccessoryList()
end
function r0_0.CreateWeaponAccessoryContent(r0_126, r1_126)
  -- line: [2768, 2803] id: 126
  if not GWorld:GetAvatar() then
    return 
  end
  if r1_126 and true then
    local r4_126 = NewObject(UIUtils.GetCommonItemContentClass())
    r4_126.ItemType = CommonConst.DataType.WeaponAccessory
    r4_126.Icon = r1_126.Icon and ""
    r4_126.Id = r1_126.WeaponAccessoryId
    r4_126.AccessoryId = r1_126.WeaponAccessoryId
    r4_126.SortPriority = r1_126.SortPriority and 0
    r4_126.IsHide = r1_126.IsHide
    r4_126.LockType = 0
    r4_126.Rarity = r1_126.Rarity and 0
    r4_126.bSelectTag = false
    r4_126.IsSelect = false
    r4_126.AccessoryType = "WeaponAccessory"
    r4_126.PartName = r1_126.PartName
    r4_126.UnlockOptionText = GText(r1_126.UnlockOption and "")
    r4_126.Parent = r0_126
    r4_126.Name = r1_126.Name
    r4_126.Des = r1_126.Des
    r4_126.ItemName = r0_126:HasAccessory(CommonConst.DataType.WeaponAccessory, r1_126.WeaponAccessoryId) and GText("UI_SHOP_ALREADYOWNED")
    r4_126.OnMouseButtonDownEvent = {
      Obj = r0_126,
      Callback = r0_126.OnGamepadConfirmKeyDonw,
      Params = {
        Content = r4_126,
        bIgnoreRightMouseDown = true,
      },
    }
    return r4_126
  end
end
function r0_0.InitGestureItemParams(r0_127)
  -- line: [2807, 2846] id: 127
  r0_127.Switch_Type:SetActiveWidgetIndex(2)
  if r0_127.Params then
    r0_127.BehaviorType = r0_127.Params.Type
    r0_127.GestureOptRewardId = r0_127.Params.GestureOptRewardId
    r0_127.ResourceId = r0_127.Params.ResourceId
  end
  local r1_127 = DataMgr.OptReward[r0_127.Params.GestureOptRewardId]
  if r1_127 then
    local r2_127 = r1_127.Type[1]
  end
  r0_127.GestureContents = {}
  r0_127.Map_GestureContents = {}
  local r3_127 = GWorld:GetAvatar()
  for r8_127, r9_127 in pairs(r1_127.Id) do
    local r10_127 = r0_127:CreateGestureContent(DataMgr.Resource[r9_127])
    if r10_127 then
      r10_127.SoundDataName = "WeaponAccessory"
      table.insert(r0_127.GestureContents, r10_127)
      r0_127.Map_GestureContents[r9_127] = r10_127
    end
  end
  -- close: r4_127
  if GWorld:GetAvatar() then
    if r1_127 then
      local r5_127 = r1_127.Id[1]
    end
    local r6_127 = {
      Type = "Char",
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      ViewUI = r0_127,
    }
    r6_127.Target = r0_127:CreatePreviewTargetData(r6_127)
    r0_127.ActorController = r0_127:CreatePreviewActor(r6_127)
    r4_0:SetModelData("BagActorController", r0_127.ActorController)
    r4_0:GetModelData("BagActorController"):OnOpened()
    r4_0:GetModel():AddModelDataRefCount("BagActorController")
    r0_127.IsPreviewMode = true
  end
  r0_127:InitGestureList()
end
function r0_0.CreateGestureContent(r0_128, r1_128)
  -- line: [2848, 2881] id: 128
  -- notice: unreachable block#16
  if r1_128 then
    local r2_128 = true
    local r3_128 = GWorld:GetAvatar()
    if not r3_128 then
      return 
    end
    if r2_128 then
      local r4_128 = NewObject(UIUtils.GetCommonItemContentClass())
      r4_128.Id = r1_128.ResourceId
      r4_128.ItemType = CommonConst.DataType.Resource
      r4_128.Icon = r1_128.Icon and ""
      r4_128.SortPriority = r1_128.SortPriority and 0
      r4_128.IsHide = r1_128.IsHide
      r4_128.LockType = 0
      r4_128.Rarity = r1_128.Rarity and 0
      r4_128.bSelectTag = false
      r4_128.IsSelect = false
      r4_128.AccessoryType = "Gesture"
      r4_128.UnlockOptionText = GText(r1_128.UnlockOption and "")
      r4_128.Parent = r0_128
      r4_128.Name = r1_128.ResourceName
      r4_128.Des = r1_128.DetailDes
      local r5_128 = r3_128.Resources[r1_128.ResourceId]
      if r5_128 then
        r5_128 = r3_128.Resources[r1_128.ResourceId].Count
        if r5_128 > 0 then
          r5_128 = GText("UI_SHOP_ALREADYOWNED")
        else
          r5_128 = false
        end
      end
      r4_128.ItemName = r5_128
      r4_128.OnMouseButtonDownEvent = {
        Obj = r0_128,
        Callback = r0_128.OnGamepadConfirmKeyDonw,
        Params = {
          Content = r4_128,
          bIgnoreRightMouseDown = true,
        },
      }
      return r4_128
    end
  end
end
function r0_0.InitGestureList(r0_129)
  -- line: [2883, 2893] id: 129
  local r2_129 = {}
  for r6_129 = 1, #r0_129.GestureContents, 1 do
    local r7_129 = r0_129.GestureContents[r6_129]
    if r7_129.Id then
      table.insert(r2_129, r7_129)
    end
  end
  r0_129:InitList(r2_129)
end
function r0_0.OnAccessoryItemClicked(r0_130, r1_130)
  -- line: [2897, 2903] id: 130
  if r1_130.AccessoryType == "Gesture" then
    r0_130:TrySelectGestureItem(r1_130)
  else
    r0_130:TrySelectAccessoryItem(r1_130)
  end
end
function r0_0.TrySelectAccessoryItem(r0_131, r1_131)
  -- line: [2905, 2914] id: 131
  if r0_131.ComparedContent == r1_131 or not r1_131.Icon then
    return 
  end
  AudioManager(r0_131):PlayUISound(r0_131, "event:/ui/common/click", nil, nil)
  if r1_131.AccessoryId then
    AudioManager(r0_131):PlayItemSound(r0_131, r1_131.AccessoryId, "Equip", r1_131.SoundDataName)
  end
  r0_131:SelectAccessoryItem(r1_131)
end
function r0_0.SelectAccessoryItem(r0_132, r1_132)
  -- line: [2916, 2940] id: 132
  r3_0:SetItemIsSelected(r0_132.ComparedContent, false)
  r0_132.ComparedContent = r1_132
  r3_0:SetItemIsSelected(r0_132.ComparedContent, true)
  r0_132.CurRoleContent = r1_132
  r0_132:UpdateAccessoryDetails(r1_132)
  if r0_132.Params.Type == "SelectCharAccessory" then
    r0_132:ClearCharAccessoryPreview()
    r0_132.ActorController:DestoryPlayerMeleeWeapon()
    r4_0:GetModelData("BagActorController"):StopPlayerFX()
    r4_0:GetModelData("BagActorController"):StopPlayerMontage()
    r0_132.ActorController:HidePlayerActor("CharSkinPreview", false)
    if UIConst.FXAccessoryTypes[r1_132.AccessoryType] then
      r4_0:GetModelData("BagActorController"):ShowPlayerFXAccessory(r1_132.AccessoryId, r1_132.AccessoryType)
      if UIConst.HidePlayerAccessoryTypes[r1_132.AccessoryType] then
        r0_132.ActorController:HidePlayerActor("CharSkinPreview", true)
      end
    else
      r4_0:GetModelData("BagActorController"):ChangeCharAccessory(r1_132.AccessoryId, r1_132.AccessoryType)
    end
    r0_132.ActorController:SetArmoryCameraTag("Char", r1_132.AccessoryType, "")
  else
    r4_0:GetModelData("BagActorController"):ChangeWeaponAccessory(r1_132.AccessoryId)
  end
end
function r0_0.UpdateAccessoryDetails(r0_133, r1_133)
  -- line: [2942, 2995] id: 133
  if not r1_133 then
    r1_133 = r0_133.TileView_Pendant:GetItemAt(0)
  end
  r0_133.Text_SkinName:SetText(GText(r1_133.Name))
  r0_133:UpdateSkinNameFontByRarity(r1_133.Rarity)
  if r1_133.ItemType == "CharAccessory" then
    r0_133.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap[(DataMgr.CharAccessory[r1_133.AccessoryId] and DataMgr.CharPartMesh[r1_133.AccessoryId]).AccessoryType] and ""))
  else
    local r2_133 = DataMgr.WeaponAccessory[r1_133.AccessoryId]
    r0_133.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap.WeaponAccessory))
  end
  r0_133.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_133.Text_Info:SetText(GText(r1_133.Des))
  r0_133.Tag_Quality:Init(r1_133.Rarity)
  local r2_133 = r3_0:GetCharNoneAccessoryIconPaths()
  local r3_133 = r1_133.AccessoryType
  r2_133 = r2_133[r3_133]
  if r2_133 then
    r3_133 = LoadObject(r2_133)
    r0_133.Icon_Element:SetBrushResourceObject(r3_133)
    r0_133.Icon_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_133.Icon_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r1_133 then
    r3_133 = r1_133.Icon and ""
  else
    goto label_99	-- block#14 is visited secondly
  end
  local r4_133 = nil	-- notice: implicit variable refs by block#[19]
  if r1_133 then
    r4_133 = r1_133.Rarity
    if not r4_133 then
      ::label_105::
      r4_133 = 0
    end
  else
    goto label_105	-- block#17 is visited secondly
  end
  if r3_133 then
    DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", r1_133.Id)
    local r5_133 = {
      Id = r1_133.Id,
      ItemType = "CharAccessory",
      Rarity = r4_133,
      Icon = r3_133,
      bAsyncLoadIcon = true,
      IsShowDetails = true,
      bDisableCommonClick = true,
      Des = GText("ASJHKAJKADSJFSJKDF"),
    }
    if not r0_133.Item_Consume.Content or r0_133.Item_Consume.Content.Id ~= r1_133.Id then
      if r0_133.Item_Consume.Init then
        r0_133.Item_Consume:Init(r5_133)
      elseif r0_133.Item_Consume.OnListItemObjectSet then
        r0_133.Item_Consume:OnListItemObjectSet(r5_133)
      end
    elseif r0_133.Item_Consume.SetIcon then
      r0_133.Item_Consume:SetIcon(r3_133)
    end
  end
end
function r0_0.TrySelectGestureItem(r0_134, r1_134)
  -- line: [2997, 3006] id: 134
  if r0_134.ComparedContent == r1_134 or not r1_134.Icon then
    return 
  end
  AudioManager(r0_134):PlayUISound(r0_134, "event:/ui/common/click", nil, nil)
  if r1_134.Id then
    AudioManager(r0_134):PlayItemSound(r0_134, r1_134.Id, "Equip", r1_134.SoundDataName)
  end
  r0_134:SelectGestureItem(r1_134)
end
function r0_0.SelectGestureItem(r0_135, r1_135)
  -- line: [3008, 3021] id: 135
  r3_0:SetItemIsSelected(r0_135.ComparedContent, false)
  r0_135.ComparedContent = r1_135
  r3_0:SetItemIsSelected(r0_135.ComparedContent, true)
  r0_135.CurRoleContent = r1_135
  local r2_135 = {
    ItemType = r1_135.ItemType,
    TypeId = r1_135.Id,
    SinglePreview = true,
    HidePurchase = true,
  }
  r0_135:UpdateGesturePreview(r1_135)
  r0_135:UpdateGestureDetails(r1_135)
end
function r0_0.UpdateGestureDetails(r0_136, r1_136)
  -- line: [3023, 3071] id: 136
  if not r1_136 then
    r1_136 = r0_136.TileView_Pendant:GetItemAt(0)
  end
  r0_136.Text_SkinName:SetText(GText(r1_136.Name))
  r0_136:UpdateSkinNameFontByRarity(r1_136.Rarity)
  r0_136.Text_CharName:SetText(GText(DataMgr.Resource[r1_136.Id].ResourceName))
  r0_136.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_136.Text_Info:SetText(GText(r1_136.Des))
  r0_136.Tag_Quality:Init(r1_136.Rarity)
  local r3_136 = r3_0:GetCharNoneAccessoryIconPaths()
  local r4_136 = r1_136.AccessoryType
  r3_136 = r3_136[r4_136]
  if r3_136 then
    r4_136 = LoadObject(r3_136)
    r0_136.Icon_Element:SetBrushResourceObject(r4_136)
    r0_136.Icon_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_136.Icon_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r1_136 then
    r4_136 = r1_136.Icon and ""
  else
    goto label_71	-- block#7 is visited secondly
  end
  local r5_136 = nil	-- notice: implicit variable refs by block#[12]
  if r1_136 then
    r5_136 = r1_136.Rarity
    if not r5_136 then
      ::label_77::
      r5_136 = 0
    end
  else
    goto label_77	-- block#10 is visited secondly
  end
  if r4_136 then
    DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", r1_136.Id)
    local r6_136 = {
      Id = r1_136.Id,
      ItemType = "GeatureItem",
      Rarity = r5_136,
      Icon = r4_136,
      bAsyncLoadIcon = true,
      IsShowDetails = true,
      bDisableCommonClick = true,
      Des = GText(""),
    }
    if not r0_136.Item_Consume.Content or r0_136.Item_Consume.Content.Id ~= r1_136.Id then
      if r0_136.Item_Consume.Init then
        r0_136.Item_Consume:Init(r6_136)
      elseif r0_136.Item_Consume.OnListItemObjectSet then
        r0_136.Item_Consume:OnListItemObjectSet(r6_136)
      end
    elseif r0_136.Item_Consume.SetIcon then
      r0_136.Item_Consume:SetIcon(r4_136)
    end
  end
end
function r0_0.UpdateGesturePreview(r0_137, r1_137)
  -- line: [3073, 3096] id: 137
  local r2_137 = DataMgr.Resource[r1_137.Id]
  local r3_137 = GWorld:GetAvatar()
  if not r3_137 then
    return 
  end
  if r2_137 then
    if r2_137.ResourceSType == "GestureItem" then
      r0_137.ActorController:ChangeWeaponModel(r3_137.Weapons[r3_137.MeleeWeapon])
      r0_137.ActorController:ChangeWeaponModel(r3_137.Weapons[r3_137.RangedWeapon])
      r0_137.EffectCreatureHideTags = {}
      if r0_137.ActorController.ArmoryPlayer.EffectCreatureHideTags then
        for r8_137, r9_137 in pairs(r0_137.ActorController.ArmoryPlayer.EffectCreatureHideTags) do
          r0_137.EffectCreatureHideTags[r8_137] = r9_137
          r0_137.ActorController.ArmoryPlayer:HideAllEffectCreature(r8_137, false)
        end
        -- close: r4_137
      end
      r0_137.ActorController:SetArmoryMontageTag(r0_137.ActorController.ArmoryPlayer, "Armory")
      r0_137.ActorController:SetArmoryCameraTag(r2_137.CameraName and "Char", "", "")
      r0_137.ActorController.ArmoryPlayer:InvokeResourceBPFunction(r1_137.Id)
    elseif r2_137.ResourceSType == "MountItem" then
    end
  end
end
function r0_0.OnSkinItemClicked(r0_138, r1_138)
  -- line: [3100, 3102] id: 138
  r0_138:TrySelectSkinItem(r1_138)
end
function r0_0.TrySelectSkinItem(r0_139, r1_139)
  -- line: [3104, 3113] id: 139
  if r0_139.ComparedContent == r1_139 or not r1_139.Icon then
    return 
  end
  AudioManager(r0_139):PlayUISound(r0_139, "event:/ui/common/click", nil, nil)
  if r1_139.AccessoryId then
    AudioManager(r0_139):PlayItemSound(r0_139, r1_139.AccessoryId, "Equip", r1_139.SoundDataName)
  end
  r0_139:SelectSkinItem(r1_139)
end
function r0_0.SelectSkinItem(r0_140, r1_140)
  -- line: [3115, 3145] id: 140
  if not r1_140 then
    return 
  end
  local r2_140 = r0_140.CurRoleContent
  if r2_140 then
    r2_140.IsSelect = false
    if r2_140.Widget then
      r2_140.Widget:SetIsSelected(r2_140.IsSelect)
    end
  end
  r2_140 = r1_140
  if r2_140 then
    r2_140.IsSelect = true
    if r2_140.Widget then
      r2_140.Widget:SetIsSelected(r2_140.IsSelect)
    else
      r0_140:AddTimer(0.01, function()
        -- line: [3130, 3132] id: 141
        r2_140.Widget:SetIsSelected(r2_140.IsSelect)
      end)
    end
  end
  r0_140.ComparedContent = r1_140
  r0_140.CurRoleContent = r1_140
  if r1_140.ItemType == "WeaponSkin" then
    r0_140:UpdatePreviewWeaponSkinActorForContent(r1_140)
    r0_140:UpdateWeaponSkinDetails(r1_140)
  else
    r0_140:UpdatePreviewCharSkinActorForContent(r1_140)
    r0_140:UpdateCharSkinDetails(r1_140)
  end
end
function r0_0.UpdatePreviewWeaponSkinActorForContent(r0_142, r1_142)
  -- line: [3148, 3157] id: 142
  r4_0:GetModelData("BagActorController"):ChangeSingleWeapon(r0_142:CreatePreviewTargetData({
    Type = "Weapon",
    SkinId = r1_142.Id,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    ViewUI = r0_142,
  }))
  r0_142.IsPreviewMode = true
end
function r0_0.UpdatePreviewCharSkinActorForContent(r0_143, r1_143)
  -- line: [3160, 3175] id: 143
  local r2_143 = r0_143:CreatePreviewTargetData({
    Type = "Char",
    SkinId = r1_143.SkinId,
  })
  local r3_143 = {
    CharId = r1_143.CharId,
    SkinId = r1_143.SkinId,
    AccessorySuit = {},
  }
  r4_0:GetModelData("BagActorController").bStandaloneWeapon = false
  r4_0:GetModelData("BagActorController").ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
  r4_0:GetModelData("BagActorController").ExCameraOffset = FVector(0, 0, 0)
  r4_0:GetModelData("BagActorController"):ChangeCharModel(r2_143)
  r4_0:GetModelData("BagActorController").ArmoryHelper:SetPlayer(r4_0:GetModelData("BagActorController").ArmoryPlayer)
  r4_0:GetModelData("BagActorController").DelayFrame = 30
  r4_0:GetModelData("BagActorController"):SetMontageAndCamera("Char", nil, nil)
  r4_0:GetModelData("BagActorController"):ChangeCharAppearance(r3_143)
  r0_143.IsPreviewMode = true
end
function r0_0.UpdateWeaponSkinDetails(r0_144, r1_144)
  -- line: [3177, 3229] id: 144
  if not r1_144 then
    r1_144 = r0_144.List_Skin:GetItemAt(0)
  end
  local r2_144 = DataMgr.WeaponTypeContrast[r1_144.ApplicationType]
  if not r2_144 then
    return 
  end
  r0_144:PlayAnimation(r0_144.Change)
  r0_144.Text_CharName:SetText(string.format(GText("UI_SkinPreview_WeaponType"), GText(r2_144.WeaponTagTextmap)))
  local r3_144 = r2_144.Icon
  if r3_144 then
    r3_144 = LoadObject(r2_144.Icon)
    r0_144.Icon_Element:SetBrushResourceObject(r3_144)
    r0_144.Icon_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_144.Icon_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_144.Text_SkinName:SetText(GText(r1_144.Name))
  r0_144:UpdateSkinNameFontByRarity(r1_144.Rarity)
  r0_144.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_144.Text_Info:SetText(GText(r1_144.Des))
  r0_144.Tag_Quality:Init(r1_144.Rarity)
  if r1_144 then
    r3_144 = r1_144.Icon and ""
  else
    goto label_81	-- block#9 is visited secondly
  end
  local r4_144 = nil	-- notice: implicit variable refs by block#[14]
  if r1_144 then
    r4_144 = r1_144.Rarity
    if not r4_144 then
      ::label_87::
      r4_144 = 0
    end
  else
    goto label_87	-- block#12 is visited secondly
  end
  if r3_144 then
    DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", r1_144.Id)
    local r5_144 = {
      Id = r1_144.Id,
      ItemType = "WeaponSkin",
      Rarity = r4_144,
      Icon = r3_144,
      bAsyncLoadIcon = true,
      IsShowDetails = true,
      bDisableCommonClick = true,
      Des = GText(r1_144.Des),
    }
    if not r0_144.Item_Consume.Content or r0_144.Item_Consume.Content.Id ~= r1_144.Id then
      if r0_144.Item_Consume.Init then
        r0_144.Item_Consume:Init(r5_144)
      elseif r0_144.Item_Consume.OnListItemObjectSet then
        r0_144.Item_Consume:OnListItemObjectSet(r5_144)
      end
    elseif r0_144.Item_Consume.SetIcon then
      r0_144.Item_Consume:SetIcon(r3_144)
    end
  end
end
function r0_0.UpdateCharSkinDetails(r0_145, r1_145)
  -- line: [3231, 3297] id: 145
  local r2_145 = DataMgr.Skin[r1_145.SkinId]
  if not r2_145 then
    return 
  end
  local r3_145 = DataMgr.Char[r1_145.CharId]
  if not r3_145 then
    return 
  end
  r0_145.Text_CharName:SetText(GText(r3_145.CharName))
  r0_145.Text_SkinName:SetText(GText(r2_145.SkinName))
  r0_145:UpdateSkinNameFontByRarity(r2_145.Rarity)
  r0_145.Text_Info:SetText(GText(r2_145.SkinDescribe))
  r0_145.Tag_Quality:Init(r2_145.Rarity)
  r0_145.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r4_145 = DataMgr.BattleChar[r2_145.CharId].Attribute
  if r4_145 then
    local r5_145 = "Armory_" .. r4_145
    r0_145.Icon_Element:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r5_145 .. ".T_" .. r5_145))
    r0_145.Icon_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_145.Icon_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
  local r5_145 = GWorld:GetAvatar()
  if not r5_145 then
    return 
  end
  local r6_145 = r5_145:CheckCharEnough({
    [r2_145.CharId] = 1,
  })
  if r6_145 then
    r0_145.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_145.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    r0_145.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_145 then
    r6_145 = r1_145.Icon and ""
  else
    goto label_112	-- block#14 is visited secondly
  end
  local r7_145 = nil	-- notice: implicit variable refs by block#[19]
  if r1_145 then
    r7_145 = r1_145.Rarity
    if not r7_145 then
      ::label_118::
      r7_145 = 0
    end
  else
    goto label_118	-- block#17 is visited secondly
  end
  if r6_145 then
    local r8_145 = {
      Id = r1_145.SkinId,
      ItemType = "CharSkin",
      Rarity = r7_145,
      Icon = r6_145,
      bAsyncLoadIcon = true,
      IsShowDetails = true,
      bDisableCommonClick = true,
      Des = GText(r1_145.Des),
    }
    if not r0_145.Item_Consume.Content or r0_145.Item_Consume.Content.Id ~= r1_145.Id then
      if r0_145.Item_Consume.Init then
        r0_145.Item_Consume:Init(r8_145)
      elseif r0_145.Item_Consume.OnListItemObjectSet then
        r0_145.Item_Consume:OnListItemObjectSet(r8_145)
      end
    elseif r0_145.Item_Consume.SetIcon then
      r0_145.Item_Consume:SetIcon(r6_145)
    end
  end
end
function r0_0.InitConsumeInfo(r0_146)
  -- line: [3300, 3325] id: 146
  if r0_146.Params.Type == "BattlePassPreview" or r0_146.Params.Type == "ShopRecommend" then
    return 
  end
  r0_146.Switch_Coin:SetActiveWidgetIndex(1)
  r0_146.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_146.WBP_Com_Cost:InitContent({
    ResourceId = r0_146.ResourceId,
    CostText = GText("UI_Armory_Trace_Cost"),
    Numerator = 1,
    Owner = r0_146,
  })
  r0_146.WBP_Com_Cost.Key:SetVisibility(ESlateVisibility.Collapsed)
end
function r0_0.OnTabChangeClicked(r0_147, r1_147)
  -- line: [3328, 3340] id: 147
  if not GWorld:GetAvatar() then
    return 
  end
  if r0_147.SwitchSuitChecked then
    r0_147.CheckBox_Preview:OnBtnClicked()
  elseif r0_147.SwitchWeaponAccessoryPreview then
    r0_147:SwitchWeaponAccessoryPreview(r1_147)
  end
end
function r0_0.UpdateSkinNameFontByRarity(r0_148, r1_148)
  -- line: [3342, 3354] id: 148
  local r3_148 = ({
    [6] = r0_148.Font_Red,
    [5] = r0_148.Font_Gold,
    [4] = r0_148.Font_Purple,
    [3] = r0_148.Font_Blue,
  })[r1_148]
  if r3_148 then
    r0_148.Text_SkinName:SetFont(r3_148)
  end
end
AssembleComponents(r0_0)
return r0_0
