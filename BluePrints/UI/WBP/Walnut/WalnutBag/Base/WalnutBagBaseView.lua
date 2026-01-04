-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Walnut\WalnutBag\Base\WalnutBagBaseView.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r1_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r2_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
return {
  PlayInAnim = function(r0_1)
    -- line: [17, 24] id: 1
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/armory/open", "WalnutBagMain", nil)
    r0_1:InitTabInfo()
    r0_1:InitListenEvent()
    r0_1:PlayAnimationForward(r0_1.In)
  end,
  PlayOutAnim = function(r0_2)
    -- line: [26, 31] id: 2
    AudioManager(r0_2):SetEventSoundParam(r0_2, "WalnutBagMain", {
      ToEnd = 1,
    })
    r0_2:BindToAnimationFinished(r0_2.Out, {
      r0_2,
      r0_2.Close
    })
    r0_2:PlayAnimationForward(r0_2.Out)
  end,
  RefreshBaseInfo = function(r0_3)
    -- line: [33, 78] id: 3
    r0_3.Text_Empty:SetText(GText("UI_BAG_EMPTY"))
    r0_3.Text_Empty_World:SetText(EnText("UI_BAG_EMPTY"))
    r0_3.Text_Empty_Search:SetText(GText("UI_Walnut_Not_Find"))
    r0_3.Text_Empty_World_1:SetText(EnText("UI_Walnut_Not_Find"))
    r0_3.Btn_Sell.Text_Button:SetText(GText("UI_BAG_Sell"))
    r0_3.Text_Empty_Detail:SetText(GText("UI_NoWalnut"))
    r0_3.InputBox:Init({
      Owner = r0_3,
      HintText = GText(GText("UI_Search")),
      FocusKeyName = "LS",
      PasteKeyName = "RS",
      TextLimit = r2_0.WalnutSearchMaxLen,
      bLimitSpaces = true,
      Events = {
        OnTextChanged = function(r0_4, r1_4)
          -- line: [52, 55] id: 4
          r0_4.SearchKeyWords = r1_4
          r0_4:BtnSearchOnClicked()
        end,
        OnTextCommitted = function(r0_5, r1_5, r2_5)
          -- line: [56, 61] id: 5
          r0_5.SearchKeyWords = r1_5
          if r2_5 == ETextCommit.OnEnter then
            r0_5:BtnSearchOnClicked()
          end
        end,
      },
    })
    r0_3.List_Item.BP_OnItemClicked:Add(r0_3, r0_3.OnListItemSelected)
    r0_3.List_Item.BP_OnItemSelectionChanged:Add(r0_3, r0_3.OnSelectStuffItemChanged)
    r0_3.Text_None:SetText(GText("UI_SHOP_NOTOWNED"))
    r0_3.CheckBox_Own:SetIsChecked(false)
    r0_3.CheckBox_Own:BindEventOnClicked({
      Inst = r0_3,
      Func = r0_3.ClickToShowNotHaveWalnutItem,
    })
    r0_3.Btn_Sell:BindEventOnClicked(r0_3, r0_3.OnSellButtonClicked)
    r0_3:AddLSFocusTarget(r0_3.CheckBox_Own.Com_KeyImg, r0_3.CheckBox_Own, nil, true)
    r0_3.Walnut_Detail:SetOwner(r0_3)
    r0_3.Btn_Goto:Init(GText("MAIN_UI_WALNUTBAG"), r0_3, r1_0:GetDungeonNextRefreshTime(), r0_3.GoToStyleOfPlay)
  end,
  InitJumpParams = function(r0_6, r1_6, r2_6)
    -- line: [80, 84] id: 6
    r0_6.NeedSelectTabId = r1_6
    r0_6.NeedSelectItemId = r2_6
    r0_6.Tab_WalnutBag:SelectTabById(r0_6.NeedSelectTabId and r2_0.DefaultSelectTabId)
  end,
  GoToStyleOfPlay = function(r0_7)
    -- line: [86, 93] id: 7
    if r0_7.CurSelectContent == nil then
      PageJumpUtils:JumpToStyleOfPlaySubUI("NewDeputeRoot", "Walnut")
    else
      PageJumpUtils:JumpToWalnutDungeonPage(r0_7.CurSelectContent.WalnutType, r0_7.CurSelectContent.Id)
    end
  end,
  SwitchToNpcCamera = function(r0_8, r1_8)
    -- line: [95, 102] id: 8
    if r1_8 then
      UIManager(r0_8):SwitchUINpcCamera(r1_8, "WalnutBagMain", r0_8.NpcId, {
        IsHaveInOutAnim = true,
      })
    else
      UIManager(r0_8):SwitchUINpcCamera(r1_8, "WalnutBagMain", r0_8.NpcId, {
        bDestroyNpc = true,
        IsHaveInOutAnim = false,
      })
    end
  end,
  CheckIsCanCloseSelf = function(r0_9)
    -- line: [104, 109] id: 9
    if r0_9:IsAnimationPlaying(r0_9.In) then
      return false
    end
    return true
  end,
  CancelStuffClickAndHideDetail = function(r0_10)
    -- line: [125, 135] id: 10
    if r0_10.CurSelectContent then
      r0_10.CurSelectContent.IsSelect = false
      if r0_10.CurSelectContent.SelfWidget then
        r0_10.CurSelectContent.SelfWidget:SetSelected(false)
      end
    end
    r0_10.CurSelectContent = nil
    r0_10:RefreshDetailPanelView(true)
  end,
  OnUpdateUIStyleByInputTypeChange = function(r0_11, r1_11, r2_11)
    -- line: [137, 142] id: 11
    r0_11:UpdateUIStyleInPlatform(r1_11 == ECommonInputType.Gamepad, r2_11)
    if r1_11 == ECommonInputType.Gamepad then
      r0_11:UpdateFocusInGamepad()
    end
  end,
  BtnSearchOnClicked = function(r0_12)
    -- line: [144, 148] id: 12
    r0_12:CancelStuffClickAndHideDetail()
    r0_12:RefreshList(true, r2_0.AllOptionName.SearchClick)
  end,
  ClickToShowNotHaveWalnutItem = function(r0_13, r1_13)
    -- line: [150, 155] id: 13
    r0_13:CancelStuffClickAndHideDetail()
    r0_13.bShowNotHaveState = r1_13
    r0_13:RefreshList(true, r2_0.AllOptionName.ShowNotHaveClick)
  end,
  OnSellButtonClicked = function(r0_14)
    -- line: [157, 159] id: 14
    r0_14:EnterWalnutSellState()
  end,
  OnListItemSelected = function(r0_15, r1_15, r2_15, r3_15)
    -- line: [161, 219] id: 15
    if not r1_15 or not r1_15.Id then
      return 
    end
    if not r2_15 then
      r2_15 = false
    end
    if r0_15.BagSellState then
      if r0_15.DesireSaleWalnutObjList[r1_15.Id] then
        r0_15:RefreshBottomKeyInfo("WalnutSell")
      else
        r0_15:RefreshBottomKeyInfo("SelectWalnutSell")
      end
    else
      r0_15:RefreshBottomKeyInfo()
    end
    if not r3_15 then
      AudioManager(r0_15):PlayItemSound(r0_15, r1_15.Id, "Click", r2_0.WalnutTypeName)
    end
    if r0_15.CurSelectContent and r0_15.CurSelectContent.Id ~= r1_15.Id then
      r0_15.CurSelectContent.IsSelect = false
      if r0_15.CurSelectContent.SelfWidget then
        r0_15.CurSelectContent.SelfWidget:SetSelected(false)
      end
    end
    r0_15.CurSelectContent = r1_15
    r1_15.IsSelect = true
    if r1_15.SelfWidget then
      r1_15.SelfWidget:SetSelected(true)
    else
      local r4_15 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_15.List_Item, r0_15.ItemId2Index[r1_15.Id] + -1)
      if r4_15 and r4_15.SetSelected then
        r4_15:SetSelected(true)
        r1_15.SelfWidget = r4_15
      end
    end
    r0_15:RefreshDetailPanelView()
    r0_15:UpdateReddotView(r1_15)
    if r1_15.Count > 0 and not r2_15 then
      r0_15:AddItemToSaleList(r1_15.Id, 1)
    end
  end,
  AddItemToSaleList = function(r0_16, r1_16, r2_16)
    -- line: [221, 276] id: 16
    if r0_16.BagSellState then
      local r3_16 = UIManager(r0_16):GetUI("WalnutSelectToList")
      if r0_16.DesireSaleWalnutObjList[r1_16] ~= nil then
        local r4_16 = nil
        if r3_16 then
          if r0_16.DesireSaleWalnutObjList[r1_16].Num + r2_16 <= r0_16.DesireSaleWalnutObjList[r1_16].StuffCount then
            r0_16.DesireSaleWalnutObjList[r1_16].Num = r0_16.DesireSaleWalnutObjList[r1_16].Num + r2_16
            r4_16 = r0_16.DesireSaleWalnutObjList[r1_16].Num
            r3_16.CurSelectStuffContentInList = r0_16.List_Item:GetItemAt(r0_16.ItemId2Index[r1_16] + -1)
          else
            return 
          end
        end
      else
        local r4_16 = r0_16:GetWalnutServerData(r1_16)
        if r4_16 then
          local r5_16 = r1_0:GetWalnutStuffData(r4_16, r0_16, r0_16.OnListItemSelected)
          if not r5_16 or r5_16.StuffCount <= 0 then
            r0_16.WS_Detail:SetActiveWidgetIndex(1)
            r0_16:RefreshDetailPanelView(true)
            return 
          end
          r5_16.SelfWidget = r0_16.List_Item:GetItemAt(r0_16.ItemId2Index[r1_16] + -1).SelfWidget
          r5_16.AddNum = r2_16
          r5_16.Id = r1_16
          r5_16.IsSelect = true
          r0_16.DesireSaleWalnutObjList[r1_16] = r5_16
          r0_16.DesireSaleWalnutObjList[r1_16].Num = r2_16
          local r7_16 = {
            Name = "IsToChoose",
            ExtraData = {
              1,
              r5_16.StuffCount,
              r5_16.Price,
              r5_16.CoinId,
              function()
                -- line: [254, 256] id: 17
                EventManager:FireEvent(EventID.OnRemoveWalnutItemInList, tostring(r1_16))
              end
            },
          }
          r0_16.CurSelectContent.StateTagInfo = r7_16
          if r0_16.CurSelectContent.SelfWidget then
            r0_16.CurSelectContent.SelfWidget:SetStuffStyleByStateTag(r0_16.CurSelectContent)
          else
            local r8_16 = r0_16.List_Item:GetItemAt(r0_16.ItemId2Index[r1_16] + -1)
            r8_16.StateTagInfo = r7_16
            if r8_16.SelfWidget then
              r8_16.SelfWidget:SetStuffStyleByStateTag(r0_16.CurSelectContent)
            end
          end
          r0_16:RefreshBottomKeyInfo("WalnutSell")
        end
      end
      r0_16:RefreshWalnutSaleItemSelect(r0_16.DesireSaleWalnutObjList[r1_16])
      r0_16:RefreshDetail(r0_16.DesireSaleWalnutObjList[r1_16].Num, r1_16)
      r0_16:RefreshItemInfo(r0_16.DesireSaleWalnutObjList[r1_16].Num, r1_16)
      r3_16:OnUpdateCurSelectItemSaleInfo(r0_16.DesireSaleWalnutObjList[r1_16].Num, true)
    end
  end,
  RemoveItemSaleState = function(r0_18, r1_18)
    -- line: [278, 306] id: 18
    local r2_18 = math.tointeger(r1_18)
    local r3_18 = r0_18.DesireSaleWalnutObjList[r2_18]
    local r4_18 = {
      Name = "Normal",
      ExtraData = {
        r3_18.StuffCount,
        r3_18.Price,
        r3_18.CoinId
      },
    }
    r3_18.StateTagInfo = r4_18
    r3_18.IsSelect = false
    r0_18.List_Item:GetItemAt(r0_18.ItemId2Index[r2_18] + -1).StateTagInfo = r4_18
    local r6_18 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_18.List_Item, r0_18.ItemId2Index[r2_18] + -1)
    if r6_18 and r3_18.Uuid == r1_18 then
      r6_18:SetSelected(false)
      r6_18:SetStuffStyleByStateTag(r3_18)
    end
    local r7_18 = false
    local r8_18 = DataMgr.Resource[r3_18.UnitId]
    if r0_18.CurSelectStuffContent ~= nil then
      r7_18 = r3_18.Uuid == r0_18.CurSelectStuffContent.Uuid
    else
      goto label_59	-- block#5 is visited secondly
    end
    r0_18.DesireSaleWalnutObjList[r2_18] = nil
    if r7_18 then
      r0_18.List_Item:BP_ClearSelection()
    end
    if tonumber(r1_18) == r0_18.CurSelectContent.Id then
      r0_18.WS_Detail:SetActiveWidgetIndex(1)
    end
  end,
  RefreshItemInfo = function(r0_19, r1_19, r2_19)
    -- line: [308, 315] id: 19
    local r3_19 = r0_19.List_Item:GetItemAt(r0_19.ItemId2Index[r2_19] + -1)
    if not r3_19 or not r3_19.SelfWidget then
      return 
    end
    r3_19.SelfWidget:SetSelectNum(r1_19, r3_19.Count)
    r0_19.DesireSaleWalnutObjList[r2_19].Num = r1_19
  end,
  RefreshDetail = function(r0_20, r1_20, r2_20)
    -- line: [317, 318] id: 20
  end,
  UpdateSelectInfo = function(r0_21, r1_21)
    -- line: [320, 321] id: 21
  end,
  OnSelectStuffItemChanged = function(r0_22, r1_22, r2_22)
    -- line: [323, 335] id: 22
    if r0_22.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      r0_22:OnListItemSelected(r1_22, true)
    end
    if r0_22.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and r0_22.BagSellState then
      r0_22.HoverItem = r1_22
    end
  end,
  UpdateReddotView = function(r0_23, r1_23)
    -- line: [337, 367] id: 23
    if r1_23.RedDotType then
      r1_23.RedDotType = nil
      if r1_23.SelfWidget then
        r1_23.SelfWidget:SetRedDot()
      end
      local r2_23 = r0_23.AllReddotItemsId[r1_23.WalnutType]
      if r2_23 then
        local r3_23 = nil
        for r8_23, r9_23 in ipairs(r2_23) do
          if r9_23 == r1_23.Id then
            r3_23 = r8_23
            break
          end
        end
        -- close: r4_23
        if r3_23 ~= nil then
          table.remove(r2_23, r3_23)
        end
        if #r2_23 == 0 then
          r0_23.AllReddotItemsId[r1_23.WalnutType] = nil
          r0_23.Tab_WalnutBag:ShowTabRedDotByTabId(r2_0.WalnutItemTypeToTabId[r2_0.WalnutItemType[r1_23.WalnutType]], false)
        end
        if IsEmptyTable(r0_23.AllReddotItemsId) then
          r0_23.Tab_WalnutBag:ShowTabRedDotByTabId(1, false)
        end
        r1_0:RemoveReddotCount(r1_23.Id)
      end
    end
  end,
  RefreshAllGridIndex = function(r0_24)
    -- line: [369, 377] id: 24
    for r5_24 = 0, r0_24.List_Item:GetNumItems() + -1, 1 do
      local r6_24 = r0_24.List_Item:GetItemAt(r5_24)
      if r6_24 then
        r6_24.GridIndex = r5_24 + 1
      end
    end
  end,
  RefreshDetailPanelView = function(r0_25, r1_25)
    -- line: [379, 390] id: 25
    if r1_25 then
      r0_25.Walnut_Detail:SetIsNeedPlayResolveAnim(true)
      r0_25.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_25.WS_Detail:SetActiveWidgetIndex(1)
      return 
    end
    r0_25.Walnut_Detail:RefreshItemDetails(r0_25.CurSelectContent)
    r0_25.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_25.WS_Detail:SetActiveWidgetIndex(0)
  end,
  OnHorizontalListViewResizeDone = function(r0_26, r1_26, r2_26)
    -- line: [393, 398] id: 26
    local r3_26 = UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_26.HB_Empty)
    local r4_26 = r3_26:GetOffsets()
    r4_26.Right = r1_26 - r2_26 - r4_26.Left
    r3_26:SetOffsets(r4_26)
  end,
  SetFocus_Lua = function(r0_27)
    -- line: [401, 414] id: 27
    r0_27:RefreshBottomKeyInfo()
    if UIManager(r0_27):GetUIObj("CommonDialog") ~= nil then
      return 
    end
    if r0_27.List_Item:GetNumItems() > 0 or r0_27.BagSellState then
      r0_27.List_Item:SetFocus()
    else
      r0_27:SetFocus()
    end
  end,
  CheckIsCanAddToSaleList = function(r0_28, r1_28, r2_28)
    -- line: [416, 437] id: 28
    if GWorld:GetAvatar() == nil then
      return false
    end
    if r1_28 == nil then
      r1_28 = r0_28.CurSelectStuffContent
    end
    if r1_28 and r1_28.Count <= 0 then
      return false
    end
    local r4_28 = nil
    if r1_28 ~= nil and r1_28.Price == -1 then
      r4_28 = 7014
    end
    if r4_28 and r2_28 then
      UIManager(r0_28):ShowError(r4_28, nil, UIConst.Tip_CommonToast)
    end
    return r4_28 == nil
  end,
  ReGenerateBagList = function(r0_29)
    -- line: [439, 452] id: 29
    r0_29:CancelStuffClickAndHideDetail()
    r0_29.List_Item:BP_ClearSelection()
    r0_29.List_Item:ClearListItems()
    r0_29:RefreshList(true, r2_0.AllOptionName.TabClick)
  end,
  UpdateAllItemsStyle = function(r0_30, r1_30)
    -- line: [454, 464] id: 30
    if r1_30 then
      if r0_30:IsExistTimer("DelayToSetItemStyle") then
        r0_30:RemoveTimer("DelayToSetItemStyle")
      end
      r0_30:AddTimer(0.1, r0_30.DelayToSetItemStyle, false, 0, "DelayToSetItemStyle")
    else
      r0_30:DelayToSetItemStyle()
    end
  end,
  DelayToSetItemStyle = function(r0_31)
    -- line: [466, 495] id: 31
    for r5_31 = 0, r0_31.List_Item:GetNumItems() + -1, 1 do
      local r6_31 = r0_31.List_Item:GetItemAt(r5_31)
      if r6_31 and r6_31.StuffType ~= "EmptyGrid" then
        local r7_31 = false
        local r8_31 = nil
        if r0_31.BagSellState then
          r7_31 = r6_31.Price == -1
          if not r7_31 then
            r8_31 = {
              r6_31.Count,
              r6_31.Price,
              r6_31.CoinId
            }
          end
        end
        if r0_31.DesireSaleStuffObjList[r6_31.Uuid] ~= nil then
          local r10_31 = UIManager(r0_31):GetUI(r2_0.WalnutSelectUINames)
          local function r11_31()
            -- line: [482, 484] id: 32
          end
          local r12_31 = {
            Name = "IsToChoose",
          }
          local r13_31 = {}
          local r14_31 = r10_31.NeedDealWithStuffCount[r6_31.Uuid] and 1
          local r15_31 = r6_31.Count
          local r16_31 = r6_31.Price
          local r17_31 = r6_31.CoinId
          local r18_31 = r11_31
          -- setlist for #13 failed
          r12_31.ExtraData = r13_31
          r12_31.IsShowGrey = r7_31
          r6_31.StateTagInfo = r12_31
        else
          r6_31.StateTagInfo = {
            Name = "Normal",
            ExtraData = r8_31,
            IsShowGrey = r7_31,
          }
        end
        if r6_31.SelfWidget then
          r6_31.SelfWidget:SetStuffStyleByStateTag(r6_31)
        end
      end
    end
  end,
}
