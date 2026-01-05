-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Battle\WBP_Battle_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.UIUtils")
local r1_0 = require("BluePrints.UI.WBP.Chat.ChatCommon")
local r2_0 = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local r3_0 = require("BluePrints.UI.TaskPanel.TaskUtils")
local r4_0 = require("BluePrints.UI.BloodBar.BloodBarUtils").AllBloodState
local r5_0 = require("EMCache.EMCache")
local r6_0 = Class("BluePrints.UI.BP_UIState_C")
r6_0._components = {
  "BluePrints.UI.WBP.Chat.View.WBP_Battle_C_ChatComp",
  "BluePrints.UI.WBP.Team.View.WBP_Battle_C_TeamComp"
}
function r6_0.Construct(r0_1)
  -- line: [23, 45] id: 1
  r6_0.Super.Construct(r0_1)
  if r0_1.Platform == nil then
    r0_1.Platform = CommonUtils.GetDeviceTypeByPlatformName(r0_1)
  end
  r0_1.OnVisibilityChanged:Add(r0_1, function(r0_2, r1_2)
    -- line: [28, 35] id: 2
    if r0_2:IsVisible() then
      UIManager():TryResumeAfterLoadingMgr({
        "TriggerGuide",
        "MainLineQuest",
        "DynamicQuest"
      })
      r0_2:_RefreshEscReddot()
    end
  end)
  r0_1.ColorAndOpacityDelegate:Bind(r0_1, function(r0_3)
    -- line: [36, 43] id: 3
    if r0_3.ColorAndOpacity.SpecifiedColor.A == 1 then
      UIManager():TryResumeAfterLoadingMgr({
        "TriggerGuide",
        "MainLineQuest",
        "DynamicQuest"
      })
      r0_3:_RefreshEscReddot()
    end
  end)
  r0_1.PlayInOutSystems = {}
end
function r6_0.OnLoaded(r0_4, ...)
  -- line: [47, 190] id: 4
  r0_4.Super.OnLoaded(r0_4, ...)
  r0_4:TryRecoverUI()
  r0_4:InitUID()
  r0_4:InitChat()
  r0_4:InitTeam()
  r0_4:ListenForInputAction("OpenArmory", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenArmory
  })
  r0_4:ListenForInputAction("OpenBag", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenBag
  })
  r0_4:ListenForInputAction("OpenPlay", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenPlay
  })
  r0_4:ListenForInputAction("OpenTask", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenTaskPanel
  })
  r0_4:ListenForInputAction("OpenMenu", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenCommonSetup
  })
  r0_4:ListenForInputAction("OpenGuideBook", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenGuideBook
  })
  r0_4:ListenForInputAction("OpenEvent", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenEvent
  })
  r0_4:ListenForInputAction("OpenForge", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenForge
  })
  r0_4:ListenForInputAction("OpenGacha", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenGacha
  })
  r0_4:ListenForInputAction("OpenBattlePass", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.OpenBattlePass
  })
  r0_4:ListenForInputAction("GamepadOpenSystem", EInputEvent.IE_Pressed, false, {
    r0_4,
    r0_4.ShowSystemEntrance
  })
  r0_4:ListenForInputAction("GamepadOpenSystem", EInputEvent.IE_Released, false, {
    r0_4,
    r0_4.CloseSystemEntrance
  })
  r0_4:AddDispatcher(EventID.ShowTeammateBloodUI, r0_4, r0_4.AddTeammateUI)
  r0_4:AddDispatcher(EventID.CloseTeammateBloodUI, r0_4, r0_4.RemoveTeammateUI)
  r0_4:AddDispatcher(EventID.OnMainUIReddotUpdate, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.OnCompleteProduce, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.OnBlueComplete, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.OnReceiveNewQuest, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.OnAchvRedPoint, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.CharDie, r0_4, r0_4.OnTeammateDie)
  r0_4:AddDispatcher(EventID.CharRecover, r0_4, r0_4.OnTeammateRecovery)
  r0_4:AddDispatcher(EventID.OnGotTopicReward, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.OnReceiveNewQuest, r0_4, r0_4.UpdateRedDotStates)
  r0_4:AddDispatcher(EventID.UnLoadUI, r0_4, r0_4.OnSystemUIUnLoad)
  r0_4:AddDispatcher(EventID.OnChangeKeyBoardSet, r0_4, r0_4.InitBtnList)
  r0_4:AddDispatcher(EventID.OnSwitchRole, r0_4, r0_4.OnSwitchRole)
  r0_4:AddDispatcher(EventID.OnHomeBaseBtnPlayAnim, r0_4, r0_4.OnHomeBaseBtnPlayAnim)
  r0_4:AddDispatcher(EventID.ShowOrHideMainPlayerBloodUI, r0_4, r0_4.ShowOrHideMainPlayerBloodUI)
  r0_4:AddDispatcher(EventID.EndRougeCanonMiniGame, r0_4, r0_4.OnEndRougeCanonMiniGame)
  r0_4:AddDispatcher(EventID.OnTempleRightUI, r0_4, r0_4.OnTempleRightUI)
  r0_4:AddDispatcher(EventID.OnPartyProgressStart, r0_4, r0_4.OnPartyProgressStart)
  r0_4:AddDispatcher(EventID.OnModBookQuestFinished, r0_4, r0_4.OnModBookQuestFinished)
  r0_4:AddDispatcher(EventID.OnNotifyShowLargeCountDown, r0_4, r0_4.OnNotifyShowLargeCountDown)
  r0_4:AddDispatcher(EventID.OnNewDetectiveQuestion, r0_4, r0_4.OnNewDetectiveQuestion)
  r0_4:AddDispatcher(EventID.OnHomeBaseeBtnShowNewClue, r0_4, r0_4.OnHomeBaseeBtnShowNewClue)
  r0_4:AddDispatcher(EventID.OnEnableGuideBookKey, r0_4, r0_4.EnableGuideBookKey)
  r0_4:AddDispatcher(EventID.OnTheaterJoinPerformGame, r0_4, r0_4.TheaterJoinPerformGame)
  r0_4:AddDispatcher(EventID.OnTheaterPerformGameStart, r0_4, r0_4.TheaterPerformGameStart)
  r0_4:AddDispatcher(EventID.OnTheaterPerformGameNotice, r0_4, r0_4.OnTheaterPerformGameNotice)
  r0_4:AddDispatcher(EventID.OnTeleportReady, r0_4, r0_4.TeleportReady)
  local r1_4 = DataMgr.ReddotNode.Quest.Name
  if GWorld:GetAvatar() then
    ReddotManager.AddListenerEx(r1_4, r0_4, function(r0_5, r1_5, r2_5, r3_5)
      -- line: [111, 117] id: 5
      if r1_5 > 0 then
        r0_5.Btn_Task.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      else
        r0_5.Btn_Task.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end)
  end
  if not r0_4:InitWithMainCharacter() then
    r0_4:AddDispatcher(EventID.CloseLoading, r0_4, r0_4.InitWithMainCharacter)
  end
  r0_4.SystemHideTags = {}
  r0_4.IsPlayOutAnim = false
  r0_4.HideGuideBookBtn = false
  r0_4.HideSystemEntrance = false
  r0_4:InitConditionMapSystem()
  r0_4.VB_Teammate_Phantom:ClearChildren()
  r0_4.VB_Teammate_Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if r0_4.Battle_Char_PC_0 then
    r0_4.Battle_Char_PC_0:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_4) == "Mobile" then
    r0_4.Char_Skill:InitSkillAfterCharInitReady()
  else
    r0_4.Char_Skill:InitSkillAfterCharInitReady()
  end
  r0_4.PlayerBloodBar = r0_4.HUD_MainBar
  r0_4.Battle_Map.Battle = r0_4
  r0_4.Map_Img:SetVisibility(ESlateVisibility.Collapsed)
  r0_4:PlayAnimation(r0_4.CollapsedMap)
  r0_4.Battle_Map:SetVisibility(0)
  if r0_4.Btn_Close then
    r0_4.Btn_Close.OnClicked:Clear()
    r0_4.Btn_Close.OnClicked:Add(r0_4, r0_4.OnBattleMapClose)
  end
  r0_4:SetOverrideInfo(r0_4.SizeMap_Original, r0_4.Task_Normal)
  r0_4.RetainerBox_0:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_4.Task:ClearChildren()
  r0_4.Pos_Weekly:ClearChildren()
  r0_4.Pos_Abyss_CountDown:ClearChildren()
  r0_4.Pos_Abyss_CountDown_1:ClearChildren()
  r0_4.Pos_ModAchive:ClearChildren()
  r0_4.Pos_TempleProgress:ClearChildren()
  r0_4.Pos_Weekly_Buff:ClearChildren()
  r0_4.Pos_GuildWarScore:ClearChildren()
  r0_4.Pos_LowHealth:ClearChildren()
  r0_4.Pos_Rouge_CountDown:ClearChildren()
  r0_4.Pos_TempleRight:ClearChildren()
  r0_4.TeammateEidSet = {}
  r0_4:HidePlayerDeadUI()
  r0_4:InitKeyTip()
  r0_4:HideDynamicEventUI()
  r0_4:CreatTakeAimIndicator()
  r0_4.Btn_Task.IsBtnTask = true
  r0_4:InitGameJumpWord()
  r0_4:CheckTheaterEventState()
end
function r6_0.GetOrAddWidget(r0_6, r1_6, r2_6)
  -- line: [192, 204] id: 6
  local r3_6 = r2_6:GetChildAt(0)
  if r3_6 then
    return r3_6
  end
  local r4_6 = r0_6:CreateWidgetNew(r1_6)
  if r4_6 then
    r2_6:AddChild(r4_6)
    r2_6:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    DebugPrint("CreateWidget failed! Widget name: ", r1_6)
  end
  return r4_6
end
function r6_0.GetWidget(r0_7, r1_7, r2_7)
  -- line: [206, 209] id: 7
  return r2_7:GetChildAt(0)
end
function r6_0.RefreshOpInfoByInputDevice(r0_8, r1_8, r2_8)
  -- line: [212, 216] id: 8
  r0_8.CurInputDeviceType = r0_0.UtilsGetCurrentInputType()
  r0_8.CurGamepadName = r0_0.UtilsGetCurrentGamepadName()
  r0_8:InitKeyTip()
end
function r6_0.InitWithMainCharacter(r0_9)
  -- line: [219, 234] id: 9
  local r1_9 = UE4.UGameplayStatics.GetPlayerCharacter(r0_9, 0)
  if not r1_9 then
    return false
  end
  r0_9.HUD_MainBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_9.HUD_MainBar:InitConfig(r1_9)
  r0_9:AddTimer(0.5, function()
    -- line: [225, 229] id: 10
    if not r1_9:CheckCanChangeToMaster() then
      r0_9:ShowOrHideMainPlayerBloodUI(true, "ChangeRoleToMaster")
    end
  end, false)
  r0_9:InitDataPhone()
  return true
end
function r6_0.GetOrAddDynamicEventWidget(r0_11)
  -- line: [236, 239] id: 11
  r0_11.Pos_DynamicEvent:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  return r0_11:GetOrAddWidget("DynamicEvent", r0_11.Pos_DynamicEvent)
end
function r6_0.GetDynamicEventWidget(r0_12)
  -- line: [241, 243] id: 12
  return r0_12:GetWidget("DynamicEvent", r0_12.Pos_DynamicEvent)
end
function r6_0.AddTempleRightKeyTextDesc(r0_13)
  -- line: [255, 269] id: 13
  r0_13.ForbidInfo = r0_13:TempleForbidSkills(DataMgr.Temple[UE4.UGameplayStatics.GetGameState(r0_13).DungeonId].FbdRule)
  if not r0_13.ForbidInfo then
    return 
  end
  for r7_13 = 1, #r0_13.ForbidInfo, 1 do
    local r8_13 = NewObject(UE4.LoadClass(UIConst.DUNGEONCOMRIGHTKEYTEXTDESCDATA))
    r8_13.Owner = r0_13
    r8_13.Index = r7_13
    r0_13.List_TrainingSetting:AddItem(r8_13)
  end
end
function r6_0.InitTrainingKeyTip(r0_14)
  -- line: [273, 295] id: 14
  local r1_14 = UE4.UGameplayStatics.GetPlayerCharacter(r0_14, 0)
  local r2_14 = UE4.UGameplayStatics.GetGameMode(r0_14)
  local r3_14 = UE4.UGameplayStatics.GetGameState(r0_14)
  if r1_14.UIModePlatform == "PC" then
    r0_14:GetOrAddWidget("TrainingSetting_P", r0_14.Task):InitView()
    r0_14:AddTrainingRightKeyListeners()
  else
    local r4_14 = r0_14:GetOrAddWidget("TrainingSetting_M", r0_14.Task)
    r4_14.Parent = r0_14
    r4_14:InitView()
  end
  local r4_14 = r3_0:GetTaskBarWidget()
  if r4_14 then
    r4_14:SetUIVisibilityTag("Training", true)
  end
end
function r6_0.InitTrailKeyTip(r0_15)
  -- line: [297, 349] id: 15
  local r1_15 = UE4.UGameplayStatics.GetPlayerCharacter(r0_15, 0)
  local r2_15 = UE4.UGameplayStatics.GetGameMode(r0_15)
  local r3_15 = UE4.UGameplayStatics.GetGameState(r0_15)
  if r1_15.UIModePlatform == "PC" then
    if r0_0.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad then
      r0_15:GetOrAddWidget("BattleKeyDescList", r0_15.Pos_KeyTip):InitKey({
        {
          Type = "Img",
          DescText = GText("UI_Keyboard_Map_OpenArmory"),
          ImgShortPath = r0_0.GetIconListByActionName("OpenArmory"),
        },
        {
          Type = "Img",
          DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
          ImgShortPath = r0_0.GetIconListByActionName("TrainingCharacterSkills"),
        }
      })
      r0_15:AddTrialRightKeyListeners()
    else
      local r5_15 = r0_15:GetOrAddWidget("BattleKeyDescList", r0_15.Pos_KeyTip)
      if r5_15 then
        r5_15:SetVisibility(UE4.ESlateVisibility.Visible)
        local r6_15 = {}
        r0_15:AddTrialRightKeyListeners()
        local r7_15 = DataMgr.KeyboardMap.TrainingCharacterSkills
        local r8_15 = "F2"
        if r7_15 then
          local r9_15 = r7_15.Key
        end
        table.insert(r6_15, {
          Type = "Text",
          Text = r8_15,
          DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
          CallbackObj = r0_15,
          CallbackFunc = r0_15.TrialCharacterSkills,
        })
        r5_15:InitKey(r6_15)
      end
    end
  end
end
function r6_0.UnInitTrainingKeyTip(r0_16)
  -- line: [351, 363] id: 16
  local r1_16 = UE4.UGameplayStatics.GetPlayerCharacter(r0_16, 0)
  r0_16.Pos_KeyTip:ClearChildren()
  if r1_16.UIModePlatform == "Mobile" then
    r0_16.Pos_Training:ClearChildren()
  end
  local r2_16 = r3_0:GetTaskBarWidget()
  if r2_16 then
    r2_16:SetUIVisibilityTag("Training", false)
  end
end
function r6_0.UnInitTrialKeyTip(r0_17)
  -- line: [365, 371] id: 17
  local r1_17 = UE4.UGameplayStatics.GetPlayerCharacter(r0_17, 0)
  r0_17.Pos_KeyTip:ClearChildren()
  if r1_17.UIModePlatform == "Mobile" then
    r0_17.Pos_Training:ClearChildren()
  end
end
function r6_0.UnInitTemple(r0_18)
  -- line: [373, 379] id: 18
  local r1_18 = r3_0:GetTaskBarWidget()
  if r1_18 then
    r1_18:SetUIVisibilityTag("Temple", false)
    r1_18:SetUIVisibilityTag("Party", false)
  end
end
function r6_0.InitKeyTip(r0_19)
  -- line: [381, 410] id: 19
  local r1_19 = UE4.UGameplayStatics.GetPlayerCharacter(r0_19, 0)
  local r2_19 = UE4.UGameplayStatics.GetGameMode(r0_19)
  local r3_19 = UE4.UGameplayStatics.GetGameState(r0_19)
  if r2_19 ~= nil and r3_19 ~= nil and r3_19.GameModeType == "Training" then
    r0_19:InitTrainingKeyTip()
  elseif r2_19 ~= nil and r3_19 ~= nil and r3_19.GameModeType == "Temple" then
    r0_19:AddDispatcher(EventID.OnTempleEnter, r0_19, r0_19.OnTempleEnter)
    r0_19:AddDispatcher(EventID.OnTempleDelayStart, r0_19, r0_19.OnTempleDelayStart)
    r0_19:AddDispatcher(EventID.OnTempleDelayEnd, r0_19, r0_19.OnTempleDelayEnd)
  elseif r3_19 ~= nil and r3_19.GameModeType == "Party" then
    r0_19:OnPartyEnter()
  elseif r2_19 ~= nil and r3_19 ~= nil and r3_19.GameModeType == "Rouge" then
    r0_19:AddRougeKeyListeners()
  elseif r3_19.GameModeType == "Trial" then
    r0_19:InitTrailKeyTip()
    r0_19.bInTrial = true
  else
    r0_19:UnInitTrainingKeyTip()
    r0_19:UnInitTrialKeyTip()
    r0_19:UnInitTemple()
  end
  r0_19:InitChatKeyTip()
end
function r6_0.InitCommonKey(r0_20, r1_20, r2_20)
  -- line: [412, 451] id: 20
  local r3_20 = UE4.UGameplayStatics.GetGameMode(r0_20)
  local r4_20 = UE4.UGameplayStatics.GetGameState(r0_20)
  if r3_20 ~= nil and r4_20 ~= nil and r4_20.GameModeType == "Training" then
    local r5_20 = ""
    if r2_20 == 1 then
      r5_20 = "F4"
    elseif r2_20 == 2 then
      r5_20 = "F1"
    elseif r2_20 == 3 then
      r5_20 = "F5"
    end
    r1_20:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = r5_20,
        }
      },
      bLongPress = false,
      Desc = GText("UI_DUNGEON_DES_TRAINING_" .. r2_20),
    })
    r1_20:AddExecuteLogic(r0_20, function()
      -- line: [432, 432] id: 21
      r0_20:OnTrainingRightKeyClicked(r2_20)
    end)
  end
  if r3_20 ~= nil and r4_20 ~= nil and r4_20.GameModeType == "Temple" then
    r1_20:CreateCommonKey({
      KeyInfoList = {
        {
          Type = r0_20.ForbidInfo[r2_20][2],
          Text = r0_20.ForbidInfo[r2_20][3],
          ImgShortPath = r0_20.ForbidInfo[r2_20][3],
        }
      },
      bLongPress = false,
      Desc = GText(r0_20.ForbidInfo[r2_20][1]),
    })
    r1_20:ShowBanImg()
    r1_20:DisableKey()
    if UE4.UGameplayStatics.GetPlayerCharacter(r0_20, 0).UIModePlatform == "Mobile" then
      r1_20:MobileBanTextImg()
    end
  end
end
function r6_0.SetOverrideInfo(r0_22, r1_22, r2_22)
  -- line: [453, 465] id: 22
  if r0_22.SizeBox_Map then
    r0_22.SizeBox_Map:SetWidthOverride(r1_22)
  end
  if not r0_22.Task then
    return 
  end
  r0_22.Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r3_22 = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(r0_22.Task)
  if r3_22 then
    local r4_22 = r3_22.Padding
    r4_22.Top = r2_22
    r3_22:SetPadding(r4_22)
  end
end
function r6_0.TempleForbidSkills(r0_23, r1_23)
  -- line: [467, 488] id: 23
  if not r1_23 then
    return 
  end
  local r2_23 = DataMgr.KeyboardMap
  local r3_23 = {}
  if r1_23.NoSkill and r1_23.NoSkill ~= 0 then
    table.insert(r3_23, {
      r2_23.Skill1.ActionNameText,
      "Text",
      r2_23.Skill1.Key
    })
    table.insert(r3_23, {
      r2_23.Skill2.ActionNameText,
      "Text",
      r2_23.Skill2.Key
    })
    table.insert(r3_23, {
      r2_23.Skill3.ActionNameText,
      "Text",
      r2_23.Skill3.Key
    })
  end
  if r1_23.NoMelee and r1_23.NoMelee ~= 0 then
    table.insert(r3_23, {
      r2_23.Attack.ActionNameText,
      "Img",
      r2_23.Attack.Key
    })
  end
  if r1_23.NoRanged and r1_23.NoRanged ~= 0 then
    table.insert(r3_23, {
      r2_23.Fire.ActionNameText,
      "Img",
      r2_23.Fire.Key
    })
  end
  if r1_23.NoBattleWheel and r1_23.NoBattleWheel ~= 0 then
    table.insert(r3_23, {
      r2_23.OpenBattleWheel.ActionNameText,
      "Text",
      r2_23.OpenBattleWheel.Key
    })
  end
  return r3_23
end
function r6_0.AddTrainingRightKeyListeners(r0_24)
  -- line: [490, 509] id: 24
  if r0_24.IsInTraining then
    return 
  end
  r0_24:ListenForInputAction("TrainingOpenSetup", EInputEvent.IE_Pressed, true, {
    r0_24,
    r0_24.TrainingOpenSetup
  })
  r0_24:ListenForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed, true, {
    r0_24,
    r0_24.TrainingCharacterSkills
  })
  r0_24:ListenForInputAction("TrainingKillMonsters", EInputEvent.IE_Pressed, true, {
    r0_24,
    r0_24.TrainingKillMonsters
  })
  r0_24:ListenForInputAction("TrainingInvincible", EInputEvent.IE_Pressed, true, {
    r0_24,
    r0_24.TrainingSetPlayerInvincible
  })
  r0_24:ListenForInputAction("TrainingMonstersActive", EInputEvent.IE_Pressed, true, {
    r0_24,
    r0_24.TrainingDisableMonsterAI
  })
  r0_24:StopListeningForInputAction("OpenEvent", EInputEvent.IE_Pressed)
  r0_24:StopListeningForInputAction("OpenBattlePass", EInputEvent.IE_Pressed)
  r0_24:StopListeningForInputAction("OpenGacha", EInputEvent.IE_Pressed)
  r0_24:StopListeningForInputAction("OpenBag", EInputEvent.IE_Pressed)
  r0_24:StopListeningForInputAction("OpenPlay", EInputEvent.IE_Pressed)
  r0_24.IsInTraining = true
end
function r6_0.RemoveTrainingRightKeyListeners(r0_25)
  -- line: [511, 524] id: 25
  r0_25:StopListeningForInputAction("TrainingOpenSetup", EInputEvent.IE_Pressed)
  r0_25:StopListeningForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed)
  r0_25:StopListeningForInputAction("TrainingKillMonsters", EInputEvent.IE_Pressed)
  r0_25:StopListeningForInputAction("TrainingInvincible", EInputEvent.IE_Pressed)
  r0_25:StopListeningForInputAction("TrainingMonstersActive", EInputEvent.IE_Pressed)
  r0_25:ListenForInputAction("OpenBattlePass", EInputEvent.IE_Pressed, false, {
    r0_25,
    r0_25.OpenBattlePass
  })
  r0_25:ListenForInputAction("OpenGacha", EInputEvent.IE_Pressed, false, {
    r0_25,
    r0_25.OpenGacha
  })
  r0_25:ListenForInputAction("OpenEvent", EInputEvent.IE_Pressed, false, {
    r0_25,
    r0_25.OpenEvent
  })
  r0_25:ListenForInputAction("OpenBag", EInputEvent.IE_Pressed, false, {
    r0_25,
    r0_25.OpenBag
  })
  r0_25:ListenForInputAction("OpenPlay", EInputEvent.IE_Pressed, false, {
    r0_25,
    r0_25.OpenPlay
  })
end
function r6_0.AddRougeKeyListeners(r0_26)
  -- line: [526, 530] id: 26
  r0_26:RemoveRougeKeyListeners()
  r0_26:ListenForInputAction("RougeOpenBag", EInputEvent.IE_Pressed, false, {
    r0_26,
    r0_26.OpenRogueShop
  })
end
function r6_0.RemoveRougeKeyListeners(r0_27)
  -- line: [532, 534] id: 27
  r0_27:StopListeningForInputAction("RougeOpenBag", EInputEvent.IE_Pressed)
end
function r6_0.OnTrainingRightKeyClicked(r0_28, r1_28)
  -- line: [536, 544] id: 28
  if r1_28 == 1 then
    r0_28:TrainingOpenSetup()
  elseif r1_28 == 2 then
    r0_28:TrainingCharacterSkills()
  elseif r1_28 == 3 then
    r0_28:TrainingKillMonsters()
  end
end
function r6_0.AddTrialRightKeyListeners(r0_29)
  -- line: [546, 553] id: 29
  r0_29:RemoveTrialRightKeyListeners()
  r0_29:ListenForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed, false, {
    r0_29,
    r0_29.TrialCharacterSkills
  })
  r0_29:ListenForInputAction("OpenTask", EInputEvent.IE_Pressed, false, {
    r0_29,
    r0_29.TrialCharacterSkills
  })
end
function r6_0.RemoveTrialRightKeyListeners(r0_30)
  -- line: [555, 559] id: 30
  r0_30:StopListeningForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed)
  r0_30:StopListeningForInputAction("OpenTask", EInputEvent.IE_Pressed)
end
function r6_0.OnTrialRightKeyClicked(r0_31, r1_31)
  -- line: [561, 565] id: 31
  if r1_31 == 2 then
    r0_31:TrialCharacterSkills()
  end
end
function r6_0.TrialCharacterSkills(r0_32)
  -- line: [567, 569] id: 32
  r0_0.LoadPreviewSkillDetails(r0_32, {
    OnClosedCallback = function()
      -- line: [568, 568] id: 33
      r0_32:PlayInAnim()
    end,
  })
end
function r6_0.OnTempleEnter(r0_34)
  -- line: [571, 588] id: 34
  local r1_34 = UE4.UGameplayStatics.GetGameInstance(r0_34)
  if r1_34:GetGameUIManager() == nil then
    return 
  end
  local r3_34 = r1_34:GetGameUIManager()
  local r4_34 = r3_34:GetUIObj("GuideCountDown")
  if r4_34 then
    r4_34:OnCountDownEnd()
    r4_34:Close()
  end
  r4_34 = r3_34:LoadUINew("GuideCountDown")
  r4_34:SetVisibility(ESlateVisibility.Collapsed)
  r0_34:AddTimer(1, r0_34.ShowCountDown, false, 0, "ShowCountDown", nil, r4_34, 4)
  r0_34.Pos_TaskBar:SetVisibility(ESlateVisibility.Collapsed)
  r0_34.Pos_DynamicEvent:SetVisibility(ESlateVisibility.Collapsed)
end
function r6_0.ShowCountDown(r0_35, r1_35, r2_35, r3_35)
  -- line: [590, 593] id: 35
  r1_35:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r1_35:InitTempleCountDown(r2_35, r3_35)
end
function r6_0.OnTempleDelayStart(r0_36, r1_36, r2_36, r3_36)
  -- line: [595, 603] id: 36
  DebugPrint("zwk OnTempleDelayStart", r1_36, r2_36, r3_36)
  r0_36.Pos_TempleTime:ClearChildren()
  r0_36.CurDelayUI = r0_36:CreateWidgetNew("DungeonTempleTime")
  r0_36.Pos_TempleTime:AddChild(r0_36.CurDelayUI)
  r0_36.Pos_TempleTime:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_36.CurDelayUI:InitTempleDelayTimeUI(r2_36, r1_36, r3_36)
end
function r6_0.OnTempleDelayEnd(r0_37)
  -- line: [605, 610] id: 37
  DebugPrint("zwk OnTempleDelayEnd")
  if r0_37.CurDelayUI then
    r0_37.CurDelayUI:CloseDungeonUI()
  end
end
function r6_0.GetTrainingComp(r0_38)
  -- line: [612, 619] id: 38
  local r1_38 = UE4.UGameplayStatics.GetGameMode(r0_38)
  if r1_38 then
    return r1_38:GetDungeonComponent()
  end
  return nil
end
function r6_0.TrainingOpenSetup(r0_39)
  -- line: [621, 623] id: 39
  r0_39:GetTrainingComp():TrainingOpenSetup()
end
function r6_0.TrainingCharacterSkills(r0_40)
  -- line: [625, 627] id: 40
  r0_40:GetTrainingComp():TrainingCharacterSkills()
end
function r6_0.TrainingKillMonsters(r0_41)
  -- line: [629, 632] id: 41
  AudioManager(r0_41):PlayUISound(r0_41, "event:/ui/common/btn_killer_all", nil, nil)
  r0_41:GetTrainingComp():TrainingKillMonsters()
end
function r6_0.TrainingSetPlayerInvincible(r0_42)
  -- line: [634, 636] id: 42
  r0_42:GetTrainingComp():TrainingSetPlayerInvincible()
end
function r6_0.TrainingDisableMonsterAI(r0_43)
  -- line: [638, 640] id: 43
  r0_43:GetTrainingComp():TrainingDisableMonsterAI()
end
function r6_0.InitUID(r0_44)
  -- line: [642, 651] id: 44
  r0_44.Text_BottomTips:SetText(GText("UI_Loading_Testing"))
  local r1_44 = GWorld:GetAvatar()
  if r1_44 and r1_44.Uid ~= 0 then
    r0_44.UID:SetUid()
    r0_44.UID:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_44.UID:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r6_0.InitEsc(r0_45)
  -- line: [653, 659] id: 45
  r0_45.Btn_Esc.bForceInvisible = nil
  r0_45.Btn_Esc.Btn_top.OnClicked:Add(r0_45, r0_45.OpenCommonSetup)
  r0_45.Btn_Esc:LoadImage(11)
  r0_45:_RefreshEscReddot()
end
function r6_0.Destruct(r0_46)
  -- line: [661, 675] id: 46
  for r5_46, r6_46 in pairs(r0_46.TeammateEidSet and {}) do
    r0_46:RemoveTeammateUI(r5_46, r6_46)
  end
  -- close: r1_46
  r0_46.TeammateEidSet = {}
  r0_46:EndAim()
  r0_46:EndChat()
  r0_46:EndTeam()
  r0_46:RemoveTrainingRightKeyListeners()
  r0_46:RemoveTrialRightKeyListeners()
  r0_46:RemoveRougeKeyListeners()
  ReddotManager.RemoveListener(DataMgr.ReddotNode.Quest.NodeName, r0_46)
  r6_0.Super.Destruct(r0_46)
end
function r6_0.InitDataPhone(r0_47)
  -- line: [677, 696] id: 47
  if r0_47.Battery then
    local r1_47 = r0_47.Battery.HB_Battery
    local r3_47 = UUCloudGameInstanceSubsystem.IsCloudGame()
    if not r3_47 then
      r3_47 = UIConst.VisibilityOp.SelfHitTestInvisible and UIConst.VisibilityOp.Collapsed
    else
      goto label_16	-- block#3 is visited secondly
    end
    r1_47:SetVisibility(r3_47)
  end
  if UE4.UGameplayStatics.GetPlayerCharacter(r0_47, 0).UIModePlatform ~= "Mobile" then
    return 
  end
  r0_47.WifiImage = {
    r0_47.Battery.Wifi_1,
    r0_47.Battery.Wifi_2,
    r0_47.Battery.Wifi_3
  }
  r0_47.DataImage = {
    r0_47.Battery.Image_Net_1,
    r0_47.Battery.Image_Net_2,
    r0_47.Battery.Image_Net_3,
    r0_47.Battery.Image_Net_4
  }
  if not GWorld.IsDev then
    r0_47.Btn_GM:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_47.Btn_GM:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  r0_47:SetBattery(UE4.UUIFunctionLibrary.GetBatteryLevel())
  r0_47:UpdateSignalStrength()
  r0_47:AddTimer(5, r0_47.UpdateDataPhone, true)
end
function r6_0.UpdateDataPhone(r0_48)
  -- line: [698, 701] id: 48
  r0_48:SetBattery(UE4.UUIFunctionLibrary.GetBatteryLevel(), r0_48.BatteryLevel)
  r0_48:UpdateSignalStrength(r0_48.SignalStrength)
end
function r6_0.SetBattery(r0_49, r1_49, r2_49)
  -- line: [703, 720] id: 49
  if r1_49 and not r2_49 then
    if r1_49 <= 20 then
      r0_49.Battery:PlayAnimation(r0_49.Battery.Low_Battery)
    else
      r0_49.Battery:PlayAnimationReverse(r0_49.Battery.Low_Battery)
    end
  elseif r1_49 <= 20 and r2_49 > 20 then
    r0_49.Battery:PlayAnimation(r0_49.Battery.Low_Battery)
  elseif r1_49 > 20 and r2_49 <= 20 then
    r0_49.Battery:PlayAnimationReverse(r0_49.Battery.Low_Battery)
  end
  if not r0_49.BatteryLevel or r1_49 ~= r0_49.BatteryLevel then
    r0_49.Battery.Num_Battery:SetText(r1_49 .. "%")
    r0_49.Battery.ProgressBar_Battery:SetPercent(r1_49 / 100)
    r0_49.BatteryLevel = r1_49
  end
end
function r6_0.UpdateSignalStrength(r0_50, r1_50)
  -- line: [722, 758] id: 50
  local r2_50 = UE4.UMobilePatchingLibrary.HasActiveWiFiConnection()
  local r3_50 = r0_50.Battery.Switcher_Net
  local r5_50 = nil	-- notice: implicit variable refs by block#[3]
  if r2_50 then
    r5_50 = 1
    if not r5_50 then
      ::label_12::
      r5_50 = 0
    end
  else
    goto label_12	-- block#2 is visited secondly
  end
  r3_50:SetActiveWidgetIndex(r5_50)
  local r4_50 = UE4.UGameplayStatics.GetPlayerCharacter(r0_50, 0):GetController().PlayerState
  if not r4_50 then
    DebugPrint(ErrorTag, "xuxiangnan::PlayerState获取失败，拿不到正确ping值")
    return 
  end
  r5_50 = r4_50:GetPlayerPing()
  r0_50.Battery.Num_Net:SetText(r5_50)
  local r6_50 = 5
  for r10_50 = 1, #Const.SignalStrength, 1 do
    if r5_50 <= Const.SignalStrength[r10_50] then
      r6_50 = r6_50 - r10_50
      break
    end
  end
  local r13_50 = nil	-- notice: implicit variable refs by block#[14, 21]
  for r10_50 = 2, #r0_50.WifiImage, 1 do
    local r11_50 = r0_50.WifiImage[r10_50]
    if r2_50 and r10_50 <= r6_50 then
      r13_50 = UE4.ESlateVisibility.SelfHitTestInvisible
      if not r13_50 then
        ::label_70::
        r13_50 = UE4.ESlateVisibility.Collapsed
      end
    else
      goto label_70	-- block#13 is visited secondly
    end
    r11_50:SetVisibility(r13_50)
  end
  for r10_50 = 2, #r0_50.DataImage, 1 do
    local r11_50 = r0_50.DataImage[r10_50]
    if not r2_50 and r10_50 <= r6_50 then
      r13_50 = UE4.ESlateVisibility.SelfHitTestInvisible
      if not r13_50 then
        ::label_92::
        r13_50 = UE4.ESlateVisibility.Collapsed
      end
    else
      goto label_92	-- block#20 is visited secondly
    end
    r11_50:SetVisibility(r13_50)
  end
  if not r1_50 then
    if r6_50 <= 2 then
      r0_50.Battery:PlayAnimation(r0_50.Battery.Low_Net)
    else
      r0_50.Battery:PlayAnimationReverse(r0_50.Battery.Low_Net)
    end
  elseif r6_50 <= 2 and r0_50.SignalStrength > 2 then
    r0_50.Battery:PlayAnimation(r0_50.Battery.Low_Net)
  elseif r6_50 > 2 and r0_50.SignalStrength <= 2 then
    r0_50.Battery:PlayAnimationReverse(r0_50.Battery.Low_Net)
  end
  r0_50.SignalStrength = r6_50
end
function r6_0.ExitHardBossBattle(r0_51)
  -- line: [760, 775] id: 51
  local r1_51 = UIManager(r0_51):GetUIObj("CommonDialog")
  if r1_51 then
    r1_51:Close()
  end
  r0_51:SetInputUIOnly(false)
  local r2_51 = UE4.UGameplayStatics.GetPlayerCharacter(r0_51, 0)
  if IsStandAlone(r2_51) then
    UE4.UGameplayStatics.GetGameMode(r2_51):SetGamePaused(UIConst.CommonSetUP, false)
  end
  local r3_51 = GWorld:GetAvatar()
  if r3_51 then
    r3_51:ExitBattle(false, true)
  end
end
function r6_0.ExitHardBattle(r0_52)
  -- line: [777, 790] id: 52
  local r1_52 = UIManager(r0_52):GetUIObj("CommonDialog")
  if r1_52 then
    r1_52:Close()
  end
  r0_52:SetInputUIOnly(false)
  local r2_52 = UE4.UGameplayStatics.GetPlayerCharacter(r0_52, 0)
  if IsStandAlone(r2_52) then
    UE4.UGameplayStatics.GetGameMode(r2_52):SetGamePaused(UIConst.CommonSetUP, false)
  end
  DebugPrint("gyy@SpecialQuestFail,ExitSpecialQuest")
  EventManager:FireEvent(EventID.OnSpecialQuestFail, "Exit")
end
function r6_0.ContinueBattle(r0_53)
  -- line: [792, 799] id: 53
  r0_53:SetInputUIOnly(false)
  local r1_53 = UE4.UGameplayStatics.GetPlayerCharacter(r0_53, 0)
  if IsStandAlone(r1_53) then
    UE4.UGameplayStatics.GetGameMode(r1_53):SetGamePaused(UIConst.CommonSetUP, false)
  end
end
function r6_0.OpenCommonSetup(r0_54)
  -- line: [802, 813] id: 54
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return 
  end
  if r0_0.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and r0_54:GetOnlineActionBtn() then
    r0_54:OnPressGamePadRightSpecial()
    return 
  end
  r0_54:OpenSystemByAction("OpenCommonSetup")
end
function r6_0.OnPressGamePadRightSpecial(r0_55)
  -- line: [814, 838] id: 55
  DebugPrint("正在打开多人动作界面")
  local r1_55 = r0_55:GetOnlineActionBtn()
  if r1_55 then
    r0_0:LongPressKey(r1_55.Key_OnlineAction_GamePad, function()
      -- line: [818, 821] id: 56
      require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController"):OpenView()
    end, 1)
    return 
  end
end
function r6_0.OnReleaseGmaePadRightSpecial(r0_57)
  -- line: [840, 854] id: 57
  local r1_57 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
  if not r1_57.MainPage or not r1_57.MainPage:IsVisible() then
    local r2_57 = r0_57:GetOnlineActionBtn()
    if r2_57 then
      r0_0:StopLongPressKey(r2_57.Key_OnlineAction_GamePad)
    end
    r0_57:OpenSystemByAction("OpenCommonSetup")
  end
end
function r6_0.GetOnlineActionBtn(r0_58)
  -- line: [856, 864] id: 58
  local r2_58 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController").OnlineActionBtn and r0_58.OnlineActionBtn
  if IsValid(r2_58) and r2_58:IsVisible() then
    return r2_58
  end
  return false
end
function r6_0.OpenSystemEntrance(r0_59)
  -- line: [865, 867] id: 59
  r0_59:OpenSystemByAction("OpenSystemEntrance")
end
function r6_0.CloseSystemEntrance(r0_60)
  -- line: [869, 871] id: 60
  r0_60:OpenSystemByAction("CloseSystemEntrance")
end
function r6_0.ShowSystemEntrance(r0_61)
  -- line: [873, 883] id: 61
  r0_61.IsShowSystemEntrance = true
  for r4_61 = 0, r0_61.ListView:GetNumItems() + -1, 1 do
    local r5_61 = r0_61.ListView:GetItemAt(r4_61)
    if r5_61 then
      r5_61.SelfWidget:ShowSystemEntranceOnGamePadInput(r0_61.IsShowSystemEntrance)
    end
  end
  r0_61.Btn_Task:ShowSystemEntranceOnGamePadInput(r0_61.IsShowSystemEntrance)
end
function r6_0.CloseSystemEntrance(r0_62)
  -- line: [885, 895] id: 62
  r0_62.IsShowSystemEntrance = false
  for r4_62 = 0, r0_62.ListView:GetNumItems() + -1, 1 do
    local r5_62 = r0_62.ListView:GetItemAt(r4_62)
    if r5_62 then
      r5_62.SelfWidget:ShowSystemEntranceOnGamePadInput(r0_62.IsShowSystemEntrance)
    end
  end
  r0_62.Btn_Task:ShowSystemEntranceOnGamePadInput(r0_62.IsShowSystemEntrance)
end
function r6_0.OpenArmory(r0_63)
  -- line: [897, 908] id: 63
  local r1_63 = UE4.UGameplayStatics.GetGameState(r0_63)
  if r1_63 and r1_63.GameModeType == "Trial" then
    local r2_63 = UE4.UGameplayStatics.GetGameMode(r0_63)
    if r2_63 then
      r2_63:TriggerDungeonComponentFun("ShowArmory")
    end
  else
    r0_63:OpenSystemByAction("OpenArmory")
  end
end
function r6_0.OpenBag(r0_64)
  -- line: [910, 912] id: 64
  r0_64:OpenSystemByAction("OpenBag")
end
function r6_0.OpenPlay(r0_65)
  -- line: [914, 916] id: 65
  r0_65:OpenSystemByAction("OpenPlay")
end
function r6_0.OpenTaskPanel(r0_66)
  -- line: [918, 920] id: 66
  r0_66:OpenSystemByAction("OpenTask")
end
function r6_0.OpenGuideBook(r0_67)
  -- line: [922, 924] id: 67
  r0_67:OpenSystemByAction("OpenGuideBook")
end
function r6_0.OpenBattlePass(r0_68)
  -- line: [926, 928] id: 68
  r0_68:OpenSystemByAction("OpenBattlePass")
end
function r6_0.OpenEvent(r0_69)
  -- line: [930, 932] id: 69
  r0_69:OpenSystemByAction("OpenEvent")
end
function r6_0.OpenForge(r0_70)
  -- line: [934, 936] id: 70
  r0_70:OpenSystemByAction("OpenForge")
end
function r6_0.OpenGacha(r0_71)
  -- line: [938, 940] id: 71
  r0_71:OpenSystemByAction("OpenGacha")
end
function r6_0.OpenRogueShop(r0_72)
  -- line: [942, 945] id: 72
  r0_72:GetGameInstance():GetGameUIManager():LoadUINew("RougeBag")
end
function r6_0.OpenSystemByAction(r0_73, r1_73, r2_73, ...)
  -- line: [949, 990] id: 73
  if not UIManager(r0_73):TryOpenSystem("BattleHUD") then
    return 
  end
  local r3_73 = UKismetSystemLibrary.GetFrameCount()
  if r0_73.FrameCount == r3_73 then
    return 
  end
  r0_73.FrameCount = r3_73
  if r1_73 == "OpenCommonSetup" then
    r0_0.OpenEsc()
    return 
  elseif r1_73 == "OpenSystemEntrance" then
    r0_73:ShowSystemEntrance()
    return 
  elseif r1_73 == "CloseSystemEntrance" then
    r0_73:CloseSystemEntrance()
    return 
  end
  local r4_73 = GWorld:GetAvatar()
  if r4_73 and r4_73:IsInHardBoss() and r1_73 ~= "OpenChat" then
    return 
  end
  local r5_73 = UE4.UGameplayStatics.GetPlayerCharacter(r0_73, 0)
  if r5_73:CheckForbidTags(r1_73) then
    return 
  end
  if (r0_73:IsPlayingAnimation(r0_73.Out) or r0_73:IsPlayingAnimation(r0_73.In)) and not r5_73.IsImmersionModel then
    return 
  end
  local r6_73 = nil
  for r11_73, r12_73 in pairs(DataMgr.MainUI) do
    local r13_73 = r12_73.ActionName
    if r13_73 and r13_73 == r1_73 then
      r6_73 = r11_73
    end
  end
  -- close: r7_73
  if r6_73 ~= nil then
    AudioManager(r0_73):PlayUISound(r0_73, "event:/ui/common/click_btn_system_entrance", nil, nil)
    r0_0.OpenSystem(r6_73, r2_73, ...)
  end
end
function r6_0.AddTeammateUI(r0_74, r1_74, r2_74, r3_74)
  -- line: [994, 1063] id: 74
  if GameState(r0_74).GameModeType == "Party" then
    DebugPrint("TeamSyncDebug  Party模式不创建队友血条UI", r1_74)
    return 
  end
  DebugPrint(DebugTag, LXYTag, "TeamSyncDebug 有角色产生，魅影或玩家", r2_74, r1_74)
  if GameState(r0_74):GetPhantomState(r1_74) then
    DebugPrint("TeamSyncDebug  PhantomArray存在该魅影，看一下OwnerEid,", GameState(r0_74):GetPhantomState(r1_74).OwnerEid)
  end
  if not r3_74 then
    r3_74 = Battle(r0_74):GetEntity(r1_74)
  end
  local r5_74 = nil	-- notice: implicit variable refs by block#[18, 20]
  if r0_74.TeammateEidSet[r1_74] then
    if r3_74 and r3_74.TeammateUI then
      r3_74.TeammateUI:ReInit()
      r5_74 = r3_74.TeammateUI
      r0_74.TeammateEidSet[r1_74] = r5_74
    end
    return 
  end
  if r0_74:AddBattleTeamBloodBar(r1_74, r2_74, r3_74) then
    if r2_74 then
      return 
    end
    if not r2_74 then
      local r4_74 = GWorld:GetMainPlayer()
      if r3_74 then
        r5_74 = r3_74.PhantomState
        if not r5_74 then
          ::label_81::
          r5_74 = GameState(r0_74)
          r5_74 = r5_74:GetPhantomState(r1_74)
        end
      else
        goto label_81	-- block#17 is visited secondly
      end
      if not r5_74 then
        Utils.Traceback(WarningTag, LXYTag .. "TeamSyncDebug  AddTeammateUI  拿不到PhantomState直接返回")
        return 
      end
      local r6_74 = r5_74.OwnerEid
      if not r6_74 then
        Utils.Traceback(WarningTag, LXYTag .. "TeamSyncDebug非常怀疑魅影的初始化流程有时序问题..")
        return 
      end
      if r6_74 ~= r4_74.Eid then
        return 
      end
    end
  end
  if not IsValid(r3_74) or r3_74.IsSimplePlayer or r3_74.IsHostage or r3_74.FromOtherWorld then
    return 
  end
  local r4_74 = UE4.UGameplayStatics.GetPlayerCharacter(r0_74, 0)
  r5_74 = r3_74.Eid
  if r5_74 == r4_74.Eid then
    DebugPrint(DebugTag, LXYTag, "TeamSyncDebug 自身不应该产生血条", r4_74.Eid)
    return 
  end
  r5_74 = r0_74:CreateWidgetNew("TeammateBloodBar")
  r5_74:InitConfig(r3_74)
  r3_74.TeammateUI = r5_74
  r3_74:SetTeammateUI(r5_74)
  r0_74.VB_Teammate_Phantom:AddChildToVerticalBox(r5_74)
  local r6_74 = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(r5_74)
  if r6_74 then
    local r7_74 = FMargin(0, 0, 0, 0)
    if CommonUtils:GetDeviceTypeByPlatformName(r0_74) == "PC" then
      r7_74.Top = 10
    end
    r6_74:SetPadding(r7_74)
  end
  if not next(r0_74.TeammateEidSet) then
    r0_74:Show1PTagBar(true)
    r0_74.VB_Teammate_Phantom:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_74.TeammateEidSet[r1_74] = r5_74
end
function r6_0.RemoveTeammateUI(r0_75, r1_75, r2_75)
  -- line: [1065, 1084] id: 75
  if r0_75:RemoveBattleTeamBloodBar(r1_75) then
    return 
  end
  if not r2_75 then
    return 
  end
  r2_75:BindToAnimationFinished(r2_75.Out, {
    r2_75,
    function()
      -- line: [1073, 1076] id: 76
      r2_75:UnbindAllFromAnimationFinished(r2_75.Out)
      r0_75.VB_Teammate_Phantom:RemoveChild(r2_75)
    end
  })
  r2_75:PlayAnimation(r2_75.Out)
  r0_75.TeammateEidSet[r2_75.Eid] = nil
  if not next(r0_75.TeammateEidSet) then
    r0_75:Show1PTagBar(false)
    r0_75.VB_Teammate_Phantom:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r6_0.UpdateRedDotStates(r0_77)
  -- line: [1087, 1095] id: 77
  DebugPrint("Tianyi@ UpdateRedDotStates")
  for r6_77, r7_77 in ipairs(r0_77.ListView:GetDisplayedEntryWidgets():ToTable()) do
    r7_77:UpdateRedDot()
  end
  -- close: r2_77
  r0_77.Btn_Task:RefreshNewClueUI()
end
function r6_0.InitConditionMapSystem(r0_78)
  -- line: [1098, 1114] id: 78
  r0_78.BattleEntry = r0_78:CreateWidgetNew("BattleEntry")
  r0_78.Pos_Entry:ClearChildren()
  r0_78.Pos_Entry:AddChild(r0_78.BattleEntry)
  r0_78.ListView = r0_78.BattleEntry.List_Entry
  r0_78.ListView:DisableScroll(true)
  r0_78.ConditionMapping = {}
  r0_78.SignBoardNpcLoadComplete = false
  for r5_78, r6_78 in pairs(DataMgr.MainUI) do
    local r7_78 = r6_78.ShowCondition
    if r7_78 then
      r0_78.ConditionMapping[r7_78] = true
    end
  end
  -- close: r1_78
  r0_78:AddDispatcher(EventID.ConditionComplete, r0_78, r0_78.OnConditionComplete)
  r0_78:AddDispatcher(EventID.OnAvatarStatusUpdate, r0_78, r0_78.OnAvatarStatusUpdate)
end
function r6_0.OnConditionComplete(r0_79, r1_79)
  -- line: [1116, 1123] id: 79
  if #r0_79.ConditionMapping == 0 then
    return 
  end
  if r0_79.ConditionMapping[r1_79] then
    r0_79:InitMainUIInBigWorld()
  end
end
function r6_0.OnAvatarStatusUpdate(r0_80, r1_80, r2_80)
  -- line: [1125, 1127] id: 80
  r0_80:InitMainUIInBigWorld()
end
function r6_0.InitMainUIInBigWorld(r0_81)
  -- line: [1129, 1138] id: 81
  r0_81.IsInHomebase = false
  local r1_81 = GWorld:GetAvatar()
  if r1_81 and r1_81:CheckSubRegionType(r1_81:GetCurrentRegionId(), CommonConst.SubRegionType.Home) and r1_81:IsInBigWorld() then
    r0_81.IsInHomebase = true
    r0_81:InitHomeBaseMain()
  else
    r0_81:InitBtnList()
  end
end
function r6_0.InitHomeBaseMain(r0_82)
  -- line: [1140, 1155] id: 82
  r0_82:InitBtnList()
  if not r0_82.SignBoardNpcLoadComplete then
    r0_82:TriggerSignBoardNpc()
    r0_82:AddDispatcher(EventID.OnCharAppearanceChanged, r0_82, r0_82.OnCharAccessoryChange)
    r0_82:AddDispatcher(EventID.OnCharAccessorySetted, r0_82, r0_82.OnCharAccessoryChange)
    r0_82:AddDispatcher(EventID.OnCharAccessoryRemoved, r0_82, r0_82.OnCharAccessoryChange)
    r0_82:AddDispatcher(EventID.OnCharShowPartMesh, r0_82, r0_82.OnCharAccessoryChange)
    r0_82:AddDispatcher(EventID.OnCharCornerVisibilityChanged, r0_82, r0_82.OnCharAccessoryChange)
    r0_82:AddDispatcher(EventID.OnCharSkinChanged, r0_82, r0_82.OnCharSkinChange)
    r0_82:AddDispatcher(EventID.OnCharColorsChanged, r0_82, r0_82.OnCharColorsChanged)
    r0_82:AddDispatcher(EventID.OnWindowResized, r0_82, function(r0_83)
      -- line: [1151, 1153] id: 83
      r0_83.bRebuildChatSimple = true
    end)
  end
end
function r6_0.InitBtnList(r0_84)
  -- line: [1157, 1192] id: 84
  local r1_84 = DataMgr.MainUI
  local r2_84 = GWorld:GetAvatar()
  if not r2_84 then
    return 
  end
  r0_84.SystemUnlockList = {}
  r0_84.SystemSortList = {}
  r0_84.SystemUnlockNums = 0
  for r7_84, r8_84 in pairs(r1_84) do
    local r9_84 = table.insert
    local r10_84 = r0_84.SystemSortList
    local r11_84 = {
      Id = r7_84,
      Sequence = r8_84.Sequence and 0,
    }
    r9_84(r10_84, r11_84)
    if r8_84.ShowCondition ~= nil and ConditionUtils.CheckCondition(r2_84, r8_84.ShowCondition) then
      r0_84.SystemUnlockList[r7_84] = false
      r10_84 = r8_84.UIUnlockRuleName
      if r10_84 == nil then
        r0_84.SystemUnlockList[r7_84] = true
      else
        r0_84.SystemUnlockList[r7_84] = r0_84:CheckUIUnlock(r10_84)
      end
    end
  end
  -- close: r3_84
  r0_84:InitSystemEntrance()
  if r0_84.Btn_GuideBook then
    r0_84:InitGuideBookBtn()
  end
  if r0_84.Btn_Task then
    r0_84:InitTaskPanelBtn()
  end
  r0_84:InitEsc()
end
function r6_0.InitGuideBookBtn(r0_85)
  -- line: [1194, 1205] id: 85
  if r0_85:CheckUIUnlock(DataMgr.MainUI[13].UIUnlockRuleName) then
    r0_85.Btn_GuideBook:LoadImage(13)
    r0_85.Btn_GuideBook.Btn_top.OnClicked:Add(r0_85, r0_85.OpenGuideBook)
    if not r0_85.HideGuideBookBtn then
      r0_85.Btn_GuideBook:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    r0_85.Btn_GuideBook:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r6_0.InitTaskPanelBtn(r0_86)
  -- line: [1207, 1244] id: 86
  local r1_86 = GWorld:GetAvatar()
  if not r1_86 then
    return 
  end
  local r2_86 = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(r0_86)
  local r3_86 = false
  local r4_86 = r1_86:IsInRougeLike()
  local r5_86 = false
  if r2_86 then
    r5_86 = r2_86:IsInDungeon()
  end
  local r6_86 = r1_86:IsInHardBoss()
  local r7_86 = r1_86:IsInSpecialQuest()
  r3_86 = r4_86 and r5_86 and r6_86 and r7_86
  local r8_86 = DataMgr.MainUI[9]
  if not r3_86 then
    if r8_86.ShowCondition and not ConditionUtils.CheckCondition(r1_86, r8_86.ShowCondition) then
      r0_86.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
      return 
    end
    if r0_86:CheckUIUnlock(r8_86.UIUnlockRuleName) then
      r0_86.Btn_Task:LoadImage(9)
      r0_86.Btn_Task.Btn_top.OnClicked:Add(r0_86, r0_86.OpenTaskPanel)
      r0_86.Btn_Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_86.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    r0_86.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r6_0.CheckUIUnlock(r0_87, r1_87)
  -- line: [1246, 1255] id: 87
  local r3_87 = DataMgr.UIUnlockRule[r1_87].UIUnlockRuleId
  local r4_87 = GWorld:GetAvatar()
  if r4_87 and r3_87 then
    return r4_87:CheckUIUnlocked(r3_87)
  else
    return true
  end
end
function r6_0.InitSystemEntrance(r0_88)
  -- line: [1257, 1290] id: 88
  local r1_88 = UE4.LoadClass("/Game/UI/WBP/Battle/Widget/WBP_Main_Btnlist_Content.WBP_Main_Btnlist_Content_C")
  r0_88.ListView:ClearListItems()
  table.sort(r0_88.SystemSortList, function(r0_89, r1_89)
    -- line: [1260, 1262] id: 89
    return r1_89.Sequence < r0_89.Sequence
  end)
  local r2_88 = GWorld:GetAvatar()
  for r7_88, r8_88 in pairs(r0_88.SystemSortList) do
    local r9_88 = DataMgr.MainUI[r8_88.Id]
    if (not r9_88 or not r0_0.CheckCdnHide(r9_88.SystemUIName)) and r0_88.SystemUnlockList[r8_88.Id] then
      r0_88.SystemUnlockNums = r0_88.SystemUnlockNums + 1
      local r10_88 = NewObject(r1_88)
      r10_88.BtnId = r8_88.Id
      local r11_88 = UE4.UGameplayStatics.GetGameState(r0_88)
      if r0_88.bInTrial then
        r10_88.bForbidReddot = true
        DebugPrint("yeke::trial模式不显示红点")
      end
      r0_88.ListView:AddItem(r10_88)
    end
  end
  -- close: r3_88
  if not r0_88.HideSystemEntrance then
    if r0_88.SystemUnlockNums == 0 then
      r0_88.Pos_Entry:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      r0_88.Pos_Entry:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end
function r6_0.TriggerSignBoardNpc(r0_90)
  -- line: [1292, 1316] id: 90
  local r1_90 = GWorld:GetAvatar()
  local r3_90 = UE4.UGameplayStatics.GetGameState(r0_90).StaticCreatorMap:ToTable()
  local r4_90 = {
    "ShowNpc" .. string.sub(DataMgr.TextMap.UI_SHOWNPC_NAME_SCENE1.TextMapId, -7),
    "ShowNpc" .. string.sub(DataMgr.TextMap.UI_SHOWNPC_NAME_SCENE2.TextMapId, -7),
    "ShowNpc" .. string.sub(DataMgr.TextMap.UI_SHOWNPC_NAME_SCENE3.TextMapId, -7)
  }
  local r5_90 = UE4.UGameplayStatics.GetGameMode(r0_90)
  r0_90.NpcStaticCreator = {}
  for r9_90 = 1, #r4_90, 1 do
    for r14_90, r15_90 in pairs(r3_90) do
      if r15_90.UnitType == "Npc" and string.lower(r15_90.DisplayName) == string.lower(r4_90[r9_90]) then
        r0_90.NpcStaticCreator[r9_90] = r15_90
        if r1_90.SignBoardNpc[r9_90] ~= CommonConst.SignBoardUnset then
          r15_90.UnitId = r1_90.SignBoardNpc[r9_90]
          local r16_90 = TArray(0)
          r16_90:Add(r15_90.StaticCreatorId)
          r5_90:TriggerActiveStaticCreator(r16_90)
          break
        else
          break
        end
      end
    end
    -- close: r10_90
  end
  r0_90:SetSignBoardNpcIdle()
end
local r7_0 = UE.EStoryLogType.NPC
function r6_0.SetSignBoardNpcIdle(r0_91)
  -- line: [1318, 1355] id: 91
  local r1_91 = GWorld:GetAvatar()
  if r1_91 == nil then
    return 
  end
  local r2_91 = UE4.UGameplayStatics.GetGameState(r0_91)
  for r7_91, r8_91 in pairs(r1_91.SignBoardNpc) do
    if r8_91 ~= CommonConst.SignBoardUnset then
      local r9_91 = DataMgr.Npc[r8_91]
      if r9_91 and r9_91.ShowAnimationId then
        local r11_91 = r9_91.ShowAnimationId[r7_91]
        r2_91:GetNpcInfoAsync(r8_91, function(r0_92)
          -- line: [1330, 1350] id: 92
          if not IsValid(r0_92) then
            UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, r7_0, "看板娘Npc加载失败", string.format("NpcId: %d 加载失败，确认下是该看板娘被删除或者其他原因", r8_91 and -1))
            return 
          end
          r0_92:InitNpcAccessories(r9_91.CharId)
          if r11_91 == "Sit" and r7_91 ~= CommonConst.SignBoardThird then
            r0_92:SetSitPoseInteractive()
          else
            r0_92:SetIdlePose(false)
          end
          local r1_92 = UE4.UGameplayStatics.GetGameInstance(r0_91)
          if IsValid(r1_92) then
            r1_92:TriggerAllNpcPauseAndHide(r1_92:GetGlobalGameUITag() and "None")
          end
        end)
        -- close: r10_91
      end
      -- close: r9_91
    end
    -- close: r7_91
  end
  -- close: r3_91
  r0_91.SignBoardNpcLoadComplete = true
end
function r6_0.OnCharAccessoryChange(r0_93, r1_93, r2_93)
  -- line: [1357, 1387] id: 93
  -- notice: unreachable block#13
  if r1_93 == ErrorCode.RET_SUCCESS then
    local r3_93 = GWorld:GetAvatar()
    if not r3_93 then
      return 
    end
    local r4_93 = r3_93.Chars[r2_93]
    if not r4_93 then
      return 
    end
    local r5_93 = r4_93.CharId
    for r10_93, r11_93 in pairs(r3_93.SignBoardNpc) do
      if r11_93 ~= CommonConst.SignBoardUnset then
        local r12_93 = DataMgr.Npc[r11_93]
        if r12_93 and r12_93.CharId and r12_93.CharId == r5_93 then
          local r14_93 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
          local r15_93 = r12_93.ShowAnimationId
          local r16_93 = r15_93 and r15_93[r10_93]
          r14_93:GetNpcInfoAsync(r11_93, function(r0_94)
            -- line: [1372, 1381] id: 94
            if not IsValid(r0_94) then
              return 
            end
            r0_94:SetIdlePose(false)
            r0_94:RefreshNpcAccessories(r4_93)
            if r16_93 == "Sit" and r10_93 ~= CommonConst.SignBoardThird then
              r0_94:SetSitPoseInteractive()
            end
          end)
          break
        end
      else
        -- close: r10_93
      end
    end
    -- close: r10_93
    -- close: r3_93
  end
end
function r6_0.OnCharColorsChanged(r0_95, r1_95, r2_95)
  -- line: [1389, 1396] id: 95
  if r1_95 == ErrorCode.RET_SUCCESS then
    local r3_95 = DataMgr.Skin[r2_95]
    if not r3_95 then
      return 
    end
    r0_95:UpdateSignBoardNpcSkin(r3_95.CharId)
  end
end
function r6_0.OnCharSkinChange(r0_96, r1_96, r2_96)
  -- line: [1398, 1407] id: 96
  if r1_96 == ErrorCode.RET_SUCCESS then
    local r3_96 = GWorld:GetAvatar()
    if not r3_96 then
      return 
    end
    local r4_96 = r3_96.Chars[r2_96]
    if not r4_96 then
      return 
    end
    r0_96:UpdateSignBoardNpcSkin(r4_96.CharId)
  end
end
function r6_0.UpdateSignBoardNpcSkin(r0_97, r1_97)
  -- line: [1409, 1442] id: 97
  local r2_97 = GWorld:GetAvatar()
  local r3_97 = nil
  for r8_97, r9_97 in pairs(r2_97.Chars) do
    if r9_97.CharId == r1_97 then
      r3_97 = r9_97
      break
    end
  end
  -- close: r4_97
  for r8_97, r9_97 in pairs(r2_97.SignBoardNpc) do
    if r9_97 ~= CommonConst.SignBoardUnset then
      local r10_97 = DataMgr.Npc[r9_97]
      if r10_97 and r10_97.CharId and r10_97.CharId == r1_97 then
        local r12_97 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
        if r10_97.ShowAnimationId then
          local r14_97 = r10_97.ShowAnimationId[r8_97]
          r12_97:GetNpcInfoAsync(r9_97, function(r0_98)
            -- line: [1427, 1436] id: 98
            if not IsValid(r0_98) then
              return 
            end
            r0_98:SetIdlePose(false)
            r0_98:RefreshNpcAccessories(r3_97)
            if r14_97 == "Sit" and r8_97 ~= CommonConst.SignBoardThird then
              r0_98:SetSitPoseInteractive()
            end
          end)
          -- close: r13_97
          break
        else
          break
        end
      end
    else
      -- close: r8_97
    end
  end
  -- close: r8_97
end
function r6_0.OnHomeBaseBtnPlayAnim(r0_99, r1_99, r2_99)
  -- line: [1445, 1452] id: 99
  r0_99:AddTimer(0.01, function()
    -- line: [1446, 1451] id: 100
    for r5_100, r6_100 in ipairs(r0_99.ListView:GetDisplayedEntryWidgets():ToTable()) do
      r6_100:OnHomeBaseBtnPlayAnim(r1_99, r2_99)
    end
    -- close: r1_100
  end, nil, nil, nil, false)
end
function r6_0.OnSwitchRole(r0_101)
  -- line: [1453, 1462] id: 101
  for r4_101 = 0, r0_101.ListView:GetNumItems() + -1, 1 do
    local r5_101 = r0_101.ListView:GetItemAt(r4_101)
    if r5_101 and r5_101.BtnId == CommonConst.ArmoryEnterId and r5_101.SelfWidget then
      r5_101.SelfWidget:UpdateArmoryIcon()
    end
  end
end
function r6_0.OnSystemUIUnLoad(r0_102, r1_102)
  -- line: [1464, 1477] id: 102
  r0_102:RemovePlayInOutSystems(r1_102)
  local r2_102 = DataMgr.SystemUI[r1_102]
  if r2_102 and r2_102.IsHideBattleUnit and r2_102.IsHideBattleUnit ~= UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll and r2_102.IsHideBattleUnit ~= UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf then
    return 
  end
  if UIManager(r0_102).States:Num() ~= 0 then
    return 
  end
  r0_102:UnLoadSystem(r1_102)
end
function r6_0.UnLoadSystem(r0_103, r1_103)
  -- line: [1479, 1498] id: 103
  local r2_103 = DataMgr.MainUI
  local r3_103 = false
  r0_103:RemovePlayInOutSystems(r1_103)
  for r8_103, r9_103 in pairs(r2_103) do
    if r0_103:CheckNeedPlayInOutAnim(r8_103) then
      local r10_103 = r9_103.SystemUIName
      if r10_103 and r10_103 == r1_103 then
        if UIManager(r0_103):GetUIObj(UIConst.MenuWorld) then
          return false
        end
        r3_103 = r0_103:TryRecoverUI()
        break
      end
    end
  end
  -- close: r4_103
  r0_103:InitChatSimple()
  return r3_103
end
function r6_0.CheckNeedPlayInOutAnim(r0_104, r1_104)
  -- line: [1500, 1508] id: 104
  if r1_104 == CommonConst.ArmoryEnterId then
    return false
  elseif r1_104 == r1_0.MainUIId then
    return false
  end
  return true
end
function r6_0.TryRecoverUI(r0_105)
  -- line: [1510, 1520] id: 105
  local r1_105 = UE4.UGameplayStatics.GetPlayerCharacter(r0_105, 0)
  if IsValid(r1_105) and r1_105.IsImmersionModel then
    r0_105:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return false
  end
  if r0_105:CheckPlayInOutSystems() then
    return 
  end
  r0_105:PlayInAnim()
  r0_105:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  return true
end
function r6_0.PlayInAnim(r0_106)
  -- line: [1522, 1544] id: 106
  if r0_106:CheckPlayInOutSystems() then
    return 
  end
  DebugPrint("-----Jzn---主界面 in-------")
  r0_106:SetUIVisibilityTag("PlayBattleAni", false)
  r0_106:UnbindAllFromAnimationFinished(r0_106.In)
  r0_106:BindToAnimationFinished(r0_106.In, {
    r0_106,
    function()
      -- line: [1528, 1531] id: 107
      r0_106:UnbindAllFromAnimationFinished(r0_106.In)
    end
  })
  r0_106:StopAnimation(r0_106.Out)
  r0_106:PlayAnimation(r0_106.In)
  r0_106.IsPlayOutAnim = false
  local r2_106 = r0_106.Pos_Instruction_Mod:GetChildAt(0)
  if r2_106 and r2_106:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    r2_106:TryGetReward()
  end
end
function r6_0._RefreshEscReddot(r0_108)
  -- line: [1546, 1558] id: 108
  local r1_108 = ReddotManager.GetTreeNode("BattleMainMenu")
  if r1_108 then
    r1_108:TryFireOnCountChange(r1_108.Count, true)
  end
  if ReddotManager.GetTreeNode("ActivityHub") then
    require("Blueprints.UI.WBP.Activity.ActivityUtils").RefreshActivityReddotNode()
  end
end
function r6_0.AddPlayInOutSystems(r0_109, r1_109)
  -- line: [1560, 1568] id: 109
  if r1_109 == nil then
    return 
  end
  if r0_109.PlayInOutSystems == nil then
    r0_109.PlayInOutSystems = {}
  end
  r0_109.PlayInOutSystems[r1_109] = true
end
function r6_0.RemovePlayInOutSystems(r0_110, r1_110)
  -- line: [1571, 1579] id: 110
  if r1_110 == nil then
    return 
  end
  if r0_110.PlayInOutSystems[r1_110] then
    r0_110.PlayInOutSystems[r1_110] = false
  end
  return true
end
function r6_0.CheckPlayInOutSystems(r0_111)
  -- line: [1581, 1590] id: 111
  for r5_111, r6_111 in pairs(r0_111.PlayInOutSystems) do
    if r6_111 then
      DebugPrint("--jzn---系统" .. r5_111 .. "还未关闭,无需播放主界面的In")
      return true
    end
  end
  -- close: r1_111
  r0_111.PlayInOutSystems = {}
  return false
end
function r6_0.PlayOutAnim(r0_112, r1_112, r2_112, r3_112)
  -- line: [1592, 1610] id: 112
  DebugPrint("-----Jzn---主界面 out-------")
  r0_112:SetUIVisibilityTag("PlayBattleAni", true)
  r0_112:StopAnimation(r0_112.In)
  r0_112:PlayAnimation(r0_112.Out)
  r0_112.IsPlayOutAnim = true
  r0_112:UnbindAllFromAnimationFinished(r0_112.Out)
  r0_112:AddPlayInOutSystems(r3_112)
  if r1_112 and r2_112 then
    r2_112(r1_112)
  end
  r0_112:BindToAnimationFinished(r0_112.Out, {
    r0_112,
    function()
      -- line: [1604, 1608] id: 113
      r0_112.IsPlayOutAnim = false
      r0_112:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  })
end
function r6_0.PlayDeathMaskIn(r0_114)
  -- line: [1613, 1619] id: 114
  local r1_114 = r0_114:GetOrAddWidget("DeathMask", r0_114.Pos_Death)
  if r1_114 then
    r1_114:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r1_114:PlayAnimation(r1_114.Mask_Death_In)
  end
end
function r6_0.PlayDeathMaskOut(r0_115)
  -- line: [1621, 1633] id: 115
  local r1_115 = r0_115:GetOrAddWidget("DeathMask", r0_115.Pos_Death)
  if r1_115 then
    if r1_115.Panel_Death:GetVisibility() == UE4.ESlateVisibility.Visible then
      r1_115.Panel_Death:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r1_115:PlayAnimation(r1_115.Mask_Death_Out)
    else
      r1_115:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r6_0.ShowPlayerDeadUI(r0_116)
  -- line: [1636, 1658] id: 116
  if UIManager(r0_116):GetUI(UE4.UGameplayStatics.GetPlayerCharacter(r0_116, 0):GetCurRecoveryUIName()) then
    r0_116:ShowOrHideMainPlayerBloodUI(false, "Dead")
    r0_116:HideSubSystem("Char_Skill", "Dead", true)
    if r0_116.TakeAimIndicator then
      r0_116.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    r0_116:ShowOrHideTeamDataTag(false)
  end
  if r0_116.HBox then
    r0_116.HBox:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if r0_116.IsShowingTeleportUI == true then
    r0_116:StopTeleportInDungeon(true)
  end
end
function r6_0.HidePlayerDeadUI(r0_117)
  -- line: [1661, 1701] id: 117
  r0_117:ShowOrHideMainPlayerBloodUI(true, "Dead")
  r0_117:HideSubSystem("Char_Skill", "Dead", false)
  r0_117.Char_Skill:OnUpdateCharSp(nil, UE4.UGameplayStatics.GetPlayerCharacter(r0_117, 0))
  if r0_117.HBox then
    r0_117.HBox:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if r0_117.TakeAimIndicator then
    r0_117.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    r0_117.TakeAimIndicator:RefreshUIShowPage()
  end
  local r2_117 = GWorld:GetAvatar()
  local r3_117 = false
  local r6_117 = nil	-- notice: implicit variable refs by block#[13]
  if r2_117 ~= nil then
    if not GWorld:IsStandAlone() then
      r3_117 = GameState(r0_117).PlayerArray:Num() > 1
    else
      local r5_117 = TeamController:GetModel():GetTeam()
      if r5_117 == nil then
        r6_117 = 0
        if not r6_117 then
          ::label_73::
          r6_117 = #r5_117.Members
        end
      else
        goto label_73	-- block#12 is visited secondly
      end
      r3_117 = r6_117 > 1
    end
  end
  r0_117:ShowOrHideTeamDataTag(r3_117)
  local r5_117 = UE4.UGameplayStatics.GetPlayerCharacter(r0_117, 0):GetCurRecoveryUIName()
  r6_117 = UIManager(r0_117)
  r6_117 = r6_117:GetUI(r5_117)
  if r6_117 then
    r6_117:Close()
  end
  if r0_117.IsShowingTeleportUI == true then
    r0_117:TeleportReady()
  end
end
function r6_0.ShowBattleFortUI(r0_118)
  -- line: [1704, 1725] id: 118
  local r1_118 = UIManager(r0_118):GetUI("BattleFort")
  if r1_118 then
    if r1_118.HideUITable then
      for r6_118, r7_118 in pairs(r1_118.HideUITable) do
        r0_118:HideSubSystem(r6_118, "BattleFort", true)
        if r6_118 == "Pos_Entry" then
          r0_118.HideSystemEntrance = true
        elseif r6_118 == "Btn_GuideBook" then
          r0_118.HideGuideBookBtn = true
        end
      end
      -- close: r2_118
    end
    r0_118:ShowOrHideMainPlayerBloodUI(false, "BattleFort")
    if r0_118.TakeAimIndicator then
      r0_118.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if IsValid(r0_118.Joystick) then
      r0_118.Joystick:SetTouchVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r6_0.HideBattleFortUI(r0_119)
  -- line: [1728, 1751] id: 119
  local r1_119 = UIManager(r0_119):GetUI("BattleFort")
  if r1_119 then
    if r1_119.HideUITable then
      for r6_119, r7_119 in pairs(r1_119.HideUITable) do
        r0_119:HideSubSystem(r6_119, "BattleFort", false)
        if r6_119 == "Pos_Entry" then
          r0_119.HideSystemEntrance = false
        elseif r6_119 == "Btn_GuideBook" then
          r0_119.HideGuideBookBtn = false
        end
      end
      -- close: r2_119
    end
    r0_119:ShowOrHideMainPlayerBloodUI(true, "BattleFort")
    if r0_119.TakeAimIndicator then
      r0_119.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      r0_119.TakeAimIndicator:RefreshUIShowPage()
    end
    if IsValid(r0_119.Joystick) then
      r0_119.Joystick:SetTouchVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    r0_119:InitBtnList()
  end
end
function r6_0.ShowFeinaEventHUD(r0_120)
  -- line: [1753, 1774] id: 120
  local r1_120 = UIManager(r0_120):LoadUINew("FeinaEventHUD")
  if r1_120 then
    if r1_120.HideUITable then
      for r6_120, r7_120 in pairs(r1_120.HideUITable) do
        r0_120:HideSubSystem(r6_120, "FeinaEvent", true)
        if r6_120 == "Pos_Entry" then
          r0_120.HideSystemEntrance = true
        elseif r6_120 == "Btn_GuideBook" then
          r0_120.HideGuideBookBtn = true
        end
      end
      -- close: r2_120
    end
    r0_120:ShowOrHideMainPlayerBloodUI(false, "FeinaEvent")
    local r2_120 = r3_0:GetTaskBarWidget()
    if r2_120 then
      r2_120:SetUIVisibilityTag("FeinaEvent", true)
    end
  end
end
function r6_0.HideFeinaEventHUD(r0_121)
  -- line: [1776, 1798] id: 121
  local r1_121 = UIManager(r0_121):GetUI("FeinaEventHUD")
  if r1_121 then
    if r1_121.HideUITable then
      for r6_121, r7_121 in pairs(r1_121.HideUITable) do
        r0_121:HideSubSystem(r6_121, "FeinaEvent", false)
        if r6_121 == "Pos_Entry" then
          r0_121.HideSystemEntrance = false
        elseif r6_121 == "Btn_GuideBook" then
          r0_121.HideGuideBookBtn = false
        end
      end
      -- close: r2_121
    end
    r0_121:ShowOrHideMainPlayerBloodUI(false, "FeinaEvent")
    local r2_121 = r3_0:GetTaskBarWidget()
    if r2_121 then
      r2_121:SetUIVisibilityTag("FeinaEvent", false)
    end
    r0_121:InitBtnList()
  end
end
function r6_0.ShowOrHideMainPlayerBloodUI(r0_122, r1_122, r2_122)
  -- line: [1800, 1805] id: 122
  DebugPrint("WBP_Battle_C:ShowOrHideMainPlayerBloodUI", r1_122, r2_122)
  if r0_122.HUD_MainBar then
    r0_122.HUD_MainBar:SetUIVisibilityTag(r2_122, not r1_122)
  end
end
function r6_0.ShowOrHideTeamDataTag(r0_123, r1_123)
  -- line: [1807, 1824] id: 123
  local r2_123 = nil
  if CommonUtils.GetDeviceTypeByPlatformName(r0_123) == "Mobile" then
    r2_123 = nil
  else
    r2_123 = r0_123.VB_Tag
  end
  if not r2_123 then
    return 
  end
  if r1_123 and not r2_123:IsVisible() then
    r2_123:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif r2_123:IsVisible() then
    r2_123:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r6_0.SetUIVisibilityTag(r0_124, r1_124, r2_124)
  -- line: [1837, 1879] id: 124
  if not IsValid(r0_124) then
    return 
  end
  if r0_124.HideTags == nil then
    r0_124.HideTags = {}
  end
  if r2_124 then
    r0_124.HideTags[r1_124] = 1
  else
    r0_124.HideTags[r1_124] = nil
  end
  local r4_124 = UE4.UKismetSystemLibrary.IsPackagedForDistribution()
  if not IsEmptyTable(r0_124.HideTags) then
    if r4_124 and CommonUtils.GetDeviceTypeByPlatformName(r0_124) == "Mobile" then
      r0_124:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_124.Panel_Content:SetVisibility(UE4.ESlateVisibility.Collapsed)
      SystemGuideManager:HideUIEvent(r0_124.WidgetName)
    else
      SystemGuideManager:HideUIEvent(r0_124.WidgetName)
      if r0_124:GetVisibility() ~= ESlateVisibility.Collapsed then
        r0_124:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  elseif r4_124 and CommonUtils.GetDeviceTypeByPlatformName(r0_124) == "Mobile" then
    r0_124:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_124.Panel_Content:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    SystemGuideManager:ShowUIEvent(r0_124.WidgetName)
  else
    if r0_124:GetVisibility() == UE4.ESlateVisibility.Visibie or r0_124:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      SystemGuideManager:ShowUIEvent(r0_124.WidgetName)
    end
    if r0_124:GetVisibility() ~= UE4.ESlateVisibility.SelfHitTestInvisible then
      r0_124:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      SystemGuideManager:ShowUIEvent(r0_124.WidgetName)
    end
  end
end
function r6_0.OnBattleMapClose(r0_125)
  -- line: [1881, 1883] id: 125
  r0_125.Battle_Map:OnClickClose()
end
function r6_0.SetVisibility(r0_126, r1_126)
  -- line: [1885, 1892] id: 126
  r0_126.Overridden.SetVisibility(r0_126, r1_126)
  if IsValid(r0_126.Joystick) then
    r0_126.Joystick:SetTouchVisibilityFromBattle(r1_126)
  elseif CommonUtils:GetDeviceTypeByPlatformName(r0_126) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    UIManager(r0_126):ShowUIError(UIConst.ErrorCategory.HUD, "Hy@== 主界面虚拟摇杆无效了Joystick 不存在, 摇杆表现可能受影响")
  end
end
function r6_0.ShowInstructionInfo(r0_127, r1_127, r2_127)
  -- line: [1894, 1921] id: 127
  local r3_127 = CommonUtils:GetDeviceTypeByPlatformName(r0_127)
  r0_127.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local r4_127 = r0_127.Pos_Instruction:GetChildAt(0)
  if r3_127 == "PC" and r4_127 == nil then
    r4_127 = r0_127:GetOrAddWidget("InstructionPC", r0_127.Pos_Instruction)
    if r4_127 then
      r4_127:HideAllText()
    end
  elseif r4_127 == nil then
    r4_127 = r0_127:GetOrAddWidget("InstructionMobile", r0_127.Pos_Instruction)
    if r4_127 then
      r4_127:HideAllText()
    end
  end
  if r4_127 then
    DebugPrint(r1_127, "===ShowInstructionInfo=============================")
    if r2_127 then
      r4_127:HideActionText(r1_127)
    else
      r4_127:ShowActionText(r1_127)
    end
  end
end
function r6_0.HideDynamicEventUI(r0_128)
  -- line: [1923, 1929] id: 128
  local r1_128 = r0_128:GetOrAddDynamicEventWidget()
  if r1_128 then
    r1_128:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r6_0.OnTeammateDie(r0_129, r1_129)
  -- line: [1931, 1937] id: 129
  local r2_129 = UE4.UGameplayStatics.GetPlayerCharacter(r0_129, 0)
  local r3_129 = Battle(r0_129):GetEntity(r1_129)
  if r2_129.Eid ~= r1_129 then
    UIManager(r0_129):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("BATTLE_RECOVERY_TEAMMATEDEAD"), r0_0.GetCharName(r3_129)))
  end
end
function r6_0.OnTeammateRecovery(r0_130, r1_130)
  -- line: [1939, 1954] id: 130
  local r2_130 = UE4.UGameplayStatics.GetPlayerCharacter(r0_130, 0)
  local r3_130 = Battle(r0_130):GetEntity(r1_130)
  if r2_130.Eid ~= r1_130 then
    if r3_130:IsPhantom() then
      UIManager(r0_130):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("BATTLE_RECOVERY_TEAMMATERECOVERY"), r0_0.GetCharName(r3_130)))
    elseif r3_130:IsPlayer() then
      for r9_130, r10_130 in pairs(UE4.UGameplayStatics.GetGameState(r0_130).PlayerArray) do
        if r10_130 == r3_130.PlayerState then
          UIManager(r0_130):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("BATTLE_RECOVERY_TEAMMATERECOVERY"), r0_0.GetCharName(r3_130)))
        end
      end
      -- close: r5_130
    end
  end
end
function r6_0.CreatTakeAimIndicator(r0_131)
  -- line: [1956, 1966] id: 131
  r0_131.TakeAimIndicator = r0_131:CreateWidgetNew("TakeAimIndicator")
  if r0_131.TakeAimIndicator then
    local r1_131 = r0_131.Pos_Aim:AddChildToOverlay(r0_131.TakeAimIndicator)
    r1_131:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    r1_131:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    r0_131.TakeAimIndicator:Init(UE4.UGameplayStatics.GetPlayerCharacter(r0_131, 0))
    r0_131.Pos_Aim:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
end
function r6_0.EndAim(r0_132)
  -- line: [1968, 1970] id: 132
  r0_132.Pos_Aim:ClearChildren()
end
function r6_0.GetTakeAimIndicator(r0_133)
  -- line: [1972, 1974] id: 133
  return r0_133.TakeAimIndicator
end
function r6_0.OnKeyDown(r0_134, r1_134, r2_134)
  -- line: [1976, 1978] id: 134
  return r0_0.Unhandled
end
function r6_0.OnPreviewKeyDown(r0_135, r1_135, r2_135)
  -- line: [1980, 1992] id: 135
  local r4_135 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_135))
  if r4_135 == UIConst.GamePadKey.DPadDown or r4_135 == UIConst.GamePadKey.DPadUp or r4_135 == UIConst.GamePadKey.DPadRight or r4_135 == UIConst.GamePadKey.DPadLeft then
    return r0_0.Handled
  end
  return r0_0.Unhandled
end
function r6_0.StartRougeCanonCountDown(r0_136)
  -- line: [1994, 2000] id: 136
  r0_136.Pos_Rouge_CountDown:ClearChildren()
  r0_136.RougeGameCountDown = r0_136:CreateWidgetNew("RougeGameCountDown")
  r0_136.Pos_Rouge_CountDown:AddChild(r0_136.RougeGameCountDown)
  r0_136.RougeGameCountDown:InitRougeGameCountDown()
  r0_136.Pos_Rouge_CountDown:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end
function r6_0.RefreshRougeGameCountDown(r0_137, r1_137)
  -- line: [2002, 2006] id: 137
  if r0_137.RougeGameCountDown then
    r0_137.RougeGameCountDown:RefreshTime(r1_137)
  end
end
function r6_0.OnEndRougeCanonMiniGame(r0_138)
  -- line: [2008, 2011] id: 138
  r0_138.Pos_Rouge_CountDown:ClearChildren()
  r0_138.Pos_Rouge_CountDown:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r6_0.HideSubSystem(r0_139, r1_139, r2_139, r3_139)
  -- line: [2013, 2033] id: 139
  if not r2_139 or not r1_139 then
    return 
  end
  if r0_139[r1_139] then
    if not r0_139.SystemHideTags[r1_139] then
      r0_139.SystemHideTags[r1_139] = {}
    end
    local r4_139 = r0_139.SystemHideTags[r1_139]
    if r3_139 then
      r4_139[r2_139] = 1
    else
      r4_139[r2_139] = nil
    end
    if IsEmptyTable(r4_139) then
      r0_139[r1_139]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_139[r1_139]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r6_0.SetSubSystemVisibility(r0_140, r1_140, r2_140)
  -- line: [2035, 2041] id: 140
  if r0_140[r1_140] and not r0_140:IsSubSystemHide(r1_140) then
    r0_140[r1_140]:SetVisibility(r2_140)
  end
end
function r6_0.IsSubSystemHide(r0_141, r1_141)
  -- line: [2043, 2054] id: 141
  if not r1_141 or not r0_141[r1_141] then
    DebugPrint("System Does Not Exist. Name: ", r1_141)
    return 
  end
  local r2_141 = r0_141.SystemHideTags[r1_141]
  if not r2_141 or IsEmptyTable(r2_141) then
    return false
  else
    return true
  end
end
function r6_0.OnTempleRightUI(r0_142)
  -- line: [2056, 2071] id: 142
  r0_142.Group_Temple:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_142.Pos_TempleRight:ClearChildren()
  r0_142.TempleRightUI = r0_142:CreateWidgetNew("DungeonTempleRight")
  r0_142.TempleRightUI:ConstructInfo()
  r0_142.Pos_TempleRight:AddChild(r0_142.TempleRightUI)
  r0_142.Pos_TempleRight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local r1_142 = r3_0:GetTaskBarWidget()
  if r1_142 then
    r1_142:SetUIVisibilityTag("Temple", true)
  end
end
function r6_0.OnPartyEnter(r0_143)
  -- line: [2073, 2078] id: 143
  local r1_143 = r3_0:GetTaskBarWidget()
  if r1_143 then
    r1_143:SetUIVisibilityTag("Party", true)
  end
end
function r6_0.OnPartyProgressStart(r0_144)
  -- line: [2080, 2084] id: 144
  r0_144.PartyProgress = r0_144:CreateWidgetNew("PartyProgress")
  r0_144.PartyProgress:ConstructInfo()
  r0_144.Pos_TempleProgress:AddChild(r0_144.PartyProgress)
end
function r6_0.OnModBookQuestFinished(r0_145, r1_145)
  -- line: [2087, 2096] id: 145
  DebugPrint("zwk OnModBookQuestFinished", r1_145)
  if not r0_145.ModArchives then
    r0_145.ModArchives = TArray(0)
  end
  r0_145.ModArchives:Add(r1_145)
  if r0_145.ModArchives:Length() > 0 and r0_145.ModArchives:GetRef(1) == r1_145 then
    r0_145:ShowModBookTips(r1_145)
  end
end
function r6_0.ShowModBookTips(r0_146, r1_146)
  -- line: [2099, 2102] id: 146
  UIManager(r0_146):LoadUINew("ModArchiveTaskTips", r0_146, r1_146)
end
function r6_0.OnPreModArchiveFinished(r0_147, r1_147)
  -- line: [2105, 2113] id: 147
  if r0_147.ModArchives then
    r0_147.ModArchives:RemoveItem(r1_147)
  end
  if r0_147.ModArchives:Length() > 0 then
    r0_147:ShowModBookTips(r0_147.ModArchives:GetRef(1))
  end
end
function r6_0.OnNotifyShowLargeCountDown(r0_148, r1_148, r2_148)
  -- line: [2115, 2130] id: 148
  local r3_148 = UE4.UGameplayStatics.GetGameInstance(r0_148)
  if r3_148:GetGameUIManager() == nil then
    return 
  end
  local r5_148 = r3_148:GetGameUIManager()
  local r6_148 = r5_148:GetUIObj("GuideCountDown")
  if r6_148 then
    r6_148:OnCountDownEnd()
    r6_148:Close()
  end
  r6_148 = r5_148:LoadUINew("GuideCountDown")
  r6_148:SetVisibility(ESlateVisibility.Collapsed)
  r0_148:ShowCountDown(r6_148, r1_148 + 1, r2_148)
end
function r6_0.EMAfterInitialize(r0_149)
  -- line: [2134, 2164] id: 149
  r6_0.Super.EMAfterInitialize(r0_149)
  r0_149.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  if r0_149.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    if UIConst.OptimizeSwitch[CommonConst.CLIENT_DEVICE_TYPE.MOBILE].UI_WRAPPING_WITH_INVALIDBOX then
    end
    if UIConst.OptimizeSwitch[CommonConst.CLIENT_DEVICE_TYPE.MOBILE].UI_WRAPPING_WITH_RETAINERBOX then
      if UE4.UKismetSystemLibrary.IsPackagedForDistribution() then
        r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Pos_TaskBar, "CustomRetainerBox_TaskBar", 1, 10)
      end
      r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Pos_Drops, "CustomRetainerBox_CommonDrops", 2, 10)
      r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Char_Skill, "CustomRetainerBox_Skill", 1, 3)
      r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Pos_Entry, "CustomRetainerBox_Entry", 3, 15)
    end
  elseif r0_149.Platform == CommonConst.CLIENT_DEVICE_TYPE.PC and UIConst.OptimizeSwitch[CommonConst.CLIENT_DEVICE_TYPE.PC].UI_WRAPPING_WITH_RETAINERBOX then
    r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Pos_Drops, "CustomRetainerBox_CommonDrops", 1, 10)
    r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Pos_SpecialDrops, "CustomRetainerBox_SpecialDrops", 5, 10)
    r0_149:ArrangeSingleWidgetWithRetainerBox(r0_149.Char_Skill, "CustomRetainerBox_Skill", 2, 10)
  end
end
function r6_0.OnHomeBaseeBtnShowNewClue(r0_150, r1_150)
  -- line: [2169, 2173] id: 150
  r0_150:AddTimer(5, function()
    -- line: [2170, 2172] id: 151
    r0_150.Btn_Task:OnHomeBaseeBtnShowNewClue(r1_150)
  end, nil, nil, nil, false)
end
function r6_0.OnNewDetectiveQuestion(r0_152, r1_152, r2_152)
  -- line: [2175, 2199] id: 152
  local r3_152 = DataMgr.DetectiveQuestion[r1_152]
  if not r3_152 then
    return 
  end
  if r3_152.ParentQuestionID then
    return 
  end
  local r4_152 = nil
  r0_152:AddTimer(1, function()
    -- line: [2185, 2195] id: 153
    r4_152 = UIManager(r0_152):CreateWidget("WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Toast.WBP_Reasoning_Toast\'", true)
    r4_152.Text_Title:SetText(GText(r3_152.Tips))
    r4_152.Text_Status:SetText(GText("Minigame_Textmap_100301"))
    if r2_152 then
      r4_152.Text_Status:SetText(GText("Minigame_Textmap_100302"))
    end
    r4_152:PlayAnimation(r4_152.In)
    AudioManager(r0_152):PlayUISound(r0_152, "event:/ui/common/tuili_clue_toast", nil, nil)
  end, nil, nil, nil, false)
  r0_152:AddTimer(3, function()
    -- line: [2196, 2198] id: 154
    r4_152:PlayAnimation(r4_152.Out)
  end, nil, nil, nil, false)
end
function r6_0.CreateFortBack(r0_155)
  -- line: [2202, 2207] id: 155
  r0_155.Pos_FortBack:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_155.Pos_FortBack:ClearChildren()
  return r0_155:GetOrAddWidget("FortBackKey", r0_155.Pos_FortBack)
end
function r6_0.DestoryFortBack(r0_156)
  -- line: [2209, 2212] id: 156
  r0_156.Pos_FortBack:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_156.Pos_FortBack:ClearChildren()
end
function r6_0.EnableGuideBookKey(r0_157, r1_157)
  -- line: [2215, 2221] id: 157
  if r1_157 then
    r0_157:ListenForInputAction("OpenGuideBook", EInputEvent.IE_Pressed, false, {
      r0_157,
      r0_157.OpenGuideBook
    })
  else
    r0_157:StopListeningForInputAction("OpenGuideBook", EInputEvent.IE_Pressed)
  end
end
function r6_0.InitGameJumpWord(r0_158)
  -- line: [2223, 2251] id: 158
  local r1_158 = USubsystemBlueprintLibrary.GetWorldSubsystem(r0_158, UJumpWordManager)
  if r1_158 then
    local r2_158 = "DamageTextAmount"
    local r3_158 = r5_0:Get(r2_158)
    if r3_158 == nil then
      local r4_158 = DataMgr.Option[r2_158]
      local r5_158 = r4_158.DefaultValue
      if CommonUtils.GetDeviceTypeByPlatformName(r0_158) == "Mobile" and r4_158.DefaultValueM then
        r5_158 = r4_158.DefaultValueM
      end
      r3_158 = r5_158 / r4_158.ScrollMappingScale
      r5_0:Set(r2_158, r3_158)
    end
    r1_158:SetMaxJumpWordCountRatio(r3_158)
    local r4_158 = "DamageTextScale"
    local r5_158 = r5_0:Get(r4_158)
    if r5_158 == nil then
      local r6_158 = DataMgr.Option[r4_158]
      local r7_158 = r6_158.DefaultValue
      if CommonUtils.GetDeviceTypeByPlatformName(r0_158) == "Mobile" and r6_158.DefaultValueM then
        r7_158 = r6_158.DefaultValueM
      end
      r5_158 = r7_158 / r6_158.ScrollMappingScale
      r5_0:Set(r4_158, r5_158)
    end
    r1_158:SetJumpWordSize(tonumber(r5_158))
  end
end
function r6_0.CheckTheaterEventState(r0_159)
  -- line: [2253, 2269] id: 159
  local r1_159 = GWorld:GetAvatar()
  if not r1_159 or r1_159.CurrentRegionId ~= 101901 then
    return 
  end
  r1_159:TheaterPerformStateGet(function(r0_160, r1_160)
    -- line: [2258, 2267] id: 160
    if r1_160 and r1_160.IsJoin == true and r0_160 == 0 then
      if r1_160.State == 0 or r1_160.State == 1 then
        r0_159:TheaterJoinPerformGame()
      elseif r1_160.State == 2 then
        r0_159:TheaterPerformGameStart(CommonConst.TheaterEventId, r1_160.PerformList, true)
      end
    end
  end)
end
function r6_0.TheaterJoinPerformGame(r0_161)
  -- line: [2271, 2295] id: 161
  if r0_161.TheaterCheckTimer then
    r0_161:RemoveTimer(r0_161.TheaterCheckTimer)
  end
  local r1_161 = GWorld:GetAvatar()
  if not r1_161 then
    return 
  end
  r1_161:TheaterPerformStateGet(function(r0_162, r1_162)
    -- line: [2278, 2284] id: 162
    if r1_162.State == 1 then
      r0_161:TheaterPerformGameStart(CommonConst.TheaterEventId, r1_162.PerformList)
      return 
    end
  end)
  r0_161.TheaterTaskTime = UIManager(r0_161):LoadUINew("TheaterTaskTime")
  r0_161.Task:AddChild(r0_161.TheaterTaskTime)
  r0_161.TheaterTaskTime.IsInit = true
  r0_161.JoinTheaterGame = true
  r0_161.TheaterCheckTimer = r0_161:AddTimer(1, function()
    -- line: [2292, 2294] id: 163
    r0_161:CheckTheaterStartTime()
  end, true, 0, "TheaterTimeCheck", true)
end
function r6_0.CheckTheaterStartTime(r0_164)
  -- line: [2297, 2313] id: 164
  local r2_164 = os.date("*t", TimeUtils.NowTime())
  local r3_164 = r2_164.min
  local r4_164 = r2_164.sec
  local r5_164 = nil	-- notice: implicit variable refs by block#[6]
  if r3_164 ~= 0 or r4_164 ~= 0 then
    if r3_164 == 30 then
      r5_164 = r4_164 == 0
    else
      goto label_18	-- block#4 is visited secondly
    end
  else
    goto label_19	-- block#5 is visited secondly
  end
  if r5_164 and r0_164.TheaterCheckTimer then
    r0_164:RemoveTimer(r0_164.TheaterCheckTimer)
    r0_164.TheaterCheckTimer = nil
  end
end
function r6_0.OnTheaterPerformGameNotice(r0_165, r1_165)
  -- line: [2315, 2329] id: 165
  local r2_165 = GWorld:GetAvatar()
  if not r2_165 then
    return 
  end
  if UE4.UGameplayStatics.GetGameState(GWorld.GameInstance):IsInRegion() and r2_165.CurrentRegionId ~= 101901 then
    for r7_165 = 0, r0_165.ListView:GetNumItems() + -1, 1 do
      local r8_165 = r0_165.ListView:GetItemAt(r7_165)
      if r8_165 and r8_165.BtnId == 19 and r8_165.SelfWidget then
        r8_165.SelfWidget:RefreshNewTheaterUI()
      end
    end
  end
end
function r6_0.TheaterPerformGameStart(r0_166, r1_166, r2_166, r3_166)
  -- line: [2331, 2364] id: 166
  local r4_166 = GWorld:GetAvatar()
  if not r4_166 then
    return 
  end
  if r0_166.TheaterTaskTime then
    r0_166.Task:RemoveChild(r0_166.TheaterTaskTime)
    r0_166.TheaterTaskTime:Close()
  end
  r0_166.TheaterToast = nil
  r0_166.Pos_Rouge_CountDown:ClearChildren()
  r4_166:TheaterPerformStateGet(function(r0_167, r1_167)
    -- line: [2341, 2362] id: 167
    if r0_167 == 0 and r1_167.IsJoin == true then
      local r2_167 = GWorld:GetAvatar()
      if not r2_167 then
        return 
      end
      local r3_167 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
      local r4_167 = r2_167.CurrentRegionId
      if not r3_167:IsInRegion() or r4_167 ~= 101901 then
        DebugPrint("ayff test 当前不在剧院区域 RegionId:", r4_167)
        return 
      end
      r0_166.TheaterToast = UIManager(r0_166):LoadUINew("TheaterToast")
      r0_166.TheaterToast.ParentWidget = r0_166
      r0_166.Pos_Rouge_CountDown:AddChild(r0_166.TheaterToast)
      r0_166.Pos_Rouge_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_166.TheaterToast.IsInit = true
      r0_166.TheaterToast:UpdatePerformList(r2_166)
      if r3_166 then
        r0_166.TheaterToast.ReStartPerform = true
      end
    end
  end)
end
function r6_0.TeleportReady(r0_168, r1_168)
  -- line: [2366, 2406] id: 168
  local r2_168 = r3_0:GetTaskBarWidget()
  if r2_168 then
    if r1_168 and r1_168 == true then
      r0_168:StopTeleportInDungeon(true)
      return 
    end
    r2_168:SetTeleportBubble(true)
    r0_168.IsShowingTeleportUI = true
    if r2_168.Platform == "Mobile" then
      r2_168.WBP_Btn_Tips3:SetVisibility(UE4.ESlateVisibility.Visable)
      r2_168.WBP_Btn_Tips3.Text_Button:SetText(GText("DUNGEON_TELEPORT"))
      r2_168.WBP_Btn_Tips3.Button_Area.OnClicked:Clear()
      r2_168.WBP_Btn_Tips3.Button_Area.OnClicked:Add(r0_168, function()
        -- line: [2382, 2398] id: 169
        local r0_169 = {
          RightCallbackFunction = function()
            -- line: [2385, 2391] id: 170
            r2_168:PlayAnimation(r2_168.Transmit_Out)
            local r0_170 = UE4.UGameplayStatics.GetPlayerCharacter(r0_168, 0)
            if r0_170 then
              r0_170.RPCComponent:NotifyServerStartDelivery()
            end
          end,
          LeftCallbackFunction = nil,
          CloseBtnCallbackFunction = nil,
          AutoFocus = true,
        }
        r2_168:RefreshTeleportBubble(true)
        UIManager(r0_168):ShowCommonPopupUI(100267, r0_169, r0_168)
      end)
    elseif r2_168.Platform == "PC" then
      r2_168.Text_Tips04:SetText(GText("DUNGEON_TELEPORT_LONGPRESS"))
      r0_168:ListenForInputAction("Recovery", EInputEvent.IE_Pressed, false, {
        r0_168,
        r0_168.StartTeleportInDungeon
      })
      r0_168:ListenForInputAction("Recovery", EInputEvent.IE_Released, false, {
        r0_168,
        r0_168.TeleportRelease
      })
    end
  end
end
function r6_0.StartTeleportInDungeon(r0_171)
  -- line: [2408, 2421] id: 171
  local r1_171 = r3_0:GetTaskBarWidget()
  if r1_171 then
    r1_171.Key_Tips03:AddExecuteLogic(r0_171, r0_171.StopTeleportInDungeon)
    local r2_171 = DataMgr.GlobalConstant.TeleportPressTime.ConstantValue and 1
    r1_171.Key_Tips03:OnButtonPressed(nil, true, 0, r2_171)
    r1_171.Key_Controller_Tips03:OnButtonPressed(nil, true, 0, r2_171)
    r1_171:RefreshTeleportBubble(true)
    UE4.UGameplayStatics.GetGameState(r0_171).ShouldStopHookInDungeonDelivery = true
  end
  DebugPrint("ayff test press teleport button")
end
function r6_0.StopTeleportInDungeon(r0_172, r1_172)
  -- line: [2423, 2455] id: 172
  local r2_172 = r3_0:GetTaskBarWidget()
  if r2_172 then
    r0_172.IsShowingTeleportUI = false
    if r1_172 == true then
      r2_172:PlayAnimation(r2_172.Transmit_Out)
      r0_172:StopListeningForInputAction("Recovery", EInputEvent.IE_Pressed)
      r0_172:StopListeningForInputAction("Recovery", EInputEvent.IE_Released)
      return 
    end
    r2_172:PlayAnimation(r2_172.Transmit_Out)
    r0_172:StopListeningForInputAction("Recovery", EInputEvent.IE_Pressed)
    r0_172:StopListeningForInputAction("Recovery", EInputEvent.IE_Released)
    local r3_172 = UE4.UGameplayStatics.GetPlayerCharacter(r0_172, 0)
    local r4_172 = r3_172:GetCharacterTag()
    if r4_172 == "Hook" or r4_172 == "HitFly" then
      DebugPrint("ayff test 传送中断，角色处于钩锁或被击飞状态，无法传送")
    else
      r3_172.RPCComponent:NotifyServerStartDelivery()
    end
  end
  r0_172:AddTimer(1, function()
    -- line: [2444, 2453] id: 173
    local r0_173 = UE4.UGameplayStatics.GetGameState(r0_172)
    if r0_173 then
      r0_173.ShouldStopHookInDungeonDelivery = false
      DebugPrint("ayff test 传送中断，恢复钩锁状态")
    else
      DebugPrint("ayff test 传送中断，恢复钩锁状态失败，GameState无效")
    end
  end)
  DebugPrint("ayff test release teleport button")
end
function r6_0.TeleportRelease(r0_174)
  -- line: [2457, 2463] id: 174
  local r1_174 = r3_0:GetTaskBarWidget()
  if r1_174 then
    r1_174.Key_Tips03:OnButtonReleased()
    r1_174.Key_Controller_Tips03:OnButtonReleased()
  end
end
AssembleComponents(r6_0)
return r6_0
