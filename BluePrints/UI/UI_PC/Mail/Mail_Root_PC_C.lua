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
  -- line: [221, 270] id: 14
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
  if r0_14.List_Mail:GetNumItems() > 0 and r0_14.WS_MailList:GetActiveWidgetIndex() == 1 then
    r0_14.List_Mail.BP_OnEntryInitialized:Add(r0_14, function()
      -- line: [260, 265] id: 15
      r0_14:AddTimer(0.1, function()
        -- line: [261, 263] id: 16
        r0_14:UpdateFocusState("ListMail", r2_14)
      end)
      r0_14.List_Mail.BP_OnEntryInitialized:Clear()
    end)
  else
    r0_14:UpdateFocusState("ListMail", r2_14)
  end
  r0_14:InitListReddot()
end
function r2_0.SetMailTabRedDot(r0_17, r1_17)
  -- line: [272, 274] id: 17
  r0_17.Tab01:SetReddotNum(r1_17)
end
function r2_0.CheckHaveRewardToReceiveAll(r0_18)
  -- line: [276, 294] id: 18
  local r1_18 = false
  for r6_18, r7_18 in pairs(r0_18.NormalMailList) do
    if r7_18.RewardGot == 0 then
      r1_18 = true
    end
  end
  -- close: r2_18
  for r6_18, r7_18 in pairs(r0_18.StarMailList) do
    if r7_18.RewardGot == 0 then
      r1_18 = true
    end
  end
  -- close: r2_18
  if r1_18 and r0_18.NowTabId == 1 then
    r0_18.Button_Receive_All:ForbidBtn(false)
  else
    r0_18.Button_Receive_All:ForbidBtn(true)
  end
  return r1_18
end
function r2_0.CheckHaveReadToDeleteAll(r0_19)
  -- line: [296, 309] id: 19
  local r1_19 = false
  for r6_19, r7_19 in pairs(r0_19.NormalMailList) do
    if r7_19.MailReaded == 1 and r7_19.RewardGot == 1 then
      r1_19 = true
    end
  end
  -- close: r2_19
  if r1_19 and r0_19.NowTabId == 1 then
    r0_19.Button_DeleteAllRead:ForbidBtn(false)
  else
    r0_19.Button_DeleteAllRead:ForbidBtn(true)
  end
  return r1_19
end
function r2_0.CheckHaveRewardToReceive(r0_20, r1_20)
  -- line: [311, 317] id: 20
  if r1_20 == 0 then
    r0_20.Button_Receive:ForbidBtn(false)
  else
    r0_20.Button_Receive:ForbidBtn(true)
  end
end
function r2_0.MergeMailList(r0_21, ...)
  -- line: [319, 328] id: 21
  local r1_21 = {}
  for r5_21 = 1, select("#", ...), 1 do
    for r11_21, r12_21 in pairs(select(r5_21, ...)) do
      r1_21[r11_21] = r12_21
    end
    -- close: r7_21
  end
  return r1_21
end
function r2_0.GetMailListData(r0_22, r1_22, ...)
  -- line: [330, 343] id: 22
  local r2_22 = r0_22:MergeMailList(...)
  local r3_22 = nil
  if r1_22 then
    r3_22 = {}
    local r4_22 = r0_22.MailContentList
    if r4_22 then
      for r9_22, r10_22 in ipairs(r4_22) do
        r3_22[r10_22.UniqueId] = r9_22
      end
      -- close: r5_22
    end
  end
  return r2_22, r3_22
end
function r2_0.InitListMail(r0_23, r1_23, r2_23, ...)
  -- line: [345, 403] id: 23
  local r3_23, r4_23 = r0_23:GetMailListData(r2_23, ...)
  local r5_23 = r0_23.List_Mail:GetScrollOffset()
  r0_23.List_Mail:ClearListItems()
  r0_23.MailContentList = {}
  local r6_23 = UE4.LoadClass("/Game/UI/WBP/Mail/Widget/WBP_Mail_List_Item_Content.WBP_Mail_List_Item_Content_C")
  for r11_23, r12_23 in pairs(r3_23) do
    local r13_23 = NewObject(r6_23)
    r13_23.UniqueId = r11_23
    r13_23.MailId = r12_23.MailId
    r13_23.MailReaded = r12_23.MailReaded
    r13_23.MailDate = r12_23.MailDate
    r13_23.RewardGot = r12_23.RewardGot
    r13_23.IsStar = r12_23.IsStar
    r13_23.DueTime = r12_23.DueTime
    r13_23.ParentWidget = r0_23
    r13_23.IsSelected = false
    table.insert(r0_23.MailContentList, r13_23)
  end
  -- close: r7_23
  r0_23:SortListMail(r4_23)
  if #r0_23.MailContentList < r1_23 then
    r1_23 = #r0_23.MailContentList
  end
  r0_23.MailContentList[r1_23].IsSelected = true
  r0_23.SelectMailUniqueId = r0_23.MailContentList[r1_23].UniqueId
  for r11_23, r12_23 in ipairs(r0_23.MailContentList) do
    r12_23.Id = r11_23
    r0_23.List_Mail:AddItem(r12_23)
  end
  -- close: r7_23
  if r0_23:IsExistTimer("AddEmpty") then
    r0_23:RemoveTimer("AddEmpty")
  end
  r0_23:AddTimer(0.01, function()
    -- line: [376, 402] id: 24
    local function r0_24()
      -- line: [377, 384] id: 25
      if r2_23 then
        r0_23.List_Mail:SetScrollOffset(r5_23)
      else
        r0_23.List_Mail:ScrollToTop()
      end
    end
    local r2_24 = UIUtils.GetListViewContentMaxCount(r0_23.List_Mail, r0_23.List_Mail:GetDisplayedEntryWidgets()) - #r0_23.MailContentList
    if r2_24 <= 0 then
      r0_23.List_Mail:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
      r0_23.ScrollBox_MailList:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_24()
      return 
    end
    local r3_24 = UE4.LoadClass("/Game/UI/WBP/Mail/Widget/WBP_Mail_List_Item_Content.WBP_Mail_List_Item_Content_C")
    for r7_24 = 1, r2_24, 1 do
      local r8_24 = NewObject(r3_24)
      r8_24.UniqueId = -1
      r0_23.List_Mail:AddItem(r8_24)
    end
    r0_23.List_Mail:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    r0_23.ScrollBox_MailList:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    r0_24()
  end, false, 0, "AddEmpty")
end
function r2_0.InitListReddot(r0_26)
  -- line: [405, 443] id: 26
  r0_26.List_Mail.OnListViewScrolled:Clear()
  local r1_26 = false
  if r0_26.NowTabId == 1 and r0_26.NorMailNums + r0_26.StarMailNums > 0 then
    r1_26 = true
  elseif r0_26.StarMailNums > 0 then
    r1_26 = true
  end
  if not r1_26 then
    r0_26.GroupListReddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  else
    r0_26.GroupListReddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_26.List_Mail.OnListViewScrolled:Add(r0_26, r0_26.OnList_MailScrolled)
  r0_26:AddTimer(0.1, function()
    -- line: [424, 426] id: 27
    r0_26:OnList_MailScrolled()
  end)
  UIUtils.BindListViewReddotAndNewClickEvent(r0_26.List_Mail, r0_26.List_RedDotTop, r0_26.List_RedDotBottom, nil, nil, function(...)
    -- line: [433, 441] id: 28
    local r0_28 = nil	-- notice: implicit variable refs by block#[0, 2, 5]
    ... = ... -- error: untaken top expr
    if not r0_28 then
      return false, false
    end
    local r1_28 = r0_28.RewardGot == 0
    return r1_28, r0_28.MailReaded == 0
  end)
end
function r2_0.OnList_MailScrolled(r0_29)
  -- line: [445, 482] id: 29
  if not r0_29 then
    return 
  end
  if r0_29.List_MailCooldown then
    r0_29.List_MailPending = true
    return 
  end
  r0_29.List_MailCooldown = true
  r0_29.List_MailPending = false
  r0_29:AddTimer(0.1, function()
    -- line: [454, 461] id: 30
    if not r0_29 then
      return 
    end
    r0_29.List_MailCooldown = false
    if r0_29.List_MailPending then
      r0_29.List_MailPending = false
      r0_29:OnList_MailScrolled()
    end
  end)
  local function r1_29(...)
    -- line: [462, 470] id: 31
    local r0_31 = nil	-- notice: implicit variable refs by block#[0, 2, 5]
    ... = ... -- error: untaken top expr
    if not r0_31 then
      return false, false
    end
    local r1_31 = r0_31.RewardGot == 0
    return r1_31, r0_31.MailReaded == 0
  end
  r0_29:AddTimer(0.033, function()
    -- line: [471, 481] id: 32
    if not r0_29 then
      return 
    end
    UIUtils.UpdateListReddot(r0_29.List_Mail, r0_29.List_RedDotTop, r0_29.List_RedDotBottom, nil, nil, r1_29)
  end)
end
function r2_0.SortListMail(r0_33, r1_33)
  -- line: [484, 515] id: 33
  local r2_33 = {
    "MailDate",
    "DueTime"
  }
  table.sort(r0_33.MailContentList, function(r0_34, r1_34)
    -- line: [486, 514] id: 34
    local r2_34 = r1_33
    if r2_34 then
      r2_34 = r1_33[r0_34.UniqueId] and nil
    else
      goto label_8	-- block#2 is visited secondly
    end
    local r3_34 = r1_33
    if r3_34 then
      r3_34 = r1_33[r1_34.UniqueId] and nil
    else
      goto label_17	-- block#5 is visited secondly
    end
    if r2_34 and r3_34 then
      return r2_34 < r3_34
    elseif r2_34 or r3_34 then
      return r2_34 ~= nil
    end
    if r0_34.RewardGot ~= r1_34.RewardGot then
      return r0_34.RewardGot < r1_34.RewardGot
    end
    if r0_34.MailReaded == r1_34.MailReaded then
      if r0_34.IsStar ~= r1_34.IsStar then
        return r0_34.IsStar
      end
      if r0_34.MailDate == r1_34.MailDate then
        return r0_34.UniqueId < r1_34.UniqueId
      end
      return r1_34.MailDate < r0_34.MailDate
    else
      return r0_34.MailReaded < r1_34.MailReaded
    end
  end)
end
function r2_0.ClearMailListItemClickState(r0_35, r1_35)
  -- line: [517, 522] id: 35
  for r7_35, r8_35 in ipairs(r0_35.List_Mail:GetDisplayedEntryWidgets():ToTable()) do
    r8_35:ClearListItemObjectSelectState(r1_35)
  end
  -- close: r3_35
end
function r2_0.OnMailListItemClicked(r0_36, r1_36)
  -- line: [524, 593] id: 36
  if r0_36.CurContent then
    r0_36.CurContent.IsSelected = false
    r0_36.CurContent.SelfWidget:ClearListItemObjectSelectState()
  end
  r0_36.SelectMailUniqueId = r1_36.UniqueId
  r0_36.CurContent = r1_36
  r0_36.WS_MailDetail:SetActiveWidgetIndex(1)
  local r2_36 = GWorld:GetAvatar()
  local r3_36 = nil
  r3_36 = r0_36:GetMailInfo(r1_36)
  r0_36.Text_MailTitle:SetText(GText(r3_36.MailTitle))
  local r4_36 = r3_36.MailSenderId
  local r5_36 = "Mail_Sender_Default"
  if r4_36 then
    local r6_36 = DataMgr.Npc[r4_36]
    if r6_36 and r6_36.UnitName then
      r5_36 = r6_36.UnitName
    end
  end
  r0_36.Text_From:SetText(GText(r5_36))
  r0_36.Text_MailTime_Title:SetText(GText("UI_Mail_Date_Detail") .. ":")
  r0_36.Text_Time:SetText(r0_0.TimeToYMDStr(r1_36.MailDate, nil, "-"))
  if r1_36.IsStar then
    r0_36.Static_ImageStar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_36.Static_ImageStar:SetRenderOpacity(1)
    r0_36.VX_StarOff:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_36.Static_ImageStar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_36.VX_StarOff:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_36.VX_StarOff:SetRenderOpacity(1)
  end
  r0_36.Text_MailDetail:SetText(GText(r3_36.MailContent))
  r0_36.ScrollBox_TaskDetail:ScrollToStart()
  if r1_36.MailReaded == 0 then
    r0_36:BlockAllUIInput(true)
    r2_36:MarkMailReaded(r1_36.UniqueId)
  end
  if not r3_36.MailReward then
    r0_36.Group_MailDetailItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_36.WS_Bottom:SetActiveWidgetIndex(1)
  else
    r0_36.Group_MailDetailItem:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_36.WS_Bottom:SetActiveWidgetIndex(0)
    r0_36:CheckHaveRewardToReceive(r1_36.RewardGot)
    r0_36:InitTileViewMailGift(r3_36.MailReward, r1_36.RewardGot)
  end
  if r0_36:IsExistTimer("RefreshTabBottomKey") then
    r0_36:RemoveTimer("RefreshTabBottomKey")
  end
  r0_36:AddTimer(0.066, function()
    -- line: [576, 578] id: 37
    r0_36.Parent:RefreshTabBottomKey()
  end, false, 0, "RefreshTabBottomKey")
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_36.Key_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_36.Group_KeyCollect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_36.Key_Collect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_36.Group_KeyDelete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_36.Key_Delete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_36.Key_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
    r0_36.Group_KeyCollect:SetVisibility(ESlateVisibility.Collapsed)
    r0_36.Key_Collect:SetVisibility(ESlateVisibility.Collapsed)
    r0_36.Group_KeyDelete:SetVisibility(ESlateVisibility.Collapsed)
    r0_36.Key_Delete:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.GetMailInfo(r0_38, r1_38)
  -- line: [612, 651] id: 38
  local r2_38 = {}
  local r3_38 = GWorld:GetAvatar()
  local r4_38 = nil
  if r1_38.IsStar then
    r4_38 = r3_38.StarMails[r1_38.UniqueId]
  else
    r4_38 = r3_38.MailInbox[r1_38.UniqueId]
  end
  if r1_38.MailId == -1 then
    r2_38.MailTitle = r4_38.MailTitle[r0_38.CurrentSystemLanguage] and r4_38.MailTitle.CN
    r2_38.MailTimeLimit = CommonConst.GMMailTimeLimit
    r2_38.MailContent = GText(r4_38.MailContent[r0_38.CurrentSystemLanguage] and r4_38.MailContent.CN)
  else
    local r5_38 = DataMgr.Mail[r1_38.MailId]
    r2_38.MailSenderId = r5_38.MailSenderId
    r2_38.MailTimeLimit = r5_38.MailTimeLimit
    local r6_38 = DataMgr.Mail[r1_38.MailId]
    r2_38.MailContent = GText(r6_38.MailContent)
    r2_38.MailTitle = GText(r6_38.MailTitle)
    for r11_38, r12_38 in pairs(r4_38.FormatText and {}) do
      r2_38.MailContent = string.gsub(r2_38.MailContent, "{" .. r11_38 .. "}", GText(r12_38))
      r2_38.MailTitle = string.gsub(r2_38.MailTitle, "{" .. r11_38 .. "}", GText(r12_38))
    end
    -- close: r7_38
  end
  if r4_38.ItemList[1] then
    r2_38.MailReward = r4_38.ItemList
  else
    r2_38.MailReward = nil
  end
  if r2_38.MailContent and string.find(r2_38.MailContent, "href") and string.find(r2_38.MailContent, "Uuid") then
    r2_38.MailContent = string.gsub(r2_38.MailContent, "Uuid", r3_38.Uid)
  end
  r2_38.MailSenderId = r4_38.MailSender
  return r2_38
end
function r2_0.CheckMailHasHref(r0_39)
  -- line: [653, 659] id: 39
  local r1_39 = r0_39.Text_MailDetail:GetText()
  if r0_39.WS_MailDetail:GetActiveWidgetIndex() == 1 and string.find(r1_39, "href") then
    return true
  end
  return false
end
function r2_0.InitTileViewMailGift(r0_40, r1_40, r2_40)
  -- line: [661, 670] id: 40
  r0_40.TileView_MailGift:ClearListItems()
  r0_40.RewardList = {}
  for r7_40, r8_40 in pairs(r1_40) do
    table.insert(r0_40.RewardList, {
      ItemId = r8_40.ItemID,
      TableName = r8_40.ItemType,
      Count = r8_40.ItemNum,
      Rarity = ItemUtils.GetItemRarity(r8_40.ItemID, r8_40.ItemType),
    })
  end
  -- close: r3_40
  r0_40:SortRewardList()
  r0_40:AddRewardListItem(r2_40)
end
function r2_0.SortRewardList(r0_41)
  -- line: [672, 680] id: 41
  table.sort(r0_41.RewardList, function(r0_42, r1_42)
    -- line: [673, 679] id: 42
    if r0_42.Rarity == r1_42.Rarity then
      return r1_42.ItemId < r0_42.ItemId
    else
      return r1_42.Rarity < r0_42.Rarity
    end
  end)
end
function r2_0.AddRewardListItem(r0_43, r1_43)
  -- line: [682, 721] id: 43
  for r6_43, r7_43 in pairs(r0_43.RewardList) do
    local r8_43 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_43.Id = r7_43.ItemId
    r8_43.ItemType = r7_43.TableName
    r8_43.IsShowDetails = true
    if r7_43.TableName == CommonConst.DataType.Char then
      r8_43.IsShowDetails = false
      r8_43.OnMouseButtonUpEvents = {
        Obj = r0_43,
        Callback = r0_43.OpenShowCharDetail,
        Params = {
          r7_43.ItemId
        },
      }
    elseif r7_43.TableName == CommonConst.DataType.Weapon then
      r8_43.IsShowDetails = false
      r8_43.OnMouseButtonUpEvents = {
        Obj = r0_43,
        Callback = r0_43.OpenShowWeaponDetail,
        Params = {
          r7_43.ItemId
        },
      }
    end
    r8_43.Count = r7_43.Count
    r8_43.Icon = ItemUtils.GetItemIconPath(r7_43.ItemId, r7_43.TableName)
    r8_43.Rarity = r7_43.Rarity
    r8_43.ParentWidget = r0_43
    r8_43.UIName = "MailMain"
    if r1_43 == 0 then
      r8_43.bHasGot = false
    else
      r8_43.bHasGot = true
    end
    r8_43.OnMenuOpenChangedEvents = {
      Obj = r0_43,
      Callback = r0_43.ItemMenuAnchorChanged,
    }
    r0_43.TileView_MailGift:AddItem(r8_43)
  end
  -- close: r2_43
  r0_43.TileView_MailGift:RequestPlayEntriesAnim()
end
function r2_0.ItemMenuAnchorChanged(r0_44, r1_44)
  -- line: [723, 733] id: 44
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_44 then
    r0_44.Parent.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_44.TileView_MailGift:SetFocus()
    r0_44.Parent.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end
function r2_0.OpenShowCharDetail(r0_45, r1_45)
  -- line: [735, 744] id: 45
  UIManager(r0_45):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {
      r1_45
    },
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
  })
end
function r2_0.OpenShowWeaponDetail(r0_46, r1_46)
  -- line: [746, 755] id: 46
  UIManager(r0_46):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = {
      r1_46
    },
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
  })
end
function r2_0.SetTileListGotState(r0_47)
  -- line: [766, 773] id: 47
  for r4_47 = 0, r0_47.TileView_MailGift:GetNumItems() + -1, 1 do
    local r5_47 = r0_47.TileView_MailGift:GetItemAt(r4_47)
    if r5_47 and r5_47.SelfWidget and r5_47.SelfWidget.SetIsGot then
      r5_47.SelfWidget:SetIsGot(true)
    end
  end
end
function r2_0.OnUpdateUIStyleByInputTypeChange(r0_48, r1_48, r2_48)
  -- line: [775, 782] id: 48
  r0_48.Super.OnUpdateUIStyleByInputTypeChange(r0_48, r1_48, r2_48)
  if r1_48 == ECommonInputType.Gamepad and IsValid(r0_48.Parent) and r0_48.Parent:HasAnyFocus() then
    r0_48:InitGamepadView()
  else
    r0_48:InitKeyboardView()
  end
end
function r2_0.InitGamepadView(r0_49)
  -- line: [784, 791] id: 49
  local r3_49 = "ListMail"
  local r4_49 = r0_49.CurContent
  if r4_49 then
    r4_49 = r0_49.CurContent.Id and 0
  else
    goto label_9	-- block#2 is visited secondly
  end
  r0_49:UpdateFocusState(r3_49, r4_49)
  r0_49.Key_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_49.Group_KeyCollect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_49.Key_Collect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_49.Group_KeyDelete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_49.Key_Delete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end
function r2_0.InitKeyboardView(r0_50)
  -- line: [793, 799] id: 50
  r0_50.Key_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
  r0_50.Group_KeyCollect:SetVisibility(ESlateVisibility.Collapsed)
  r0_50.Key_Collect:SetVisibility(ESlateVisibility.Collapsed)
  r0_50.Group_KeyDelete:SetVisibility(ESlateVisibility.Collapsed)
  r0_50.Key_Delete:SetVisibility(ESlateVisibility.Collapsed)
end
function r2_0.OnMailRootPreviewKeyDown(r0_51, r1_51, r2_51)
  -- line: [801, 818] id: 51
  local r4_51 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_51))
  if r4_51 == UIConst.GamePadKey.DPadRight and r0_51.GamePadState == "ListMail" and r0_51:CheckMailHasHref() then
    r0_51:UpdateFocusState("Hyperlink")
  elseif r0_51.GamePadState == "Hyperlink" and r0_51.CurrentUrlWidgetIndex >= 0 then
    if r0_51.CurrentUrlWidgetIndex == 0 and r4_51 == UIConst.GamePadKey.DPadLeft then
      r0_51:ResetFocusState()
    elseif r4_51 == UIConst.GamePadKey.DPadUp or r4_51 == UIConst.GamePadKey.DPadLeft then
      r0_51.CurrentUrlWidgetIndex = r0_51.Text_MailDetail:FindLastFocsableUrlWidget(r0_51.CurrentUrlWidgetIndex)
    elseif r4_51 == UIConst.GamePadKey.DPadDown or r4_51 == UIConst.GamePadKey.DPadRight then
      r0_51.CurrentUrlWidgetIndex = r0_51.Text_MailDetail:FindNextFocusableUrlWidget(r0_51.CurrentUrlWidgetIndex)
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.OnMailRootKeyDown(r0_52, r1_52, r2_52)
  -- line: [820, 842] id: 52
  local r4_52 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_52))
  local r5_52 = false
  if UE4.UKismetStringLibrary.StartsWith(r4_52, "GamePad") then
    r5_52 = r0_52:OnGamePadDown(r4_52)
  elseif r4_52 == "Escape" then
    r0_52.Parent:OnPressESC()
  elseif r4_52 == "SpaceBar" then
    r0_52:OnPressSPACE()
  elseif r4_52 == "F11" then
    r0_52:AddTimer(0.5, r0_52.SetFocus, false, 0, "ReSetFocus")
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_52, "LevelEditor.ToggleImmersive")
  elseif r4_52 == "A" and r0_52.NowTabId ~= 1 then
    AudioManager(r0_52):PlayUISound(r0_52, "event:/ui/common/click_level_02", nil, nil)
    r0_52.WBP_Com_TabSub01:TabToLeft()
  elseif r4_52 == "D" and r0_52.NowTabId ~= 2 then
    AudioManager(r0_52):PlayUISound(r0_52, "event:/ui/common/click_level_02", nil, nil)
    r0_52.WBP_Com_TabSub01:TabToRight()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.OnGamePadDown(r0_53, r1_53)
  -- line: [844, 879] id: 53
  local r2_53 = false
  if r1_53 == UIConst.GamePadKey.LeftTriggerThreshold or r1_53 == UIConst.GamePadKey.RightTriggerThreshold and r0_53.GamePadState == "ListMail" then
    r0_53.WBP_Com_TabSub01:Handle_KeyEventOnGamePad(r1_53)
  elseif r1_53 == UIConst.GamePadKey.FaceButtonLeft and r0_53.GamePadState == "ListMail" then
    r0_53:OnClickButtonDeleteAllRead()
  elseif r1_53 == UIConst.GamePadKey.RightThumb and r0_53.GamePadState == "ListMail" then
    r0_53:OnClickDeleteMail()
  elseif r1_53 == UIConst.GamePadKey.FaceButtonBottom and r0_53.GamePadState == "ListMail" then
    r0_53:OnClickButtonReceive()
  elseif r1_53 == UIConst.GamePadKey.FaceButtonTop and r0_53.GamePadState == "ListMail" then
    r0_53:OnClickButtonReceiveAll()
  elseif r1_53 == UIConst.GamePadKey.SpecialRight and r0_53.GamePadState == "ListMail" then
    r0_53:OnClickButtonCollect()
  elseif r1_53 == UIConst.GamePadKey.LeftThumb and r0_53.Group_MailDetailItem:IsVisible() then
    if r0_53.GamePadState == "ListReward" then
      r0_53:UpdateFocusState("ListMail")
    else
      r0_53:UpdateFocusState("ListReward")
    end
  elseif r0_53.GamePadState ~= "ListMail" then
    if r1_53 == UIConst.GamePadKey.FaceButtonRight then
      local r5_53 = "ListMail"
      local r6_53 = r0_53.CurContent
      if r6_53 then
        r6_53 = r0_53.CurContent.Id and 0
      else
        goto label_112	-- block#28 is visited secondly
      end
      r0_53:UpdateFocusState(r5_53, r6_53)
      r2_53 = true
    end
  else
    r2_53 = r0_53.Parent.Common_Tab:Handle_KeyEventOnGamePad(r1_53)
  end
  return r2_53
end
function r2_0.OnAnalogValueChanged(r0_54, r1_54, r2_54)
  -- line: [881, 907] id: 54
  local r4_54 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_54))
  local r5_54 = UKismetInputLibrary.GetAnalogValue(r2_54) * 5
  if r4_54 == UIConst.GamePadKey.RightAnalogY and r0_54.GamePadState == "ListMail" then
    r0_54.ScrollBox_TaskDetail:SetScrollOffset(math.clamp(r0_54.ScrollBox_TaskDetail:GetScrollOffset() - r5_54, 0, r0_54.ScrollBox_TaskDetail:GetScrollOffsetOfEnd()))
  elseif r4_54 == UIConst.GamePadKey.LeftAnalogX then
    local r6_54 = UKismetInputLibrary.GetAnalogValue(r2_54)
    if r6_54 <= -1 and r0_54.GamePadState == "Hyperlink" then
      local r9_54 = "ListMail"
      local r10_54 = r0_54.CurContent
      if r10_54 then
        r10_54 = r0_54.CurContent.Id and 0
      else
        goto label_64	-- block#8 is visited secondly
      end
      r0_54:UpdateFocusState(r9_54, r10_54)
    elseif r6_54 >= 1 and r0_54.GamePadState == "ListMail" and r0_54:CheckMailHasHref() then
      r0_54:UpdateFocusState("Hyperlink")
    end
  elseif r4_54 == UIConst.GamePadKey.LeftAnalogY then
    local r6_54 = UKismetInputLibrary.GetAnalogValue(r2_54)
    local r7_54 = r0_54.GamePadState
    if r7_54 == "Hyperlink" then
      if r6_54 <= 0 then
        r7_54 = "Next" and "Last"
      else
        goto label_97	-- block#18 is visited secondly
      end
      r0_54:OnNavigatUrlWithAxis(math.abs(r6_54), r7_54)
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.ResetFocusState(r0_55)
  -- line: [909, 913] id: 55
  r0_55.CurrentUrlWidgetIndex = -1
  r0_55.GamePadState = "ListMail"
  local r3_55 = "ListMail"
  local r4_55 = r0_55.CurContent
  if r4_55 then
    r4_55 = r0_55.CurContent.Id and 0
  else
    goto label_11	-- block#2 is visited secondly
  end
  r0_55:UpdateFocusState(r3_55, r4_55)
end
function r2_0.UpdateFocusState(r0_56, r1_56, r2_56)
  -- line: [915, 955] id: 56
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_56:IsExistTimer("SetFocus") then
    r0_56:RemoveTimer("SetFocus")
  end
  if r0_56.GamePadState == "GetItemPage" then
    return 
  end
  r0_56.GamePadState = r1_56
  r0_56:SetCommonGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
  if r1_56 == "ListMail" then
    if r0_56.NowTabId == 1 or r0_56.NowTabId == 2 and r0_56.StarMailNums > 0 then
      r0_56:AddTimer(0.066, function()
        -- line: [934, 941] id: 57
        if r0_56.GamePadState == "GetItemPage" then
          return 
        end
        if CommonUtils:IfExistSystemGuideUI(r0_56) then
          return 
        end
        local r0_57 = r0_56.List_Mail
        local r2_57 = r2_56
        if r2_57 then
          r2_57 = r2_56 + -1 and 0
        else
          goto label_21	-- block#6 is visited secondly
        end
        r0_57:NavigateToIndex(r2_57)
      end, false, 0, "SetFocus")
    else
      r0_56:SetFocus()
    end
  elseif r1_56 == "Hyperlink" then
    r0_56:SetIsDealWithVirtualAccept(false)
    r0_56.CurrentUrlWidgetIndex = r0_56.Text_MailDetail:NavigateToUrlWidget()
    r0_56:SetCommonGamePadVisibility(ESlateVisibility.Collapsed)
    r0_56.Parent.Common_Tab.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif r1_56 == "ListReward" then
    r0_56.TileView_MailGift:SetFocus()
    r0_56:SetCommonGamePadVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.OnNavigatUrlWithAxis(r0_58, r1_58, r2_58)
  -- line: [957, 970] id: 58
  local r3_58 = 0.5 < r1_58
  if not r0_58.bWasLeftStickPressedLast and r3_58 then
    r0_58.bWasLeftStickPressedLast = true
    if r2_58 == "Last" then
      r0_58.CurrentUrlWidgetIndex = r0_58.Text_MailDetail:FindLastFocsableUrlWidget(r0_58.CurrentUrlWidgetIndex)
    elseif r2_58 == "Next" then
      r0_58.CurrentUrlWidgetIndex = r0_58.Text_MailDetail:FindNextFocusableUrlWidget(r0_58.CurrentUrlWidgetIndex)
    end
  elseif r0_58.bWasLeftStickPressedLast and not r3_58 then
    r0_58.bWasLeftStickPressedLast = false
  end
end
function r2_0.SetCommonGamePadVisibility(r0_59, r1_59)
  -- line: [972, 987] id: 59
  r0_59.WBP_Com_TabSub01.Key_Left:SetVisibility(r1_59)
  r0_59.WBP_Com_TabSub01.Key_Right:SetVisibility(r1_59)
  r0_59.Key_RewardTitle:SetVisibility(r1_59)
  if r0_59.Parent then
    r0_59.Parent:RefreshTabBottomKey()
  end
  r0_59.Group_KeyCollect:SetVisibility(r1_59)
  r0_59.Key_Collect:SetVisibility(r1_59)
  r0_59.Group_KeyDelete:SetVisibility(r1_59)
  r0_59.Key_Delete:SetVisibility(r1_59)
  r0_59.Button_DeleteAllRead:SetGamePadVisibility(r1_59)
  r0_59.Button_Receive_All:SetGamePadVisibility(r1_59)
  r0_59.Button_Receive:SetGamePadVisibility(r1_59)
end
function r2_0.OnClickButtonCollect(r0_60)
  -- line: [989, 1025] id: 60
  if not r0_60.CurContent then
    return 
  end
  local r1_60 = GWorld:GetAvatar()
  local r2_60 = r0_60.CurContent.IsStar
  local r3_60 = nil	-- notice: implicit variable refs by block#[10, 11]
  if r2_60 then
    r2_60 = r0_60.CurContent
    function r3_60()
      -- line: [995, 998] id: 61
      r0_60:BlockAllUIInput(true)
      r1_60:CancelMailStar(r2_60.UniqueId)
    end
    local r4_60 = r0_60.StarMailList[r2_60.UniqueId]
    local r5_60 = r4_60 and r4_60.RealDueTime
    if r5_60 and r5_60 <= r0_0.NowTime() then
      UIManager(r0_60):ShowCommonPopupUI(100196, {
        LeftCallbackFunction = function()
          -- line: [1004, 1006] id: 62
        end,
        RightCallbackFunction = function()
          -- line: [1007, 1009] id: 63
          r3_60()
        end,
      })
    else
      r3_60()
    end
    -- close: r2_60
  else
    r2_60 = DataMgr
    r2_60 = r2_60.GlobalConstant
    r3_60 = r0_60.StarMailNums
    if r3_60 == r2_60.StarMailMaxSave.ConstantValue then
      r3_60 = ErrorCode
      r3_60 = r3_60.RET_MAIL_STAR_FULL
      UIManager(r0_60):ShowError(r3_60)
      return 
    end
    r0_60:BlockAllUIInput(true)
    r1_60:MarkMailStar(r0_60.CurContent.UniqueId)
  end
end
function r2_0.OnPressSPACE(r0_64)
  -- line: [1027, 1029] id: 64
  r0_64:OnClickButtonReceiveAll()
end
function r2_0.OnClickButtonReceiveAll(r0_65)
  -- line: [1031, 1038] id: 65
  if not r0_65.CurContent then
    return 
  end
  if not r0_65:CheckHaveRewardToReceiveAll() then
    return 
  end
  if r0_65.NowTabId ~= 1 then
    return 
  end
  local r1_65 = GWorld:GetAvatar()
  r0_65:BlockAllUIInput(true)
  r1_65:GetAllMailReward()
end
function r2_0.OnClickButtonReceive(r0_66)
  -- line: [1040, 1051] id: 66
  if not r0_66.CurContent then
    return 
  end
  local r1_66 = r0_66:GetMailInfo(r0_66.CurContent)
  if r0_66.CurContent.RewardGot == 1 or r1_66.MailReward == nil then
    return 
  else
    local r2_66 = GWorld:GetAvatar()
    r0_66:BlockAllUIInput(true)
    r2_66:GetMailRewards(r0_66.CurContent.UniqueId)
  end
end
function r2_0.OnClickButtonDeleteAllRead(r0_67)
  -- line: [1053, 1066] id: 67
  if r0_67.NowTabId ~= 1 then
    return 
  end
  local r1_67 = GWorld:GetAvatar()
  if not r1_67 then
    return 
  end
  UIManager(r0_67):ShowCommonPopupUI(100194, {
    LeftCallbackFunction = function()
      -- line: [1058, 1060] id: 68
      r0_67:BlockAllUIInput(false)
    end,
    RightCallbackFunction = function()
      -- line: [1061, 1064] id: 69
      r0_67:BlockAllUIInput(true)
      r1_67:DeleteReadedMails()
    end,
  })
end
function r2_0.OnClickDeleteMail(r0_70)
  -- line: [1068, 1082] id: 70
  if not r0_70.CurContent then
    return 
  end
  local r1_70 = GWorld:GetAvatar()
  if not r1_70 then
    return 
  end
  local r2_70 = r0_70.CurContent.UniqueId
  UIManager(r0_70):ShowCommonPopupUI(100195, {
    LeftCallbackFunction = function()
      -- line: [1074, 1076] id: 71
      r0_70:BlockAllUIInput(false)
    end,
    RightCallbackFunction = function()
      -- line: [1077, 1080] id: 72
      r0_70:BlockAllUIInput(true)
      r1_70:DeleteMail(r2_70)
    end,
  })
end
function r2_0.BindEventOnSelectionsChanged(r0_73)
  -- line: [1084, 1086] id: 73
  r0_73:OnMailListTabClicked(r0_73.NowTabId, 1)
end
function r2_0.BindEventOnSortTypeChanged(r0_74)
  -- line: [1088, 1090] id: 74
  r0_74:OnMailListTabClicked(r0_74.NowTabId, 1)
end
function r2_0.OnPressESC(r0_75)
  -- line: [1092, 1094] id: 75
  r0_75:PlayOutAnim()
end
function r2_0.GetMailRewardIds(r0_76, r1_76)
  -- line: [1096, 1140] id: 76
  local r2_76 = {}
  if type(r1_76) == "table" then
    for r7_76, r8_76 in pairs(r1_76) do
      local r9_76 = nil
      if r0_76.NormalMailList[r8_76] then
        r9_76 = r0_76.NormalMailList[r8_76].ItemList
      else
        r9_76 = r0_76.StarMailList[r8_76].ItemList
      end
      for r14_76, r15_76 in pairs(r9_76) do
        if r2_76[r15_76.ItemType .. "s"] then
          if r2_76[r15_76.ItemType .. "s"][r15_76.ItemID] then
            r2_76[r15_76.ItemType .. "s"][r15_76.ItemID] = r2_76[(r15_76.ItemType .. "s")][r15_76.ItemID] + r15_76.ItemNum
          else
            r2_76[r15_76.ItemType .. "s"][r15_76.ItemID] = r15_76.ItemNum
          end
        else
          r2_76[r15_76.ItemType .. "s"] = {}
          r2_76[r15_76.ItemType .. "s"][r15_76.ItemID] = r15_76.ItemNum
        end
      end
      -- close: r10_76
    end
    -- close: r3_76
  elseif type(r1_76) == "number" then
    local r3_76 = nil
    if r0_76.NormalMailList[r1_76] then
      r3_76 = r0_76.NormalMailList[r1_76].ItemList
    else
      r3_76 = r0_76.StarMailList[r1_76].ItemList
    end
    for r8_76, r9_76 in pairs(r3_76) do
      if r2_76[r9_76.ItemType .. "s"] then
        if r2_76[r9_76.ItemType .. "s"][r9_76.ItemID] then
          r2_76[r9_76.ItemType .. "s"][r9_76.ItemID] = r2_76[(r9_76.ItemType .. "s")][r9_76.ItemID] + r9_76.ItemNum
        else
          r2_76[r9_76.ItemType .. "s"][r9_76.ItemID] = r9_76.ItemNum
        end
      else
        r2_76[r9_76.ItemType .. "s"] = {}
        r2_76[r9_76.ItemType .. "s"][r9_76.ItemID] = r9_76.ItemNum
      end
    end
    -- close: r4_76
  end
  return r2_76
end
function r2_0.OnGetMailRewards(r0_77, r1_77, r2_77, r3_77)
  -- line: [1142, 1172] id: 77
  if r1_77 == ErrorCode.RET_SUCCESS then
    r0_77:BlockAllUIInput(false)
    if r0_77.NormalMailList[r2_77] then
      r0_77.NormalMailList[r2_77].RewardGot = 1
      r0_77.NormalMailList[r2_77].MailReaded = 1
    end
    if r0_77.StarMailList[r2_77] then
      r0_77.StarMailList[r2_77].RewardGot = 1
      r0_77.StarMailList[r2_77].MailReaded = 1
    end
    local r4_77 = r0_77:GetMailRewardIds(r3_77)
    r0_77.GamePadState = "GetItemPage"
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r4_77, false, function(r0_78)
      -- line: [1155, 1158] id: 78
      r0_77:ResetFocusState()
      r0_77:CheckHaveRewardToReceive(r0_77.CurContent.RewardGot)
    end, r0_77)
    r0_77:SetTileListGotState()
    r0_77.CurContent.RewardGot = 1
    r0_77.CurContent.MailReaded = 1
    if not r0_77:CheckHaveRewardToReceiveAll() then
      r0_77.Parent:RefreshTabBottomKey()
    end
    r0_77:CheckHaveReadToDeleteAll()
    r0_77.CurContent.SelfWidget:SetListItemObjectReadState()
    r0_77.CurContent.SelfWidget:SetListItemObjectRewardGotState()
  else
    r0_77:HandleAvatarRet(r1_77)
  end
end
function r2_0.OnGetAllMailReward(r0_79, r1_79, r2_79)
  -- line: [1174, 1188] id: 79
  if r1_79 == ErrorCode.RET_SUCCESS then
    r0_79:BlockAllUIInput(false)
    if r2_79 then
      local r3_79 = r0_79:GetMailRewardIds(r2_79)
      r0_79.GamePadState = "GetItemPage"
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r3_79, false, function()
        -- line: [1180, 1182] id: 80
        r0_79:ResetFocusState()
      end, r0_79)
    end
    r0_79:InitMailMain()
  else
    r0_79:HandleAvatarRet(r1_79)
  end
end
function r2_0.OnMarkMailStar(r0_81, r1_81, r2_81, r3_81)
  -- line: [1190, 1207] id: 81
  if r1_81 == ErrorCode.RET_SUCCESS then
    r0_81:BlockAllUIInput(false)
    r0_81.StarUniqueId = r2_81
    if r0_81.NormalMailList[r2_81].RewardGot ~= 1 and r0_81.NormalMailList[r2_81].ItemList[1] then
      local r4_81 = r0_81:GetMailRewardIds(r2_81)
      r0_81.NormalMailList[r2_81].RewardGot = 1
      r0_81.GamePadState = "GetItemPage"
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r4_81, false, function(r0_82)
        -- line: [1198, 1200] id: 82
        r0_81:PlayStarAnim()
      end, r0_81)
    else
      r0_81:PlayStarAnim()
    end
  else
    r0_81:HandleAvatarRet(r1_81)
  end
end
function r2_0.PlayStarAnim(r0_83)
  -- line: [1209, 1232] id: 83
  r0_83:PlayAnimation(r0_83.Collect)
  r0_83.CurContent.IsStar = true
  r0_83.NormalMailList[r0_83.StarUniqueId].IsStar = true
  r0_83.NormalMailList[r0_83.StarUniqueId].MailReaded = 1
  r0_83.NormalMailList[r0_83.StarUniqueId] = nil
  r0_83.StarMailList[r0_83.StarUniqueId] = r0_83.NormalMailList[r0_83.StarUniqueId]
  local r2_83 = r0_83.CurContent.Id
  r0_83.StarMailNums = r0_83.StarMailNums + 1
  r0_83.NorMailNums = r0_83.NorMailNums + -1
  r0_83.CurContent.SelfWidget:PlayAnimation(r0_83.CurContent.SelfWidget.List_Collect)
  if r0_83:IsExistTimer("StarMail") then
    r0_83:RemoveTimer("StarMail")
  end
  r0_83:AddTimer(r0_83.CurContent.SelfWidget.List_Collect:GetEndTime(), function()
    -- line: [1224, 1229] id: 84
    r0_83:BlockAllUIInput(false)
    r0_83:ResetFocusState()
    r0_83:OnMailListTabClicked(r0_83.NowTabId, r2_83, true)
    r0_83:UpdateMailNum()
  end, false, 0, "StarMail", true)
end
function r2_0.OnCancelMailStar(r0_85, r1_85, r2_85)
  -- line: [1235, 1261] id: 85
  if r1_85 == ErrorCode.RET_SUCCESS then
    r0_85:PlayAnimation(r0_85.UnCollect)
    r0_85.CurContent.IsStar = false
    r0_85.StarMailList[r2_85] = nil
    r0_85.NormalMailList[r2_85] = r0_85.StarMailList[r2_85]
    r0_85.NormalMailList[r2_85].IsStar = false
    local r4_85 = r0_85.CurContent.Id
    r0_85.StarMailNums = r0_85.StarMailNums + -1
    r0_85.NorMailNums = r0_85.NorMailNums + 1
    UIManager(r0_85):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Mail_Remove"))
    if r0_85:IsExistTimer("CancelStar") then
      r0_85:RemoveTimer("CancelStar")
    end
    r0_85:AddTimer(r0_85.UnCollect:GetEndTime(), function()
      -- line: [1250, 1255] id: 86
      r0_85:BlockAllUIInput(false)
      r0_85:OnMailListTabClicked(r0_85.NowTabId, r4_85, r0_85.NowTabId == 1)
      r0_85:UpdateMailNum()
    end, false, 0, "CancelStar")
    -- close: r3_85
  else
    r0_85:HandleAvatarRet(r1_85)
  end
end
function r2_0.OnMarkMailReaded(r0_87, r1_87, r2_87)
  -- line: [1263, 1290] id: 87
  if r1_87 == ErrorCode.RET_SUCCESS then
    local r3_87 = nil
    if r0_87:GetMailInfo(r0_87.CurContent).MailReward == nil then
      if r0_87.NormalMailList[r2_87] then
        r0_87.NormalMailList[r2_87].RewardGot = 1
      end
      if r0_87.StarMailList[r2_87] then
        r0_87.StarMailList[r2_87].RewardGot = 1
      end
      r0_87.CurContent.RewardGot = 1
    end
    if r0_87.NormalMailList[r2_87] then
      r0_87.NormalMailList[r2_87].MailReaded = 1
    end
    if r0_87.StarMailList[r2_87] then
      r0_87.StarMailList[r2_87].MailReaded = 1
    end
    r0_87.CurContent.MailReaded = 1
    r0_87.CurContent.SelfWidget:SetListItemObjectReadState()
    r0_87.CurContent.SelfWidget:SetListItemObjectRewardGotState()
    r0_87:BlockAllUIInput(false)
    r0_87:CheckHaveReadToDeleteAll()
  else
    r0_87:HandleAvatarRet(r1_87)
  end
end
function r2_0.OnDeleteMail(r0_88, r1_88, r2_88)
  -- line: [1292, 1296] id: 88
  r0_88:BlockAllUIInput(false)
  UIManager(r0_88):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Mail_Delete_Success"))
  r0_88:InitMailMain()
end
function r2_0.HandleAvatarRet(r0_89, r1_89)
  -- line: [1298, 1306] id: 89
  r0_89:BlockAllUIInput(false)
  if DataMgr.ErrorCode[r1_89] then
    UIManager(r0_89):ShowError(r1_89)
  else
    UIManager(r0_89):ShowUITip(UIConst.Tip_CommonToast, GText("Unknown_Error"), 1.5)
  end
end
function r2_0.PlayInAnim(r0_90)
  -- line: [1308, 1310] id: 90
end
function r2_0.PlayOutAnim(r0_91)
  -- line: [1312, 1314] id: 91
end
return r2_0
