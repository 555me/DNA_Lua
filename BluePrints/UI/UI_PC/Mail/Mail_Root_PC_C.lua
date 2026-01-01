-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Mail\Mail_Root_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.TimeUtils")
local r1_0 = DataMgr.ReddotNode.NormalMail.Name
local r2_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
function r2_0.Init(r0_1, r1_1)
  -- line: [10, 18] id: 1
  r0_1.Parent = r1_1
  r0_1:GetCurrentSystemLanguage()
  r0_1:InitRpcEvent()
  r0_1:InitCommonTab()
  r0_1:InitMailMain()
  r0_1:PlayInAnim()
  r0_1:AddReddotListen()
end
function r2_0.AddReddotListen(r0_2)
  -- line: [20, 24] id: 2
  ReddotManager.AddListener(r1_0, r0_2, function(r0_3, r1_3)
    -- line: [21, 23] id: 3
    r0_3:SetMailTabRedDot(r1_3)
  end)
end
function r2_0.RemoveReddotListen(r0_4)
  -- line: [26, 28] id: 4
  ReddotManager.RemoveListener(r1_0, r0_4)
end
function r2_0.GetCurrentSystemLanguage(r0_5)
  -- line: [30, 44] id: 5
  local r1_5 = {
    CN = "TextMapContent",
    EN = "ContentEN",
    JP = "ContentJP",
    KR = "ContentKR",
    TC = "ContentTC",
  }
  r0_5.CurrentSystemLanguage = "CN"
  for r6_5, r7_5 in pairs(r1_5) do
    if CommonConst.SystemLanguage == r7_5 then
      r0_5.CurrentSystemLanguage = r6_5
    end
  end
  -- close: r2_5
end
function r2_0.InitRpcEvent(r0_6)
  -- line: [46, 54] id: 6
  r0_6:AddDispatcher(EventID.OnGetMailRewards, r0_6, r0_6.OnGetMailRewards)
  r0_6:AddDispatcher(EventID.OnMarkMailStar, r0_6, r0_6.OnMarkMailStar)
  r0_6:AddDispatcher(EventID.OnCancelMailStar, r0_6, r0_6.OnCancelMailStar)
  r0_6:AddDispatcher(EventID.OnDeleteMail, r0_6, r0_6.OnDeleteMail)
  r0_6:AddDispatcher(EventID.OnMarkMailReaded, r0_6, r0_6.OnMarkMailReaded)
  r0_6:AddDispatcher(EventID.OnGetAllMailReward, r0_6, r0_6.OnGetAllMailReward)
  r0_6:AddDispatcher(EventID.OnChangePropMailUniqueID, r0_6, r0_6.InitMailMain)
end
function r2_0.InitCommonTab(r0_7)
  -- line: [56, 77] id: 7
  r0_7:InitBtnTab()
  r0_7.NowTabId = 1
  r0_7.CurContent = nil
  r0_7.GamePadState = "ListMail"
  r0_7.Text_Empty:SetText(GText("UI_Mail_Empty"))
  r0_7.Text_MailDetail_Empry:SetText(GText("UI_Mail_Nochosen"))
  r0_7.Button_Receive_All:SetText(GText("UI_Mail_Recieveall"))
  r0_7.Button_Receive_All:BindEventOnClicked(r0_7, r0_7.OnClickButtonReceiveAll)
  r0_7.Button_Receive_All:SetGamePadImg("Y")
  r0_7.Button_Receive:SetText(GText("UI_Mail_Recieve"))
  r0_7.Button_Receive:SetGamePadIconVisible(true)
  r0_7.Button_Receive:SetGamePadImg("A")
  r0_7.Button_Receive:BindEventOnClicked(r0_7, r0_7.OnClickButtonReceive)
  r0_7.Button_DeleteAllRead:SetText(GText("UI_Mail_Delete_All"))
  r0_7.Button_DeleteAllRead:BindEventOnClicked(r0_7, r0_7.OnClickButtonDeleteAllRead)
  r0_7.Button_DeleteAllRead:SetGamePadImg("X")
  r0_7.SortList = {
    GText("UI_Mail_Date_Recieve"),
    GText("UI_Mail_Date_Remain")
  }
  r0_7.Text_RewardTitle:SetText(GText("UI_Mail_Reward"))
  r0_7.Button_Collect:BindEventOnClicked(r0_7, r0_7.OnClickButtonCollect)
end
function r2_0.InitBtnTab(r0_8)
  -- line: [79, 142] id: 8
  r0_8.Platform = CommonUtils.GetDeviceTypeByPlatformName(r0_8)
  r0_8.WBP_Com_TabSub01:Init({
    PlatformName = r0_8.Platform,
    LeftKey = "A",
    RightKey = "D",
    Tabs = {
      [1] = {
        Text = GText("UI_Mail_Tab_Common"),
        TabId = 1,
      },
      [2] = {
        Text = GText("UI_Mail_Tab_Star"),
        TabId = 2,
      },
    },
  })
  r0_8.WBP_Com_TabSub01:BindEventOnTabSelected(r0_8, r0_8.OnSubTabChanged)
  r0_8.WBP_Com_TabSub01:SelectTab(r0_8.NowTabId)
  local r2_8 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_8.WS_MailList)
  local r3_8 = r2_8:GetSize()
  local r4_8 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_8.Group_MailListCommon)
  local r5_8 = r4_8:GetSize()
  local r6_8 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_8.WS_MailDetail)
  local r7_8 = r6_8:GetOffsets()
  if r0_8.Platform == "PC" then
    r2_8:SetSize(FVector2D(r0_8.ListSizeX_P, r3_8.Y))
    r4_8:SetSize(FVector2D(r0_8.ListSizeX_P, r5_8.Y))
    r7_8.Left = r0_8.DetailOffsetLeft_P
    r6_8:SetOffsets(r7_8)
  else
    r2_8:SetSize(FVector2D(r0_8.ListSizeX_M, r3_8.Y))
    r4_8:SetSize(FVector2D(r0_8.ListSizeX_M, r5_8.Y))
    r7_8.Left = r0_8.DetailOffsetLeft_M
    r6_8:SetOffsets(r7_8)
  end
  r0_8.Key_Collect:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
      }
    },
  })
  r0_8.Key_Delete:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RS",
      }
    },
  })
  r0_8.Key_RewardTitle:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
      }
    },
  })
  r0_8.Tab01 = r0_8.WBP_Com_TabSub01.List_Tab:GetChildAt(0)
  r0_8.Btn_Delete:BindEventOnClicked(r0_8, r0_8.OnClickDeleteMail)
end
function r2_0.InitMailMain(r0_9)
  -- line: [144, 182] id: 9
  r0_9.NormalMailList = {}
  r0_9.NorMailNums = 0
  r0_9.StarMailList = {}
  r0_9.StarMailNums = 0
  local r1_9 = GWorld:GetAvatar()
  if r1_9 then
    if r1_9.MailInbox then
      for r6_9, r7_9 in pairs(r1_9.MailInbox) do
        r0_9.NorMailNums = r0_9.NorMailNums + 1
        r0_9.NormalMailList[r6_9] = {}
        r0_9.NormalMailList[r6_9].RewardGot = r7_9.RewardGot
        r0_9.NormalMailList[r6_9].MailReaded = r7_9.MailReaded
        r0_9.NormalMailList[r6_9].ItemList = r7_9.ItemList
        r0_9.NormalMailList[r6_9].MailDate = r7_9.MailDate
        r0_9.NormalMailList[r6_9].MailId = r7_9.MailId
        r0_9.NormalMailList[r6_9].IsStar = false
        r0_9.NormalMailList[r6_9].DueTime = r0_9:CalculateDueTime(r7_9)
        r0_9.NormalMailList[r6_9].RealDueTime = r0_9:CalcuateRealDueTime(r7_9)
      end
      -- close: r2_9
    end
    if r1_9.StarMails then
      for r6_9, r7_9 in pairs(r1_9.StarMails) do
        r0_9.StarMailNums = r0_9.StarMailNums + 1
        r0_9.StarMailList[r6_9] = {}
        r0_9.StarMailList[r6_9].RewardGot = r7_9.RewardGot
        r0_9.StarMailList[r6_9].MailReaded = r7_9.MailReaded
        r0_9.StarMailList[r6_9].ItemList = r7_9.ItemList
        r0_9.StarMailList[r6_9].MailDate = r7_9.MailDate
        r0_9.StarMailList[r6_9].MailId = r7_9.MailId
        r0_9.StarMailList[r6_9].IsStar = true
        r0_9.StarMailList[r6_9].DueTime = r0_9:CalculateDueTime(r7_9)
        r0_9.StarMailList[r6_9].RealDueTime = r0_9:CalcuateRealDueTime(r7_9)
      end
      -- close: r2_9
    end
  end
  r0_9:UpdateMailNum()
  r0_9.WBP_Com_TabSub01:SelectTab(r0_9.NowTabId)
end
function r2_0.CalculateDueTime(r0_10, r1_10)
  -- line: [184, 197] id: 10
  local r2_10 = CommonConst.MailMaxDueTime
  local r3_10 = r0_0.NowTime()
  if r1_10.MailId == -1 then
    r2_10 = math.max(0, CommonConst.GMMailTimeLimit * CommonConst.SECOND_IN_DAY - r3_10 + r1_10.MailDate)
  else
    local r4_10 = DataMgr.Mail[r1_10.MailId]
    if r4_10.MailTimeLimit == -1 then
      return r2_10
    end
    r2_10 = math.max(0, r4_10.MailTimeLimit * CommonConst.SECOND_IN_DAY - r3_10 + r1_10.MailDate)
  end
  return r2_10
end
function r2_0.CalcuateRealDueTime(r0_11, r1_11)
  -- line: [199, 209] id: 11
  if r1_11.MailId == -1 then
    return r1_11.MailDate + CommonConst.GMMailTimeLimit * CommonConst.SECOND_IN_DAY
  else
    local r2_11 = DataMgr.Mail[r1_11.MailId]
    if r2_11.MailTimeLimit == -1 then
      return nil
    end
    return r1_11.MailDate + r2_11.MailTimeLimit * CommonConst.SECOND_IN_DAY
  end
end
function r2_0.UpdateMailNum(r0_12)
  -- line: [211, 215] id: 12
  local r1_12 = DataMgr.GlobalConstant
  r0_12.Text_NormalMailNum:SetText(r0_12.NorMailNums + r0_12.StarMailNums .. "/" .. math.floor(r1_12.MailMaxSave.ConstantValue))
  r0_12.Text_StarMailNum:SetText(r0_12.StarMailNums .. "/" .. math.floor(r1_12.StarMailMaxSave.ConstantValue))
end
function r2_0.OnSubTabChanged(r0_13, r1_13)
  -- line: [217, 219] id: 13
  r0_13:OnMailListTabClicked(r1_13.Idx, 1)
end
function r2_0.OnMailListTabClicked(r0_14, r1_14, r2_14, r3_14)
  -- line: [221, 261] id: 14
  if not r2_14 then
    r2_14 = 1
  end
  if r0_14.CurContent then
    r0_14.CurContent.IsSelected = false
    r0_14.CurContent.SelfWidget:ClearListItemObjectSelectState()
  end
  r0_14.NowTabId = r1_14
  if r1_14 == 1 then
    r0_14.Button_Receive_All:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_14.Button_DeleteAllRead:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_14:CheckHaveRewardToReceiveAll()
    r0_14:CheckHaveReadToDeleteAll()
  else
    r0_14.Button_Receive_All:ForbidBtn(true)
    r0_14.Button_DeleteAllRead:ForbidBtn(true)
  end
  if r0_14.NowTabId == 1 then
    r0_14.WS_MailNum:SetActiveWidgetIndex(0)
    if r0_14.NorMailNums + r0_14.StarMailNums > 0 then
      r0_14.WS_MailList:SetActiveWidgetIndex(1)
      r0_14:InitListMail(r2_14, r3_14, r0_14.NormalMailList, r0_14.StarMailList)
    else
      r0_14.CurContent = nil
      r0_14.WS_MailList:SetActiveWidgetIndex(0)
      r0_14.WS_MailDetail:SetActiveWidgetIndex(0)
    end
  else
    r0_14.WS_MailNum:SetActiveWidgetIndex(1)
    if r0_14.StarMailNums > 0 then
      r0_14.WS_MailList:SetActiveWidgetIndex(1)
      r0_14:InitListMail(r2_14, r3_14, r0_14.StarMailList)
    else
      r0_14.CurContent = nil
      r0_14.WS_MailList:SetActiveWidgetIndex(0)
      r0_14.WS_MailDetail:SetActiveWidgetIndex(0)
    end
  end
  r0_14:UpdateFocusState("ListMail", r2_14)
  r0_14:InitListReddot()
end
function r2_0.SetMailTabRedDot(r0_15, r1_15)
  -- line: [263, 265] id: 15
  r0_15.Tab01:SetReddotNum(r1_15)
end
function r2_0.CheckHaveRewardToReceiveAll(r0_16)
  -- line: [267, 285] id: 16
  local r1_16 = false
  for r6_16, r7_16 in pairs(r0_16.NormalMailList) do
    if r7_16.RewardGot == 0 then
      r1_16 = true
    end
  end
  -- close: r2_16
  for r6_16, r7_16 in pairs(r0_16.StarMailList) do
    if r7_16.RewardGot == 0 then
      r1_16 = true
    end
  end
  -- close: r2_16
  if r1_16 and r0_16.NowTabId == 1 then
    r0_16.Button_Receive_All:ForbidBtn(false)
  else
    r0_16.Button_Receive_All:ForbidBtn(true)
  end
  return r1_16
end
function r2_0.CheckHaveReadToDeleteAll(r0_17)
  -- line: [287, 300] id: 17
  local r1_17 = false
  for r6_17, r7_17 in pairs(r0_17.NormalMailList) do
    if r7_17.MailReaded == 1 and r7_17.RewardGot == 1 then
      r1_17 = true
    end
  end
  -- close: r2_17
  if r1_17 and r0_17.NowTabId == 1 then
    r0_17.Button_DeleteAllRead:ForbidBtn(false)
  else
    r0_17.Button_DeleteAllRead:ForbidBtn(true)
  end
  return r1_17
end
function r2_0.CheckHaveRewardToReceive(r0_18, r1_18)
  -- line: [302, 308] id: 18
  if r1_18 == 0 then
    r0_18.Button_Receive:ForbidBtn(false)
  else
    r0_18.Button_Receive:ForbidBtn(true)
  end
end
function r2_0.MergeMailList(r0_19, ...)
  -- line: [310, 319] id: 19
  local r1_19 = {}
  for r5_19 = 1, select("#", ...), 1 do
    for r11_19, r12_19 in pairs(select(r5_19, ...)) do
      r1_19[r11_19] = r12_19
    end
    -- close: r7_19
  end
  return r1_19
end
function r2_0.GetMailListData(r0_20, r1_20, ...)
  -- line: [321, 334] id: 20
  local r2_20 = r0_20:MergeMailList(...)
  local r3_20 = nil
  if r1_20 then
    r3_20 = {}
    local r4_20 = r0_20.MailContentList
    if r4_20 then
      for r9_20, r10_20 in ipairs(r4_20) do
        r3_20[r10_20.UniqueId] = r9_20
      end
      -- close: r5_20
    end
  end
  return r2_20, r3_20
end
function r2_0.InitListMail(r0_21, r1_21, r2_21, ...)
  -- line: [336, 394] id: 21
  local r3_21, r4_21 = r0_21:GetMailListData(r2_21, ...)
  local r5_21 = r0_21.List_Mail:GetScrollOffset()
  r0_21.List_Mail:ClearListItems()
  r0_21.MailContentList = {}
  local r6_21 = UE4.LoadClass("/Game/UI/WBP/Mail/Widget/WBP_Mail_List_Item_Content.WBP_Mail_List_Item_Content_C")
  for r11_21, r12_21 in pairs(r3_21) do
    local r13_21 = NewObject(r6_21)
    r13_21.UniqueId = r11_21
    r13_21.MailId = r12_21.MailId
    r13_21.MailReaded = r12_21.MailReaded
    r13_21.MailDate = r12_21.MailDate
    r13_21.RewardGot = r12_21.RewardGot
    r13_21.IsStar = r12_21.IsStar
    r13_21.DueTime = r12_21.DueTime
    r13_21.ParentWidget = r0_21
    r13_21.IsSelected = false
    table.insert(r0_21.MailContentList, r13_21)
  end
  -- close: r7_21
  r0_21:SortListMail(r4_21)
  if #r0_21.MailContentList < r1_21 then
    r1_21 = #r0_21.MailContentList
  end
  r0_21.MailContentList[r1_21].IsSelected = true
  r0_21.SelectMailUniqueId = r0_21.MailContentList[r1_21].UniqueId
  for r11_21, r12_21 in ipairs(r0_21.MailContentList) do
    r12_21.Id = r11_21
    r0_21.List_Mail:AddItem(r12_21)
  end
  -- close: r7_21
  if r0_21:IsExistTimer("AddEmpty") then
    r0_21:RemoveTimer("AddEmpty")
  end
  r0_21:AddTimer(0.01, function()
    -- line: [367, 393] id: 22
    local function r0_22()
      -- line: [368, 375] id: 23
      if r2_21 then
        r0_21.List_Mail:SetScrollOffset(r5_21)
      else
        r0_21.List_Mail:ScrollToTop()
      end
    end
    local r2_22 = UIUtils.GetListViewContentMaxCount(r0_21.List_Mail, r0_21.List_Mail:GetDisplayedEntryWidgets()) - #r0_21.MailContentList
    if r2_22 <= 0 then
      r0_21.List_Mail:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
      r0_21.ScrollBox_MailList:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_22()
      return 
    end
    local r3_22 = UE4.LoadClass("/Game/UI/WBP/Mail/Widget/WBP_Mail_List_Item_Content.WBP_Mail_List_Item_Content_C")
    for r7_22 = 1, r2_22, 1 do
      local r8_22 = NewObject(r3_22)
      r8_22.UniqueId = -1
      r0_21.List_Mail:AddItem(r8_22)
    end
    r0_21.List_Mail:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    r0_21.ScrollBox_MailList:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    r0_22()
  end, false, 0, "AddEmpty")
end
function r2_0.InitListReddot(r0_24)
  -- line: [396, 434] id: 24
  r0_24.List_Mail.OnListViewScrolled:Clear()
  local r1_24 = false
  if r0_24.NowTabId == 1 and r0_24.NorMailNums + r0_24.StarMailNums > 0 then
    r1_24 = true
  elseif r0_24.StarMailNums > 0 then
    r1_24 = true
  end
  if not r1_24 then
    r0_24.GroupListReddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  else
    r0_24.GroupListReddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_24.List_Mail.OnListViewScrolled:Add(r0_24, r0_24.OnList_MailScrolled)
  r0_24:AddTimer(0.1, function()
    -- line: [415, 417] id: 25
    r0_24:OnList_MailScrolled()
  end)
  UIUtils.BindListViewReddotAndNewClickEvent(r0_24.List_Mail, r0_24.List_RedDotTop, r0_24.List_RedDotBottom, nil, nil, function(...)
    -- line: [424, 432] id: 26
    local r0_26 = nil	-- notice: implicit variable refs by block#[0, 2, 5]
    ... = ... -- error: untaken top expr
    if not r0_26 then
      return false, false
    end
    local r1_26 = r0_26.RewardGot == 0
    return r1_26, r0_26.MailReaded == 0
  end)
end
function r2_0.OnList_MailScrolled(r0_27)
  -- line: [436, 473] id: 27
  if not r0_27 then
    return 
  end
  if r0_27.List_MailCooldown then
    r0_27.List_MailPending = true
    return 
  end
  r0_27.List_MailCooldown = true
  r0_27.List_MailPending = false
  r0_27:AddTimer(0.1, function()
    -- line: [445, 452] id: 28
    if not r0_27 then
      return 
    end
    r0_27.List_MailCooldown = false
    if r0_27.List_MailPending then
      r0_27.List_MailPending = false
      r0_27:OnList_MailScrolled()
    end
  end)
  local function r1_27(...)
    -- line: [453, 461] id: 29
    local r0_29 = nil	-- notice: implicit variable refs by block#[0, 2, 5]
    ... = ... -- error: untaken top expr
    if not r0_29 then
      return false, false
    end
    local r1_29 = r0_29.RewardGot == 0
    return r1_29, r0_29.MailReaded == 0
  end
  r0_27:AddTimer(0.033, function()
    -- line: [462, 472] id: 30
    if not r0_27 then
      return 
    end
    UIUtils.UpdateListReddot(r0_27.List_Mail, r0_27.List_RedDotTop, r0_27.List_RedDotBottom, nil, nil, r1_27)
  end)
end
function r2_0.SortListMail(r0_31, r1_31)
  -- line: [475, 506] id: 31
  local r2_31 = {
    "MailDate",
    "DueTime"
  }
  table.sort(r0_31.MailContentList, function(r0_32, r1_32)
    -- line: [477, 505] id: 32
    local r2_32 = r1_31
    if r2_32 then
      r2_32 = r1_31[r0_32.UniqueId] and nil
    else
      goto label_8	-- block#2 is visited secondly
    end
    local r3_32 = r1_31
    if r3_32 then
      r3_32 = r1_31[r1_32.UniqueId] and nil
    else
      goto label_17	-- block#5 is visited secondly
    end
    if r2_32 and r3_32 then
      return r2_32 < r3_32
    elseif r2_32 or r3_32 then
      return r2_32 ~= nil
    end
    if r0_32.RewardGot ~= r1_32.RewardGot then
      return r0_32.RewardGot < r1_32.RewardGot
    end
    if r0_32.MailReaded == r1_32.MailReaded then
      if r0_32.IsStar ~= r1_32.IsStar then
        return r0_32.IsStar
      end
      if r0_32.MailDate == r1_32.MailDate then
        return r0_32.UniqueId < r1_32.UniqueId
      end
      return r1_32.MailDate < r0_32.MailDate
    else
      return r0_32.MailReaded < r1_32.MailReaded
    end
  end)
end
function r2_0.ClearMailListItemClickState(r0_33, r1_33)
  -- line: [508, 513] id: 33
  for r7_33, r8_33 in ipairs(r0_33.List_Mail:GetDisplayedEntryWidgets():ToTable()) do
    r8_33:ClearListItemObjectSelectState(r1_33)
  end
  -- close: r3_33
end
function r2_0.OnMailListItemClicked(r0_34, r1_34)
  -- line: [515, 584] id: 34
  if r0_34.CurContent then
    r0_34.CurContent.IsSelected = false
    r0_34.CurContent.SelfWidget:ClearListItemObjectSelectState()
  end
  r0_34.SelectMailUniqueId = r1_34.UniqueId
  r0_34.CurContent = r1_34
  r0_34.WS_MailDetail:SetActiveWidgetIndex(1)
  local r2_34 = GWorld:GetAvatar()
  local r3_34 = nil
  r3_34 = r0_34:GetMailInfo(r1_34)
  r0_34.Text_MailTitle:SetText(GText(r3_34.MailTitle))
  local r4_34 = r3_34.MailSenderId
  local r5_34 = "Mail_Sender_Default"
  if r4_34 then
    local r6_34 = DataMgr.Npc[r4_34]
    if r6_34 and r6_34.UnitName then
      r5_34 = r6_34.UnitName
    end
  end
  r0_34.Text_From:SetText(GText(r5_34))
  r0_34.Text_MailTime_Title:SetText(GText("UI_Mail_Date_Detail") .. ":")
  r0_34.Text_Time:SetText(r0_0.TimeToYMDStr(r1_34.MailDate, nil, "-"))
  if r1_34.IsStar then
    r0_34.Static_ImageStar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_34.Static_ImageStar:SetRenderOpacity(1)
    r0_34.VX_StarOff:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_34.Static_ImageStar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_34.VX_StarOff:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_34.VX_StarOff:SetRenderOpacity(1)
  end
  r0_34.Text_MailDetail:SetText(GText(r3_34.MailContent))
  r0_34.ScrollBox_TaskDetail:ScrollToStart()
  if r1_34.MailReaded == 0 then
    r0_34:BlockAllUIInput(true)
    r2_34:MarkMailReaded(r1_34.UniqueId)
  end
  if not r3_34.MailReward then
    r0_34.Group_MailDetailItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_34.WS_Bottom:SetActiveWidgetIndex(1)
  else
    r0_34.Group_MailDetailItem:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_34.WS_Bottom:SetActiveWidgetIndex(0)
    r0_34:CheckHaveRewardToReceive(r1_34.RewardGot)
    r0_34:InitTileViewMailGift(r3_34.MailReward, r1_34.RewardGot)
  end
  if r0_34:IsExistTimer("RefreshTabBottomKey") then
    r0_34:RemoveTimer("RefreshTabBottomKey")
  end
  r0_34:AddTimer(0.066, function()
    -- line: [567, 569] id: 35
    r0_34.Parent:RefreshTabBottomKey()
  end, false, 0, "RefreshTabBottomKey")
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_34.Key_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_34.Group_KeyCollect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_34.Key_Collect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_34.Group_KeyDelete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_34.Key_Delete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_34.Key_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
    r0_34.Group_KeyCollect:SetVisibility(ESlateVisibility.Collapsed)
    r0_34.Key_Collect:SetVisibility(ESlateVisibility.Collapsed)
    r0_34.Group_KeyDelete:SetVisibility(ESlateVisibility.Collapsed)
    r0_34.Key_Delete:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.GetMailInfo(r0_36, r1_36)
  -- line: [603, 642] id: 36
  local r2_36 = {}
  local r3_36 = GWorld:GetAvatar()
  local r4_36 = nil
  if r1_36.IsStar then
    r4_36 = r3_36.StarMails[r1_36.UniqueId]
  else
    r4_36 = r3_36.MailInbox[r1_36.UniqueId]
  end
  if r1_36.MailId == -1 then
    r2_36.MailTitle = r4_36.MailTitle[r0_36.CurrentSystemLanguage] and r4_36.MailTitle.CN
    r2_36.MailTimeLimit = CommonConst.GMMailTimeLimit
    r2_36.MailContent = GText(r4_36.MailContent[r0_36.CurrentSystemLanguage] and r4_36.MailContent.CN)
  else
    local r5_36 = DataMgr.Mail[r1_36.MailId]
    r2_36.MailSenderId = r5_36.MailSenderId
    r2_36.MailTimeLimit = r5_36.MailTimeLimit
    local r6_36 = DataMgr.Mail[r1_36.MailId]
    r2_36.MailContent = GText(r6_36.MailContent)
    r2_36.MailTitle = GText(r6_36.MailTitle)
    for r11_36, r12_36 in pairs(r4_36.FormatText and {}) do
      r2_36.MailContent = string.gsub(r2_36.MailContent, "{" .. r11_36 .. "}", GText(r12_36))
      r2_36.MailTitle = string.gsub(r2_36.MailTitle, "{" .. r11_36 .. "}", GText(r12_36))
    end
    -- close: r7_36
  end
  if r4_36.ItemList[1] then
    r2_36.MailReward = r4_36.ItemList
  else
    r2_36.MailReward = nil
  end
  if r2_36.MailContent and string.find(r2_36.MailContent, "href") and string.find(r2_36.MailContent, "Uuid") then
    r2_36.MailContent = string.gsub(r2_36.MailContent, "Uuid", r3_36.Uid)
  end
  r2_36.MailSenderId = r4_36.MailSender
  return r2_36
end
function r2_0.CheckMailHasHref(r0_37)
  -- line: [644, 650] id: 37
  local r1_37 = r0_37.Text_MailDetail:GetText()
  if r0_37.WS_MailDetail:GetActiveWidgetIndex() == 1 and string.find(r1_37, "href") then
    return true
  end
  return false
end
function r2_0.InitTileViewMailGift(r0_38, r1_38, r2_38)
  -- line: [652, 661] id: 38
  r0_38.TileView_MailGift:ClearListItems()
  r0_38.RewardList = {}
  for r7_38, r8_38 in pairs(r1_38) do
    table.insert(r0_38.RewardList, {
      ItemId = r8_38.ItemID,
      TableName = r8_38.ItemType,
      Count = r8_38.ItemNum,
      Rarity = ItemUtils.GetItemRarity(r8_38.ItemID, r8_38.ItemType),
    })
  end
  -- close: r3_38
  r0_38:SortRewardList()
  r0_38:AddRewardListItem(r2_38)
end
function r2_0.SortRewardList(r0_39)
  -- line: [663, 671] id: 39
  table.sort(r0_39.RewardList, function(r0_40, r1_40)
    -- line: [664, 670] id: 40
    if r0_40.Rarity == r1_40.Rarity then
      return r1_40.ItemId < r0_40.ItemId
    else
      return r1_40.Rarity < r0_40.Rarity
    end
  end)
end
function r2_0.AddRewardListItem(r0_41, r1_41)
  -- line: [673, 712] id: 41
  for r6_41, r7_41 in pairs(r0_41.RewardList) do
    local r8_41 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_41.Id = r7_41.ItemId
    r8_41.ItemType = r7_41.TableName
    r8_41.IsShowDetails = true
    if r7_41.TableName == CommonConst.DataType.Char then
      r8_41.IsShowDetails = false
      r8_41.OnMouseButtonUpEvents = {
        Obj = r0_41,
        Callback = r0_41.OpenShowCharDetail,
        Params = {
          r7_41.ItemId
        },
      }
    elseif r7_41.TableName == CommonConst.DataType.Weapon then
      r8_41.IsShowDetails = false
      r8_41.OnMouseButtonUpEvents = {
        Obj = r0_41,
        Callback = r0_41.OpenShowWeaponDetail,
        Params = {
          r7_41.ItemId
        },
      }
    end
    r8_41.Count = r7_41.Count
    r8_41.Icon = ItemUtils.GetItemIconPath(r7_41.ItemId, r7_41.TableName)
    r8_41.Rarity = r7_41.Rarity
    r8_41.ParentWidget = r0_41
    r8_41.UIName = "MailMain"
    if r1_41 == 0 then
      r8_41.bHasGot = false
    else
      r8_41.bHasGot = true
    end
    r8_41.OnMenuOpenChangedEvents = {
      Obj = r0_41,
      Callback = r0_41.ItemMenuAnchorChanged,
    }
    r0_41.TileView_MailGift:AddItem(r8_41)
  end
  -- close: r2_41
  r0_41.TileView_MailGift:RequestPlayEntriesAnim()
end
function r2_0.ItemMenuAnchorChanged(r0_42, r1_42)
  -- line: [714, 724] id: 42
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_42 then
    r0_42.Parent.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_42.TileView_MailGift:SetFocus()
    r0_42.Parent.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end
function r2_0.OpenShowCharDetail(r0_43, r1_43)
  -- line: [726, 735] id: 43
  UIManager(r0_43):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {
      r1_43
    },
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
  })
end
function r2_0.OpenShowWeaponDetail(r0_44, r1_44)
  -- line: [737, 746] id: 44
  UIManager(r0_44):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = {
      r1_44
    },
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
  })
end
function r2_0.SetTileListGotState(r0_45)
  -- line: [757, 764] id: 45
  for r4_45 = 0, r0_45.TileView_MailGift:GetNumItems() + -1, 1 do
    local r5_45 = r0_45.TileView_MailGift:GetItemAt(r4_45)
    if r5_45 and r5_45.SelfWidget and r5_45.SelfWidget.SetIsGot then
      r5_45.SelfWidget:SetIsGot(true)
    end
  end
end
function r2_0.OnUpdateUIStyleByInputTypeChange(r0_46, r1_46, r2_46)
  -- line: [766, 773] id: 46
  r0_46.Super.OnUpdateUIStyleByInputTypeChange(r0_46, r1_46, r2_46)
  if r1_46 == ECommonInputType.Gamepad then
    r0_46:InitGamepadView()
  else
    r0_46:InitKeyboardView()
  end
end
function r2_0.InitGamepadView(r0_47)
  -- line: [775, 782] id: 47
  local r3_47 = "ListMail"
  local r4_47 = r0_47.CurContent
  if r4_47 then
    r4_47 = r0_47.CurContent.Id and 0
  else
    goto label_9	-- block#2 is visited secondly
  end
  r0_47:UpdateFocusState(r3_47, r4_47)
  r0_47.Key_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_47.Group_KeyCollect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_47.Key_Collect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_47.Group_KeyDelete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_47.Key_Delete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end
function r2_0.InitKeyboardView(r0_48)
  -- line: [784, 790] id: 48
  r0_48.Key_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
  r0_48.Group_KeyCollect:SetVisibility(ESlateVisibility.Collapsed)
  r0_48.Key_Collect:SetVisibility(ESlateVisibility.Collapsed)
  r0_48.Group_KeyDelete:SetVisibility(ESlateVisibility.Collapsed)
  r0_48.Key_Delete:SetVisibility(ESlateVisibility.Collapsed)
end
function r2_0.OnMailRootPreviewKeyDown(r0_49, r1_49, r2_49)
  -- line: [792, 809] id: 49
  local r4_49 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_49))
  if r4_49 == UIConst.GamePadKey.DPadRight and r0_49.GamePadState == "ListMail" and r0_49:CheckMailHasHref() then
    r0_49:UpdateFocusState("Hyperlink")
  elseif r0_49.GamePadState == "Hyperlink" and r0_49.CurrentUrlWidgetIndex >= 0 then
    if r0_49.CurrentUrlWidgetIndex == 0 and r4_49 == UIConst.GamePadKey.DPadLeft then
      r0_49:ResetFocusState()
    elseif r4_49 == UIConst.GamePadKey.DPadUp or r4_49 == UIConst.GamePadKey.DPadLeft then
      r0_49.CurrentUrlWidgetIndex = r0_49.Text_MailDetail:FindLastFocsableUrlWidget(r0_49.CurrentUrlWidgetIndex)
    elseif r4_49 == UIConst.GamePadKey.DPadDown or r4_49 == UIConst.GamePadKey.DPadRight then
      r0_49.CurrentUrlWidgetIndex = r0_49.Text_MailDetail:FindNextFocusableUrlWidget(r0_49.CurrentUrlWidgetIndex)
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.OnMailRootKeyDown(r0_50, r1_50, r2_50)
  -- line: [811, 833] id: 50
  local r4_50 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_50))
  local r5_50 = false
  if UE4.UKismetStringLibrary.StartsWith(r4_50, "GamePad") then
    r5_50 = r0_50:OnGamePadDown(r4_50)
  elseif r4_50 == "Escape" then
    r0_50.Parent:OnPressESC()
  elseif r4_50 == "SpaceBar" then
    r0_50:OnPressSPACE()
  elseif r4_50 == "F11" then
    r0_50:AddTimer(0.5, r0_50.SetFocus, false, 0, "ReSetFocus")
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_50, "LevelEditor.ToggleImmersive")
  elseif r4_50 == "A" and r0_50.NowTabId ~= 1 then
    AudioManager(r0_50):PlayUISound(r0_50, "event:/ui/common/click_level_02", nil, nil)
    r0_50.WBP_Com_TabSub01:TabToLeft()
  elseif r4_50 == "D" and r0_50.NowTabId ~= 2 then
    AudioManager(r0_50):PlayUISound(r0_50, "event:/ui/common/click_level_02", nil, nil)
    r0_50.WBP_Com_TabSub01:TabToRight()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.OnGamePadDown(r0_51, r1_51)
  -- line: [835, 870] id: 51
  local r2_51 = false
  if r1_51 == UIConst.GamePadKey.LeftTriggerThreshold or r1_51 == UIConst.GamePadKey.RightTriggerThreshold and r0_51.GamePadState == "ListMail" then
    r0_51.WBP_Com_TabSub01:Handle_KeyEventOnGamePad(r1_51)
  elseif r1_51 == UIConst.GamePadKey.FaceButtonLeft and r0_51.GamePadState == "ListMail" then
    r0_51:OnClickButtonDeleteAllRead()
  elseif r1_51 == UIConst.GamePadKey.RightThumb and r0_51.GamePadState == "ListMail" then
    r0_51:OnClickDeleteMail()
  elseif r1_51 == UIConst.GamePadKey.FaceButtonBottom and r0_51.GamePadState == "ListMail" then
    r0_51:OnClickButtonReceive()
  elseif r1_51 == UIConst.GamePadKey.FaceButtonTop and r0_51.GamePadState == "ListMail" then
    r0_51:OnClickButtonReceiveAll()
  elseif r1_51 == UIConst.GamePadKey.SpecialRight and r0_51.GamePadState == "ListMail" then
    r0_51:OnClickButtonCollect()
  elseif r1_51 == UIConst.GamePadKey.LeftThumb and r0_51.Group_MailDetailItem:IsVisible() then
    if r0_51.GamePadState == "ListReward" then
      r0_51:UpdateFocusState("ListMail")
    else
      r0_51:UpdateFocusState("ListReward")
    end
  elseif r0_51.GamePadState ~= "ListMail" then
    if r1_51 == UIConst.GamePadKey.FaceButtonRight then
      local r5_51 = "ListMail"
      local r6_51 = r0_51.CurContent
      if r6_51 then
        r6_51 = r0_51.CurContent.Id and 0
      else
        goto label_112	-- block#28 is visited secondly
      end
      r0_51:UpdateFocusState(r5_51, r6_51)
      r2_51 = true
    end
  else
    r2_51 = r0_51.Parent.Common_Tab:Handle_KeyEventOnGamePad(r1_51)
  end
  return r2_51
end
function r2_0.OnAnalogValueChanged(r0_52, r1_52, r2_52)
  -- line: [872, 898] id: 52
  local r4_52 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_52))
  local r5_52 = UKismetInputLibrary.GetAnalogValue(r2_52) * 5
  if r4_52 == UIConst.GamePadKey.RightAnalogY and r0_52.GamePadState == "ListMail" then
    r0_52.ScrollBox_TaskDetail:SetScrollOffset(math.clamp(r0_52.ScrollBox_TaskDetail:GetScrollOffset() - r5_52, 0, r0_52.ScrollBox_TaskDetail:GetScrollOffsetOfEnd()))
  elseif r4_52 == UIConst.GamePadKey.LeftAnalogX then
    local r6_52 = UKismetInputLibrary.GetAnalogValue(r2_52)
    if r6_52 <= -1 and r0_52.GamePadState == "Hyperlink" then
      local r9_52 = "ListMail"
      local r10_52 = r0_52.CurContent
      if r10_52 then
        r10_52 = r0_52.CurContent.Id and 0
      else
        goto label_64	-- block#8 is visited secondly
      end
      r0_52:UpdateFocusState(r9_52, r10_52)
    elseif r6_52 >= 1 and r0_52.GamePadState == "ListMail" and r0_52:CheckMailHasHref() then
      r0_52:UpdateFocusState("Hyperlink")
    end
  elseif r4_52 == UIConst.GamePadKey.LeftAnalogY then
    local r6_52 = UKismetInputLibrary.GetAnalogValue(r2_52)
    local r7_52 = r0_52.GamePadState
    if r7_52 == "Hyperlink" then
      if r6_52 <= 0 then
        r7_52 = "Next" and "Last"
      else
        goto label_97	-- block#18 is visited secondly
      end
      r0_52:OnNavigatUrlWithAxis(math.abs(r6_52), r7_52)
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.ResetFocusState(r0_53)
  -- line: [900, 904] id: 53
  r0_53.CurrentUrlWidgetIndex = -1
  r0_53.GamePadState = "ListMail"
  local r3_53 = "ListMail"
  local r4_53 = r0_53.CurContent
  if r4_53 then
    r4_53 = r0_53.CurContent.Id and 0
  else
    goto label_11	-- block#2 is visited secondly
  end
  r0_53:UpdateFocusState(r3_53, r4_53)
end
function r2_0.UpdateFocusState(r0_54, r1_54, r2_54)
  -- line: [906, 946] id: 54
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_54:IsExistTimer("SetFocus") then
    r0_54:RemoveTimer("SetFocus")
  end
  if r0_54.GamePadState == "GetItemPage" then
    return 
  end
  r0_54.GamePadState = r1_54
  r0_54:SetCommonGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
  if r1_54 == "ListMail" then
    if r0_54.NowTabId == 1 or r0_54.NowTabId == 2 and r0_54.StarMailNums > 0 then
      r0_54:AddTimer(0.066, function()
        -- line: [925, 932] id: 55
        if r0_54.GamePadState == "GetItemPage" then
          return 
        end
        if CommonUtils:IfExistSystemGuideUI(r0_54) then
          return 
        end
        local r0_55 = r0_54.List_Mail
        local r2_55 = r2_54
        if r2_55 then
          r2_55 = r2_54 + -1 and 0
        else
          goto label_21	-- block#6 is visited secondly
        end
        r0_55:NavigateToIndex(r2_55)
      end, false, 0, "SetFocus")
    else
      r0_54:SetFocus()
    end
  elseif r1_54 == "Hyperlink" then
    r0_54:SetIsDealWithVirtualAccept(false)
    r0_54.CurrentUrlWidgetIndex = r0_54.Text_MailDetail:NavigateToUrlWidget()
    r0_54:SetCommonGamePadVisibility(ESlateVisibility.Collapsed)
    r0_54.Parent.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif r1_54 == "ListReward" then
    r0_54.TileView_MailGift:SetFocus()
    r0_54:SetCommonGamePadVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.OnNavigatUrlWithAxis(r0_56, r1_56, r2_56)
  -- line: [948, 961] id: 56
  local r3_56 = 0.5 < r1_56
  if not r0_56.bWasLeftStickPressedLast and r3_56 then
    r0_56.bWasLeftStickPressedLast = true
    if r2_56 == "Last" then
      r0_56.CurrentUrlWidgetIndex = r0_56.Text_MailDetail:FindLastFocsableUrlWidget(r0_56.CurrentUrlWidgetIndex)
    elseif r2_56 == "Next" then
      r0_56.CurrentUrlWidgetIndex = r0_56.Text_MailDetail:FindNextFocusableUrlWidget(r0_56.CurrentUrlWidgetIndex)
    end
  elseif r0_56.bWasLeftStickPressedLast and not r3_56 then
    r0_56.bWasLeftStickPressedLast = false
  end
end
function r2_0.SetCommonGamePadVisibility(r0_57, r1_57)
  -- line: [963, 976] id: 57
  r0_57.WBP_Com_TabSub01.Key_Left:SetVisibility(r1_57)
  r0_57.WBP_Com_TabSub01.Key_Right:SetVisibility(r1_57)
  r0_57.Key_RewardTitle:SetVisibility(r1_57)
  r0_57.Parent:RefreshTabBottomKey()
  r0_57.Group_KeyCollect:SetVisibility(r1_57)
  r0_57.Key_Collect:SetVisibility(r1_57)
  r0_57.Group_KeyDelete:SetVisibility(r1_57)
  r0_57.Key_Delete:SetVisibility(r1_57)
  r0_57.Button_DeleteAllRead:SetGamePadVisibility(r1_57)
  r0_57.Button_Receive_All:SetGamePadVisibility(r1_57)
  r0_57.Button_Receive:SetGamePadVisibility(r1_57)
end
function r2_0.OnClickButtonCollect(r0_58)
  -- line: [978, 1014] id: 58
  if not r0_58.CurContent then
    return 
  end
  local r1_58 = GWorld:GetAvatar()
  local r2_58 = r0_58.CurContent.IsStar
  local r3_58 = nil	-- notice: implicit variable refs by block#[10, 11]
  if r2_58 then
    r2_58 = r0_58.CurContent
    function r3_58()
      -- line: [984, 987] id: 59
      r0_58:BlockAllUIInput(true)
      r1_58:CancelMailStar(r2_58.UniqueId)
    end
    local r4_58 = r0_58.StarMailList[r2_58.UniqueId]
    local r5_58 = r4_58 and r4_58.RealDueTime
    if r5_58 and r5_58 <= r0_0.NowTime() then
      UIManager(r0_58):ShowCommonPopupUI(100196, {
        LeftCallbackFunction = function()
          -- line: [993, 995] id: 60
        end,
        RightCallbackFunction = function()
          -- line: [996, 998] id: 61
          r3_58()
        end,
      })
    else
      r3_58()
    end
    -- close: r2_58
  else
    r2_58 = DataMgr
    r2_58 = r2_58.GlobalConstant
    r3_58 = r0_58.StarMailNums
    if r3_58 == r2_58.StarMailMaxSave.ConstantValue then
      r3_58 = ErrorCode
      r3_58 = r3_58.RET_MAIL_STAR_FULL
      UIManager(r0_58):ShowError(r3_58)
      return 
    end
    r0_58:BlockAllUIInput(true)
    r1_58:MarkMailStar(r0_58.CurContent.UniqueId)
  end
end
function r2_0.OnPressSPACE(r0_62)
  -- line: [1016, 1018] id: 62
  r0_62:OnClickButtonReceiveAll()
end
function r2_0.OnClickButtonReceiveAll(r0_63)
  -- line: [1020, 1027] id: 63
  if not r0_63.CurContent then
    return 
  end
  if not r0_63:CheckHaveRewardToReceiveAll() then
    return 
  end
  if r0_63.NowTabId ~= 1 then
    return 
  end
  local r1_63 = GWorld:GetAvatar()
  r0_63:BlockAllUIInput(true)
  r1_63:GetAllMailReward()
end
function r2_0.OnClickButtonReceive(r0_64)
  -- line: [1029, 1040] id: 64
  if not r0_64.CurContent then
    return 
  end
  local r1_64 = r0_64:GetMailInfo(r0_64.CurContent)
  if r0_64.CurContent.RewardGot == 1 or r1_64.MailReward == nil then
    return 
  else
    local r2_64 = GWorld:GetAvatar()
    r0_64:BlockAllUIInput(true)
    r2_64:GetMailRewards(r0_64.CurContent.UniqueId)
  end
end
function r2_0.OnClickButtonDeleteAllRead(r0_65)
  -- line: [1042, 1055] id: 65
  if r0_65.NowTabId ~= 1 then
    return 
  end
  local r1_65 = GWorld:GetAvatar()
  if not r1_65 then
    return 
  end
  UIManager(r0_65):ShowCommonPopupUI(100194, {
    LeftCallbackFunction = function()
      -- line: [1047, 1049] id: 66
      r0_65:BlockAllUIInput(false)
    end,
    RightCallbackFunction = function()
      -- line: [1050, 1053] id: 67
      r0_65:BlockAllUIInput(true)
      r1_65:DeleteReadedMails()
    end,
  })
end
function r2_0.OnClickDeleteMail(r0_68)
  -- line: [1057, 1071] id: 68
  if not r0_68.CurContent then
    return 
  end
  local r1_68 = GWorld:GetAvatar()
  if not r1_68 then
    return 
  end
  local r2_68 = r0_68.CurContent.UniqueId
  UIManager(r0_68):ShowCommonPopupUI(100195, {
    LeftCallbackFunction = function()
      -- line: [1063, 1065] id: 69
      r0_68:BlockAllUIInput(false)
    end,
    RightCallbackFunction = function()
      -- line: [1066, 1069] id: 70
      r0_68:BlockAllUIInput(true)
      r1_68:DeleteMail(r2_68)
    end,
  })
end
function r2_0.BindEventOnSelectionsChanged(r0_71)
  -- line: [1073, 1075] id: 71
  r0_71:OnMailListTabClicked(r0_71.NowTabId, 1)
end
function r2_0.BindEventOnSortTypeChanged(r0_72)
  -- line: [1077, 1079] id: 72
  r0_72:OnMailListTabClicked(r0_72.NowTabId, 1)
end
function r2_0.OnPressESC(r0_73)
  -- line: [1081, 1083] id: 73
  r0_73:PlayOutAnim()
end
function r2_0.GetMailRewardIds(r0_74, r1_74)
  -- line: [1085, 1129] id: 74
  local r2_74 = {}
  if type(r1_74) == "table" then
    for r7_74, r8_74 in pairs(r1_74) do
      local r9_74 = nil
      if r0_74.NormalMailList[r8_74] then
        r9_74 = r0_74.NormalMailList[r8_74].ItemList
      else
        r9_74 = r0_74.StarMailList[r8_74].ItemList
      end
      for r14_74, r15_74 in pairs(r9_74) do
        if r2_74[r15_74.ItemType .. "s"] then
          if r2_74[r15_74.ItemType .. "s"][r15_74.ItemID] then
            r2_74[r15_74.ItemType .. "s"][r15_74.ItemID] = r2_74[(r15_74.ItemType .. "s")][r15_74.ItemID] + r15_74.ItemNum
          else
            r2_74[r15_74.ItemType .. "s"][r15_74.ItemID] = r15_74.ItemNum
          end
        else
          r2_74[r15_74.ItemType .. "s"] = {}
          r2_74[r15_74.ItemType .. "s"][r15_74.ItemID] = r15_74.ItemNum
        end
      end
      -- close: r10_74
    end
    -- close: r3_74
  elseif type(r1_74) == "number" then
    local r3_74 = nil
    if r0_74.NormalMailList[r1_74] then
      r3_74 = r0_74.NormalMailList[r1_74].ItemList
    else
      r3_74 = r0_74.StarMailList[r1_74].ItemList
    end
    for r8_74, r9_74 in pairs(r3_74) do
      if r2_74[r9_74.ItemType .. "s"] then
        if r2_74[r9_74.ItemType .. "s"][r9_74.ItemID] then
          r2_74[r9_74.ItemType .. "s"][r9_74.ItemID] = r2_74[(r9_74.ItemType .. "s")][r9_74.ItemID] + r9_74.ItemNum
        else
          r2_74[r9_74.ItemType .. "s"][r9_74.ItemID] = r9_74.ItemNum
        end
      else
        r2_74[r9_74.ItemType .. "s"] = {}
        r2_74[r9_74.ItemType .. "s"][r9_74.ItemID] = r9_74.ItemNum
      end
    end
    -- close: r4_74
  end
  return r2_74
end
function r2_0.OnGetMailRewards(r0_75, r1_75, r2_75, r3_75)
  -- line: [1131, 1161] id: 75
  if r1_75 == ErrorCode.RET_SUCCESS then
    r0_75:BlockAllUIInput(false)
    if r0_75.NormalMailList[r2_75] then
      r0_75.NormalMailList[r2_75].RewardGot = 1
      r0_75.NormalMailList[r2_75].MailReaded = 1
    end
    if r0_75.StarMailList[r2_75] then
      r0_75.StarMailList[r2_75].RewardGot = 1
      r0_75.StarMailList[r2_75].MailReaded = 1
    end
    local r4_75 = r0_75:GetMailRewardIds(r3_75)
    r0_75.GamePadState = "GetItemPage"
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r4_75, false, function(r0_76)
      -- line: [1144, 1147] id: 76
      r0_75:ResetFocusState()
      r0_75:CheckHaveRewardToReceive(r0_75.CurContent.RewardGot)
    end, r0_75)
    r0_75:SetTileListGotState()
    r0_75.CurContent.RewardGot = 1
    r0_75.CurContent.MailReaded = 1
    if not r0_75:CheckHaveRewardToReceiveAll() then
      r0_75.Parent:RefreshTabBottomKey()
    end
    r0_75:CheckHaveReadToDeleteAll()
    r0_75.CurContent.SelfWidget:SetListItemObjectReadState()
    r0_75.CurContent.SelfWidget:SetListItemObjectRewardGotState()
  else
    r0_75:HandleAvatarRet(r1_75)
  end
end
function r2_0.OnGetAllMailReward(r0_77, r1_77, r2_77)
  -- line: [1163, 1177] id: 77
  if r1_77 == ErrorCode.RET_SUCCESS then
    r0_77:BlockAllUIInput(false)
    if r2_77 then
      local r3_77 = r0_77:GetMailRewardIds(r2_77)
      r0_77.GamePadState = "GetItemPage"
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r3_77, false, function()
        -- line: [1169, 1171] id: 78
        r0_77:ResetFocusState()
      end, r0_77)
    end
    r0_77:InitMailMain()
  else
    r0_77:HandleAvatarRet(r1_77)
  end
end
function r2_0.OnMarkMailStar(r0_79, r1_79, r2_79, r3_79)
  -- line: [1179, 1196] id: 79
  if r1_79 == ErrorCode.RET_SUCCESS then
    r0_79:BlockAllUIInput(false)
    r0_79.StarUniqueId = r2_79
    if r0_79.NormalMailList[r2_79].RewardGot ~= 1 and r0_79.NormalMailList[r2_79].ItemList[1] then
      local r4_79 = r0_79:GetMailRewardIds(r2_79)
      r0_79.NormalMailList[r2_79].RewardGot = 1
      r0_79.GamePadState = "GetItemPage"
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r4_79, false, function(r0_80)
        -- line: [1187, 1189] id: 80
        r0_79:PlayStarAnim()
      end, r0_79)
    else
      r0_79:PlayStarAnim()
    end
  else
    r0_79:HandleAvatarRet(r1_79)
  end
end
function r2_0.PlayStarAnim(r0_81)
  -- line: [1198, 1221] id: 81
  r0_81:PlayAnimation(r0_81.Collect)
  r0_81.CurContent.IsStar = true
  r0_81.NormalMailList[r0_81.StarUniqueId].IsStar = true
  r0_81.NormalMailList[r0_81.StarUniqueId].MailReaded = 1
  r0_81.NormalMailList[r0_81.StarUniqueId] = nil
  r0_81.StarMailList[r0_81.StarUniqueId] = r0_81.NormalMailList[r0_81.StarUniqueId]
  local r2_81 = r0_81.CurContent.Id
  r0_81.StarMailNums = r0_81.StarMailNums + 1
  r0_81.NorMailNums = r0_81.NorMailNums + -1
  r0_81.CurContent.SelfWidget:PlayAnimation(r0_81.CurContent.SelfWidget.List_Collect)
  if r0_81:IsExistTimer("StarMail") then
    r0_81:RemoveTimer("StarMail")
  end
  r0_81:AddTimer(r0_81.CurContent.SelfWidget.List_Collect:GetEndTime(), function()
    -- line: [1213, 1218] id: 82
    r0_81:BlockAllUIInput(false)
    r0_81:ResetFocusState()
    r0_81:OnMailListTabClicked(r0_81.NowTabId, r2_81, true)
    r0_81:UpdateMailNum()
  end, false, 0, "StarMail", true)
end
function r2_0.OnCancelMailStar(r0_83, r1_83, r2_83)
  -- line: [1224, 1250] id: 83
  if r1_83 == ErrorCode.RET_SUCCESS then
    r0_83:PlayAnimation(r0_83.UnCollect)
    r0_83.CurContent.IsStar = false
    r0_83.StarMailList[r2_83] = nil
    r0_83.NormalMailList[r2_83] = r0_83.StarMailList[r2_83]
    r0_83.NormalMailList[r2_83].IsStar = false
    local r4_83 = r0_83.CurContent.Id
    r0_83.StarMailNums = r0_83.StarMailNums + -1
    r0_83.NorMailNums = r0_83.NorMailNums + 1
    UIManager(r0_83):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Mail_Remove"))
    if r0_83:IsExistTimer("CancelStar") then
      r0_83:RemoveTimer("CancelStar")
    end
    r0_83:AddTimer(r0_83.UnCollect:GetEndTime(), function()
      -- line: [1239, 1244] id: 84
      r0_83:BlockAllUIInput(false)
      r0_83:OnMailListTabClicked(r0_83.NowTabId, r4_83, r0_83.NowTabId == 1)
      r0_83:UpdateMailNum()
    end, false, 0, "CancelStar")
    -- close: r3_83
  else
    r0_83:HandleAvatarRet(r1_83)
  end
end
function r2_0.OnMarkMailReaded(r0_85, r1_85, r2_85)
  -- line: [1252, 1279] id: 85
  if r1_85 == ErrorCode.RET_SUCCESS then
    local r3_85 = nil
    if r0_85:GetMailInfo(r0_85.CurContent).MailReward == nil then
      if r0_85.NormalMailList[r2_85] then
        r0_85.NormalMailList[r2_85].RewardGot = 1
      end
      if r0_85.StarMailList[r2_85] then
        r0_85.StarMailList[r2_85].RewardGot = 1
      end
      r0_85.CurContent.RewardGot = 1
    end
    if r0_85.NormalMailList[r2_85] then
      r0_85.NormalMailList[r2_85].MailReaded = 1
    end
    if r0_85.StarMailList[r2_85] then
      r0_85.StarMailList[r2_85].MailReaded = 1
    end
    r0_85.CurContent.MailReaded = 1
    r0_85.CurContent.SelfWidget:SetListItemObjectReadState()
    r0_85.CurContent.SelfWidget:SetListItemObjectRewardGotState()
    r0_85:BlockAllUIInput(false)
    r0_85:CheckHaveReadToDeleteAll()
  else
    r0_85:HandleAvatarRet(r1_85)
  end
end
function r2_0.OnDeleteMail(r0_86, r1_86, r2_86)
  -- line: [1281, 1285] id: 86
  r0_86:BlockAllUIInput(false)
  UIManager(r0_86):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Mail_Delete_Success"))
  r0_86:InitMailMain()
end
function r2_0.HandleAvatarRet(r0_87, r1_87)
  -- line: [1287, 1295] id: 87
  r0_87:BlockAllUIInput(false)
  if DataMgr.ErrorCode[r1_87] then
    UIManager(r0_87):ShowError(r1_87)
  else
    UIManager(r0_87):ShowUITip(UIConst.Tip_CommonToast, GText("Unknown_Error"), 1.5)
  end
end
function r2_0.PlayInAnim(r0_88)
  -- line: [1297, 1299] id: 88
end
function r2_0.PlayOutAnim(r0_89)
  -- line: [1301, 1303] id: 89
end
return r2_0
