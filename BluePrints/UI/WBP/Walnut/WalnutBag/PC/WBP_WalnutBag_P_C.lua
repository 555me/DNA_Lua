-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Walnut\WalnutBag\PC\WBP_WalnutBag_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r1_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r2_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local r3_0 = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Walnut.WalnutBag.Base.WalnutBagListBase"
})
r3_0._components = {
  "BluePrints.UI.WBP.Walnut.WalnutBag.Base.WalnutBagBaseView",
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}
function r3_0.Initialize(r0_1, r1_1)
  -- line: [23, 40] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.CurTabId = nil
  r0_1.NpcId = r2_0.NpcId
  r0_1.AllTabInfo = {}
  r0_1.AllReddotItemsId = {}
  r0_1.CurFocusWidget = nil
  r0_1.BottomKeyInfoList = nil
  r0_1.NeedSelectTabId = nil
  r0_1.NeedSelectItemId = nil
  r0_1.NeedSelectGridIndex = -1
  r0_1.CurSelectGridIndex = 1
  r0_1.CurSelectWalnutContent = nil
  r0_1.BagSellState = false
  r0_1.DesireSaleStuffObjList = {}
  r0_1.CurSelectStuffContent = nil
  r0_1.bIsWalnutSelling = false
end
function r3_0.Construct(r0_2)
  -- line: [42, 46] id: 2
  r0_2.Super.Construct(r0_2)
  r0_2:RefreshBaseInfo()
  r0_2:CheckIsCanSellWalnut()
end
function r3_0.Close(r0_3)
  -- line: [48, 58] id: 3
  local r1_3 = UIManager(r0_3):GetUIObj(r2_0.WalnutSelectUIName)
  if r1_3 ~= nil then
    r1_3:Close()
  end
  r1_0:ClearReddotCount()
  r0_3:HorizontalListViewResize_TearDown()
  r0_3.CheckBox_Own:UnInitCommonCheckBox()
  r0_3:_StopListFramingInAnim()
  r3_0.Super.Close(r0_3)
end
function r3_0.OnFocusReceived(r0_4, r1_4, r2_4)
  -- line: [60, 64] id: 4
  r0_4.Walnut_Detail:ResetInfo()
  r0_4:RefreshBottomKeyInfo()
  return r3_0.Super.OnFocusReceived(r0_4, r1_4, r2_4)
end
function r3_0.ReceiveEnterState(r0_5, r1_5)
  -- line: [66, 78] id: 5
  r3_0.Super.ReceiveEnterState(r0_5, r1_5)
  if r1_5 == 1 then
    r0_5:RefreshList(true, r2_0.AllOptionName.TabClick)
    if r0_5.GameInputModeSubsystem then
      r0_5:OnUpdateUIStyleByInputTypeChange(r0_5.GameInputModeSubsystem:GetCurrentInputType(), r0_5.GameInputModeSubsystem:GetCurrentGamepadName())
    end
  end
  r0_5.AllReddotItemsId = r1_0:GetAllNewItemsId()
  r0_5:InitTabInfo()
end
function r3_0.ReceiveExitState(r0_6, r1_6)
  -- line: [80, 89] id: 6
  r0_6.Super.ReceiveExitState(r0_6, r1_6)
  if r1_6 == 0 then
    local r2_6 = UIManager(r0_6):GetUI(r2_0.WalnutSelectUIName)
    if r2_6 ~= nil then
      r2_6:PlayOutAnim()
    end
  end
end
function r3_0.InitTabInfo(r0_7)
  -- line: [91, 116] id: 7
  r0_7.AllTabInfo = {
    {
      Text = GText("UI_TAB_NAME_ALL"),
      IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All",
      TabId = 1,
      IsNew = not IsEmptyTable(r0_7.AllReddotItemsId),
    }
  }
  for r5_7, r6_7 in pairs(DataMgr.WalnutType) do
    local r7_7 = false
    if r0_7.AllReddotItemsId[r6_7.WalnutType] ~= nil then
      r7_7 = true
    end
    table.insert(r0_7.AllTabInfo, {
      Text = GText(r6_7.Name),
      IconPath = r6_7.TabIcon,
      TabId = r5_7 + 1,
      IsNew = r7_7,
    })
  end
  -- close: r1_7
  r0_7.BottomKeyInfoList = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_7.OnReturnKeyDown,
          Owner = r0_7,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_7.OnReturnKeyDown,
          Owner = r0_7,
        }
      },
      Desc = GText("UI_BACK"),
    }
  }
  r0_7.Tab_WalnutBag:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = r0_7.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = r0_7.BottomKeyInfoList,
    StyleName = "TextImage",
    OwnerPanel = r0_7,
    TitleName = GText("MAIN_UI_WALNUTBAG"),
    BackCallback = r0_7.OnReturnKeyDown,
  })
  r0_7.Tab_WalnutBag:BindEventOnTabSelected(r0_7, r0_7.WalnutTabItemClick)
  r0_7.Btn_Sell:SetGamePadImg("X")
  r0_7:AddDelayFrameFunc(function()
    -- line: [113, 115] id: 8
    r0_7.Tab_WalnutBag:SelectTabById(r0_7.NeedSelectTabId and r2_0.DefaultSelectTabId)
  end, 1, "FillWithWalnutItemInfo")
end
function r3_0.InitListenEvent(r0_9)
  -- line: [118, 120] id: 9
  r0_9:AddDispatcher(EventID.OnUpdateWalnutItem, r0_9, r0_9.OnUpdateWalnutItemByAction)
end
function r3_0.OnLoaded(r0_10, ...)
  -- line: [122, 134] id: 10
  local r2_10 = nil	-- notice: implicit variable refs by block#[0]
  local r1_10 = nil	-- notice: implicit variable refs by block#[0]
  r3_0.Super.OnLoaded(r0_10, ...)
  ... = ... -- error: untaken top expr
  r0_10.NeedSelectItemId = r2_10
  r0_10.NeedSelectTabId = r1_10
  r0_10:PlayInAnim()
  r0_10:InitBtnExplanation()
  r1_10 = r0_10.Com_BtnExplanation.Com_KeyImg
  r1_10:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
      }
    },
  })
end
function r3_0.InitBtnExplanation(r0_11)
  -- line: [136, 143] id: 11
  r0_11.Com_BtnExplanation:Init({
    ClickCallback = r0_11.OnBtnExplanationClickCallback,
    OwnerWidget = r0_11,
    PopupId = 100224,
    Desc = "UI_Walnut_Gacha_Des",
  })
end
function r3_0.OnBtnExplanationClickCallback(r0_12)
  -- line: [145, 147] id: 12
  print("lgc@ OnBtnExplanationClickCallback")
end
function r3_0.RefreshBottomKeyInfo(r0_13, r1_13)
  -- line: [149, 188] id: 13
  if not r1_13 then
    r1_13 = "DefaultWidget"
  end
  if r0_13.CurFocusWidget == r1_13 then
    return 
  end
  if r1_13 == "ViewStuff" then
    r0_13.Tab_WalnutBag:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_13,
          }
        },
        Desc = GText("UI_Controller_CheckDetails"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  elseif r1_13 == "ViewMethod" then
    r0_13.Tab_WalnutBag:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_13,
          }
        },
        Desc = GText("UI_Controller_Go"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  elseif r1_13 == "NotAnyKey" then
    r0_13.Tab_WalnutBag:UpdateBottomKeyInfo({})
  elseif r1_13 == "WalnutSell" then
    r0_13.Tab_WalnutBag:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = r0_13,
          }
        },
        Desc = GText("UI_CTL_Remove"),
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_13,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  elseif r1_13 == "SelectWalnutSell" then
    r0_13.Tab_WalnutBag:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_13,
          }
        },
        Desc = GText("UI_CTL_Add"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_13.OnReturnKeyDown,
            Owner = r0_13,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  elseif r0_13.BottomKeyInfoList then
    r0_13.Tab_WalnutBag:UpdateBottomKeyInfo(r0_13.BottomKeyInfoList)
  end
  r0_13.CurFocusWidget = r1_13
end
function r3_0.WalnutTabItemClick(r0_14, r1_14)
  -- line: [191, 212] id: 14
  r0_14.CurTabId = r1_14:GetTabId()
  r0_14.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.Hidden)
  r0_14.ListCanvas:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_14:RefreshList(true, r2_0.AllOptionName.TabClick)
  r0_14:HorizontalListViewResize_SetUp(r0_14.Panel_ItemList, r0_14.List_Item, 0)
  r0_14:AddTimer(0.05, function()
    -- line: [204, 211] id: 15
    if r0_14.List_Item:GetNumItems() > 0 then
      local r0_15 = r0_14.List_Item:GetItemAt(0)
      if r0_15 then
        r0_14:OnListItemSelected(r0_15, nil, true)
      end
    end
  end, false, 0, "SelectFirstWalnutItem", true)
end
function r3_0.OnUpdateWalnutItemByAction(r0_16, r1_16, r2_16, ...)
  -- line: [214, 244] id: 16
  local r3_16 = ErrorCode:Check(r2_16, UIConst.Tip_CommonToast)
  if not r3_16 then
    return 
  end
  if r1_16 == "WalnutBulkSale" then
    ... = ... -- error: untaken top expr
    local r5_16 = 0
    local r6_16 = true
    if not false then
      if r6_16 then
        r0_16:ReGenerateBagList()
      else
        r0_16.NeedSelectGridIndex = 0
        r0_16:JumpToSelectItem(false)
        r0_16:RefreshAllGridIndex()
      end
    end
    local r8_16 = {}
    local r9_16 = true
    local r10_16 = "Resources"
    r8_16[r10_16] = {}
    r9_16 = false
    for r15_16, r16_16 in pairs(r3_16) do
      r8_16[r10_16][r15_16] = r16_16
    end
    -- close: r11_16
    if not r9_16 then
      r0_16:ShowGetItemPage(r8_16)
    end
  end
  r0_16.bIsWalnutSelling = false
end
function r3_0.IsCanChangeToGamePadViewMode(r0_17)
  -- line: [246, 253] id: 17
  if r0_17.CurFocusWidget == "DefaultWidget" then
    return true
  else
    return not r0_17.Walnut_Detail:IsInGamePadViewMode()
  end
end
function r3_0.UpdateUIStyleInPlatform(r0_18, r1_18, r2_18)
  -- line: [255, 278] id: 18
  if r1_18 then
    r1_18 = r0_18:IsCanChangeToGamePadViewMode()
  end
  r0_18.Walnut_Detail:UpdateUIStyleInPlatform(r1_18)
  r0_18.Btn_Goto:UpdateUIStyleInPlatform(r1_18)
  r0_18.Tab_WalnutBag:UpdateUIStyleInPlatform(r1_18)
  r0_18.Com_BtnExplanation:UpdateUIStyleInPlatform(r1_18)
  if r1_18 then
    r0_18.InputBox:ChangeKeyByInputDevice(ECommonInputType.Gamepad)
    r0_18:RefreshOpInfoByInputDeviceForLSComp(ECommonInputType.Gamepad, r2_18)
    r0_18.Btn_Sell.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_18.InputBox:ChangeKeyByInputDevice(ECommonInputType.MouseAndKeyboard)
    r0_18:RefreshOpInfoByInputDeviceForLSComp(ECommonInputType.MouseAndKeyboard, r2_18)
    r0_18.Btn_Sell.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_18.BagSellState then
    local r3_18 = UIManager(r0_18):GetUI("WalnutSelectToList")
    if r3_18 ~= nil then
      r3_18:UpdateUIStyleInPlatform(r1_18)
    end
  end
end
function r3_0.UpdateFocusInGamepad(r0_19)
  -- line: [280, 291] id: 19
  if r0_19.BagSellState then
    local r1_19 = UIManager(r0_19):GetUI("WalnutSelectToList")
    if r1_19 ~= nil then
      if r1_19.bIsOpenList then
        r1_19.List_Item:SetFocus()
      else
        r0_19.List_Item:SetFocus()
      end
    end
  end
end
function r3_0.OnKeyDown(r0_20, r1_20, r2_20)
  -- line: [293, 320] id: 20
  local r3_20 = false
  local r4_20 = UE4.UKismetInputLibrary.GetKey(r2_20)
  local r5_20 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_20)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_20) then
    if r0_20.Walnut_Detail:IsVisible() then
      r3_20 = r0_20.Walnut_Detail:Handle_KeyDownOnGamePad(r5_20)
    end
    if not r3_20 then
      r3_20 = r0_20:OnGamePadButtonDown(r5_20)
    end
  elseif r0_20.BagSellState then
    r3_20 = true
    if r5_20 == "Escape" then
      r0_20:OnReturnKeyDown()
    end
  else
    r3_20 = r0_20.Tab_WalnutBag:Handle_KeyEventOnPC(r5_20)
  end
  if r3_20 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r3_0.OnGamePadButtonDown(r0_21, r1_21)
  -- line: [322, 338] id: 21
  local r2_21 = false
  if r1_21 == UIConst.GamePadKey.FaceButtonLeft then
    r2_21 = r0_21:Handle_KeyDownOnGamePad(r1_21)
  elseif r0_21.BagSellState then
    local r3_21 = UIManager(r0_21):GetUI("WalnutSelectToList")
    if r3_21 ~= nil then
      r2_21 = r3_21:OnGamePadButtonDown(r1_21)
    end
  else
    r2_21 = r0_21:Handle_KeyDownOnGamePad(r1_21)
  end
  if not r2_21 then
    r2_21 = r0_21.Tab_WalnutBag:Handle_KeyEventOnGamePad(r1_21)
  end
  return r2_21
end
function r3_0.Handle_KeyDownOnGamePad(r0_22, r1_22)
  -- line: [340, 368] id: 22
  if r1_22 == UIConst.GamePadKey.FaceButtonLeft then
    if r0_22.BagSellState and r0_22.HoverItem then
      r0_22:OnHoverItemKeyPressed()
    elseif r0_22.SellUnlocked then
      r0_22:OnSellButtonClicked()
    end
    return true
  elseif r1_22 == UIConst.GamePadKey.RightThumb then
    r0_22:RefreshBottomKeyInfo()
    r0_22.InputBox:SetText("")
    return true
  elseif r1_22 == UIConst.GamePadKey.FaceButtonTop then
    r0_22:RefreshBottomKeyInfo()
    r0_22.Btn_Goto:OnGoToButtonClicked()
    return true
  elseif r1_22 == UIConst.GamePadKey.SpecialRight then
    r0_22.Com_BtnExplanation:OnBtnClick()
    return true
  elseif r1_22 == UIConst.GamePadKey.LeftThumb then
    r0_22:RefreshBottomKeyInfo()
    r0_22.InputBox:SetFocus()
    return true
  end
  return false
end
function r3_0.OnKeyUp(r0_23, r1_23, r2_23)
  -- line: [370, 381] id: 23
  local r3_23 = false
  if r0_23:OnGamePadButtonUp(UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_23))) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  r0_23:OnKeyDownForLSComp(r1_23, r2_23)
  return r3_0.Super.OnKeyUp(r0_23, r1_23, r2_23)
end
function r3_0.OnGamePadButtonUp(r0_24, r1_24)
  -- line: [383, 392] id: 24
  local r2_24 = false
  if r0_24.BagSellState then
    local r3_24 = UIManager(r0_24):GetUI("WalnutSelectToList")
    if r3_24 ~= nil then
      r2_24 = r3_24:OnGamePadButtonUp(r1_24)
    end
  end
  return r2_24
end
function r3_0.OnReturnKeyDown(r0_25)
  -- line: [394, 414] id: 25
  if r0_25.bIsWalnutSelling then
    return 
  end
  local r1_25 = UIManager(r0_25):GetUI("WalnutSelectToList")
  if r1_25 ~= nil then
    r1_25:PlayOutAnim()
    return 
  end
  local r2_25 = UIManager(r0_25):GetUIObj("CommonDialog")
  if r2_25 ~= nil then
    r2_25:Close()
    return 
  end
  if r0_25:CheckIsCanCloseSelf() then
    r0_25:PlayOutAnim()
  end
end
function r3_0.EnterWalnutSellState(r0_26)
  -- line: [417, 465] id: 26
  if r0_26.bIsWalnutSelling then
    return 
  end
  r0_26.Tab_WalnutBag:EnterViewSingleMode()
  r0_26.BagSellState = true
  r0_26:RefreshList(true, "ShowHaveWalnutOnly")
  r0_26.DesireSaleWalnutObjList = {}
  local r2_26 = UE4.UGameplayStatics.GetGameInstance(r0_26):GetGameUIManager()
  if r2_26 ~= nil then
    local r3_26 = nil
    if r0_26.CurSelectContent then
      if r0_26.CurSelectContent.SelfWidget then
        r0_26.CurSelectContent.SelfWidget:SetSelected(false)
      else
        r0_26.CurSelectContent.IsSelect = false
      end
      r0_26.WS_Detail:SetActiveWidgetIndex(1)
    end
    if r0_26:IsAnimationPlaying(r0_26.Sell_Close) then
      r0_26:StopAnimation(r0_26.Sell_Close)
    end
    r0_26:PlayAnimation(r0_26.Sell)
    r2_26:LoadUI(UIConst.WALNUTBAGSALESELECT, r2_0.WalnutSelectUIName, r2_0.WalnutBagSellPageZOrder, r0_26, r0_26.LeaveWalnutSellState, r0_26.RemoveItemSaleState, r0_26.RealToSaleWalnuts)
  end
  r0_26:UpdateAllItemsStyle(false)
end
function r3_0.LeaveWalnutSellState(r0_27)
  -- line: [467, 503] id: 27
  r0_27.Tab_WalnutBag:LeaveViewSingleMode()
  r0_27:RefreshList(true, r2_0.AllOptionName.TabClick)
  r0_27.BagSellState = false
  local r1_27 = r0_27.DesireSaleStuffObjList
  for r6_27 = 0, r0_27.List_Item:GetNumItems() + -1, 1 do
    local r7_27 = r0_27.List_Item:GetItemAt(r6_27)
    if r7_27.SelfWidget then
      r7_27.SelfWidget:SetSelectNum()
    end
  end
  r0_27:SetFocus_Lua()
  if r0_27:IsAnimationPlaying(r0_27.Sell) then
    r0_27:StopAnimation(r0_27.Sell)
  end
  r0_27:PlayAnimation(r0_27.Sell_Close)
  r0_27:AddTimer(0.05, function()
    -- line: [495, 502] id: 28
    if r0_27.List_Item:GetNumItems() > 0 then
      local r0_28 = r0_27.List_Item:GetItemAt(0)
      if r0_28 then
        r0_27:OnListItemSelected(r0_28)
      end
    end
  end, false, 0, "SelectFirstWalnutItem", true)
end
function r3_0.RemoveWalnutSaleState(r0_29)
  -- line: [505, 506] id: 29
end
function r3_0.RealToSaleWalnuts(r0_30, r1_30, r2_30)
  -- line: [508, 527] id: 30
  local r3_30 = GWorld:GetAvatar()
  local r4_30 = {}
  local r5_30 = nil
  for r10_30, r11_30 in pairs(r1_30) do
    r5_30 = math.tointeger(r11_30.Uuid)
    r4_30[r5_30] = r2_30[r10_30]
  end
  -- close: r6_30
  if not IsEmptyTable(r4_30) then
    r3_30:WalnutBulkSale(r4_30)
  end
  local r6_30 = UIManager(r0_30):GetUI(r2_0.WalnutSelectUIName)
  if r6_30 ~= nil then
    r6_30:PlayOutAnim()
  end
  r0_30.bIsWalnutSelling = true
end
function r3_0.GetWalnutServerData(r0_31, r1_31)
  -- line: [529, 536] id: 31
  local r2_31 = GWorld:GetAvatar()
  local r3_31 = {}
  if r2_31 == nil then
    return 
  end
  r3_31.Id = r1_31
  r3_31.Count = r2_31.Walnuts:GetCount(r1_31) and 0
  return r3_31
end
function r3_0.OnHoverItemKeyPressed(r0_32)
  -- line: [538, 543] id: 32
  if r0_32.HoverItem then
    EventManager:FireEvent(EventID.OnRemoveWalnutItemInList, r0_32.HoverItem.Uuid)
    r0_32:RefreshBottomKeyInfo("SelectWalnutSell")
  end
end
function r3_0.ShowGetItemPage(r0_33, r1_33)
  -- line: [545, 561] id: 33
  local function r2_33()
    -- line: [546, 553] id: 34
    if r0_33.List_Item:GetNumItems() > 0 then
      local r0_34 = r0_33.List_Item:GetItemAt(0)
      if r0_34 then
        r0_33:OnListItemSelected(r0_34)
      end
    end
  end
  if r0_33.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_33:AddDelayFrameFunc(function()
      -- line: [555, 557] id: 35
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_33, false, r2_33, r0_33, true)
    end)
  else
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_33, false, r2_33, r0_33, true)
  end
end
function r3_0.CheckIsCanSellWalnut(r0_36)
  -- line: [563, 574] id: 36
  local r2_36 = DataMgr.UIUnlockRule.WalnutSell.UIUnlockRuleId
  local r3_36 = GWorld:GetAvatar()
  if not r3_36 then
    return false
  end
  r0_36.SellUnlocked = r3_36:CheckUIUnlocked(r2_36)
  if not r0_36.SellUnlocked then
    r0_36.Btn_Sell:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_36.Btn_Sell:SetVisibility(UE4.ESlateVisibility.Visable)
  end
end
AssembleComponents(r3_0)
return r3_0
