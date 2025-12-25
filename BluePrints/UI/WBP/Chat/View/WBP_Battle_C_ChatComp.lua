-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Chat\View\WBP_Battle_C_ChatComp.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Chat.ChatController")
local r1_0 = require("BluePrints.UI.WBP.Chat.ChatCommon")
local r2_0 = r0_0:GetModel()
local r4_0 = require("BluePrints.Common.DataStructure").Deque
return {
  EndChat = function(r0_1)
    -- line: [11, 27] id: 1
    local r1_1 = GWorld:GetAvatar()
    if not r1_1 then
      return 
    end
    ReddotManager.RemoveListener(r1_0.ReddotName, r0_1)
    r0_0:UnRegisterEvent(r0_1)
    r0_1.ChatSimpleOpenQueue = nil
    r0_1:RemoveChatSimpleProcessTimer()
    r0_1["_EndChat" .. CommonUtils.GetDeviceTypeByPlatformName(r0_1)](r0_1, r1_1)
    local r3_1 = DataMgr.MainUI[r1_0.MainUIId]
    if r0_1.ChatUnlockKey then
      r1_1:UnBindOnUIFirstTimeUnlock(r3_1.UIUnlockRuleName, r0_1.ChatUnlockKey)
    end
  end,
  InitChat = function(r0_2)
    -- line: [29, 65] id: 2
    local r1_2 = GWorld:GetAvatar()
    if not r1_2 then
      return 
    end
    local r2_2 = DataMgr.MainUI[r1_0.MainUIId]
    assert(r2_2, "聊天的入口配置不存在，策划需要检查MainUI配表，聊天系统的id为" .. r1_0.MainUIId)
    r0_2.ChatSimpleOpenQueue = r4_0.New()
    r0_2["_InitChat" .. CommonUtils.GetDeviceTypeByPlatformName(r0_2)](r0_2, r1_2, r2_2)
    r0_2.bRebuildChatSimple = false
    local r4_2 = r2_2.UIUnlockRuleName
    if r4_2 then
      if r1_2:CheckUIUnlocked(r4_2) then
        r0_2:_EnterChannel()
      else
        r0_2.ChatUnlockKey = r1_2:BindOnUIFirstTimeUnlock(r4_2, function()
          -- line: [56, 60] id: 3
          if not r0_2.ChatUnlockKey then
            return 
          end
          r0_2:_EnterChannel()
          r0_2.ChatUnlockKey = nil
        end)
      end
    else
      r0_2:_EnterChannel()
    end
  end,
  _InitChatPC = function(r0_4, r1_4, ...)
    -- line: [67, 160] id: 4
    local r2_4 = nil	-- notice: implicit variable refs by block#[0]
    ... = ... -- error: untaken top expr
    r0_4.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_4.Group_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_4.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_4.Select_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_4.Text_ChatChannelNormal:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_4.Btn_ChatEntry.OnClicked:Add(r0_4, r0_4.ChatEntryOnClicked)
    r0_4.Btn_ChatEntry.OnHovered:Add(r0_4, r0_4.ChatEntryOnHovered)
    r0_4.Btn_ChatEntry.OnUnhovered:Add(r0_4, r0_4.ChatEntryOnLeaved)
    r0_4.ChatFocusArea.OnClicked:Add(r0_4, r0_4.OnChatFocusAreaClicked)
    r0_4.Text_ChatChannelSelect:SetText(GText(r2_4.Name))
    r0_4.Chat_Entry:LoadImage(r1_0.MainUIId)
    r0_4.Key_ChatEntry:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "View",
        }
      },
      bLongPress = true,
    })
    r0_4:_SetUpChannelText()
    r0_0:RegisterEvent(r0_4, function(r0_5, r1_5, ...)
      -- line: [91, 147] id: 5
      local r2_5 = r1_0.EventID.CloseMainView
      if r1_5 == r2_5 then
        ... = ... -- error: untaken top expr
        if not r2_5 then
          return 
        end
        EMUIAnimationSubsystem:EMPlayAnimation(r0_5, r0_5.Chat_Out)
        r0_5.bRebuildChatSimple = true
        r0_5:InitChatSimple()
        r0_5.ChatFocusArea:SetVisibility(UIConst.VisibilityOp.Collapsed)
        r0_5:_SetUpChannelText()
      else
        local r3_5 = nil	-- notice: implicit variable refs by block#[5, 7, 20]
        if r1_5 == r1_0.EventID.ChatMsgRecv then
          ... = ... -- error: untaken top expr
          if r1_4.ChatChannelMute[r3_5.Message.ChannelType] == 1 then
            print("yklua 收到消息，但是在免打扰列表中")
            return 
          end
          r0_5:UpdateChatSimple(r3_5)
        else
          r2_5 = r1_0.EventID.OpenMainView
          if r1_5 == r2_5 then
            ... = ... -- error: untaken top expr
            if not r2_5 then
              return 
            end
            r0_5.Group_Select:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
            r0_5.ChatFocusArea:SetVisibility(UIConst.VisibilityOp.Visible)
            r3_5 = pairs
            for r7_5, r8_5 in r3_5(r0_5.Pos_ChatSimple:GetDisplayedEntryWidgets()) do
              r8_5:Close()
            end
            -- close: r3_5
            r0_5.Pos_ChatSimple:ClearListItems()
            r0_5.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
            EMUIAnimationSubsystem:EMPlayAnimation(r0_5, r0_5.Chat_In)
          else
            r2_5 = r1_0.EventID.EnterChatChannel
            if r1_5 == r2_5 then
              ... = ... -- error: untaken top expr
              if r2_5 ~= ErrorCode.RET_SUCCESS then
                return 
              end
              if IsValid(r0_0:GetView(r0_5)) then
                return 
              end
              if r2_0:GetCurrentChannel() ~= r3_5 then
                return 
              end
              if r2_4.ShowCondition ~= nil then
                if ConditionUtils.CheckCondition(r1_4, r2_4.ShowCondition) then
                  r0_5.Group_ChatEntry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
                else
                  r0_5.Group_ChatEntry:SetVisibility(UIConst.VisibilityOp.Collapsed)
                end
              else
                r0_5.Group_ChatEntry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
              end
              r0_5.bRebuildChatSimple = true
              r0_5:InitChatSimple()
            else
              r2_5 = r1_0.EventID.CloseChatChannel
              if r1_5 == r2_5 then
                ... = ... -- error: untaken top expr
                if not r2_5 then
                  return 
                end
                r0_5.bRebuildChatSimple = true
                r0_5:InitChatSimple()
                r0_5.ChatFocusArea:SetVisibility(UIConst.VisibilityOp.Collapsed)
                r0_5:_SetUpChannelText()
              end
            end
          end
        end
      end
    end)
    ReddotManager.AddListener(r1_0.ReddotName, r0_4, function(r0_6, r1_6)
      -- line: [148, 159] id: 6
      if r1_6 == 0 then
        r0_6.Select_Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        r0_6.Select_Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
        local r2_6 = tostring(r1_6)
        if r1_0.ReddotMaxCount <= r1_6 then
          r2_6 = r1_0.ReddotMaxCount .. "+"
        end
        r0_6.Select_Reddot_Num:SetNum(r2_6)
      end
    end)
  end,
  _InitChatMobile = function(r0_7, r1_7, ...)
    -- line: [162, 188] id: 7
    local r2_7 = nil	-- notice: implicit variable refs by block#[0]
    ... = ... -- error: untaken top expr
    local r3_7 = NewObject(UE4.LoadClass("/Game/UI/WBP/Battle/Widget/WBP_Main_Btnlist_Content.WBP_Main_Btnlist_Content_C"))
    r3_7.BtnId = r1_0.MainUIId
    r0_7.Chat_Entry:OnListItemObjectSet(r3_7)
    r0_0:RegisterEvent(r0_7, function(r0_8, r1_8, ...)
      -- line: [169, 187] id: 8
      local r2_8 = r1_0.EventID.EnterChatChannel
      if r1_8 == r2_8 then
        ... = ... -- error: untaken top expr
        if r2_8 ~= ErrorCode.RET_SUCCESS then
          return 
        end
        local r3_8 = nil	-- notice: implicit variable refs by block#[5]
        if IsValid(r0_0:GetView(r0_8)) then
          return 
        end
        if r2_0:GetCurrentChannel() ~= r3_8 then
          return 
        end
        if r2_7.ShowCondition ~= nil then
          if ConditionUtils.CheckCondition(r1_7, r2_7.ShowCondition) then
            r0_8.Chat_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
          else
            r0_8.Chat_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
          end
        else
          r0_8.Chat_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        end
      end
    end)
  end,
  _EndChatPC = function(r0_9, r1_9, ...)
    -- line: [190, 198] id: 9
    r0_9:StopListeningForInputAction(DataMgr.KeyboardMap.OpenChat.ActionName, EInputEvent.IE_Pressed)
    r0_9.Btn_ChatEntry.OnClicked:Remove(r0_9, r0_9.ChatEntryOnClicked)
    r0_9.Btn_ChatEntry.OnHovered:Remove(r0_9, r0_9.ChatEntryOnHovered)
    r0_9.Btn_ChatEntry.OnUnhovered:Remove(r0_9, r0_9.ChatEntryOnLeaved)
    r0_9.ChatFocusArea.OnClicked:Remove(r0_9, r0_9.OnChatFocusAreaClicked)
    ReddotManager.RemoveListener(r1_0.UIName, r0_9)
  end,
  _EndChatMobile = function(r0_10, r1_10, ...)
    -- line: [200, 202] id: 10
  end,
  _EnterChannel = function(r0_11)
    -- line: [204, 213] id: 11
    r2_0:UpdateCurrentChannel()
    for r5_11, r6_11 in pairs(r1_0.ChannelDef) do
      r0_0:SendRequestEnterChatChannel(r6_11)
    end
    -- close: r1_11
    if CommonUtils.GetDeviceTypeByPlatformName(r0_11) == "PC" then
      r0_11:ListenForInputAction(DataMgr.KeyboardMap.OpenChat.ActionName, EInputEvent.IE_Pressed, false, {
        r0_11,
        r0_11.OpenChat
      })
    end
  end,
  _LeaveChannel = function(r0_12)
    -- line: [215, 220] id: 12
  end,
  OpenChat = function(r0_13)
    -- line: [222, 229] id: 13
    if IsValid(r0_0:GetView(r0_13)) then
      return 
    end
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_13, r0_13.Chat_Out) or EMUIAnimationSubsystem:EMAnimationIsPlaying(r0_13, r0_13.Chat_In) then
      return 
    end
    r0_13:OpenSystemByAction(DataMgr.KeyboardMap.OpenChat.ActionName, true, true)
  end,
  InitChatSimple = function(r0_14)
    -- line: [231, 247] id: 14
    if not r0_14.bRebuildChatSimple then
      return 
    end
    if CommonUtils.GetDeviceTypeByPlatformName(r0_14) == "Mobile" then
      return 
    end
    local r2_14 = GWorld:GetAvatar()
    if r2_14:IsInHardBoss() or r2_14:IsInDungeon() then
      r0_14.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_14.bRebuildChatSimple = false
      return 
    end
    r0_14.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_14.Pos_ChatSimple:ClearListItems()
    r0_14.bRebuildChatSimple = false
  end,
  UpdateChatSimple = function(r0_15, r1_15)
    -- line: [250, 266] id: 15
    DebugPrint("Battle_PC_ChatComp:UpdateChatSimple", r0_15.Pos_ChatSimple:GetVisibility())
    if IsValid(r0_0:GetView(r0_15)) then
      return 
    end
    local r2_15 = GWorld:GetAvatar()
    if r2_15:IsInHardBoss() or r2_15:IsInDungeon() then
      r0_15.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_15.ChatSimpleOpenQueue = r4_0.New()
      r0_15.Pos_ChatSimple:ClearListItems()
      r0_15:RemoveChatSimpleProcessTimer()
    elseif r2_15:IsInBigWorld() then
      r0_15.Pos_ChatSimple:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    if not r0_15.Pos_ChatSimple:IsVisible() then
      return 
    end
    r0_15.ChatSimpleOpenQueue:PushBack(r1_15)
    r0_15.SimpleChatMovingTime = nil
    r0_15:TryAddChatSimpleProcessTimer()
  end,
  TryAddChatSimpleProcessTimer = function(r0_16)
    -- line: [268, 291] id: 16
    if not r0_16:IsExistTimer(r0_16.ProcessTicker) then
      local r1_16 = 0.05
      local r2_16, r3_16 = r0_16:AddTimer(r1_16, function()
        -- line: [271, 288] id: 17
        if not GWorld.NetworkMgr:CheckIsConnected(true) then
          r0_16:RemoveChatSimpleProcessTimer()
          return 
        end
        if not r0_16.Pos_ChatSimple:IsVisible() then
          r0_16.ChatSimpleOpenQueue = r4_0.New()
          r0_16.Pos_ChatSimple:ClearListItems()
          r0_16:RemoveChatSimpleProcessTimer()
          return 
        end
        if r0_16.SimpleChatMovingTime == nil then
          r0_16:_ProcessChatSimpleListModify()
        else
          r0_16:_ProcessChatSimpleMove(r1_16)
        end
      end, true)
      r0_16.ProcessTicker = r3_16
      -- close: r1_16
    end
  end,
  _ProcessChatSimpleListModify = function(r0_18)
    -- line: [293, 309] id: 18
    local r1_18 = DataMgr.GlobalConstant.ChatMsgCountInBattleMain.ConstantValue
    local r2_18 = r0_18.Pos_ChatSimple:GetNumItems()
    if r2_18 <= r1_18 and r2_18 < r0_18.ChatSimpleOpenQueue:Size() then
      local r3_18 = r0_18.ChatSimpleOpenQueue:Get(r2_18 + 1)
      local r4_18 = NewObject(UIUtils.GetCommonItemContentClass())
      r4_18.MsgWrap = r3_18
      r4_18.bSound = true
      r0_18.Pos_ChatSimple:AddItem(r4_18)
    end
    if r1_18 < r2_18 then
      local r3_18 = r0_18.Pos_ChatSimple:GetItemAt(0)
      if IsValid(r3_18.UI) then
        r3_18.UI:Close()
      end
    end
  end,
  _ProcessChatSimpleMove = function(r0_19, r1_19)
    -- line: [311, 330] id: 19
    if r0_19.SimpleChatMovingTime < r0_19.SCItemAnimTotalTime then
      for r6_19, r7_19 in pairs(r0_19.Pos_ChatSimple:GetDisplayedEntryWidgets()) do
        r7_19:DoMove(r0_19.SimpleChatMovingTime)
      end
      -- close: r2_19
      r0_19.SimpleChatMovingTime = r0_19.SimpleChatMovingTime + r1_19
    end
    if r0_19.SCItemAnimTotalTime <= r0_19.SimpleChatMovingTime then
      r0_19.SimpleChatMovingTime = nil
      for r6_19, r7_19 in pairs(r0_19.Pos_ChatSimple:GetDisplayedEntryWidgets()) do
        r7_19:ResetTranslation()
      end
      -- close: r2_19
      r0_19.Pos_ChatSimple:RemoveItem(r0_19.Pos_ChatSimple:GetItemAt(0))
      r0_19.ChatSimpleOpenQueue:PopFront()
      if r0_19.ChatSimpleOpenQueue:IsEmpty() then
        r0_19:RemoveChatSimpleProcessTimer()
      end
    end
  end,
  OnSimpleChatClose = function(r0_20, r1_20)
    -- line: [332, 335] id: 20
    r0_20.SimpleChatMovingTime = 0
    r0_20.SCItemAnimTotalTime = math.max(r1_20.Out:GetEndTime(), 0.2)
  end,
  RemoveChatSimpleProcessTimer = function(r0_21)
    -- line: [337, 341] id: 21
    if not r0_21:IsExistTimer(r0_21.ProcessTicker) then
      return 
    end
    r0_21:RemoveTimer(r0_21.ProcessTicker)
    r0_21.ProcessTicker = nil
  end,
  ChatEntryOnClicked = function(r0_22)
    -- line: [343, 346] id: 22
    AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/common/click_btn_system_entrance", nil, nil)
    r0_0:OpenView(r0_22, true)
  end,
  ChatEntryOnHovered = function(r0_23)
    -- line: [348, 350] id: 23
    r0_23.Chat_Entry:OnBtnHovered()
  end,
  OnChatFocusAreaClicked = function(r0_24)
    -- line: [352, 357] id: 24
    local r1_24 = r0_0:GetView(r0_24)
    if IsValid(r1_24) then
      r1_24:SetFocus()
    end
  end,
  ChatEntryOnLeaved = function(r0_25)
    -- line: [359, 361] id: 25
    r0_25.Chat_Entry:OnBtnUnhovered()
  end,
  _SetUpChannelText = function(r0_26)
    -- line: [363, 372] id: 26
    local r1_26 = DataMgr.Channel[r2_0:GetCurrentChannel()]
    if r1_26 and r1_26.SIcon then
      local r2_26 = LoadObject(r1_26.SIcon)
      if IsValid(r2_26) then
        r0_26.Image_ChatChannelIcon:SetBrushResourceObject(r2_26)
      end
    end
  end,
  InitChatKeyTip = function(r0_27)
    -- line: [373, 378] id: 27
    if CommonUtils.GetDeviceTypeByPlatformName(r0_27) == "PC" then
      local r1_27 = UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad
      local r2_27 = r0_27.Group_NormalKey
      local r4_27 = nil	-- notice: implicit variable refs by block#[7]
      if r1_27 then
        r4_27 = UIConst.VisibilityOp.Visible
        if not r4_27 then
          ::label_25::
          r4_27 = UIConst.VisibilityOp.Collapsed
        end
      else
        goto label_25	-- block#6 is visited secondly
      end
      r2_27:SetVisibility(r4_27)
    end
  end,
}
