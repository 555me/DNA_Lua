-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\RougeLike\PC\WBP_Rouge_3Choose1_Main_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.Construct(r0_1)
  -- line: [19, 55] id: 1
  r0_1.BtnCD = 0.5
  r0_1.BlessingWidgets = {}
  r0_1.TreasureWidgets = {}
  r0_1.ActivateNeedMap = {}
  for r4_1 = 1, 3, 1 do
    local r6_1 = r0_1[string.format("Item_Blessing0%s", r4_1)]
    local r8_1 = r0_1[string.format("Item_Treasure0%s", r4_1)]
    if r6_1 then
      table.insert(r0_1.BlessingWidgets, r6_1)
    end
    if r8_1 then
      table.insert(r0_1.TreasureWidgets, r8_1)
    end
  end
  local r1_1 = GWorld:GetAvatar()
  local r2_1 = nil	-- notice: implicit variable refs by block#[9]
  if r1_1 then
    r2_1 = r1_1:GetCurrentRougeLikeTokenId()
    if not r2_1 then
      ::label_50::
      r2_1 = 0
    end
  else
    goto label_50	-- block#8 is visited secondly
  end
  r0_1.CoinId = r2_1
  r0_1.Btn_Refresh.Btn_Click.OnClicked:Add(r0_1, r0_1.OnRefreshAward)
  r0_1.Btn_Refresh.Btn_Click.OnHovered:Add(r0_1, r0_1.OnRougeBtnHover)
  r2_1 = LoadObject(DataMgr.Resource[r0_1.CoinId].Icon)
  r0_1.Btn_Refresh.Common_Item_Icon:Init({
    UIName = "Rouge_3Choose1_Main",
    IsShowDetails = true,
    IsCantItemSelection = true,
    Id = r0_1.CoinId,
    Icon = r2_1,
    ItemType = "Resource",
    HandleMouseDown = true,
  })
  r0_1.Btn_SortDesc:AddEventOnCheckStateChanged(r0_1, r0_1.SwitchDesc)
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_1, 0))
end
function r1_0.InitUIInfo(r0_2, r1_2, r2_2, r3_2, ...)
  -- line: [57, 85] id: 2
  local r5_2 = nil	-- notice: implicit variable refs by block#[0]
  local r4_2 = nil	-- notice: implicit variable refs by block#[0]
  r0_2.Super.InitUIInfo(r0_2, r1_2, r2_2, r3_2, ...)
  ... = ... -- error: untaken top expr
  r0_2.IsEventAward = r5_2
  r0_2.AwardList = r4_2
  r0_2:ShowNextAward()
  r0_2:InitResourceBar()
  r0_2:InitRougeBtn()
  r4_2 = r0_2.AwardType
  if r4_2 == "Blessing" then
    r0_2:InitSuitVariables()
    r0_2:SetListView()
    r0_2:UpdateSuitInfo(r0_2.SelectedSuit, r0_2.CurrentListIndex)
  end
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/roguelike/choose_point_hud_show", "Switch3Choose1", nil)
  r0_2:SetFocus()
  r4_2 = UIUtils.UtilsGetCurrentInputType()
  r5_2 = ECommonInputType.Gamepad
  if r4_2 == r5_2 then
    r0_2:InitGamepadView()
  else
    r4_2 = UIUtils.UtilsGetCurrentInputType()
    r5_2 = ECommonInputType.MouseAndKeyboard
    if r4_2 == r5_2 then
      r0_2:InitKeyboardView()
    end
  end
  r0_2:AddTimer(0.05, function()
    -- line: [79, 84] id: 3
    if not r0_2 then
      return 
    end
    if not r0_2.Auto_In then
      return 
    end
    r0_2:StopAllAnimations()
    r0_2:PlayAnimation(r0_2.Auto_In)
  end)
end
function r1_0.InitSuitVariables(r0_4)
  -- line: [87, 118] id: 4
  r0_4.SuitIdToCount = {}
  r0_4.SuitIdToIndex = {}
  r0_4.BlessingGroupData = DataMgr.BlessingGroup
  local r1_4 = 0
  local r2_4 = 1
  local r3_4 = 0
  for r8_4, r9_4 in pairs(r0_4.BlessingGroupData) do
    local r10_4 = GWorld.RougeLikeManager.BlessingGroup:Find(r9_4.GroupId) and 0
    if r3_4 < r10_4 then
      r3_4 = r10_4
      r2_4 = r9_4.GroupId
    end
    r0_4.SuitIdToCount[r9_4.GroupId] = r10_4
    r0_4.SuitIdToIndex[r9_4.GroupId] = r1_4
    for r15_4, r16_4 in ipairs(r9_4.ActivateNeed) do
      if r0_4.ActivateNeedMap[r9_4.GroupId] == nil then
        r0_4.ActivateNeedMap[r9_4.GroupId] = {}
      end
      table.insert(r0_4.ActivateNeedMap[r9_4.GroupId], r16_4 + GWorld.RougeLikeManager.BlessingGroupDiscount)
    end
    -- close: r11_4
    r1_4 = r1_4 + 1
  end
  -- close: r4_4
  r0_4.MaxSuitNum = r1_4
  r0_4.SelectedSuit = r2_4
  r0_4.CurrentListIndex = r0_4.SuitIdToIndex[r0_4.SelectedSuit]
end
function r1_0.InitRougeBtn(r0_5)
  -- line: [120, 184] id: 5
  if r0_5.Btn_Bag then
    r0_5.Btn_Bag.Text_Btn:SetText(GText("UI_RougeLike_Bag"))
    r0_5.Btn_Bag.Btn_Click.OnClicked:Add(r0_5, function()
      -- line: [124, 127] id: 6
      AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/roguelike/btn_black_small_click", nil, nil)
      UIManager(r0_5):LoadUINew("RougeBag")
    end)
    r0_5.Btn_Bag.Btn_Click.OnHovered:Add(r0_5, function()
      -- line: [128, 130] id: 7
      AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/roguelike/btn_black_hover", nil, nil)
    end)
    r0_5.Btn_Bag.Key_Bag:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
        }
      },
    })
  end
  if r0_5.AwardType == "Blessing" then
    r0_5.Btn_Right.Btn.OnClicked:Add(r0_5, r0_5.TabToRight)
    r0_5.Btn_Left.Btn.OnClicked:Add(r0_5, r0_5.TabToLeft)
    if r0_5.Left_GamePad then
      r0_5.Left_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LB",
          }
        },
      })
      r0_5.Right_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RB",
          }
        },
      })
    end
  end
  r0_5.Btn_Confirm.Text_BtnTitle:SetText(GText("UI_RougeLike_BlessingConfirm"))
  r0_5.Btn_Confirm.Btn_Click.OnClicked:Add(r0_5, r0_5.OnConfirmBtnClicked)
  r0_5.Btn_Confirm.Btn_Click.OnHovered:Add(r0_5, r0_5.OnRougeBtnHover)
  r0_5.Btn_Confirm.Panel_Group_Currency:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_5.Btn_Confirm.Group_PriceBG:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_5.Btn_Confirm.Btn_Click:SetIsEnabled(false)
  r0_5.Btn_Confirm:PlayAnimation(r0_5.Btn_Confirm.Forbidden)
  r0_5.Btn_Confirm.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
      }
    },
  })
  r0_5.Btn_GiveUp.Text_Btn:SetText(GText("UI_RougeLike_GiveUpSelect"))
  r0_5.Btn_GiveUp.Btn_Click.OnClicked:Add(r0_5, r0_5.ShowRefundPopupUI)
  r0_5.Btn_GiveUp.Btn_Click.OnHovered:Add(r0_5, r0_5.OnGiveUpBtnHover)
  r0_5.Btn_GiveUp.Key_Gamepad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
  r0_5.Text_SortDesc:SetText(GText("RLBlessing_SimpleDesc_Switch"))
  if r0_5.Key_Gamepad_Desc then
    r0_5.Key_Gamepad_Desc:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "View",
        }
      },
    })
  end
  r0_5.Btn_SortDesc:SetChecked(r0_0:Get("RougeSimpleDesc"), true)
  if r0_5.Key_Tip then
    r0_5.Key_Tip:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
          }
        },
        Desc = GText("UI_CTL_Rougelike_SlideItems"),
      }
    })
  end
  if r0_5.AwardType == "Blessing" and CommonUtils.GetDeviceTypeByPlatformName(r0_5) ~= "Mobile" then
    r0_5.Key_SuitDetail:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
      Desc = GText("UI_CTL_ExplainSet"),
    })
    r0_5.Key_SuitDetail:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_5.UsedSuitDetail = r0_5.Key_Tip
  end
end
function r1_0.ShowTreasureSuitGamePadKey(r0_8)
  -- line: [186, 201] id: 8
  if r0_8.Key_Tip then
    r0_8.Key_Tip:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
          }
        },
        Desc = GText("UI_CTL_ExplainSet"),
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
          }
        },
        Desc = GText("UI_CTL_Rougelike_SlideItems"),
      }
    })
  end
end
function r1_0.HideTreasureSuitGamePadKey(r0_9)
  -- line: [202, 212] id: 9
  if r0_9.Key_Tip then
    r0_9.Key_Tip:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
          }
        },
        Desc = GText("UI_CTL_Rougelike_SlideItems"),
      }
    })
  end
end
function r1_0.InitResourceBar(r0_10)
  -- line: [214, 221] id: 10
  r0_10.Panel_ResourceBar:ClearChildren()
  r0_10.ResourceBarWidget = r0_10:CreateWidgetNew("ResourceBarNode")
  r0_10.Panel_ResourceBar:AddChild(r0_10.ResourceBarWidget)
  r0_10.ResourceBarWidget:InitResourceBar({
    r0_10.CoinId
  })
  r0_10.ResourceBarWidget:SetGamePadKeyImgByPath(UIUtils.UtilsGetKeyIconPathInGamepad("RS", "Generic"))
end
function r1_0.InitRefreshButton(r0_11, r1_11)
  -- line: [223, 257] id: 11
  if r1_11 == "Treasure" then
    r0_11.Btn_Refresh:SetVisibility(ESlateVisibility.Collapsed)
    return 
  else
    r0_11.Btn_Refresh:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if not GWorld.RougeLikeManager then
    return 
  end
  r0_11.Btn_Refresh.Btn_Click:SetForbidden(false)
  r0_11.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_11)
  local r2_11 = GWorld.RougeLikeManager.RefreshTime
  local r3_11 = GWorld.RougeLikeManager.MaxRefreshTime
  r0_11.ResetCost = GWorld.RougeLikeManager.RefreshCost
  local r5_11 = GWorld:GetAvatar().Resources:QueryResourceCount(r0_11.CoinId)
  local r6_11 = nil
  if r5_11 < r0_11.ResetCost then
    r6_11 = "<W>" .. r0_11.ResetCost .. "</>"
    r0_11.Btn_Refresh:PlayAnimation(r0_11.Btn_Refresh.Forbidden)
    r0_11.Btn_Refresh.Btn_Click:SetForbidden(true)
  else
    r6_11 = tostring(r0_11.ResetCost)
  end
  if r3_11 <= r2_11 then
    r0_11.Btn_Refresh:PlayAnimation(r0_11.Btn_Refresh.Forbidden)
    r0_11.Btn_Refresh.Btn_Click:SetForbidden(true)
  end
  r0_11.Btn_Refresh.Text_BtnTitle:SetText(GText("UI_RougeLike_RefreshSelect"))
  r0_11.Btn_Refresh.Text_BtnTimes:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_11.Btn_Refresh.Text_BtnNum_Front:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_11.Btn_Refresh.Text_BtnNum_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_11.Btn_Refresh.Text_BtnTimes:SetText(GText(r3_11 - r2_11 .. "/" .. r3_11))
  r0_11.Btn_Refresh.Text_Reset:SetText(GText(r6_11))
  r0_11.Btn_Refresh.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
end
function r1_0.UpdateSuitInfo(r0_12, r1_12, r2_12)
  -- line: [261, 294] id: 12
  AudioManager(r0_12):PlayUISound(r0_12, "event:/ui/roguelike/choose_point_affix_refresh", nil, nil)
  r0_12:PlayAnimation(r0_12.Switch)
  r0_12.CurrentListIndex = r2_12
  local r3_12 = r0_12.SuitIdToCount[r1_12]
  if r0_12.PreAddSuit and r0_12.PreAddSuit == r1_12 then
    r3_12 = r3_12 + 1
  end
  r0_12.Text_SuitNum:SetText(r3_12)
  r0_12.Text_SuitTitle:SetText(GText(r0_12.BlessingGroupData[r1_12].Name))
  r0_12:SetSuitImage(r1_12, r3_12, r0_12.PreAddSuit)
  r0_12.ScrollBox_Suit:ClearChildren()
  for r7_12 = 1, 4, 1 do
    local r8_12 = UIManager(r0_12):CreateWidget("/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail_SubItem.WBP_Rouge_SuitDetail_SubItem", false)
    local r9_12 = {}
    if r0_12.PreAddSuit and r0_12.PreAddSuit == r1_12 then
      r9_12 = RougeUtils:GenSuitDetail(r1_12, r7_12, true)
    else
      r9_12 = RougeUtils:GenSuitDetail(r1_12, r7_12, false)
    end
    r9_12.Parent = r0_12
    r8_12:InitUIInfo(r9_12)
    r0_12.ScrollBox_Suit:AddChild(r8_12)
  end
  r0_12.List_BottomTab:SetSelectedIndex(r2_12)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_12) == "Mobile" then
    return 
  end
  r0_12:SelectSuitItem(r0_12.CurrentSelectSuitItem)
  r0_12.ScrollBox_Suit:SetScrollOffset(0)
end
function r1_0.SetSuitImage(r0_13, r1_13, r2_13, r3_13)
  -- line: [296, 318] id: 13
  local r4_13 = LoadObject(r0_13.BlessingGroupData[r1_13].BigIcon)
  r0_13.Image_SuitIcon.Image_SuitIcon:SetBrushFromTexture(r4_13)
  local r5_13 = r0_13.Image_SuitIcon.Image_SuitIcon_Color:GetDynamicMaterial()
  if r5_13 then
    r5_13:SetTextureParameterValue("Mask", r4_13)
  end
  if r3_13 and r3_13 == r1_13 then
    r0_13.Text_SuitNum:SetColorAndOpacity(r0_13.CanUnlockNumColor)
  else
    r0_13.Text_SuitNum:SetColorAndOpacity(r0_13.NormalColor)
  end
  for r9_13 = 1, 4, 1 do
    if r2_13 < r0_13.ActivateNeedMap[r1_13][r9_13] then
      r0_13.Image_SuitIcon:PlayAnimation(r0_13.Image_SuitIcon[r9_13 + -1])
      break
    elseif r9_13 == 4 then
      r0_13.Image_SuitIcon:PlayAnimation(r0_13.Image_SuitIcon[r9_13])
    end
  end
end
function r1_0.UpdateAllCompadKeyDefinition(r0_14)
  -- line: [320, 333] id: 14
  r0_14:AddTimer(0.01, function()
    -- line: [321, 332] id: 15
    if not r0_14 then
      return 
    end
    for r3_15 = 1, 3, 1 do
      local r5_15 = r0_14[string.format("Item_Blessing0%s", r3_15)]
      if r5_15 and r5_15 ~= r0_14.CurrentSelectItem then
        r5_15:UpdateCompadKeyDefinition(false)
      elseif r5_15 then
        r5_15:UpdateCompadKeyDefinition(true)
      end
    end
  end)
end
function r1_0.SetListView(r0_16)
  -- line: [335, 356] id: 16
  r0_16.List_BottomTab:ClearListItems()
  local r1_16 = 0
  for r6_16, r7_16 in pairs(r0_16.BlessingGroupData) do
    local r8_16 = NewObject(r0_16.SuitInfoContentClass)
    r8_16.SuitId = r7_16.GroupId
    r8_16.Count = r0_16.SuitIdToCount[r7_16.GroupId]
    r8_16.Index = r1_16
    if r0_16.CurrentListIndex == r8_16.Index then
      r8_16.IsSelected = true
    end
    r8_16.ActivateNeedMap = r0_16.ActivateNeedMap
    if r0_16.PreAddSuit and r0_16.PreAddSuit == r7_16.GroupId then
      r8_16.Count = r8_16.Count + 1
      r8_16.IsPreAdd = true
    end
    r8_16.Parent = r0_16
    r8_16.UseBigFont = false
    r0_16.List_BottomTab:AddItem(r8_16)
    r1_16 = r1_16 + 1
  end
  -- close: r2_16
end
function r1_0.TabToRight(r0_17)
  -- line: [358, 372] id: 17
  if r0_17.AwardType == "Blessing" and r0_17.CurrentListIndex < r0_17.MaxSuitNum + -1 then
    AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/common/click_mid", nil, nil)
    r0_17:UpdateSuitInfo(r0_17.List_BottomTab:GetItemAt(r0_17.CurrentListIndex + 1).SuitId, r0_17.CurrentListIndex + 1)
    if r0_17.bInSuitScroll then
      r0_17:AddTimer(0.1, function()
        -- line: [364, 369] id: 18
        local r0_18 = r0_17.ScrollBox_Suit:GetChildAt(0)
        if r0_18 then
          r0_18:SetFocus()
        end
      end)
    end
  end
end
function r1_0.TabToLeft(r0_19)
  -- line: [374, 388] id: 19
  if r0_19.AwardType == "Blessing" and r0_19.CurrentListIndex > 0 then
    AudioManager(r0_19):PlayUISound(r0_19, "event:/ui/common/click_mid", nil, nil)
    r0_19:UpdateSuitInfo(r0_19.List_BottomTab:GetItemAt(r0_19.CurrentListIndex + -1).SuitId, r0_19.CurrentListIndex + -1)
    if r0_19.bInSuitScroll then
      r0_19:AddTimer(0.1, function()
        -- line: [380, 385] id: 20
        local r0_20 = r0_19.ScrollBox_Suit:GetChildAt(0)
        if r0_20 then
          r0_20:SetFocus()
        end
      end)
    end
  end
end
function r1_0.ShowNextAward(r0_21)
  -- line: [392, 417] id: 21
  r0_21.ItemSelectInfo = r0_21.AwardList[1]
  r0_21.AwardType = r0_21.ItemSelectInfo.Type
  r0_21:InitRefreshButton(r0_21.AwardType)
  local r1_21 = r0_21.ItemSelectInfo.AwardsId
  if r0_21.AwardType == "Blessing" then
    r0_21.Text_Title:SetText(GText("UI_RougeLike_SelectBlessing"))
  elseif r0_21.AwardType == "Treasure" then
    if r0_21:CheckIfSupportAward() then
      r0_21.Text_Title:SetText(GText("UI_MRT_ExtraTreasure"))
    else
      r0_21.Text_Title:SetText(GText("UI_RougeLike_SelectTreasure"))
    end
  end
  for r5_21 = 1, 3, 1 do
    assert(r0_21[r0_21.AwardType .. "Widgets"][r5_21], "没找到AwardWidgets")
    if r1_21[r5_21] then
      r0_21[r0_21.AwardType .. "Widgets"][r5_21]:OnLoaded({
        AwardType = r0_21.AwardType,
        AwardId = r1_21[r5_21].ItemId,
      }, r0_21)
    else
      r0_21[r0_21.AwardType .. "Widgets"][r5_21]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  r0_21:SwitchDesc(r0_21.Btn_SortDesc:GetChecked())
  table.remove(r0_21.AwardList, 1)
end
function r1_0.ChooseItem(r0_22, r1_22)
  -- line: [419, 445] id: 22
  local r2_22 = GWorld:GetAvatar()
  assert(r2_22, "Avatar不存在")
  assert(UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance), "GameMode不存在")
  r0_22.AwardId = r1_22
  GWorld.RougeLikeManager.Last3Choose1AwardId = r1_22
  if r0_22.AwardType == "Blessing" then
    if GWorld.RougeLikeManager.Blessings:FindRef(r1_22) then
      return 
    end
    r2_22:GetBlessing(r1_22, function()
      -- line: [430, 435] id: 23
      r0_22:PlayItemsFadeAnimations(r1_22)
      r0_22.CurrentSelectId = nil
      r0_22.CurrentSelectItem = nil
      r0_22:Close()
    end)
  elseif r0_22.AwardType == "Treasure" then
    if GWorld.RougeLikeManager.Treasures:FindRef(r1_22) then
      return 
    end
    r2_22:GetTreasure(r1_22, function()
      -- line: [440, 443] id: 24
      r0_22:PlayItemsFadeAnimations(r1_22)
      r0_22:Close()
    end)
  end
end
function r1_0.SelectItem(r0_25, r1_25, r2_25)
  -- line: [447, 495] id: 25
  if r0_25.AwardType == "Blessing" then
    local r3_25 = DataMgr.RougeLikeBlessing[r1_25].BlessingGroup
    r0_25.PreAddSuit = r3_25
    local r4_25 = r0_25.SuitIdToIndex[r3_25]
    if not r0_25.CurrentSelectId and r0_25.List_BottomTab:GetItemAt(r4_25) then
      r0_25.List_BottomTab:GetItemAt(r4_25).UI.IsPreAdd = true
      r0_25.List_BottomTab:GetItemAt(r4_25).UI:BP_OnItemSelectionChanged(true)
    else
      local r5_25 = r0_25.SuitIdToIndex[DataMgr.RougeLikeBlessing[r0_25.CurrentSelectId].BlessingGroup]
      if r5_25 ~= r4_25 and r0_25.List_BottomTab:GetItemAt(r5_25) then
        r0_25.List_BottomTab:GetItemAt(r5_25).UI.IsPreAdd = false
        r0_25.List_BottomTab:GetItemAt(r5_25).UI:BP_OnItemSelectionChanged(false)
        r0_25.List_BottomTab:GetItemAt(r4_25).UI.IsPreAdd = true
      end
    end
    r0_25:UpdateSuitInfo(r3_25, r0_25.SuitIdToIndex[r3_25])
    r0_25:UpdateAllCompadKeyDefinition()
  elseif r0_25.AwardType == "Treasure" then
    local r3_25 = UIUtils.GetTreasureGroupNum(r1_25)
    local r4_25 = UIUtils.GetCurrentTreasureGroupNum(r1_25)
    local r5_25 = "<G>" .. tostring(r4_25 + 1) .. "</>" .. "/" .. tostring(r3_25)
    if r3_25 > 0 then
      if r4_25 + 1 == r3_25 then
        r2_25.Rouge_SuitSign:PlayAnimation(r2_25.Rouge_SuitSign.Active)
      end
      r2_25.Rouge_SuitSign.Text_SuitTitle:SetText(r5_25)
      r0_25:ShowTreasureSuitGamePadKey()
    else
      r0_25:HideTreasureSuitGamePadKey()
    end
    if r0_25.CurrentSelectId ~= r1_25 then
      r3_25 = UIUtils.GetTreasureGroupNum(r0_25.CurrentSelectId)
      r4_25 = UIUtils.GetCurrentTreasureGroupNum(r0_25.CurrentSelectId)
      r5_25 = tostring(r4_25) .. "/" .. tostring(r3_25)
      if r3_25 > 0 then
        if r4_25 + 1 == r3_25 then
          r2_25.Rouge_SuitSign:PlayAnimation(r0_25.CurrentSelectItem.Rouge_SuitSign.Normal)
        end
        r0_25.CurrentSelectItem.Rouge_SuitSign.Text_SuitTitle:SetText(r5_25)
      end
    end
  end
  r0_25.Btn_Confirm:PlayAnimation(r0_25.Btn_Confirm.Normal)
  r0_25.Btn_Confirm.Btn_Click:SetIsEnabled(true)
  r0_25.CurrentSelectId = r1_25
  r0_25.CurrentSelectItem = r2_25
  r0_25:PlayItemsUnSelectAnimations(r1_25)
end
function r1_0.OnConfirmBtnClicked(r0_26)
  -- line: [497, 514] id: 26
  DebugPrint("检测到确认按键按下")
  if not r0_26.IsInit then
    DebugPrint("还未初始化完成，不允许选择奖励")
    return 
  end
  if not r0_26.CurrentSelectId then
    return 
  end
  r0_26.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_26)
  if r0_26.ConfirmStartTime and r0_26.CurrentTime - r0_26.ConfirmStartTime < r0_26.BtnCD then
    return 
  end
  r0_26.ConfirmStartTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_26)
  AudioManager(r0_26):PlayUISound(r0_26, "event:/ui/roguelike/choose_point_confirm", nil, nil)
  AudioManager(r0_26):PlayUISound(r0_26, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  r0_26:ChooseItem(r0_26.CurrentSelectId)
end
function r1_0.OnRefreshAward(r0_27)
  -- line: [516, 548] id: 27
  if not r0_27.Btn_Refresh then
    return 
  end
  r0_27.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_27)
  if r0_27.CurrentTime - r0_27.StartTime < r0_27.BtnCD then
    return 
  end
  AudioManager(r0_27):PlayUISound(r0_27, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  local r1_27 = GWorld:GetAvatar()
  if r1_27.Resources:QueryResourceCount(r0_27.CoinId) < r0_27.ResetCost then
    UIManager(GWorld.GameInstance):ShowUITip("CommonToastMain", GText("UI_Rou_Toast_27006"))
    return 
  end
  if GWorld.RougeLikeManager.MaxRefreshTime <= GWorld.RougeLikeManager.RefreshTime then
    UIManager(GWorld.GameInstance):ShowUITip("CommonToastMain", GText("UI_Rou_Toast_27012"))
    return 
  end
  r0_27.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_27)
  if r1_27 then
    r1_27:RefreshAward(r0_27.AwardType, function()
      -- line: [537, 546] id: 28
      r0_27:FillNewAward()
      r0_27:PlayAnimation(r0_27.Refresh)
      r0_27:PlayItemsRefreshAnimations()
      r0_27:AddTimer(r0_27[r0_27.AwardType .. "Widgets"][1].Refresh_Out:GetEndTime(), r0_27.ShowNextAward)
      AudioManager(r0_27):PlayUISound(r0_27, "event:/ui/roguelike/choose_point_refresh", nil, nil)
      r0_27.ResourceBarWidget:UpdateResource()
      r0_27:InitRefreshButton(r0_27.AwardType)
      r0_27:UpdateSuitInfo(r0_27.SelectedSuit, r0_27.CurrentListIndex)
    end)
  end
end
function r1_0.FillNewAward(r0_29)
  -- line: [550, 573] id: 29
  if not GWorld.RougeLikeManager then
    return 
  end
  local r1_29 = {}
  local r2_29 = GWorld.RougeLikeManager["Random" .. r0_29.AwardType .. "s"]
  for r6_29 = 1, r2_29:Length(), 1 do
    table.insert(r1_29, {
      ItemId = r2_29[r6_29],
    })
  end
  if r0_29.AwardType == "Blessing" then
    if r0_29.PreAddSuit then
      local r3_29 = r0_29.SuitIdToIndex[r0_29.PreAddSuit]
      r0_29.List_BottomTab:GetItemAt(r3_29).UI.IsPreAdd = false
      r0_29.List_BottomTab:GetItemAt(r3_29).UI:BP_OnItemSelectionChanged(false)
      r0_29:SetSuitImage(r0_29.PreAddSuit, r3_29)
    end
    r0_29.PreAddSuit = nil
  end
  table.insert(r0_29.AwardList, 1, {
    Type = r0_29.AwardType,
    Event = "3Choose1",
    AwardsId = r1_29,
  })
end
function r1_0.PlayItemsFadeAnimations(r0_30, r1_30)
  -- line: [575, 583] id: 30
  for r5_30 = 1, 3, 1 do
    if r0_30[r0_30.AwardType .. "Widgets"][r5_30].AwardId == r1_30 then
      r0_30[r0_30.AwardType .. "Widgets"][r5_30]:PlayAnimationForward(r0_30[r0_30.AwardType .. "Widgets"][r5_30].Btn_Click)
    else
      r0_30[r0_30.AwardType .. "Widgets"][r5_30]:PlayAnimationForward(r0_30[r0_30.AwardType .. "Widgets"][r5_30].Auto_Out)
    end
  end
end
function r1_0.PlayItemsUnSelectAnimations(r0_31, r1_31)
  -- line: [585, 597] id: 31
  for r5_31 = 1, 3, 1 do
    if r0_31[r0_31.AwardType .. "Widgets"][r5_31].AwardId ~= r1_31 and r0_31[r0_31.AwardType .. "Widgets"][r5_31].IsSelected then
      if r0_31[r0_31.AwardType .. "Widgets"][r5_31]:IsAnimationPlaying(r0_31[r0_31.AwardType .. "Widgets"][r5_31].Click) then
        r0_31[r0_31.AwardType .. "Widgets"][r5_31]:StopAnimation(r0_31[r0_31.AwardType .. "Widgets"][r5_31].Click)
      end
      r0_31[r0_31.AwardType .. "Widgets"][r5_31].IsSelected = false
      r0_31[r0_31.AwardType .. "Widgets"][r5_31]:PlayAnimationForward(r0_31[r0_31.AwardType .. "Widgets"][r5_31].UnSelect)
    end
  end
end
function r1_0.PlayItemsRefreshAnimations(r0_32)
  -- line: [599, 608] id: 32
  for r4_32 = 1, 3, 1 do
    r0_32[r0_32.AwardType .. "Widgets"][r4_32]:PlayAnimationForward(r0_32[r0_32.AwardType .. "Widgets"][r4_32].Refresh_Out)
    r0_32.CurrentSelectId = nil
    r0_32.CurrentSelectItem = nil
  end
  r0_32.Btn_Confirm:PlayAnimation(r0_32.Btn_Confirm.Forbidden)
  r0_32.Btn_Confirm.Btn_Click:SetIsEnabled(false)
end
function r1_0.OnUpdateUIStyleByInputTypeChange(r0_33, r1_33, r2_33)
  -- line: [611, 623] id: 33
  r0_33.Super.OnUpdateUIStyleByInputTypeChange(r0_33, r1_33, r2_33)
  if r1_33 == ECommonInputType.Gamepad then
    r0_33:InitGamepadView()
  else
    r0_33:InitKeyboardView()
  end
  for r6_33 = 1, 4, 1 do
    if r0_33["DetailItem_" .. r6_33] and r0_33["DetailItem_" .. r6_33].OnUpdateUIStyleByInputTypeChange then
      r0_33["DetailItem_" .. r6_33]:OnUpdateUIStyleByInputTypeChange(r1_33, r2_33)
    end
  end
end
function r1_0.OnKeyDown(r0_34, r1_34, r2_34)
  -- line: [625, 688] id: 34
  local r4_34 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_34))
  if r4_34 == Const.GamepadFaceButtonLeft then
    r0_34:ShowRefundPopupUI()
  elseif r4_34 == Const.GamepadFaceButtonUp then
    r0_34:OnRefreshAward()
  elseif r4_34 == Const.GamepadFaceButtonDown then
    r0_34:OnConfirmBtnClicked()
  elseif r4_34 == Const.GamepadLeftTrigger then
    r0_34.IsLeftTriggerDown = true
  elseif r4_34 == Const.GamepadSpecialRight then
    UIManager(r0_34):LoadUINew("RougeBag")
  elseif r4_34 == Const.GamepadSpecialLeft then
    r0_34.Btn_SortDesc:OnBtnClicked()
  elseif r4_34 == Const.GamepadLeftShoulder then
    r0_34:TabToLeft()
  elseif r4_34 == Const.GamepadRightShoulder then
    r0_34:TabToRight()
  elseif r4_34 == Const.GamepadRightThumbstick then
    r0_34.ResourceBarWidget:SetLastFocusWidget(r0_34.CurrentSelectItem.Button_Select and nil)
    r0_34.ResourceBarWidget:SetFocus()
  elseif r4_34 == Const.GamepadLeftThumbstick then
    if r0_34.AwardType == "Blessing" then
      local r5_34 = r0_34.ScrollBox_Suit:GetChildAt(0)
      if r5_34 then
        r5_34:SetFocus()
      end
      r0_34:ShowOtherGamepadKey(false)
    else
      if r0_34.CurrentSelectItem and r0_34.CurrentSelectItem.Rouge_SuitSign and r0_34.CurrentSelectItem.Rouge_SuitSign.Com_BtnQa and r0_34.CurrentSelectItem.Rouge_SuitSign:IsVisible() then
        r0_34.CurrentSelectItem.Rouge_SuitSign.Com_BtnQa:OnViewInfoClick()
        r0_34.CurrentDesiredFocusTarget = r0_34.CurrentSelectItem.Button_Select
      end
      r0_34:HideTreasureSuitGamePadKey()
    end
    r0_34.bInSuitScroll = true
  elseif r4_34 == Const.GamepadFaceButtonRight and r0_34.bInSuitScroll then
    if r0_34.AwardType == "Blessing" then
      if r0_34.CurrentSelectItem then
        r0_34.CurrentSelectItem.Button_Select:SetFocus()
      else
        r0_34.Item_Blessing01.Button_Select:SetFocus()
      end
    end
    r0_34.bInSuitScroll = false
    if r0_34.Key_Tip then
      r0_34.Key_Tip:UpdateKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "RV",
            }
          },
          Desc = GText("UI_CTL_Rougelike_SlideItems"),
        }
      })
    end
    r0_34:ShowOtherGamepadKey(true)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r1_0.BP_GetDesiredFocusTarget(r0_35)
  -- line: [690, 694] id: 35
  if r0_35.CurrentDesiredFocusTarget and IsValid(r0_35.CurrentDesiredFocusTarget) then
    return r0_35.CurrentDesiredFocusTarget
  end
end
function r1_0.ShowOtherGamepadKey(r0_36, r1_36)
  -- line: [696, 709] id: 36
  local r2_36 = nil	-- notice: implicit variable refs by block#[3, 4, 5]
  if r1_36 then
    r2_36 = UIConst.VisibilityOp.SelfHitTestInvisible
    if not r2_36 then
      ::label_7::
      r2_36 = UIConst.VisibilityOp.Collapsed
    end
  else
    goto label_7	-- block#2 is visited secondly
  end
  r0_36.Btn_Confirm.Key_GamePad:SetVisibility(r2_36)
  r0_36.Btn_Refresh.Key_GamePad:SetVisibility(r2_36)
  if r0_36.Key_GamePad_Desc then
    r0_36.Key_GamePad_Desc:SetVisibility(r2_36)
  end
  r0_36.Left_GamePad:SetVisibility(r2_36)
  r0_36.Right_GamePad:SetVisibility(r2_36)
  r0_36.Btn_Bag.Key_Bag:SetVisibility(r2_36)
  r0_36.Btn_GiveUp.Key_GamePad:SetVisibility(r2_36)
  r0_36.Key_SuitDetail:SetVisibility(r2_36)
  r0_36.ResourceBarWidget.KeyImg_GamePad:SetVisibility(r2_36)
end
function r1_0.SelectSuitItem(r0_37, r1_37)
  -- line: [711, 741] id: 37
  if r0_37.Key_Tip and r0_37.bInSuitScroll then
    local r2_37 = nil
    if r1_37 and r1_37.ExplanationId and #r1_37.ExplanationId > 0 then
      r2_37 = {
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
            }
          },
          Desc = GText("UI_CTL_Explain"),
        },
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
            }
          },
          Desc = GText("UI_BACK"),
        }
      }
    else
      r2_37 = {
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
            }
          },
          Desc = GText("UI_BACK"),
        }
      }
    end
    r0_37.Key_Tip:UpdateKeyInfo(r2_37)
  end
end
function r1_0.OnKeyUp(r0_38, r1_38, r2_38)
  -- line: [743, 750] id: 38
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_38)) == Const.GamepadLeftTrigger then
    r0_38.IsLeftTriggerDown = nil
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r1_0.OnAnalogValueChanged(r0_39, r1_39, r2_39)
  -- line: [752, 768] id: 39
  local r4_39 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_39))
  local r5_39 = UKismetInputLibrary.GetAnalogValue(r2_39) * 5
  if r4_39 == "Gamepad_RightY" or r4_39 == "Gamepad_LeftY" then
    if r0_39.IsLeftTriggerDown and r0_39.ScrollBox_Suit then
      r0_39.ScrollBox_Suit:SetScrollOffset(math.clamp(r0_39.ScrollBox_Suit:GetScrollOffset() - r5_39, 0, r0_39.ScrollBox_Suit:GetScrollOffsetOfEnd()))
    elseif r0_39.CurrentSelectItem then
      r0_39.CurrentSelectItem.ScrollBox_Desc:SetScrollOffset(math.clamp(r0_39.CurrentSelectItem.ScrollBox_Desc:GetScrollOffset() - r5_39, 0, r0_39.CurrentSelectItem.ScrollBox_Desc:GetScrollOffsetOfEnd()))
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r1_0.InitGamepadView(r0_40)
  -- line: [770, 796] id: 40
  if r0_40.Key_L then
    r0_40.Key_L:SetActiveWidgetIndex(1)
  end
  if r0_40.Key_R then
    r0_40.Key_R:SetActiveWidgetIndex(1)
  end
  r0_40.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_40.Key_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if r0_40.AwardType == "Blessing" then
    r0_40.Key_SuitDetail:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_40.Btn_Refresh.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_40.Btn_Refresh.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_40.Btn_Confirm.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_40.Btn_Confirm.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_40.Btn_GiveUp.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_40.Key_GamePad_Desc:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if not UIUtils.HasAnyFocus(r0_40) then
    return 
  end
  if r0_40.CurrentSelectItem then
    r0_40.CurrentSelectItem.Button_Select:SetFocus()
  else
    r0_40[r0_40.AwardType .. "Widgets"][1].Button_Select:SetFocus()
  end
end
function r1_0.InitKeyboardView(r0_41)
  -- line: [798, 821] id: 41
  if r0_41.Key_L then
    r0_41.Key_L:SetActiveWidgetIndex(0)
  end
  if r0_41.Key_R then
    r0_41.Key_R:SetActiveWidgetIndex(0)
  end
  r0_41.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if r0_41.Key_Tip then
    r0_41.Key_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_41.Key_SuitDetail then
    r0_41.Key_SuitDetail:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_41.Btn_Refresh.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_41.Btn_Refresh.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_41.Btn_Confirm.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_41.Btn_Confirm.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_41.Btn_GiveUp.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if r0_41.Key_GamePad_Desc then
    r0_41.Key_GamePad_Desc:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_41:UpdateAllCompadKeyDefinition()
end
function r1_0.Close(r0_42)
  -- line: [823, 826] id: 42
  AudioManager(r0_42):SetEventSoundParam(r0_42, "Switch3Choose1", {
    ToEnd = 1,
  })
  r0_42.Super.Close(r0_42)
end
function r1_0.RealClose(r0_43)
  -- line: [828, 840] id: 43
  r0_43.Super.RealClose(r0_43)
  GWorld.RougeLikeManager:OnChooseAwardFinished()
  if CommonUtils.GetDeviceTypeByPlatformName(r0_43) == "Mobile" then
    EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get_Phone")
  else
    EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get")
  end
  if r0_43.AwardType == "Blessing" then
    EventManager:FireEvent(EventID.OnGetAwardUIClose)
  end
  GWorld.RougeLikeManager:ShowNextAward(r0_43.AwardList)
end
function r1_0.SwitchDesc(r0_44, r1_44)
  -- line: [842, 853] id: 44
  if r0_44.AwardType == "Blessing" then
    for r6_44, r7_44 in ipairs(r0_44.BlessingWidgets) do
      r7_44:SwitchDesc(r1_44)
    end
    -- close: r2_44
  else
    for r6_44, r7_44 in ipairs(r0_44.TreasureWidgets) do
      r7_44:SwitchDesc(r1_44)
    end
    -- close: r2_44
  end
  r0_0:Set("RougeSimpleDesc", r1_44)
end
function r1_0.CheckIfSupportAward(r0_45)
  -- line: [855, 857] id: 45
  local r1_45 = GWorld.RougeLikeManager.RoomIndex
  if r1_45 == 1 then
    r1_45 = GWorld.RougeLikeManager.PassRooms:Num() == 0
  else
    goto label_12	-- block#2 is visited secondly
  end
  return r1_45
end
function r1_0.ShowRefundPopupUI(r0_46)
  -- line: [860, 876] id: 46
  AudioManager(r0_46):PlayUISound(r0_46, "event:/ui/roguelike/btn_black_small_click", nil, nil)
  local r1_46 = nil
  if GWorld.RougeLikeManager.bCanGetToken then
    r1_46 = DataMgr.RougeLikeSeason[GWorld.RougeLikeManager.SeasonId].MRTRefund
  else
    r1_46 = 0
  end
  UIManager(r0_46):ShowCommonPopupUI(100143, {
    RightCallbackObj = r0_46,
    RightCallbackFunction = r0_46.RefundAward,
    ShortText = string.format(GText("UI_RougeLike_GiveUpSelect_Tip"), r1_46),
  })
end
function r1_0.OnGiveUpBtnHover(r0_47)
  -- line: [878, 880] id: 47
  AudioManager(r0_47):PlayUISound(r0_47, "event:/ui/roguelike/btn_black_hover", nil, nil)
end
function r1_0.OnRougeBtnHover(r0_48)
  -- line: [882, 884] id: 48
  AudioManager(r0_48):PlayUISound(r0_48, "event:/ui/roguelike/btn_black_hover", nil, nil)
end
function r1_0.RefundAward(r0_49)
  -- line: [887, 895] id: 49
  local r1_49 = GWorld:GetAvatar()
  local r2_49 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  r1_49:RougeLikeRefundMRT(r0_49.AwardType, function()
    -- line: [890, 894] id: 50
    EventManager:FireEvent(EventID.OnRougeDealEventReward)
    r0_49:PlayItemsFadeAnimations(nil)
    r0_49:Close()
  end)
end
return r1_0
