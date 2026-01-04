-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\Widget\Pet\WBP_Armory_PetMix_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("Utils.SkillUtils")
local r2_0 = require("EMCache.EMCache")
local r3_0 = Class("BluePrints.UI.BP_UIState_C")
local r4_0 = {
  PetMixStart = "PetMixStart",
  PetMixSuccess = "PetMixSuccess",
}
function r3_0.Construct(r0_1)
  -- line: [22, 39] id: 1
  r0_1.Btn_Confirm:SetText(GText("Pet_Affix_Activat"))
  r0_1.Btn_Confirm:TryOverrideSoundFunc(function()
    -- line: [24, 26] id: 2
    AudioManager(r0_1):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  r0_1.Btn_Confirm.Button_Area.OnClicked:Add(r0_1, r0_1.OnBtnConfirmClicked)
  r0_1.Btn_Add.OnClicked:Add(r0_1, r0_1.OnBigBtnAdd)
  r0_1.Btn_Switch.Button_Area.OnClicked:Add(r0_1, r0_1.OnSmallBtnAdd)
  r0_1.Entry_Pet_Mix.Button_Area.OnClicked:Add(r0_1, r0_1.OnBtnAddClicked)
  r0_1:BindAllAnimation()
  r0_1.Text_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_1.Entry_Pet_Mix.Text_Select:SetText(GText("Pet_Affix_Fuse_SelectAffix"))
  r0_1.Hint_Locked:SetText(GText("Pet_Affix_UnableFuse_Locked"))
  r0_1:BindToAnimationFinished(r0_1.Finish, {
    r0_1,
    r0_1.OnFinish
  })
  r0_1:AddDispatcher(EventID.OnResourcesChanged, r0_1, r0_1.OnResourcesChanged)
  r0_1:RefreshBaseInfo()
  r0_1:AddDispatcher(EventID.OnPetLocked, r0_1, r0_1.OnPetLocked)
end
function r3_0.ReceiveEnterState(r0_3, r1_3)
  -- line: [41, 49] id: 3
  r3_0.Super.ReceiveEnterState(r0_3, r1_3)
  local r2_3 = UIManager(r0_3):GetArmoryUIObj()
  if r2_3 then
    r0_3.ArmoryPlayer = r2_3.ActorController.ArmoryPlayer
    r0_3.ArmoryHelper = r2_3.ActorController.ArmoryHelper
    r0_3.ArmoryPlayer:SetActorHideTag("PetMix", true)
  end
end
function r3_0.Destruct(r0_4)
  -- line: [51, 56] id: 4
  r0_4.ArmoryPlayer:SetActorHideTag("PetMix", false)
  r0_4.Btn_Confirm.Button_Area.OnClicked:Clear()
  r0_4.Btn_Add.OnClicked:Clear()
  r0_4.Super.Destruct(r0_4)
end
function r3_0.OnBackKeyDown(r0_5)
  -- line: [58, 61] id: 5
  r0_5:PlayAnimation(r0_5.Out)
  r0_5:Close()
end
function r3_0.Close(r0_6)
  -- line: [63, 70] id: 6
  if r0_6.EffectCreature then
    r0_6.EffectCreature:SetActorHiddenInGame(true)
    r0_6._Player:RemoveEffectCreature(r0_6.EffectCreatureId)
    r0_6.EffectCreature = nil
  end
  r0_6.Super.Close(r0_6)
end
function r3_0.InitUIInfo(r0_7, r1_7, r2_7, r3_7, ...)
  -- line: [72, 98] id: 7
  local r4_7 = nil	-- notice: implicit variable refs by block#[0]
  r3_0.Super.InitUIInfo(r0_7, r1_7, r2_7, r3_7, ...)
  ... = ... -- error: untaken top expr
  r0_7.Params = r4_7
  r0_7.User = r0_7.Params.User
  r0_7.Parent = r0_7.Params.Parent
  r0_7.Target = r0_7.Params.Target
  r0_7.CurEntryContent = CommonUtils:DeepCopy(r0_7.Params.CurEntryContent)
  r0_7.SelectedEntryContent = nil
  r0_7.IsPreviewMode = r0_7.Params.IsPreviewMode
  r0_7._Avatar = GWorld:GetAvatar()
  r0_7.AutoIndex = r0_7.Params.CurEntryContent.Index
  r0_7:InitUI()
  r4_7 = UIManager(r0_7):GetArmoryUIObj()
  if r4_7 and r4_7.ActorController then
    local r5_7 = GWorld:GetAvatar()
    local r6_7 = nil
    if r5_7.Sex == 1 then
      r6_7 = "Nvzhu"
    else
      r6_7 = "Nanzhu"
    end
    if r0_7.User == CommonConst.ArmoryType.Pet then
      r4_7.ActorController:SetArmoryCameraTag(r6_7, "Mix", nil, r0_7.User)
    end
  end
end
function r3_0.InitUI(r0_8)
  -- line: [100, 147] id: 8
  r0_8.TabConfigData = {
    TitleName = GText("Pet_Affix_Fuse"),
    LeftKey = "Q",
    RightKey = "E",
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = r0_8,
          }
        },
        Desc = GText("UI_CTL_Pet_SwitchAffix"),
        bLongPress = false,
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_8,
          }
        },
        Desc = GText("UI_CTL_Pet_Select"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_8.OnBackKeyDown,
            Owner = r0_8,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_8.OnBackKeyDown,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    },
    StyleName = "Text",
    BackCallback = r0_8.OnBackKeyDown,
    OwnerPanel = r0_8,
  }
  r0_8.Tab_PetMix:Init(r0_8.TabConfigData, true)
  r0_8:InitResourceItem()
  r0_8:InitEntryContent()
  r0_8.Panel_Add:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_8.Entry_Pet_Mix:Init({})
  if r0_8.CurInputDevice == ECommonInputType.MouseAndKeyboard then
    r0_8.Entry_Pet_Mix:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r0_8.Entry_Pet_Mix:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  r0_8.Entry_Pet_Mix:PlayAnimation(r0_8.Entry_Pet_Mix.In)
  r0_8.Entry_Pet_Mix.WidgetSwitcher_State:SetActiveWidgetIndex(3)
  r0_8.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Btn_Confirm:SetGamePadImg("X")
  r0_8.Btn_Confirm:ForbidBtn(true)
  r0_8.VX:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8:PlayAnimation(r0_8.In)
  r0_8:SetFocus()
end
function r3_0.OnResourcesChanged(r0_9, r1_9)
  -- line: [149, 153] id: 9
  if r1_9 == r0_9.ResourceID then
    r0_9:InitResourceItem()
  end
end
function r3_0.InitResourceItem(r0_10)
  -- line: [155, 182] id: 10
  local r1_10 = DataMgr.PetEntryP[3]
  local r2_10 = DataMgr.Resource[r1_10.ResourceID]
  r0_10.ResourceID = r1_10.ResourceID
  if r1_10 and r2_10 then
    local r3_10 = {
      ItemType = "Resource",
      ResourceId = r1_10.ResourceID,
      Count = r1_10.ResourceCount,
      Icon = r2_10.Icon,
      Rarity = r2_10.Rarity and 1,
      IsShowDetails = true,
      bShowDenominator = true,
      OnMenuOpenChangedEvents = {
        Obj = r0_10,
        Callback = r0_10.OnMenuOpenChanged,
      },
    }
    local r4_10 = r0_10._Avatar:GetResourceNum(r1_10.ResourceID) and 0
    r3_10.Numerator = r4_10
    r3_10.Denominator = r1_10.ResourceCount
    if r4_10 < r1_10.ResourceCount then
      r0_10.IsCostEnough = false
    else
      r0_10.IsCostEnough = true
    end
    r0_10.Counsume_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_10.Counsume_Cost:InitContent(r3_10)
  end
end
function r3_0.OnMenuOpenChanged(r0_11, r1_11)
  -- line: [210, 215] id: 11
  if r0_11.CurInputDevice == ECommonInputType.Gamepad then
    r0_11.Tab_PetMix:SetBottomKeyInfoVisible(not r1_11)
    r0_11.Btn_Confirm:SetPCVisibility(r1_11)
  end
end
function r3_0.InitEntryContent(r0_12)
  -- line: [217, 314] id: 12
  local r1_12 = r0_12.Target
  local r2_12 = DataMgr.PetBreak[r1_12.PetId]
  local r3_12 = 0
  if r2_12 and r2_12[#r2_12].EntryNum then
    r3_12 = 0
  end
  local r4_12 = r2_12[r1_12.BreakNum].EntryNum and 0
  r0_12.EntryItemWidgets = {}
  if r1_12:IsResourcePet() then
    for r8_12 = 1, 4, 1 do
      if r0_12["EntryItem_" .. r8_12] then
        r0_12["EntryItem_" .. r8_12]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
    r0_12.EntryItemWidgets = {
      r0_12.EntryItem_3
    }
    if r0_12.EntryItem_3 then
      r0_12.EntryItem_3:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    for r8_12 = 1, 4, 1 do
      if r0_12["EntryItem_" .. r8_12] then
        r0_12["EntryItem_" .. r8_12]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    end
    if r1_12:IsPremium() then
      r0_12.EntryItemWidgets = {
        r0_12.EntryItem_1,
        r0_12.EntryItem_2,
        r0_12.EntryItem_3,
        r0_12.EntryItem_4
      }
    else
      r0_12.EntryItemWidgets = {
        r0_12.EntryItem_1,
        r0_12.EntryItem_2,
        r0_12.EntryItem_3
      }
      r0_12.EntryItem_4:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  r0_12.EntryContents = {}
  local r5_12 = 1
  local r6_12 = r1_12:IsResourcePet()
  if r6_12 then
    r6_12 = 1
    if not r6_12 then
      ::label_119::
      r6_12 = r1_12:IsPremium()
      if r6_12 then
        r6_12 = 4 and 3
      else
        goto label_126	-- block#23 is visited secondly
      end
    end
  else
    goto label_119	-- block#21 is visited secondly
  end
  for r8_12 = r5_12, r6_12, 1 do
    local r9_12 = r1_12.Entry[r8_12]
    if r9_12 ~= 0 then
      r9_12 = r1_12.Entry[r8_12] and nil
    else
      goto label_137	-- block#27 is visited secondly
    end
    local r10_12 = DataMgr.PetEntry[r9_12]
    local r11_12 = {
      Index = r8_12,
      Owner = r0_12,
    }
    local r12_12 = r0_12.OnEntryClicked
    r11_12.OnClicked = r12_12
    if r10_12 then
      r11_12.EntryId = r9_12
      r11_12.Name = GText(r10_12.PetEntryName)
      r11_12.Rarity = r10_12.Rarity
      r12_12 = r1_0.CalcPetEntryDesc(r9_12)
      r11_12.Desc = r12_12
    end
    if r9_12 then
      r12_12 = r9_12 <= 0
    else
      goto label_165	-- block#33 is visited secondly
    end
    r11_12.IsEmpty = r12_12
    r11_12.IsLocked = r4_12 < r8_12
    if r0_12.EntryItemWidgets and r0_12.EntryItemWidgets[r8_12] then
      r0_12.EntryItemWidgets[r8_12]:Init(r11_12)
      if r0_12.CurInputDevice == ECommonInputType.Gamepad then
        r0_12.EntryItemWidgets[r8_12].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        r0_12.EntryItemWidgets[r8_12].Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
      end
    end
    table.insert(r0_12.EntryContents, r11_12)
  end
  if not r0_12.CurEntryContent then
    return 
  end
  if r0_12.CurEntryContent.IsSelected then
    r0_12.Entry_Pet_Now:Init(r0_12.CurEntryContent)
    r5_12 = r0_12.CurEntryContent.Index
    if r0_12.EntryItemWidgets and r0_12.EntryItemWidgets[r5_12] then
      r0_12.EntryItemWidgets[r5_12]:OnBtnClicked()
    end
  else
    r5_12 = nil
    if r0_12.AutoIndex then
      r5_12 = r0_12.AutoIndex
    else
      for r10_12, r11_12 in ipairs(r0_12.EntryContents) do
        if not r11_12.IsLocked and r11_12.IsEmpty then
          r5_12 = r10_12
          break
        end
      end
      -- close: r6_12
      if not r5_12 then
        r5_12 = 1
      end
    end
    if r0_12.EntryItemWidgets and r0_12.EntryItemWidgets[r5_12] then
      r0_12.EntryItemWidgets[r5_12]:OnBtnClicked()
    end
  end
end
function r3_0.UpdateSelectedEntryItem(r0_13)
  -- line: [316, 352] id: 13
  local r1_13 = r0_13.Target
  local r2_13 = DataMgr.PetBreak[r1_13.PetId]
  local r3_13 = 0
  if r2_13 and r2_13[#r2_13].EntryNum then
    r3_13 = 0
  end
  local r4_13 = r2_13[r1_13.BreakNum].EntryNum and 0
  local r5_13 = r0_13.CurEntryContent.Index
  local r6_13 = r0_13.EntryItemWidgets[r5_13]
  if r6_13 then
    local r7_13 = r1_13.Entry[r5_13]
    if r7_13 ~= 0 then
      r7_13 = r1_13.Entry[r5_13] and nil
    else
      goto label_34	-- block#8 is visited secondly
    end
    local r8_13 = DataMgr.PetEntry[r7_13]
    local r9_13 = {
      Index = r5_13,
      Owner = r0_13,
    }
    local r10_13 = r0_13.OnEntryClicked
    r9_13.OnClicked = r10_13
    if r8_13 then
      r9_13.EntryId = r7_13
      r9_13.Name = GText(r8_13.PetEntryName)
      r9_13.Rarity = r8_13.Rarity
      r10_13 = r1_0.CalcPetEntryDesc(r7_13)
      r9_13.Desc = r10_13
    end
    if r7_13 then
      r10_13 = r7_13 <= 0
    else
      goto label_62	-- block#14 is visited secondly
    end
    r9_13.IsEmpty = r10_13
    r9_13.IsLocked = r4_13 < r5_13
    r6_13:Init(r9_13)
    r6_13:SetIsSelected(true)
    r6_13:PlayAnimation(r6_13.RefreshColor)
    AudioManager(r0_13):PlayUISound(nil, "event:/ui/common/light_refresh", nil, nil)
    r0_13.CurEntryContent = r9_13
  end
  r0_13:BlockAllUIInput(false)
end
function r3_0.OnBtnConfirmClicked(r0_14)
  -- line: [354, 367] id: 14
  if not r0_14.SelectedEntryContent then
    UIManager(r0_14):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_Affix_Fuse_SelectAffix"))
    return 
  end
  if not r0_14.IsCostEnough then
    return 
  end
  if r0_14.CurEntryContent.IsEmpty then
    r0_14:ReallyMix()
  else
    r0_14:ShowWarningPopup()
  end
end
function r3_0.ShowWarningPopup(r0_15)
  -- line: [370, 375] id: 15
  UIManager(r0_15):ShowCommonPopupUI(100220, {
    RightCallbackFunction = r0_15.ReallyMix,
    RightCallbackObj = r0_15,
  })
end
function r3_0.ReallyMix(r0_16)
  -- line: [377, 404] id: 16
  r0_16._Avatar:PetEntryReplace(function(r0_17)
    -- line: [378, 398] id: 17
    if r0_17 == ErrorCode.RET_SUCCESS then
      r0_16.Parent:UpdateEntryInfos(r0_16.Params.Target)
      r0_16.Target = r0_16.Parent.Pet
      if r0_16.CurInputDevice == ECommonInputType.Gamepad then
        r0_16:SetFocus()
      end
      r0_16.VB_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_16.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_16:PlayAnimation(r0_16.Finish)
      AudioManager(r0_16):PlayUISound(nil, "event:/ui/common/pet_potential_active", nil, nil)
      r0_16:PlayPetVoice(r4_0.PetMixStart)
      r0_16.IsFinishing = true
      r0_16.Entry_Pet_Mix.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_16.Entry_Pet_Now.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif DataMgr.ErrorCode[r0_17] then
      UIManager(r0_16):ShowError(r0_17, nil, UIConst.Tip_CommonToast)
      r0_16:BlockAllUIInput(false)
    else
      UIManager(r0_16):ShowUITip("CommonToastMain", GText("Unknown_Error"), 1.5)
    end
  end, r0_16.Params.Target.UniqueId, r0_16.CurEntryContent.Index, r0_16.SelectedPet.UniqueId, r0_16.SelectedEntryContent.Index)
  r0_16:BlockAllUIInput(true)
  r0_16:AddTimer(5, function()
    -- line: [401, 403] id: 18
    r0_16:BlockAllUIInput(false)
  end)
end
function r3_0.OnFinish(r0_19)
  -- line: [406, 431] id: 19
  r0_19:PlayPetVoice(r4_0.PetMixSuccess)
  r0_19.Entry_Pet_Mix.WidgetSwitcher_State:SetActiveWidgetIndex(3)
  r0_19.Entry_Pet_Mix.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_19.Entry_Pet_Now:Init(r0_19.SelectedEntryContent)
  r0_19.SelectedEntryContent = nil
  r0_19.Entry_Pet_Now:PlayAnimation(r0_19.Entry_Pet_Now.TextRefresh)
  r0_19.Entry_Pet_Now.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_19.VX:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_19.VB_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_19.Panel_Add:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_19.IsFinishing = false
  if r0_19.CurInputDevice == ECommonInputType.Gamepad then
    r0_19.Btn_Add:SetFocus()
  end
  r0_19.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if r0_19.EffectCreature then
    r0_19.EffectCreature:SetActorHiddenInGame(true)
    r0_19._Player:RemoveEffectCreature(r0_19.EffectCreatureId)
    r0_19.EffectCreature = nil
    r0_19.EffectCreatureId = nil
  end
  r0_19.Btn_Confirm:ForbidBtn(true)
  r0_19:InitResourceItem()
  r0_19:AddTimer(r0_19.Entry_Pet_Now.TextRefresh:GetEndTime(), function()
    -- line: [428, 430] id: 20
    r0_19:UpdateSelectedEntryItem()
  end)
end
function r3_0.PlayPetVoice(r0_21, r1_21)
  -- line: [433, 444] id: 21
  local r2_21 = UE4.UGameplayStatics.GetPlayerCharacter(r0_21, 0)
  local r3_21 = r0_21.Target:Data()
  local r4_21 = r3_21 and r3_21.PetNameTag
  if r1_21 == r4_0.PetMixStart then
    AudioManager(r0_21):StopSound(r2_21, "PetMixStart")
    AudioManager(r0_21):PlayPetVoice(r2_21, r4_21, "vo_upset", "PetMixStart")
  elseif r1_21 == r4_0.PetMixSuccess then
    AudioManager(r0_21):StopSound(r2_21, "PetMixSuccess")
    AudioManager(r0_21):PlayPetVoice(r2_21, r4_21, "vo_happy", "PetMixSuccess")
  end
end
function r3_0.OnBigBtnAdd(r0_22)
  -- line: [446, 449] id: 22
  AudioManager(r0_22):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  r0_22:OnBtnAddClicked()
end
function r3_0.OnSmallBtnAdd(r0_23)
  -- line: [451, 454] id: 23
  AudioManager(r0_23):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  r0_23:OnBtnAddClicked()
end
function r3_0.OnBtnAddClicked(r0_24)
  -- line: [456, 466] id: 24
  r0_24:PlayAnimation(r0_24.Clicked)
  UIManager(r0_24):LoadUINew(DataMgr.SystemUI.PetMixEntry.UIName, {
    OnDestructObj = r0_24,
    OnDestructCallback2 = r0_24.OnPetMixEntryDestructed,
    Target = r0_24.Target,
    EntryContent = r0_24.CurEntryContent,
    Type = 1,
  })
end
function r3_0.OnPetMixEntryDestructed(r0_25, r1_25, r2_25)
  -- line: [468, 515] id: 25
  if not r1_25 then
    return 
  end
  if r0_25.IsCostEnough then
    r0_25.Btn_Confirm:ForbidBtn(false)
  else
    r0_25.Btn_Confirm:ForbidBtn(true)
  end
  r0_25.VB_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_25.VX:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_25.SelectedEntryContent = r1_25
  r0_25.SelectedPet = r2_25
  r1_25.IsSelected = false
  r1_25.Owner = r0_25
  r1_25._OnClicked = r0_25.OnBtnAddClicked
  r0_25.Entry_Pet_Mix:Init(r1_25)
  r0_25.Entry_Pet_Mix:PlayAnimation(r0_25.Entry_Pet_Mix.In)
  r0_25.Panel_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_25.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_25.Entry_Pet_Mix:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_25.Entry_Pet_Mix.Button_Area:SetFocus()
  local r3_25 = DataMgr.Pet[r2_25.UnitId]
  if r0_25.EffectCreatureId and r0_25.EffectCreatureId == r3_25.EffectCreatureId then
    ScreenPrint("不创建宠物")
    return 
  elseif r0_25.EffectCreatureId and r0_25.EffectCreatureId ~= r3_25.EffectCreatureId and r0_25.EffectCreature then
    r0_25.EffectCreature:SetActorHiddenInGame(true)
    r0_25._Player:RemoveEffectCreature(r0_25.EffectCreatureId)
  end
  r0_25.EffectCreatureId = r3_25.EffectCreatureId
  local r4_25 = r0_25.ArmoryPlayer:GetBattlePet()
  r0_25._Player = UGameplayStatics.GetPlayerCharacter(r0_25, 0)
  r0_25.EffectCreature = r0_25._Player:CreateEffectCreature(r0_25.EffectCreatureId, FTransform(), true, "Root")
  r0_25.EffectCreature.OwnerPlayer = r0_25.ArmoryPlayer
  local r5_25 = r0_25.ArmoryPlayer:GetTransform()
  r0_25.EffectCreature:K2_SetActorTransform(FTransform(r5_25.Rotation, r5_25.Translation, r5_25.Scale3D), false, nil, false)
  r0_25.EffectCreature.SkeletalMesh:K2_AddRelativeLocation(r0_25:GetDPIAdjustedMixPetOffset(), false, nil, false)
  r0_25.EffectCreature:SetActorHiddenInGame(false)
  r0_25.EffectCreature.SkeletalMesh:SetTickableWhenPaused(true)
end
function r3_0.OnEntryClicked(r0_26, r1_26)
  -- line: [517, 542] id: 26
  if not r0_26.CurEntryContent or r0_26.CurEntryContent.Index ~= r1_26.Index then
    AudioManager(r0_26):PlayUISound(r0_26, "event:/ui/common/pet_potential_click", nil, nil)
  end
  r0_26.Entry_Pet_Now:Init(r1_26)
  r0_0:SetContentIsSelected(r0_26.CurEntryContent, false)
  r0_26.CurEntryContent = r1_26
  r0_0:SetContentIsSelected(r0_26.CurEntryContent, true)
  if r1_26 and r1_26.IsLocked then
    r0_26.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_26.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    return 
  else
    r0_26.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  if r1_26.IsEmpty then
    r0_26.Btn_Confirm:SetText(GText("Pet_Affix_Activat"))
    r0_26.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    r0_26.Btn_Confirm:SetText(GText("Pet_Affix_Replace"))
    r0_26.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end
function r3_0.OnKeyDown(r0_27, r1_27, r2_27)
  -- line: [544, 581] id: 27
  local r3_27 = r3_0.Super.OnKeyDown(r0_27, r1_27, r2_27)
  local r4_27 = UE4.UKismetInputLibrary.GetKey(r2_27)
  local r5_27 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_27)
  if r5_27 == "Escape" then
    r0_27:OnBackKeyDown()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_27) then
    if r5_27 == Const.GamepadFaceButtonRight then
      if r0_27.CounsumeTipActivated or r0_27.Counsume_Cost.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
        r0_27.CounsumeTipActivated = false
        r0_27.Counsume_Cost:InActivate()
        if r0_27.Panel_Add:IsVisible() then
          r0_27.Btn_Add:SetFocus()
        else
          r0_27.Entry_Pet_Mix.Button_Area:SetFocus()
        end
        return UIUtils.Handled
      end
      r0_27:OnBackKeyDown()
    elseif r5_27 == Const.RightStickUp and r0_27.CurEntryContent.Index > 1 then
      r0_27.EntryItemWidgets[r0_27.CurEntryContent.Index + -1]:OnBtnClicked()
    elseif r5_27 == Const.RightStickDown and r0_27.CurEntryContent.Index < CommonUtils.Size(r0_27.EntryItemWidgets) then
      r0_27.EntryItemWidgets[r0_27.CurEntryContent.Index + 1]:OnBtnClicked()
    elseif r5_27 == Const.GamepadFaceButtonLeft then
      r0_27:OnBtnConfirmClicked()
    elseif r5_27 == Const.GamepadLeftThumbstick then
      r0_27.Counsume_Cost:Activate()
      r0_27.CounsumeTipActivated = true
    end
  end
  return UIUtils.Handled
end
function r3_0.BindAllAnimation(r0_28)
  -- line: [583, 587] id: 28
  r0_28.Btn_Add.OnHovered:Add(r0_28, r0_28.OnBtnAddHovered)
  r0_28.Btn_Add.OnUnhovered:Add(r0_28, r0_28.OnBtnAddUnhovered)
  r0_28.Btn_Add.OnPressed:Add(r0_28, r0_28.OnBtnAddPressed)
end
function r3_0.OnBtnAddHovered(r0_29)
  -- line: [589, 591] id: 29
  r0_29:PlayAnimation(r0_29.Hover)
end
function r3_0.OnBtnAddUnhovered(r0_30)
  -- line: [593, 595] id: 30
  r0_30:PlayAnimation(r0_30.UnHover)
end
function r3_0.OnBtnAddPressed(r0_31)
  -- line: [597, 599] id: 31
  r0_31:PlayAnimation(r0_31.Press)
end
function r3_0.OnFocusReceived(r0_32, r1_32, r2_32)
  -- line: [602, 614] id: 32
  if r0_32.Panel_Add:IsVisible() then
    if not r0_32.Btn_Add:HasAnyUserFocus() then
      r0_32.Btn_Add:SetFocus()
    end
  elseif r0_32.IsFinishing then
    r0_32:SetFocus()
  else
    r0_32.Entry_Pet_Mix.Button_Area:SetFocus()
  end
  r0_32:InitNavigationRules()
  return r3_0.Super.OnFocusReceived(r0_32, r1_32, r2_32)
end
function r3_0.InitNavigationRules(r0_33)
  -- line: [616, 620] id: 33
  r0_33.Btn_Add:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_33.Entry_Pet_Mix:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end
function r3_0.RefreshBaseInfo(r0_34)
  -- line: [627, 633] id: 34
  r0_34.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_34, 0))
  if IsValid(r0_34.GameInputModeSubsystem) then
    r0_34:RefreshOpInfoByInputDevice(r0_34.GameInputModeSubsystem:GetCurrentInputType(), r0_34.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r3_0.RefreshOpInfoByInputDevice(r0_35, r1_35, r2_35)
  -- line: [635, 648] id: 35
  r0_35.Super.RefreshOpInfoByInputDevice(r0_35, r1_35, r2_35)
  r0_35.CurGamepadName = r2_35
  local r3_35 = r1_35 == ECommonInputType.MouseAndKeyboard
  if not r3_35 or not 0 then
    local r4_35 = 1
  end
  if r3_35 then
    r0_35.Counsume_Cost.Common_Item_Icon:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    r0_35.Counsume_Cost.Common_Item_Icon:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  r0_35.CurInputDevice = r1_35
end
function r3_0.OnPetLocked(r0_36, r1_36, r2_36, r3_36)
  -- line: [654, 670] id: 36
  if not ErrorCode:Check(r1_36) then
    return 
  end
  if not r0_36.SelectedPet then
    return 
  end
  if r2_36 == r0_36.SelectedPet.UniqueId then
    if not r3_36 and r0_36.IsCostEnough then
      r0_36.Btn_Confirm:ForbidBtn(true)
    else
      r0_36.Btn_Confirm:ForbidBtn(false)
    end
  end
end
function r3_0.GetDPIAdjustedMixPetOffset(r0_37)
  -- line: [673, 690] id: 37
  return r0_37.EffectCreature.MixPetOffset and FVector(0, 63, 25)
end
function r3_0.GetCurrentDPIScale(r0_38)
  -- line: [693, 711] id: 38
  local r1_38 = r2_0:Get("HUDScale")
  if not r1_38 or r1_38 == 0 then
    local r2_38 = DataMgr.Option.HUDSize
    if r2_38 then
      for r7_38, r8_38 in ipairs(r2_38.UnFoldText) do
        if r7_38 == math.floor(tonumber(r2_38.DefaultValue)) then
          r1_38 = tonumber(table.pack(string.gsub(r8_38, "%%", ""))[1]) * 0.01
          break
        end
      end
      -- close: r3_38
    end
    if not r1_38 or r1_38 == 0 then
      r1_38 = 1
    end
  end
  return r1_38
end
function r3_0.GetMobileDeviceScale(r0_39)
  -- line: [713, 730] id: 39
  local r1_39 = UWidgetLayoutLibrary.GetViewportSize(r0_39)
  return math.max(0.5, math.min(2, math.min(r1_39.X / UIConst.DPIBaseOnSize.Mobile.X, r1_39.Y / UIConst.DPIBaseOnSize.Mobile.Y)))
end
return r3_0
