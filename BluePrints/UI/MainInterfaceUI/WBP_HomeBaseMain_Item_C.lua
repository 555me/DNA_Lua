-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\MainInterfaceUI\WBP_HomeBaseMain_Item_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("Utils.TimeUtils")
local r2_0 = require("Utils.UIUtils")
local r3_0 = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")
local r4_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
r4_0._components = {
  "BluePrints.UI.UI_PC.Menu.Reddot.MainUIItem_ReddotTree_Component"
}
function r4_0.Construct(r0_1)
  -- line: [24, 32] id: 1
  r0_1.Btn_top.OnClicked:Add(r0_1, r0_1.OnBtnClick)
  r0_1.Btn_top.OnHovered:Add(r0_1, r0_1.OnBtnHovered)
  r0_1.Btn_top.OnUnhovered:Add(r0_1, r0_1.OnBtnUnhovered)
  if not r0_1.ConditionMap then
    r0_1.ConditionMap = {}
  end
  EventManager:AddEvent(EventID.ConditionComplete, r0_1, r0_1.OnConditionComplete)
end
function r4_0.OnConditionComplete(r0_2, r1_2)
  -- line: [34, 39] id: 2
  if r0_2.ConditionMap[r1_2] then
    r0_2:UpdateGuidePoint()
  end
end
function r4_0.RefreshNewClueUI(r0_3)
  -- line: [41, 65] id: 3
  if not r0_3.IsBtnTask then
    return 
  end
  if r3_0:IsHasNewQuestionOrClue() == 2 then
    r0_3.NewClue = UIManager(r0_3):_CreateWidgetNew("CommonHudBubble")
    r0_3.NewClue:Init({
      IconPath = "",
      Text = "Minigame_Textmap_100319",
      ColorType = 3,
      Arrow = 10,
    })
    r0_3.NewClue:PlayInAnimation()
    if r0_3.NewClue then
      r0_3.Pos_Bubble_L:AddChild(r0_3.NewClue)
    end
  elseif r0_3.NewClue then
    r0_3.Pos_Bubble_L:ClearChildren()
  end
end
function r4_0.RefreshNewTheaterUI(r0_4)
  -- line: [67, 103] id: 4
  local r1_4 = GWorld:GetAvatar()
  if not r1_4 then
    return 
  end
  local r2_4 = 8029
  local r4_4 = r1_4.QuestChains[400111]
  if not r4_4 then
    DebugPrint("ayff 剧院tips配置了一个不存在的任务")
    return 
  end
  if not ConditionUtils.CheckCondition(r1_4, r2_4) or not r4_4:IsFinish() then
    return 
  end
  r0_4.NewTheaterBubble = UIManager(r0_4):_CreateWidgetNew("CommonHudBubble")
  r0_4.Pos_Bubble_L:AddChild(r0_4.NewTheaterBubble)
  r0_4.NewTheaterBubble:Init({
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_TheaterOnline.T_Interactive_TheaterOnline",
    Text = "UI_Theater_Waiting",
    ColorType = 0,
    Arrow = 1,
  })
  r0_4.NewTheaterBubble:PlayInAnimation()
  r0_4.NewTheaterBubble:SetIconColor(true)
  r0_4:AddTimer(3, function()
    -- line: [96, 101] id: 5
    r0_4.NewTheaterBubble:PlayOutAnimation()
    if r0_4:IsExistTimer("HideTheaterBubble") then
      r0_4:RemoveTimer("HideTheaterBubble")
    end
  end, false, 0.1, "HideTheaterBubble", true)
end
function r4_0.OnListItemObjectSet(r0_6, r1_6)
  -- line: [105, 115] id: 6
  r0_6.CurContent = r1_6
  r0_6.CurContent.SelfWidget = r0_6
  r0_6:ReddotTreePlugOut()
  r0_6:LoadImage()
  r0_6:UpdateGuidePoint()
  r0_6:InitListenEvent()
  if r1_6.bForbidReddot then
    r0_6:SetRedDot(false, false, nil)
  end
end
function r4_0.UpdateGuidePoint(r0_7)
  -- line: [118, 155] id: 7
  local r1_7 = {}
  local r2_7 = GWorld:GetAvatar()
  for r7_7, r8_7 in pairs(DataMgr.MainUIGuidePoint) do
    if r8_7.EnterId == r0_7.CurContent.BtnId then
      table.insert(r1_7, r8_7)
    end
  end
  -- close: r3_7
  local r3_7 = false
  for r8_7, r9_7 in pairs(r1_7) do
    if r9_7 then
      local r10_7 = false
      if r9_7.ShowCondition then
        r10_7 = ConditionUtils.CheckCondition(r2_7, r9_7.ShowCondition)
        DebugPrint("@@@Updateguidepoint Home Base main EnterId,ShowCondition", r9_7.EnterId, r10_7)
        r0_7.ConditionMap[r9_7.ShowCondition] = true
      end
      if r9_7.HideCondition then
        local r11_7 = ConditionUtils.CheckCondition(r2_7, r9_7.HideCondition)
        DebugPrint("@@@Updateguidepoint Home Base main EnterId,HideCondition", r9_7.EnterId, r11_7)
        if r11_7 then
          r10_7 = false
        end
        r0_7.ConditionMap[r9_7.HideCondition] = true
      end
      if not r3_7 then
        DebugPrint("@@@Updateguidepoint Home Base main UpdateCurrentShow EnterId,CurrentPointShow", r3_7)
        r3_7 = r10_7
      end
    end
  end
  -- close: r4_7
  DebugPrint("@@@Updateguidepoint Home Base main Update Final Current Show,CurrentPointShow", r3_7)
  if r3_7 then
    r0_7.Icon_GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_7.Icon_GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r4_0.InitListenEvent(r0_8)
  -- line: [158, 165] id: 8
  r0_8.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_8, 0))
  if IsValid(r0_8.GameInputModeSubsystem) then
    r0_8.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_8, r0_8.RefreshOpInfoByInputDevice)
    r0_8:RefreshOpInfoByInputDevice(r0_8.GameInputModeSubsystem:GetCurrentInputType(), r0_8.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r4_0.ClearListenEvent(r0_9)
  -- line: [167, 171] id: 9
  if IsValid(r0_9.GameInputModeSubsystem) then
    r0_9.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_9, r0_9.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RefreshOpInfoByInputDevice(r0_10, r1_10, r2_10)
  -- line: [173, 183] id: 10
  if r0_10.CurInputDeviceType == r1_10 then
    return 
  end
  r0_10.CurInputDeviceType = r1_10
  r0_10:InitWidgetInfoInGamePad(r1_10 == ECommonInputType.Gamepad)
end
function r4_0.InitWidgetInfoInGamePad(r0_11, r1_11)
  -- line: [185, 218] id: 11
  if r0_11.Key_GamePad then
    r0_11.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not r1_11 then
    return 
  end
  local r4_11 = DataMgr.MainUI[r0_11.CurContent.BtnId].ActionName
  if r4_11 == "RougeOpenBag" then
    local r5_11 = DataMgr.GamepadMap
    if not r0_0:Get("GamepadLayout") then
      local r6_11 = tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
    end
    if r5_11[r4_11] and r5_11[r4_11].GamepadIcon then
      r0_11.Key_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = r2_0.GetIconListByActionName(r4_11)[1],
          }
        },
      })
    end
    r0_11.Key_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end
function r4_0.LoadImage(r0_12, r1_12)
  -- line: [220, 299] id: 12
  r0_12.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_12.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_12.Reddot_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local r2_12 = DataMgr.MainUI
  local r3_12 = nil	-- notice: implicit variable refs by block#[3, 4, 5, 8, 12, 14, 27]
  if r1_12 == nil then
    r3_12 = r0_12.CurContent.BtnId
    if not r3_12 then
      ::label_26::
      r3_12 = r1_12
    end
  else
    goto label_26	-- block#2 is visited secondly
  end
  local r4_12 = r2_12[r3_12].Icon
  if not r2_0.IsMenuWorld() and r2_12[r3_12].DungeonIcon then
    r4_12 = r2_12[r3_12].DungeonIcon
  end
  if r4_12 == nil then
    r4_12 = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory"
  end
  local r5_12 = LoadObject(r4_12)
  local r6_12 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_12.VerticalBox_0)
  local r7_12 = FAnchors()
  if r3_12 == CommonConst.ArmoryEnterId then
    r0_12:UpdateArmoryIcon()
    r6_12:SetAlignment(FVector2D(1, 0))
    r7_12.Minimum = FVector2D(1, 1)
    r7_12.Maximum = FVector2D(1, 1)
    r6_12:SetAnchors(r7_12)
  else
    r6_12:SetAlignment(FVector2D(0.5, 0))
    r7_12.Minimum = FVector2D(0.5, 1)
    r7_12.Maximum = FVector2D(0.5, 1)
    r6_12:SetAnchors(r7_12)
    if r5_12 ~= nil then
      r0_12:SetButtonStyle(r5_12)
    end
  end
  if r3_12 == CommonConst.GachaEnterId then
    r0_12:RefreshTimeLimitResource()
  end
  local r8_12 = r2_12[r3_12].ActionName
  r0_12.Name:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_12.IsHaveKey = false
  r0_12.Switcher:SetActiveWidgetIndex(0)
  local r9_12 = CommonUtils:GetActionMappingKeyName(r8_12)
  if r8_12 and r9_12 ~= "" then
    r0_12.IsHaveKey = true
    r0_12.Common_Key_Hud_PC:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = r9_12,
        }
      },
    })
    r0_12.Common_Key_Hud_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local r10_12 = r2_0.GetIconListByActionName(r8_12)
    local r11_12 = r10_12
    if r11_12 then
      r11_12 = r10_12[1]
      if r11_12 == "Right" then
        r11_12 = #r10_12 > 1
      else
        goto label_160	-- block#19 is visited secondly
      end
    end
    r0_12.HasGamePadTips = r11_12
    if r0_12.HasGamePadTips and r0_12.Common_Key_Hud_Gamepad then
      r0_12.Common_Key_Hud_Gamepad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = r10_12[#r10_12],
          }
        },
      })
    end
  else
    r0_12.Common_Key_Hud_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_12) == "Mobile" then
    r0_12.Common_Key_Hud_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_12.Name:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_12.Name:SetText(GText(r2_12[r3_12].Name))
  r0_12.Switcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_12:ReddotTreePlugIn(r2_12[r3_12])
end
function r4_0.Destruct(r0_13)
  -- line: [302, 319] id: 13
  EventManager:RemoveEvent(EventID.ConditionComplete, r0_13)
  r0_13:ReddotTreePlugOut()
  local r1_13 = GWorld:GetAvatar()
  if r1_13 then
    for r6_13, r7_13 in ipairs(DataMgr.MainUI) do
      if r7_13.UIUnlockRuleName then
        local r9_13 = DataMgr.UIUnlockRule[r7_13.UIUnlockRuleName].UIUnlockRuleId
        if r0_13.UnlockRuleNames then
          r1_13:UnBindOnUIFirstTimeUnlock(r9_13, r0_13.UnlockRuleNames[r7_13.UIUnlockRuleName])
        end
      end
    end
    -- close: r2_13
  end
  r0_13:ClearListenEvent()
end
function r4_0.UpdateTaskBtnRedDot(r0_14)
  -- line: [321, 346] id: 14
  local r2_14, r3_14 = (function()
    -- line: [322, 342] id: 15
    local r0_15 = r0_0:Get("NewQuestChainTable", true) and {}
    local r1_15 = r0_0:Get("NewQuestReddotSet", true) and {}
    if IsEmptyTable(r1_15) == false then
      for r6_15, r7_15 in pairs(r1_15) do
        if r7_15 then
          return true, true
        end
      end
      -- close: r2_15
    end
    if IsEmptyTable(r0_15) then
      return true, true
    else
      for r6_15, r7_15 in pairs(r0_15) do
        if r7_15 then
          return true, true
        end
      end
      -- close: r2_15
    end
    return false, false
  end)()
  r0_14:SetRedDot(r2_14, r3_14, nil)
  r0_14:RefreshNewClueUI()
end
function r4_0.UpdateRedDot(r0_16)
  -- line: [348, 349] id: 16
end
function r4_0.SetRedDot(r0_17, r1_17, r2_17, r3_17, r4_17)
  -- line: [351, 379] id: 17
  if not IsValid(r0_17) then
    return 
  end
  if type(r4_17) == "number" and r4_17 <= 0 then
    r4_17 = "0"
  end
  r0_17.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_17.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if r0_17.bForceInvisible and (r1_17 or r2_17 or r4_17 and r4_17 ~= "0") then
    r0_17.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    Traceback(ErrorTag, "Esc红点已经强制不可见了，走到这里肯定有问题的，最终容错已经做了,但还是埋个桩看看是哪里捣鬼")
    return 
  end
  if r1_17 then
    r0_17.Common_Item_Subsize_New_PC:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return 
  end
  if r2_17 then
    r0_17.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r3_17 == 3 then
    if r4_17 == "0" then
      r0_17.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r0_17.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_17.Reddot_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_17.Reddot_Num:SetNum(r4_17)
    end
  else
    r0_17.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.OnBtnClick(r0_18)
  -- line: [381, 397] id: 18
  if r0_18.CurContent == nil then
    return 
  end
  AudioManager(r0_18):PlayUISound(r0_18, "event:/ui/common/click_btn_system_entrance", nil, nil)
  if r0_18.CurContent == nil then
    return 
  end
  local r1_18 = UE4.UGameplayStatics.GetGameMode(r0_18)
  if r1_18 and r1_18.EMGameState.GameModeType == "Trial" then
    r1_18:TriggerDungeonComponentFun("ShowArmory")
  else
    r2_0.OpenSystem(r0_18.CurContent.BtnId)
    CommonUtils:CloseGuideTouchIfExist(r0_18)
  end
end
function r4_0.OnBtnHovered(r0_19)
  -- line: [399, 413] id: 19
  if CommonUtils.GetDeviceTypeByPlatformName(r0_19) == "Mobile" then
    r0_19.Switcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  if r0_19.IsBubblePlaying and r0_19:IsExistTimer("HideBubble") then
    r0_19:RemoveTimer("HideBubble")
  end
  r0_19.Switcher:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_19:StopAnimation(r0_19.HoverOut)
  r0_19:PlayAnimation(r0_19.Hover)
end
function r4_0.OnBtnUnhovered(r0_20)
  -- line: [415, 427] id: 20
  local r1_20 = CommonUtils.GetDeviceTypeByPlatformName(r0_20)
  r0_20.Switcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if r1_20 == "Mobile" then
    r0_20.Switcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  r0_20:StopAnimation(r0_20.Hover)
  r0_20:PlayAnimation(r0_20.HoverOut)
  if r0_20.IsBubblePlaying then
    r0_20:HideBubble(r0_20.BubbleEndTime and 3)
  end
end
function r4_0.ShowSystemEntranceOnGamePadInput(r0_21, r1_21)
  -- line: [429, 448] id: 21
  if not r0_21.HasGamePadTips or not r0_21.Common_Key_Hud_Gamepad then
    return 
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_21) == "Mobile" then
    r0_21.Switcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_21.Switcher:SetActiveWidgetIndex(0)
    return 
  end
  if r1_21 then
    r0_21.Switcher:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_21.Switcher:SetActiveWidgetIndex(1)
    r0_21.Common_Key_Hud_Gamepad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_21.Switcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_21.Switcher:SetActiveWidgetIndex(0)
    r0_21.Common_Key_Hud_Gamepad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r4_0.UpdateArmoryIcon(r0_22)
  -- line: [450, 469] id: 22
  local r1_22 = GWorld:GetAvatar()
  if not r1_22 then
    return 
  end
  local r3_22 = UE4.UGameplayStatics.GetPlayerCharacter(r0_22, 0)
  local r4_22 = r1_22.Chars[r1_22.CurrentChar].CharId
  local r5_22 = UE4.UGameplayStatics.GetGameMode(r0_22)
  local r6_22 = UE4.UGameplayStatics.GetGameState(r0_22)
  if r5_22 ~= nil and r6_22 ~= nil and r6_22.GameModeType == "Trial" and r3_22 then
    r4_22 = r3_22.PlayerState:GetOldBattleInfo("Char").Id
  end
  r0_22:SetButtonStyle(LoadObject(DataMgr.Char[r4_22].EscIcon))
end
function r4_0.RefreshTimeLimitResource(r0_23)
  -- line: [472, 502] id: 23
  r0_23.IsBubblePlaying = false
  r0_23.Pos_Bubble:ClearChildren()
  local r1_23 = GWorld:GetAvatar()
  if not r1_23 then
    return 
  end
  local r2_23 = nil
  local r3_23 = nil
  for r8_23, r9_23 in pairs(DataMgr.SkinGacha) do
    for r14_23, r15_23 in ipairs(r9_23.GachaCostRes) do
      local r16_23 = DataMgr.Resource[r15_23]
      local r17_23 = r1_23:GetResourceNum(r15_23)
      local r18_23 = ItemUtils.GetItemLimitedInfo(r15_23)
      if r18_23 and r18_23.EndTime and r17_23 > 0 then
        r2_23 = r18_23.EndTime
        r3_23 = r16_23.Icon
        break
      end
    end
    -- close: r10_23
  end
  -- close: r4_23
  if not r2_23 then
    return 
  end
  local r5_23 = r2_23 - r1_0.NowTime()
  local r6_23 = r0_0:Get("GachaBubble")
  if r6_23 and r6_23 == true then
    return 
  end
  if r5_23 > 0 and r5_23 < CommonConst.SECOND_IN_DAY then
    r0_23:ShowBubble(2, 1, r3_23)
  elseif CommonConst.SECOND_IN_DAY <= r5_23 and r5_23 < CommonConst.SECOND_IN_WEEKDAY then
    r0_23:ShowBubble(1, 1, r3_23)
  end
end
function r4_0.ShowBubble(r0_24, r1_24, r2_24, r3_24)
  -- line: [504, 523] id: 24
  if not r0_24.HudBubbleWidget then
    r0_24.HudBubbleWidget = UIManager(r0_24):_CreateWidgetNew("CommonHudBubble")
  end
  r0_24.Pos_Bubble:AddChild(r0_24.HudBubbleWidget)
  local r4_24 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_24.HudBubbleWidget)
  r4_24:SetVerticalAlignment(EVerticalAlignment.VAlign_Center)
  r4_24:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Center)
  r0_24.HudBubbleWidget:Init({
    IconPath = r3_24,
    Text = "UI_GachaTicket_Bubble",
    ColorType = r1_24,
    Arrow = r2_24,
  })
  r0_24.HudBubbleWidget:PlayInAnimation()
  r0_24.IsBubblePlaying = true
  r0_0:Set("GachaBubble", true)
  r0_24:HideBubble(r0_24.BubbleEndTime and 3)
end
function r4_0.HideBubble(r0_25, r1_25)
  -- line: [525, 537] id: 25
  if r0_25:IsExistTimer("HideBubble") then
    r0_25:RemoveTimer("HideBubble")
  end
  r0_25:AddTimer(r1_25, function()
    -- line: [529, 535] id: 26
    r0_25.HudBubbleWidget:PlayOutAnimation()
    r0_25.IsBubblePlaying = false
    if r0_25:IsExistTimer("HideBubble") then
      r0_25:RemoveTimer("HideBubble")
    end
  end, false, 0.1, "HideBubble", true)
end
function r4_0.OnHomeBaseBtnPlayAnim(r0_27, r1_27, r2_27)
  -- line: [539, 548] id: 27
  if not r1_27 then
    return 
  end
  if not r0_27[r2_27] then
    return 
  end
  if r0_27.CurContent and r0_27.CurContent.BtnId and DataMgr.MainUI[r0_27.CurContent.BtnId].SystemUIName == r1_27 then
    r0_27:PlayAnimation(r0_27[r2_27])
  end
end
function r4_0.OnHomeBaseeBtnShowNewClue(r0_28, r1_28)
  -- line: [550, 552] id: 28
  r0_28:RefreshNewClueUI()
end
AssembleComponents(r4_0)
return r4_0
