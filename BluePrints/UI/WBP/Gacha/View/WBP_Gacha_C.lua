-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\Gacha\View\WBP_Gacha_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("BluePrints.UI.WBP.Gacha.GachaModel")
local r2_0 = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local r3_0 = require("BluePrints.UI.WBP.Gacha.GachaController")
local r4_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r4_0.Construct(r0_1)
  -- line: [26, 72] id: 1
  r0_1.IsPCPlatform = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC"
  r0_1.Btn_Detail:SetText(GText("UI_GACHA_DETAIL"))
  r0_1.Btn_Detail:BindEventOnClicked(r0_1, r0_1.OnClickBtnDetails)
  r0_1.Btn_History:SetText(GText("UI_GACHA_LIST"))
  r0_1.Btn_History:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText)
  r0_1.Btn_Detail:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.SpecialRight].KeyText)
  r0_1.Btn_Once:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonLeft].KeyText)
  r0_1.Btn_Tentimes:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonRight].KeyText)
  if r0_1.Key_Exchange then
    r0_1.Key_Exchange:CreateGamepadKey(DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText)
  end
  r0_1.Btn_Once:SetGamePadIconVisible(true)
  r0_1.Btn_Tentimes:SetGamePadIconVisible(true)
  r0_1.Btn_History:BindEventOnClicked(r0_1, r0_1.OnClickBtnHistory)
  r0_1.Btn_Once:SetText(GText("UI_SkinGacha_One"))
  r0_1.Btn_Once:BindEventOnClicked(r0_1, r0_1.OnClickBtnGachaOnce)
  function r0_1.Btn_Once.SoundFunc()
    -- line: [46, 48] id: 2
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  end
  r0_1.Btn_Tentimes:SetText(GText("UI_SkinGacha_Ten"))
  r0_1.Btn_Tentimes:BindEventOnClicked(r0_1, r0_1.OnClickBtnGachaTentimes)
  function r0_1.Btn_Tentimes.SoundFunc()
    -- line: [51, 53] id: 3
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  end
  r0_1.Com_Time.Text_TimeTitle:SetText(GText("UI_SkinGacha_Remain_Time"))
  r0_1.Group_ShopExchange:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_1.Btn_ShopExChange:SetText(GText("UI_SkinGacha_Shop_Goto"))
  r0_1.Btn_ShopExChange:BindEventOnClicked(r0_1, r0_1.OnClickBtnShop)
  function r0_1.Btn_ShopExChange.SoundFunc()
    -- line: [60, 62] id: 4
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end
  r0_1.Btn_ShopExChange:SetDefaultGamePadImg(DataMgr.KeyboardText.Gamepad_Dpad_Left.KeyText)
  r0_1.Group_ListTop:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Group_ListBottom:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.OpenKey = CommonUtils:GetActionMappingKeyName("OpenGacha")
  r0_1:UnLoadNavMeshLevel()
  r0_1:InitListenEvent()
end
function r4_0.Destruct(r0_5)
  -- line: [75, 78] id: 5
  AudioManager(r0_5):StopSystemUIBGM(r0_5.CurrentGachaId)
  r0_5.Super.Destruct(r0_5)
end
function r4_0.UnLoadNavMeshLevel(r0_6)
  -- line: [79, 89] id: 6
  local r2_6 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local r3_6 = r2_6:GetRegionId()
  r0_6.IsUnLoadNavMesh = false
  if r3_6 == CommonConst.GachaRegionId then
    DebugPrint("----jzn---冰湖城打开抽卡卸载导航网格---")
    r0_6.IsUnLoadNavMesh = true
    URuntimeCommonFunctionLibrary.UnloadNavMeshLevel(r2_6:GetWorld())
  end
end
function r4_0.ReceiveEnterState(r0_7, r1_7)
  -- line: [93, 97] id: 7
  r0_7.bCanNotClick = false
  r4_0.Super.ReceiveEnterState(r0_7, r1_7)
  r0_7:RefreshGachaInfo(r0_7.TabId)
end
function r4_0.InitListenEvent(r0_8)
  -- line: [99, 102] id: 8
  r0_8:AddDispatcher(EventID.OnDrawGacha, r0_8, r0_8.OnDrawGacha)
  r0_8:AddDispatcher(EventID.OnGachaPoolUpdate, r0_8, r0_8.OnGachaPoolUpdate)
end
function r4_0.OnLoaded(r0_9, r1_9)
  -- line: [104, 118] id: 9
  r4_0.Super.OnLoaded(r0_9, r1_9)
  r0_9.GachaRecordsCache = nil
  r0_9.BGWidgetMap = {}
  r0_9.TitleWidgetMap = {}
  r0_9.Group_TitleAnchor:ClearChildren()
  r0_9.LoadUIAnchor:ClearChildren()
  r0_9.PoolStaticBG:ClearChildren()
  r0_9:InitCommonTab()
  local r2_9 = nil
  if r1_9 then
    r2_9 = r1_9.InitGachaTabId
  end
  r0_9:InitGachaUI(r2_9)
end
function r4_0.InitGachaUI(r0_10, r1_10)
  -- line: [120, 155] id: 10
  r0_10.bInGachaMain = true
  r0_10.bGachaing = false
  r0_10.ExchangeBtnCanClick = false
  r0_10.bCanNotClick = false
  r0_10.bNeedUpdate = false
  r0_10.GachaPoolDict = r1_0:GetEffectiveGachaInfo()
  r0_10.GachaTabInfoLst = r1_0:GetGachaTabInfo()
  if r1_10 then
    r0_10.TabId = r1_10
  end
  if not r0_10.TabId then
    for r6_10, r7_10 in ipairs(r0_10.GachaTabInfoLst) do
      if r0_10.GachaPoolDict[r7_10.TabId] then
        r0_10.TabId = r7_10.TabId
        break
      end
    end
    -- close: r2_10
  end
  if not r0_10.TabId then
    UIManager(r0_10):ShowUITip("CommonToastMain", GText("GACHA_Toast_Nona"), 2)
    r0_10:AddTimer(0.1, function()
      -- line: [144, 146] id: 11
      r0_10:Close()
    end)
  end
  r0_10.Image_Black:SetRenderOpacity(0)
  r0_10:PlayAnimation(r0_10.In)
  AudioManager(r0_10):PlayUISound(r0_10, "event:/ui/armory/open", "GachaMainIn", nil)
  r0_10:BlockAllUIInput(true)
  r0_10:FillGachaItem()
end
function r4_0.InitCommonTab(r0_12)
  -- line: [157, 185] id: 12
  r0_12.Com_Tab:Init({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_12.CloseSelf,
            Owner = r0_12,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_12.CloseSelf,
            Owner = r0_12,
          }
        },
        Desc = GText("UI_BACK"),
      }
    },
    StyleName = "Text",
    TitleName = GText("UI_SkinGacha_System_Name"),
    OwnerPanel = r0_12,
    bShowBubble = true,
    OnResourceBarAddedToFocusPath = function()
      -- line: [174, 176] id: 13
      r0_12.Btn_ShopExChange:SetGamePadVisibility(ESlateVisibility.Collapsed)
    end,
    OnResourceBarRemovedFromFocusPath = function()
      -- line: [177, 180] id: 14
      r0_12.Btn_ShopExChange:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_12.Btn_ShopExChange:RefreshIconAndGamePadVisibility()
    end,
    BackCallback = r0_12.CloseSelf,
  })
  r0_12.Btn_Once:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonLeft)
  r0_12.Btn_TenTimes:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonTop)
end
function r4_0.FillGachaItem(r0_15)
  -- line: [188, 213] id: 15
  r0_15.LastWidgetContent = nil
  r0_15.PoolItemMap = {}
  r0_15.List_Pool:ClearListItems()
  for r5_15, r6_15 in ipairs(r0_15.GachaTabInfoLst) do
    if r0_15.GachaPoolDict[r6_15.TabId] then
      local r7_15 = NewObject(UIUtils.GetCommonItemContentClass())
      if r0_15.TabId == r6_15.TabId then
        r7_15.bSelected = true
      else
        r7_15.bSelected = false
      end
      r7_15.TabId = r6_15.TabId
      r7_15.TabName = r6_15.TabName
      r7_15.Icon = r6_15.Icon
      r7_15.Parent = r0_15
      r7_15.ClickEvent = {
        Obj = r0_15,
        Callback = r0_15.OnGachaTypeItemClick,
      }
      r0_15.PoolItemMap[r6_15.TabId] = r7_15
      r0_15.List_Pool:AddItem(r7_15)
    end
  end
  -- close: r1_15
  r0_15:AddTabReddotListen()
end
function r4_0.OnGachaTypeItemClick(r0_16, r1_16, r2_16, r3_16)
  -- line: [217, 232] id: 16
  if r0_16.LastWidgetContent and r0_16.LastWidgetContent.SelfWidget then
    r0_16.LastWidgetContent.SelfWidget:UnSelect()
  end
  r0_16.LastWidgetContent = r2_16
  r0_16.List_Pool:BP_SetItemSelection(r2_16, true)
  r0_16:BlockAllUIInput(true)
  r0_16:PlayAnimation(r0_16.Change)
  if r3_16 then
    AudioManager(r0_16):PlayUISound(r0_16, "event:/ui/activity/large_btn_click", nil, nil)
  end
  r0_16.TabId = r1_16
  r0_16:RefreshGachaInfo(r0_16.TabId)
end
function r4_0.RefreshGachaInfo(r0_17, r1_17)
  -- line: [236, 283] id: 17
  if not r1_17 then
    return 
  end
  if not next(r0_17.GachaPoolDict) then
    return 
  end
  local r2_17 = r0_17.GachaPoolDict[r1_17]
  if not r2_17 then
    return 
  end
  local r3_17 = DataMgr.SkinGacha[r2_17[1]]
  assert(r3_17, "抽卡信息不存在:" .. r2_17[1])
  local r4_17 = r3_17.BgBGM
  if r4_17 then
    AudioManager(r0_17):PlaySystemUIBGM(r4_17, nil, r2_17[1])
  end
  if r0_17.CurrentGachaId ~= r2_17[1] then
    AudioManager(r0_17):StopSystemUIBGM(r0_17.CurrentGachaId)
  end
  r0_17.CurrentGachaId = r2_17[1]
  r0_17:CheckShopLockState()
  r0_17:RefreshGachaBG(r3_17)
  r0_17:RefreshGachaTitle(r3_17)
  r0_17:RefreshCumulativeDrawReward()
  r0_17:RefreshRemainGachaTimes()
  r0_17:RefreshGuaranteedDict()
  r0_17:RefreshGachaQualityTips(r3_17)
  r0_17.Text_PoolGachaDetail:SetText(string.format(GText(r3_17.GachaDes), GText(r3_17.GachaName)))
  r0_17:RemoveTimer("RefreshGacha")
  if r3_17.IsHIdeCountdown then
    r0_17.Com_Time:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_17.Com_Time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_17:UpdateGachaTime(r3_17.GachaEndTime)
    r0_17:AddTimer(1, r0_17.UpdateGachaTime, true, 0, "RefreshGacha", true, r3_17.GachaEndTime)
  end
  r0_17:RefreshGachaResInfo()
end
function r4_0.RefreshGachaResInfo(r0_18)
  -- line: [285, 313] id: 18
  local r1_18 = DataMgr.SkinGacha[r0_18.CurrentGachaId]
  if not GWorld:GetAvatar() then
    return 
  end
  local r3_18 = {}
  table.insert(r3_18, 99)
  if r1_18.GachaType == r2_0.GachaType.NORMAL then
    table.insert(r3_18, 100)
  end
  for r8_18, r9_18 in ipairs(r1_18.GachaCostRes) do
    table.insert(r3_18, r9_18)
  end
  -- close: r4_18
  r0_18.Com_Tab:OverrideTopResource(r3_18, true)
  r0_18:RefreshGachaCostInfo()
  if r0_18.GetItemPage then
    r0_18.GetItemPage:RefreshGachaResInfo()
  end
end
function r4_0.RefreshGachaCostInfo(r0_19)
  -- line: [316, 427] id: 19
  local r1_19 = DataMgr.SkinGacha[r0_19.CurrentGachaId]
  local r2_19 = GWorld:GetAvatar()
  if not r2_19 then
    return 
  end
  local r3_19 = nil
  local r4_19 = 0
  local r5_19 = nil
  local r6_19 = 0
  for r11_19, r12_19 in ipairs(r1_19.GachaCostRes) do
    if ItemUtils.GetItemLimitedInfo(r12_19) then
      r5_19 = r12_19
      r6_19 = r2_19:GetResourceNum(r5_19)
    else
      r3_19 = r12_19
      r4_19 = r2_19:GetResourceNum(r3_19)
    end
  end
  -- close: r7_19
  if r1_19.GachaCostNum10 <= r6_19 then
    r0_19.Com_CostOnce:InitContent({
      ResourceId = r5_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Com_CostTenTimes_1:InitContent({
      ResourceId = r5_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaCostNum10,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
  elseif r6_19 > 0 and r1_19.GachaCostNum10 <= r6_19 + r4_19 then
    r0_19.Com_CostOnce:InitContent({
      ResourceId = r5_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Com_CostTenTimes_1:InitContent({
      ResourceId = r3_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaCostNum10 - r6_19,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Panel_TimeLimit:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_19.Com_CostTenTimes_2:InitContent({
      ResourceId = r5_19,
      bShowDenominator = false,
      Numerator = r6_19,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
  elseif r6_19 > 0 and r6_19 + r4_19 < r1_19.GachaCostNum10 then
    r0_19.Com_CostOnce:InitContent({
      ResourceId = r5_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Com_CostTenTimes_1:InitContent({
      ResourceId = r3_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaCostNum10,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_19.Com_CostOnce:InitContent({
      ResourceId = r3_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Com_CostTenTimes_1:InitContent({
      ResourceId = r3_19,
      bShowDenominator = false,
      Numerator = r1_19.GachaCostNum10,
      IsGamePadIconVisible = false,
      NotInteractive = true,
    })
    r0_19.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.RefreshGachaBG(r0_20, r1_20)
  -- line: [429, 467] id: 20
  r0_20.VideoPlayer:Stop()
  if r0_20.CurrentBgMusic then
    AudioManager(r0_20):StopSound(r0_20, r0_20.CurrentBgMusic)
  end
  if r1_20.GachaDisplayType == 1 then
    local r2_20 = r1_20.GachaDisplayPath
    if r1_20.BgMusic then
      r0_20.CurrentBgMusic = r1_20.BgMusic
      AudioManager(r0_20):PlayUISound(r0_20, r1_20.BgMusic, r0_20.CurrentBgMusic, nil)
    end
    r0_20.VideoPlayer:SetUrlByMediaSource(LoadObject(r2_20))
    r0_20.VideoPlayer:SetLooping(true)
    r0_20.VideoPlayer:Play()
    r0_20.WS_BG:SetActiveWidgetIndex(1)
  elseif r1_20.GachaDisplayType == 2 then
    r0_20.WS_BG:SetActiveWidgetIndex(0)
    if not r0_20.BGWidgetMap[r0_20.CurrentGachaId] then
      local r2_20 = r1_20.GachaDisplayPath
      if r0_20.IsPCPlatform then
        r2_20 = CommonConst.GachaBackgroundAddrPC .. r1_20.GachaDisplayPath .. "." .. r1_20.GachaDisplayPath
      else
        r2_20 = CommonConst.GachaBackgroundAddrMobile .. r1_20.GachaDisplayPath .. "." .. r1_20.GachaDisplayPath
      end
      local r3_20 = UIManager(r0_20):CreateWidget(r2_20, false)
      assert(r3_20, "抽卡背景资源不存在：BgPath:" .. r2_20 .. " GachaId: " .. r0_20.CurrentGachaId)
      r0_20.BGWidgetMap[r0_20.CurrentGachaId] = r3_20
      r0_20.PoolStaticBG:AddChild(r0_20.BGWidgetMap[r0_20.CurrentGachaId])
      local r4_20 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_20.BGWidgetMap[r0_20.CurrentGachaId])
      r4_20:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      r4_20:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
    r0_20.BGWidgetMap[r0_20.CurrentGachaId]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r0_20.LastBgWidget and r0_20.LastBgWidget ~= r0_20.BGWidgetMap[r0_20.CurrentGachaId] then
      r0_20.LastBgWidget:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_20.LastBgWidget = r0_20.BGWidgetMap[r0_20.CurrentGachaId]
  end
end
function r4_0.RefreshGachaTitle(r0_21, r1_21)
  -- line: [469, 484] id: 21
  if not r0_21.TitleWidgetMap[r0_21.CurrentGachaId] then
    local r2_21 = r1_21.GachaNameBp
    local r3_21 = UIManager(r0_21):CreateWidget(r2_21, false)
    assert(r3_21, "抽卡标题资源不存在：BTitleBPPath:" .. r2_21 .. " GachaId: " .. r0_21.CurrentGachaId)
    r0_21.TitleWidgetMap[r0_21.CurrentGachaId] = r3_21
    r0_21.Group_TitleAnchor:AddChild(r0_21.TitleWidgetMap[r0_21.CurrentGachaId])
  end
  r0_21.TitleWidgetMap[r0_21.CurrentGachaId]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_21.TitleWidgetMap[r0_21.CurrentGachaId]:PlayAnimation(r0_21.TitleWidgetMap[r0_21.CurrentGachaId].In)
  if r0_21.LastTitleWidget and r0_21.LastTitleWidget ~= r0_21.TitleWidgetMap[r0_21.CurrentGachaId] then
    r0_21.LastTitleWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_21.TitleWidgetMap[r0_21.CurrentGachaId].Text_MainTitle:SetText(GText(r1_21.GachaName))
  r0_21.LastTitleWidget = r0_21.TitleWidgetMap[r0_21.CurrentGachaId]
end
function r4_0.RefreshGachaQualityTips(r0_22, r1_22)
  -- line: [487, 498] id: 22
  local r2_22 = r1_22.GachaCoreDesColor
  local r3_22 = r1_22.GachaCoreDes
  r0_22.Com_QualityTag:SetVisibility(ESlateVisibility.Collapsed)
  if r2_22 then
    r0_22.Com_QualityTag:Init(r2_22)
    r0_22.Com_QualityTag:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r3_22 then
    r0_22.Com_QualityTag:SetCustomizedTextTag(GText(r3_22))
  end
end
function r4_0.RefreshRemainGachaTimes(r0_23)
  -- line: [501, 525] id: 23
  local r1_23 = DataMgr.SkinGacha[r0_23.CurrentGachaId]
  if DataMgr.GachaProbability[r1_23.ProbabilityId].ShowGetStar5Times == nil or r1_23.GachaLimitIsShow then
    r0_23.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_23.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if GWorld:GetAvatar() then
      local r3_23 = r1_0:GetSkinGachaAlreadyTimes(r1_23.GachaType) and 0
      if r3_23 < DataMgr.GachaProbability[r1_23.ProbabilityId].ShowGetStar5Times then
        local r4_23 = math.floor(DataMgr.GachaProbability[r1_23.ProbabilityId].ShowGetStar5Times - r3_23)
        local r5_23 = DataMgr.SkinGachaType[r1_23.GachaType].GachaGuaranteeDes
        if r1_23.RewardUpId then
          local r6_23, r7_23 = r1_0:GetSkinGachaUpInfo(r0_23.CurrentGachaId)
          if r6_23 then
            r0_23.Text_RemainTimes:SetText(string.format(GText(r5_23), r4_23, GText(ItemUtils.GetItemName(r6_23, r7_23))))
          end
        else
          r0_23.Text_RemainTimes:SetText(string.format(GText(r5_23), r4_23))
        end
      end
    end
  end
end
function r4_0.RefreshCumulativeDrawReward(r0_24)
  -- line: [528, 601] id: 24
  if not next(r0_24.GachaPoolDict) then
    return 
  end
  local r1_24 = r0_24.GachaPoolDict[r0_24.TabId]
  if not r1_24 then
    return 
  end
  local r2_24 = DataMgr.SkinGacha[r1_24[1]]
  r0_24.HB_Exchange:SetVisibility(ESlateVisibility.Collapsed)
  r0_24.ExchangeBtn.RedDot:SetVisibility(ESlateVisibility.Collapsed)
  r0_24.ExchangeBtn.bCanReceive = false
  r0_24.ExchangeBtn.Btn_Click.OnClicked:Clear()
  r0_24.ExchangeBtnCanClick = false
  if DataMgr.SkinGachaCumulative[r2_24.GachaId] then
    r0_24.HB_Exchange:SetVisibility(ESlateVisibility.Visible)
    local r3_24, r4_24, r5_24 = r1_0:GetSkinGachaCurrentCumulativeInfo(r0_24.CurrentGachaId)
    if r3_24 then
      r0_24.ExchangeBtn.Btn_Click.OnClicked:Add(r0_24, r0_24.OpenCumulativeDrawReward)
      r0_24.ExchangeBtnCanClick = true
      if r4_24 <= 0 then
        r0_24.ExchangeBtn.bCanReceive = true
        r0_24.ExchangeBtn.RedDot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        r0_24.ExchangeBtn:PlayAnimation(r0_24.ExchangeBtn.Reward)
        r0_24.ExchangeBtn.Text_ExchangeDesc:SetText(GText("UI_SkinGacha_Cumulative_Get"))
      else
        r0_24.ExchangeBtn:PlayAnimation(r0_24.ExchangeBtn.Normal)
        r0_24.ExchangeBtn.Text_ExchangeDesc:SetText(string.format(GText("UI_SkinGacha_Cumulative_Remain"), r4_24))
      end
    else
      r3_24 = r5_24
      r0_24.ExchangeBtn:SetIsForbidden(true)
      r0_24.ExchangeBtn.Text_ExchangeDesc:SetText(GText("UI_SkinGacha_Cumulative_Finish"))
    end
    local r6_24 = DataMgr.Reward[r3_24]
    local r7_24 = r6_24.Type[1]
    local r8_24 = r6_24.Id[1]
    local r9_24 = ItemUtils.GetItemIcon(r8_24, r7_24)
    local r10_24 = ItemUtils.GetItemRarity(r8_24, r7_24)
    r0_24.ExchangeBtn.Image_Light:SetColorAndOpacity(r0_24.ExchangeBtn["Color_" .. r10_24])
    local r12_24 = nil
    local r13_24 = nil
    if r10_24 == 5 then
      r12_24 = r0_24.ExchangeBtn.Yellow
      r13_24 = LoadObject("NiagaraSystem\'/Game/UI/WBP/Common/VX/GachaNew/NI_Gacha_ExchangeBtn_01.NI_Gacha_ExchangeBtn_01\'")
    elseif r10_24 == 4 then
      r12_24 = r0_24.ExchangeBtn.Purple
      r13_24 = LoadObject("NiagaraSystem\'/Game/UI/WBP/Common/VX/GachaNew/NI_Gacha_ExchangeBtn_02.NI_Gacha_ExchangeBtn_02\'")
    elseif r10_24 == 3 then
      r12_24 = r0_24.ExchangeBtn.Blue
      r13_24 = LoadObject("NiagaraSystem\'/Game/UI/WBP/Common/VX/GachaNew/NI_Gacha_ExchangeBtn_03.NI_Gacha_ExchangeBtn_03\'")
    elseif r10_24 == 2 then
      r12_24 = r0_24.ExchangeBtn.Green
    elseif r10_24 == 1 then
      r12_24 = r0_24.ExchangeBtn.Grey
    end
    r0_24.ExchangeBtn.VX_RewardGlow:SetColorAndOpacity(r12_24)
    if r13_24 then
      r0_24.ExchangeBtn.VX_Particle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_24.ExchangeBtn.VX_Particle:UpdateNiagaraSystemReference(r13_24)
      r0_24.ExchangeBtn.VX_Particle:ActivateSystem(true)
    else
      r0_24.ExchangeBtn.VX_Particle:SetVisibility(ESlateVisibility.Collapsed)
      r0_24.ExchangeBtn.VX_Particle:DeactivateSystem()
    end
    assert(r9_24, "抽卡累计奖励图标不合法, Id:" .. r8_24 .. " Type:" .. r7_24)
    r0_24.ExchangeBtn.Image_ExchangeIcon:SetBrushResourceObject(r9_24)
  end
  r1_0:CheckReddot()
  local r3_24 = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  r0_24:OnUpdateUIStyleByInputTypeChange(r3_24:GetCurrentInputType(), r3_24:GetCurrentGamepadName())
end
function r4_0.UpdateGachaTime(r0_25, r1_25)
  -- line: [605, 614] id: 25
  local r3_25 = r1_25 - TimeUtils.NowTime()
  if r3_25 <= 0 then
    r0_25:RemoveTimer("RefreshGacha")
    r0_25:InitGachaUI(r0_25.TabId)
  end
  r0_25.Com_Time.Text_TimeDesc:SetText(ShopUtils:GetRefreshTimeStr(r3_25))
end
function r4_0.GetGachaAnime(r0_26)
  -- line: [618, 635] id: 26
  if r0_26.GachaAnime and r0_26.GachaAnime:IsValid() then
    return r0_26.GachaAnime
  end
  local r1_26 = r0_26:CreateWidgetNew("GachaAnime")
  r0_26.LoadUIAnchor:AddChild(r1_26)
  local r2_26 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r1_26)
  local r3_26 = FAnchors()
  r3_26.Minimum = FVector2D(0, 0)
  r3_26.Maximum = FVector2D(1, 1)
  r2_26:SetAnchors(r3_26)
  r2_26:SetOffsets(FMargin(0, 0, 0, 0))
  r1_26:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r2_26:SetZOrder(5)
  r0_26.GachaAnime = r1_26
  r0_26.GachaAnime.Parent = r0_26
  return r0_26.GachaAnime
end
function r4_0.GetGachaResultSpecialShow(r0_27, r1_27, r2_27)
  -- line: [638, 660] id: 27
  r0_27.bGachaing = false
  r0_27.bSpecialShow = true
  local r3_27 = {}
  for r8_27, r9_27 in pairs(r1_27) do
    local r10_27 = r2_0.GachaItemTypeMap[r9_27.Sign]
    if not r3_27[(r10_27 .. "s")] then
      r3_27[r10_27 .. "s"] = {}
    end
    if not r3_27[(r10_27 .. "s")][r9_27.ResultId] then
      r3_27[r10_27 .. "s"][r9_27.ResultId] = r9_27.Count
    else
      r3_27[r10_27 .. "s"][r9_27.ResultId] = r3_27[(r10_27 .. "s")][r9_27.ResultId] + r9_27.Count
    end
  end
  -- close: r4_27
  UIUtils.ShowGetCharWeaponPage(r3_27, function()
    -- line: [656, 659] id: 28
    r0_27.bSpecialShow = false
    r0_27:GetGachaResultPage(r1_27, r2_27)
  end, r0_27, true)
end
function r4_0.GetGachaResultPage(r0_29, r1_29, r2_29)
  -- line: [663, 721] id: 29
  if r0_29.bNeedUpdate then
    return 
  end
  r0_29.bSpecialShow = false
  r0_29.bGachaing = false
  r0_29.bGachaRes = true
  r0_29.GetItemPage = nil
  local r3_29, r4_29 = r0_29:GetShowSkin(r1_29)
  if r3_29 then
    if not r0_29.GachaGetItemPageSP then
      r0_29.GachaGetItemPageSP = r0_29:CreateWidgetNew("GachaGetItemPageSP")
      r0_29.LoadUIAnchor:AddChild(r0_29.GachaGetItemPageSP)
      local r5_29 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_29.GachaGetItemPageSP)
      local r6_29 = FAnchors()
      r6_29.Minimum = FVector2D(0, 0)
      r6_29.Maximum = FVector2D(1, 1)
      r5_29:SetAnchors(r6_29)
      r5_29:SetOffsets(FMargin(0, 0, 0, 0))
      r0_29.GachaGetItemPageSP:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r5_29:SetZOrder(5)
    end
    r0_29.GachaGetItemPageSP:Init(r1_29, r2_29, r0_29.CurrentGachaId, r3_29, r4_29, r0_29, function()
      -- line: [685, 694] id: 30
      r0_29.bGachaRes = false
      if not r0_29.bGachaing and not r0_29.bGachaRes and not r0_29.bSpecialShow then
        r0_29:SetAnimationCurrentTime(r0_29.Gacha, r0_29.Gacha:GetEndTime())
        r0_29:PlayAnimationReverse(r0_29.Gacha)
        r0_29.List_Pool:SetFocus()
        r0_29:RefreshGachaInfo(r0_29.TabId)
        r0_29.bInGachaMain = true
      end
    end)
    r0_29.GetItemPage = r0_29.GachaGetItemPageSP
  else
    if not r0_29.GachaGetItemPage then
      r0_29.GachaGetItemPage = r0_29:CreateWidgetNew("GachaGetItemPage")
      r0_29.LoadUIAnchor:AddChild(r0_29.GachaGetItemPage)
      local r5_29 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_29.GachaGetItemPage)
      local r6_29 = FAnchors()
      r6_29.Minimum = FVector2D(0, 0)
      r6_29.Maximum = FVector2D(1, 1)
      r5_29:SetAnchors(r6_29)
      r5_29:SetOffsets(FMargin(0, 0, 0, 0))
      r0_29.GachaGetItemPage:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r5_29:SetZOrder(5)
    end
    r0_29.GachaGetItemPage:Init(r1_29, r2_29, r0_29.CurrentGachaId, nil, nil, r0_29, function()
      -- line: [709, 718] id: 31
      r0_29.bGachaRes = false
      if not r0_29.bGachaing and not r0_29.bGachaRes and not r0_29.bSpecialShow then
        r0_29:SetAnimationCurrentTime(r0_29.Gacha, r0_29.Gacha:GetEndTime())
        r0_29:PlayAnimationReverse(r0_29.Gacha)
        r0_29.List_Pool:SetFocus()
        r0_29:RefreshGachaInfo(r0_29.TabId)
        r0_29.bInGachaMain = true
      end
    end)
    r0_29.GetItemPage = r0_29.GachaGetItemPage
  end
end
function r4_0.GetShowSkin(r0_32, r1_32)
  -- line: [724, 743] id: 32
  local r2_32 = DataMgr.SkinGacha[r0_32.CurrentGachaId]
  local r3_32, r4_32 = r1_0:GetSkinGachaUpInfo(r0_32.CurrentGachaId)
  local r5_32 = -1
  local r6_32 = nil
  local r7_32 = nil
  for r12_32, r13_32 in ipairs(r1_32) do
    local r14_32 = r2_0.GachaItemTypeMap[r13_32.Sign]
    local r15_32 = r13_32.ResultId
    if DataMgr.GachaRewardType[r14_32] and DataMgr.GachaRewardType[r14_32].HighlightDisplay or r14_32 == r4_32 and r15_32 == r3_32 then
      local r16_32 = DataMgr[r14_32][r15_32]
      local r17_32 = r16_32.Rarity and r16_32[r14_32 .. "Rarity"]
      if r5_32 < r17_32 then
        r5_32 = r17_32
        r6_32 = r14_32
        r7_32 = r15_32
      end
    end
  end
  -- close: r8_32
  return r6_32, r7_32
end
function r4_0.CheckShopLockState(r0_33)
  -- line: [746, 758] id: 33
  local r1_33 = "Shop"
  r0_33.ShopIsUnlock = false
  local r2_33 = GWorld:GetAvatar()
  if r2_33 then
    r0_33.ShopIsUnlock = r2_33:CheckUIUnlocked(r1_33)
  end
  if r0_33.ShopIsUnlock then
    r0_33.Group_ShopExchange:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_33.Group_ShopExchange:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r4_0.PurchaseGachaResource(r0_34, r1_34, r2_34)
  -- line: [760, 941] id: 34
  local r3_34 = DataMgr.SkinGacha[r0_34.CurrentGachaId]
  local r4_34 = nil
  local r5_34 = r3_34.GachaCostRes
  if not r5_34 then
    return 
  end
  local r6_34 = GWorld:GetAvatar()
  if not r6_34 then
    return 
  end
  local r7_34 = 0
  for r12_34, r13_34 in ipairs(r3_34.GachaCostRes) do
    r7_34 = r7_34 + r6_34:GetResourceNum(r13_34)
  end
  -- close: r8_34
  local r8_34 = nil
  local r9_34 = nil
  for r14_34, r15_34 in ipairs(r5_34) do
    if DataMgr.ShopItem2ShopSubId.Resource.Shop[r15_34] then
      for r20_34, r21_34 in ipairs(DataMgr.ShopItem2ShopSubId.Resource.Shop[r15_34]) do
        if DataMgr.ShopItem[r21_34.ShopItemId].PriceType == CommonConst.Coins.Coin1 or DataMgr.ShopItem[r21_34.ShopItemId].PriceType == CommonConst.Coins.Coin4 then
          r8_34 = r21_34
          r9_34 = r15_34
          break
        end
      end
      -- close: r16_34
      if r9_34 then
        break
      end
    end
  end
  -- close: r10_34
  if r1_34 then
    r4_34 = r3_34.GachaTimes
  else
    r4_34 = r3_34.GachaCostNum10
  end
  local r10_34 = r4_34 - r7_34
  if r8_34 then
    local r11_34 = r8_34.ShopItemId
    local r12_34 = DataMgr.ShopItem[r11_34]
    local r13_34 = r12_34.PriceType
    local r14_34 = math.ceil(ShopUtils:GetShopItemPrice(r11_34) * math.ceil(r10_34 / r12_34.TypeNum))
    local r15_34 = r6_34:GetResourceNum(r13_34)
    if r15_34 < r14_34 then
      if r13_34 == CommonConst.Coins.Coin1 then
        local r16_34 = CommonConst.Coins.Coin4
        local r17_34 = r6_34:GetResourceNum(r16_34)
        local r18_34 = r14_34 - r15_34
        if r18_34 <= r17_34 then
          local function r19_34()
            -- line: [805, 831] id: 35
            r0_34.CantClick = true
            r6_34:PurchaseShopItemUseCoin1(r11_34, math.ceil(r10_34 / r12_34.TypeNum), function(r0_36)
              -- line: [807, 829] id: 36
              if r0_36 == ErrorCode.RET_SUCCESS then
                r0_34.CantClick = false
                r0_34:RefreshGachaResInfo()
                if r1_34 then
                  r0_34:OnClickBtnGachaOnce()
                else
                  r0_34:OnClickBtnGachaTentimes()
                end
                if r2_34 and r0_34.GetItemPage then
                  r0_34.GetItemPage:PlayOutAnim()
                end
              elseif DataMgr.ErrorCode[r0_36] then
                r0_34.CantClick = false
                UIManager(r0_34):ShowError(r0_36, nil, UIConst.Tip_CommonToast)
              else
                r0_34.CantClick = false
                UIManager(r0_34):ShowUITip("CommonToastMain", GText("Unknown_Error"), 1.5)
              end
            end)
          end
          local r20_34 = {}
          table.insert(r20_34, {
            ItemId = r16_34,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = r17_34,
            ItemNeed = r18_34,
          })
          local r21_34 = 100136
          local r22_34 = DataMgr.Resource[r13_34]
          local r23_34 = GText(DataMgr.CommonPopupUIContext[r21_34].PopoverText)
          if string.find(r23_34, "&ResourceName&") then
            r23_34 = string.gsub(r23_34, "&ResourceName&", GText(r22_34.ResourceName))
          end
          if string.find(r23_34, "&ResourceName1&") then
            r23_34 = string.gsub(r23_34, "&ResourceName1&", GText(DataMgr.Resource[r16_34].ResourceName))
          end
          if string.find(r23_34, "&ResourceName2&") then
            r23_34 = string.gsub(r23_34, "&ResourceName2&", GText(r22_34.ResourceName))
          end
          if string.find(r23_34, "&Num1&") then
            r23_34 = string.gsub(r23_34, "&Num1&", r18_34)
          end
          if string.find(r23_34, "&Num2&") then
            r23_34 = string.gsub(r23_34, "&Num2&", r18_34)
          end
          r0_34.PopupUI = UIManager(r0_34):ShowCommonPopupUI(r21_34, {
            RightCallbackFunction = r19_34,
            ItemList = r20_34,
            ShortText = r23_34,
          })
          r0_34:PopupUIGamepadSetting()
          return 
        end
      end
      local function r16_34()
        -- line: [865, 873] id: 37
        if r0_34.ShopIsUnlock then
          PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        else
          UIManager(r0_34):ShowUITip("CommonToastMain", GText(DataMgr.UIUnlockRule.Shop.UIUnlockDesc), 1.5)
        end
      end
      local r17_34 = nil
      if r13_34 == CommonConst.Coins.Coin1 then
        r17_34 = 100137
      elseif r13_34 == CommonConst.Coins.Coin4 then
        r17_34 = 100263
      end
      if not r17_34 then
        return 
      end
      r0_34.PopupUI = UIManager(r0_34):ShowCommonPopupUI(r17_34, {
        LeftCallbackObj = r0_34,
        RightCallbackObj = r0_34,
        RightCallbackFunction = r16_34,
      }, r0_34)
    else
      local function r16_34()
        -- line: [889, 906] id: 38
        r0_34.CantClick = true
        r0_34.IsPurchaseForGacha = true
        r6_34:PurchaseShopItem(r11_34, math.ceil(r10_34 / r12_34.TypeNum), true, function()
          -- line: [892, 905] id: 39
          r0_34:RefreshGachaResInfo()
          r0_34.CantClick = false
          if r1_34 then
            r0_34:OnClickBtnGachaOnce()
          else
            r0_34:OnClickBtnGachaTentimes()
          end
          if r2_34 and r0_34.GetItemPage then
            r0_34.GetItemPage:PlayOutAnim()
          end
        end)
      end
      local r17_34 = {}
      table.insert(r17_34, {
        ItemId = r13_34,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = r15_34,
        ItemNeed = r14_34,
      })
      local r18_34 = 100136
      local r19_34 = DataMgr.Resource[r9_34]
      local r20_34 = GText(DataMgr.CommonPopupUIContext[r18_34].PopoverText)
      if string.find(r20_34, "&ResourceName&") then
        r20_34 = string.gsub(r20_34, "&ResourceName&", GText(r19_34.ResourceName))
      end
      if string.find(r20_34, "&ResourceName1&") then
        r20_34 = string.gsub(r20_34, "&ResourceName1&", GText(DataMgr.Resource[r13_34].ResourceName))
      end
      if string.find(r20_34, "&ResourceName2&") then
        r20_34 = string.gsub(r20_34, "&ResourceName2&", GText(r19_34.ResourceName))
      end
      if string.find(r20_34, "&Num1&") then
        r20_34 = string.gsub(r20_34, "&Num1&", r14_34)
      end
      if string.find(r20_34, "&Num2&") then
        r20_34 = string.gsub(r20_34, "&Num2&", r10_34)
      end
      r0_34.PopupUI = UIManager(r0_34):ShowCommonPopupUI(r18_34, {
        RightCallbackFunction = r16_34,
        ItemList = r17_34,
        ShortText = r20_34,
      })
      r0_34:PopupUIGamepadSetting()
    end
    -- close: r11_34
  end
end
function r4_0.PopupUIGamepadSetting(r0_40)
  -- line: [943, 980] id: 40
  r0_40.PopupUI.OpenTipsButtonIndex = r0_40.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.LeftThumb,
      }
    },
    Desc = GText("UI_Controller_CheckDetails"),
  })
  r0_40.PopupUI.ConfirmButtonIndex = r0_40.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
      }
    },
    Desc = GText("UI_Tips_Ensure"),
  })
  r0_40.PopupUI.CancelButtonIndex = r0_40.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight,
      }
    },
    Desc = GText("UI_BACK"),
  })
  r0_40.PopupUI:HideGamepadShortcut(r0_40.PopupUI.ConfirmButtonIndex)
  r0_40.PopupUI:HideGamepadShortcut(r0_40.PopupUI.CancelButtonIndex)
  local r1_40 = r0_40.PopupUI:GetContentWidgetByName("ItemSubsize")
  if r1_40 then
    r1_40.OnContentKeyDown = r0_40.OnContentKeyDown
    r1_40.Item:GetChildAt(0):BindEventOnMenuOpenChanged(r0_40, r0_40.ItemMenuAnchorChanged)
  end
end
function r4_0.ItemMenuAnchorChanged(r0_41, r1_41)
  -- line: [982, 997] id: 41
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_41.PopupUI then
    if r1_41 then
      r0_41.PopupUI:HideGamepadShortcut(r0_41.PopupUI.CancelButtonIndex)
      r0_41.PopupUI:HideGamepadShortcut(r0_41.PopupUI.ConfirmButtonIndex)
    else
      r0_41.PopupUI:ShowGamepadShortcut(r0_41.PopupUI.CancelButtonIndex)
      r0_41.PopupUI:ShowGamepadShortcut(r0_41.PopupUI.ConfirmButtonIndex)
    end
  end
end
function r4_0.OnContentKeyDown(r0_42, r1_42, r2_42)
  -- line: [1000, 1026] id: 42
  local r4_42 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_42))
  local r5_42 = false
  local r6_42 = r0_42.Item:GetChildAt(0)
  if r4_42 == UIConst.GamePadKey.LeftThumb and r6_42 then
    r6_42:SetFocus()
    r0_42.Owner.ButtonBar:SetGamepadBtnKeyVisibility(false)
    r0_42.Owner:ShowGamepadShortcut(r0_42.Owner.ConfirmButtonIndex)
    r0_42.Owner:ShowGamepadShortcut(r0_42.Owner.CancelButtonIndex)
    r0_42.Owner:HideGamepadShortcut(r0_42.Owner.OpenTipsButtonIndex)
    r5_42 = true
  elseif r4_42 == UIConst.GamePadKey.FaceButtonRight and r6_42:HasAnyFocus() then
    r0_42.Owner.ButtonBar:SetGamepadBtnKeyVisibility(true)
    r0_42.Owner:HideGamepadShortcut(r0_42.Owner.ConfirmButtonIndex)
    r0_42.Owner:HideGamepadShortcut(r0_42.Owner.CancelButtonIndex)
    r0_42.Owner:ShowGamepadShortcut(r0_42.Owner.OpenTipsButtonIndex)
    r0_42.Owner:SetFocus()
    r5_42 = true
  end
  return r5_42
end
function r4_0.OnDrawGacha(r0_43, r1_43, r2_43, r3_43)
  -- line: [1032, 1062] id: 43
  if r1_43 == ErrorCode.RET_SUCCESS then
    AudioManager(r0_43):PlayUISound(r0_43, "event:/ui/common/gacha_amb", "GachaAmb", nil)
    if r0_43.bInGachaMain then
      r0_43.bInGachaMain = false
      r0_43:AddTimer(0.3, function(r0_44)
        -- line: [1038, 1043] id: 44
        r0_44.VideoPlayer:Stop()
        if r0_44.CurrentBgMusic then
          AudioManager(r0_44):StopSound(r0_44, r0_44.CurrentBgMusic)
        end
      end, false)
      r0_43:SetAnimationCurrentTime(r0_43.Gacha, 0)
      r0_43:PlayAnimation(r0_43.Gacha)
      r0_43.PendingGachaData = r2_43
      r0_43.PendingRebateData = r3_43
    else
      r0_43:GetGachaAnime():Init(r2_43, r3_43)
    end
    r0_43.GachaRecordsCache = nil
    r0_43:RefreshGuaranteedDict()
  elseif DataMgr.ErrorCode[r1_43] then
    UIManager(r0_43):ShowError(r1_43, nil, UIConst.Tip_CommonToast)
  else
    UIManager(r0_43):ShowUITip("CommonToastMain", GText("Unknown_Error"), 1.5)
  end
end
function r4_0.OnGetCumulativeDrawReward(r0_45, r1_45, r2_45)
  -- line: [1064, 1072] id: 45
  if r1_45 == ErrorCode.RET_SUCCESS then
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r2_45)
    r0_45:RefreshGachaCostInfo()
  else
    UIManager(r0_45):ShowError(r1_45, 1, "CommonToastMain")
  end
  r0_45:RefreshCumulativeDrawReward()
end
function r4_0.OnGachaPoolUpdate(r0_46)
  -- line: [1074, 1087] id: 46
  r0_46:BlockAllUIInput(false)
  r0_46.bNeedUpdate = true
  UIManager(r0_46):ShowCommonPopupUI(100032, {
    RightCallbackFunction = function()
      -- line: [1078, 1085] id: 47
      r0_46.VideoPlayer:Stop()
      if r0_46.CurrentBgMusic then
        AudioManager(r0_46):StopSound(r0_46, r0_46.CurrentBgMusic)
      end
      r0_46.VideoPlayer:Close()
      r0_46:Close()
    end,
  })
end
function r4_0.OnClickBtnGachaOnce(r0_48)
  -- line: [1095, 1108] id: 48
  if r0_48.bCanNotClick then
    return 
  end
  if r0_48.bGachaing or r0_48.CantClick then
    return 
  end
  r0_48:CloseMenuAnchor()
  local r1_48 = r3_0:TryGacha(r0_48.CurrentGachaId, true)
  if r1_48 == 1 then
    r0_48:PurchaseGachaResource(true)
  end
  if r1_48 == 0 then
    r0_48.bGachaing = true
  end
end
function r4_0.OnClickBtnGachaTentimes(r0_49)
  -- line: [1110, 1123] id: 49
  if r0_49.bCanNotClick then
    return 
  end
  if r0_49.bGachaing or r0_49.CantClick then
    return 
  end
  r0_49:CloseMenuAnchor()
  local r1_49 = r3_0:TryGacha(r0_49.CurrentGachaId, false)
  if r1_49 == 1 then
    r0_49:PurchaseGachaResource(false)
  end
  if r1_49 == 0 then
    r0_49.bGachaing = true
  end
end
function r4_0.OnClickBtnShop(r0_50)
  -- line: [1125, 1136] id: 50
  if r0_50.bCanNotClick or r0_50.bGachaing then
    return 
  end
  r0_50:CloseMenuAnchor()
  r0_50.bCanNotClick = true
  local r1_50 = DataMgr.SkinGachaType[DataMgr.SkinGacha[r0_50.CurrentGachaId].GachaType].SubTabId
  local r2_50 = DataMgr.ShopTabSub[r1_50].MainTabId
  local r3_50 = DataMgr.ShopMainTab2ShopType[r2_50]
  AudioManager(r0_50):PlayUISound(r0_50, "event:/ui/activity/shop_small_btn_click", nil, nil)
  PageJumpUtils:JumpToShopPage(r2_50, r1_50, nil, r3_50)
end
function r4_0.OnClickBtnDetails(r0_51)
  -- line: [1139, 1179] id: 51
  if r0_51.bCanNotClick or r0_51.bGachaing or r0_51.CantClick then
    return 
  end
  r0_51:CloseMenuAnchor()
  r0_51.bCanNotClick = true
  local r1_51 = {}
  r1_51.TabConfigData = {
    PlatformName = CommonUtils.GetDeviceTypeByPlatformName(r0_51),
    LeftKey = "A",
    RightKey = "D",
    Tabs = {
      [1] = {
        Text = GText("UI_GACHA_PROBDETAIL"),
        TabId = 1,
      },
      [2] = {
        Text = GText("UI_GACHA_DESDETAIL"),
        TabId = 2,
      },
    },
    SoundFunc = function()
      -- line: [1161, 1163] id: 52
      AudioManager(r0_51):PlayUISound(r0_51, "event:/ui/common/click_level_01", nil, nil)
    end,
  }
  r1_51.IsGacha = true
  r1_51.Parent = r0_51
  r1_51.UseCachedWidget = {
    [1] = r0_51:GetGachaDetailsUI(),
  }
  r1_51.OnCloseCallbackObj = r0_51
  function r1_51.OnCloseCallbackFunction()
    -- line: [1167, 1171] id: 53
    r0_51.bCanNotClick = false
    UIManager(r0_51):GetGameInputModeSubsystem(r0_51):SetNavigateWidgetOpacity(1)
  end
  r1_51.CurrentGachaId = r0_51.CurrentGachaId
  r0_51.DetailPopupUI = UIManager(r0_51):ShowCommonPopupUI(100243, r1_51, r0_51)
end
function r4_0.GetGachaDetailsUI(r0_54)
  -- line: [1181, 1187] id: 54
  if r0_54.GachaDetailsUI and r0_54.GachaDetailsUI:IsValid() then
    return r0_54.GachaDetailsUI
  end
  r0_54.GachaDetailsUI = r0_54:CreateWidgetNew("GachaDetails")
  return r0_54.GachaDetailsUI
end
function r4_0.OnClickBtnHistory(r0_55)
  -- line: [1192, 1237] id: 55
  local r1_55 = GWorld:GetAvatar()
  if not r1_55 then
    return 
  end
  if r0_55.bCanNotClick or r0_55.bGachaing then
    return 
  end
  r0_55:CloseMenuAnchor()
  r0_55.bCanNotClick = true
  local function r2_55(r0_56, r1_56)
    -- line: [1202, 1227] id: 56
    r0_55.bWaitingGachaRecord = false
    r0_55.GachaRecordsCache = r0_56
    r0_55.GuaranteedDict = r1_56
    local r2_56 = r0_55:HandleRecords(r0_56)
    local r3_56 = {
      Parent = r0_55,
    }
    local r4_56, r5_56 = r0_55:GetHistoryTab()
    r3_56.TabConfigData = {
      PlatformName = CommonUtils.GetDeviceTypeByPlatformName(r0_55),
      LeftKey = "A",
      RightKey = "D",
      Tabs = r4_56,
      SoundFunc = function()
        -- line: [1215, 1217] id: 57
        AudioManager(r0_55):PlayUISound(r0_55, "event:/ui/common/click_level_01", nil, nil)
      end,
    }
    r3_56.RecordTable = r2_56
    r3_56.TabMapGacha = r5_56
    r3_56.CurrentGachaId = r0_55.CurrentGachaId
    r3_56.OnCloseCallbackObj = r0_55
    function r3_56.OnCloseCallbackFunction()
      -- line: [1223, 1225] id: 58
      r0_55.bCanNotClick = false
    end
    r0_55.DetailPopupUI = UIManager(r0_55):ShowCommonPopupUI(100242, r3_56, r0_55)
  end
  if r0_55.GachaRecordsCache and r0_55.GuaranteedDict then
    r2_55(r0_55.GachaRecordsCache, r0_55.GuaranteedDict)
  else
    if r0_55.bWaitingGachaRecord then
      return 
    end
    r0_55.bWaitingGachaRecord = true
    r1_55:OpenGachaRecord(r2_55)
  end
end
function r4_0.RefreshGuaranteedDict(r0_59)
  -- line: [1240, 1263] id: 59
  local r1_59 = GWorld:GetAvatar()
  if r1_59 then
    local function r2_59(r0_60, r1_60)
      -- line: [1243, 1256] id: 60
      r0_59.GachaRecordsCache = r0_60
      r0_59.GuaranteedDict = r1_60
      local r2_60 = DataMgr.SkinGacha[r0_59.CurrentGachaId]
      local r4_60 = DataMgr.GachaProbability[r2_60.ProbabilityId]
      local r5_60 = r2_60.GachaType
      if r4_60 and r4_60.ShowGetStar5Times then
        local r6_60 = 0
        if r0_59.GuaranteedDict and r0_59.GuaranteedDict[r5_60] then
          r6_60 = r0_59.GuaranteedDict[r5_60]
        end
      end
    end
    if r0_59.GachaRecordsCache and r0_59.GuaranteedDict then
      r2_59(r0_59.GachaRecordsCache, r0_59.GuaranteedDict)
    else
      r1_59:OpenGachaRecord(r2_59)
    end
  end
end
function r4_0.HandleRecords(r0_61, r1_61)
  -- line: [1266, 1279] id: 61
  local r3_61 = {}
  if #r1_61 == 0 then
    return r3_61
  end
  for r8_61, r9_61 in ipairs(r1_61) do
    if not r3_61[r9_61.GachaId] then
      r3_61[r9_61.GachaId] = {}
    end
    table.insert(r3_61[r9_61.GachaId], r9_61)
  end
  -- close: r4_61
  return r3_61
end
function r4_0.GetHistoryTab(r0_62)
  -- line: [1281, 1314] id: 62
  local r1_62 = TimeUtils.NowTime()
  local r2_62 = {}
  local r3_62 = {}
  local r4_62 = {}
  local r5_62 = 1
  for r10_62, r11_62 in pairs(DataMgr.SkinGacha) do
    if r11_62.GachaStartTime <= r1_62 and r1_62 < r11_62.GachaEndTime then
      if r11_62.GachaHistoryType == 2 and r0_62.CurrentGachaId ~= r10_62 then
        table.insert(r2_62, {
          GachaId = r10_62,
          GachaType = DataMgr.SkinGachaType[r11_62.GachaType].GachaTypeName,
        })
      end
      if r0_62.CurrentGachaId == r10_62 then
        r3_62[r5_62] = {
          Text = GText(DataMgr.SkinGachaType[r11_62.GachaType].GachaTypeName),
          TabId = r5_62,
        }
        r4_62[r5_62] = r10_62
      end
    end
  end
  -- close: r6_62
  table.sort(r2_62, function(r0_63, r1_63)
    -- line: [1302, 1304] id: 63
    return r1_63.GachaId < r0_63.GachaId
  end)
  for r10_62, r11_62 in ipairs(r2_62) do
    r5_62 = r5_62 + 1
    r3_62[r5_62] = {
      Text = GText(r11_62.GachaType),
      TabId = r5_62,
    }
    r4_62[r5_62] = r11_62.GachaId
  end
  -- close: r6_62
  return r3_62, r4_62
end
function r4_0.OpenCumulativeDrawReward(r0_64)
  -- line: [1320, 1422] id: 64
  -- notice: unreachable block#18
  local r1_64 = GWorld:GetAvatar()
  if not r1_64 then
    return 
  end
  if r0_64.bCanNotClick or r0_64.bGachaing then
    return 
  end
  r0_64:CloseMenuAnchor()
  r0_64.bCanNotClick = true
  local r2_64 = r1_0:GetGachaAvatarInfo(r0_64.CurrentGachaId)
  local r3_64 = r1_0:GetSkinGachaCumulativeInfo(r0_64.CurrentGachaId)
  local r4_64 = {}
  local r5_64 = r3_64[#r3_64]
  if r5_64 then
    r5_64 = r3_64[#r3_64].RewardTarget and 0
  else
    goto label_35	-- block#7 is visited secondly
  end
  local r6_64 = {
    Items = {},
    Text_Total = "UI_SkinGacha_Cumulative_Progress",
    ReceiveAllCallBack = function(r0_65, r1_65)
      -- line: [1337, 1353] id: 65
      r1_64:GetGachaCumulativeReward(function(r0_66, r1_66)
        -- line: [1339, 1351] id: 66
        -- notice: unreachable block#4
        local r2_66, r3_66 = r1_0:GetSkinGachaCurrentCumulativeInfo(r0_64.CurrentGachaId)
        for r7_66 = 0, r1_65.SelfWidget.List_Item:GetNumItems() + -1, 1 do
          local r8_66 = r1_65.SelfWidget.List_Item:GetItemAt(r7_66)
          local r9_66 = r8_66.ConfigData
          local r10_66 = r2_64.DrawCounts
          if r8_66.ConfigData.RewardData.RewardTarget <= r10_66 then
            r10_66 = not r2_64.CumulativeRewardGot:HasElement((r7_66 + 1))
          else
            r10_66 = false
          end
          r9_66.CanReceive = r10_66
          r8_66.ConfigData.RewardsGot = r1_64.SkinGachaPool[r0_64.CurrentGachaId].CumulativeRewardGot:HasElement(r7_66 + 1)
          if r8_66.SelfWidget then
            r8_66.SelfWidget:RefreshBtn(r8_66.ConfigData.RewardsGot)
          end
        end
        r1_65.SelfWidget:RefreshButton(r2_66 and r3_66 <= 0)
        r0_64:OnGetCumulativeDrawReward(r0_66, r1_66)
      end, r0_64.CurrentGachaId, -1)
    end,
    ReceiveAllParam = {},
    SortType = 2,
    Rewards = {},
  }
  local r7_64 = r2_64.DrawCounts
  if r5_64 < r7_64 then
    r7_64 = r5_64 and r2_64.DrawCounts
  else
    goto label_56	-- block#10 is visited secondly
  end
  r6_64.NowNum = r7_64
  r7_64 = r3_64[#r3_64]
  if r7_64 then
    r7_64 = r3_64[#r3_64].RewardTarget and 0
  else
    goto label_67	-- block#13 is visited secondly
  end
  r6_64.NumMax = r7_64
  r6_64.ReceiveButtonText = "UI_Event_MidTerm_GetAll"
  r7_64 = nil
  for r12_64, r13_64 in ipairs(r3_64) do
    local r14_64 = {
      Text = string.format(GText("UI_SkinGacha_Cumulative_Goal"), r13_64.RewardTarget),
      ItemId = r12_64,
    }
    local r15_64 = r2_64.DrawCounts
    if r13_64.RewardTarget <= r15_64 then
      r15_64 = not r2_64.CumulativeRewardGot:HasElement(r12_64)
    else
      r15_64 = false
    end
    r14_64.CanReceive = r15_64
    r14_64.RewardsGot = r1_64.SkinGachaPool[r0_64.CurrentGachaId].CumulativeRewardGot:HasElement(r12_64)
    r14_64.InProgress = false
    r14_64.Rewards = {}
    r14_64.Nums = 1
    r14_64.NotreachText = "UI_SkinGacha_Cumulative_Wait"
    r14_64.Hint = string.format(GText("UI_SkinGacha_Cumulative_Goal"), r13_64.RewardTarget)
    r14_64.LeftAligned = true
    r14_64.ReceiveButtonText = "UI_Event_MidTerm_GetPrize"
    function r14_64.ReceiveCallBack(r0_67, r1_67)
      -- line: [1375, 1386] id: 67
      r1_64:GetGachaCumulativeReward(function(r0_68, r1_68)
        -- line: [1377, 1384] id: 68
        -- notice: unreachable block#3
        local r2_68, r3_68 = r1_0:GetSkinGachaCurrentCumulativeInfo(r0_64.CurrentGachaId)
        local r4_68 = r1_67.ConfigData
        local r5_68 = r2_64.DrawCounts
        if r13_64.RewardTarget <= r5_68 then
          r5_68 = not r2_64.CumulativeRewardGot:HasElement(r12_64)
        else
          r5_68 = false
        end
        r4_68.CanReceive = r5_68
        r1_67.ConfigData.RewardsGot = r1_64.SkinGachaPool[r0_64.CurrentGachaId].CumulativeRewardGot:HasElement(r12_64)
        r1_67.SelfWidget:RefreshBtn(r0_68 == 0)
        r1_67.Owner:RefreshButton(r2_68 and r3_68 <= 0)
        r0_64:OnGetCumulativeDrawReward(r0_68, r1_68)
      end, r0_64.CurrentGachaId, r12_64)
    end
    r14_64.ReceiveParm = {}
    r14_64.RewardData = r13_64
    r7_64 = r14_64
    r14_64 = {}
    r15_64 = DataMgr.Reward[r13_64.RewardId]
    if r15_64 then
      local r16_64 = r15_64.Id and {}
      local r17_64 = r15_64.Count and {}
      local r18_64 = r15_64.Type and {}
      for r22_64 = 1, #r16_64, 1 do
        local r23_64 = r16_64[r22_64]
        table.insert(r14_64, {
          ItemType = r18_64[r22_64],
          ItemId = r23_64,
          Count = RewardUtils:GetCount(r17_64[r22_64]),
          Rarity = ItemUtils.GetItemRarity(r23_64, r18_64[r22_64]),
        })
      end
    end
    r7_64.Rewards = r14_64
    table.insert(r6_64.Items, r7_64)
    -- close: r12_64
  end
  -- close: r8_64
  r4_64.ConfigData = r6_64
  r4_64.Title = GText("UI_SkinGacha_Cumulative_Title")
  r4_64.OnCloseCallbackObj = r0_64
  function r4_64.OnCloseCallbackFunction()
    -- line: [1417, 1419] id: 69
    r0_64.bCanNotClick = false
  end
  local r8_64 = AudioManager(r0_64)
  local r12_64 = nil
  local r13_64 = nil
  r8_64:PlayUISound(r0_64, "event:/ui/common/click_btn_large_crystal", r12_64, r13_64)
  r8_64 = UIManager(r0_64)
  r12_64 = r0_64
  r0_64.DetailPopupUI = r8_64:ShowCommonPopupUI(100158, r4_64, r12_64)
end
function r4_0.TakeGachaScreenShot(r0_70, r1_70, r2_70)
  -- line: [1426, 1445] id: 70
  ULowEntryExtendedStandardLibrary.SetMousePositionInPercentages(1, 1)
  local r3_70 = TArray(FColor)
  local r4_70 = FVector(0, 0, 0)
  if not URuntimeCommonFunctionLibrary.TakeUIScreenShot(r1_70, r3_70, r4_70) then
    return 
  end
  local r6_70 = ULowEntryExtendedStandardLibrary.PixelsToTexture2D(math.floor(r4_70.X), math.floor(r4_70.Y), r3_70)
  if not IsValid(r6_70) then
    return 
  end
  if not IsValid(r0_70.GachaScreenShotWidget) then
    r0_70:GetScreenShotWidget()
  end
  if IsValid(r0_70.GachaScreenShotWidget) then
    r0_70.GachaScreenShotWidget:Init(r6_70, r1_70, r2_70)
    r0_70.GachaScreenShotWidget:SetFocus()
  end
end
function r4_0.GetScreenShotWidget(r0_71)
  -- line: [1447, 1461] id: 71
  if not IsValid(r0_71.GachaScreenShotWidget) then
    local r1_71 = UIManager(r0_71):CreateWidget(UIConst.ScreenshotWidget)
    r0_71.LoadUIAnchor:AddChild(r1_71)
    local r2_71 = UWidgetLayoutLibrary.SlotAsCanvasSlot(r1_71)
    local r3_71 = FAnchors()
    r3_71.Minimum = FVector2D(0, 0)
    r3_71.Maximum = FVector2D(1, 1)
    r2_71:SetZOrder(6)
    r2_71:SetAnchors(r3_71)
    r2_71:SetOffsets(FMargin(0, 0, 0, 0))
    r0_71.GachaScreenShotWidget = r1_71
  end
  return r0_71.GachaScreenShotWidget
end
function r4_0.CheckBubbleShow(r0_72)
  -- line: [1465, 1496] id: 72
  if not r0_72.ShopIsUnlock or not r0_72.bAlreadyIn then
    return 
  end
  r0_72:CloseMenuAnchor()
  local r1_72 = DataMgr.SkinGacha[r0_72.CurrentGachaId]
  if not r1_72.BubbleShowGoods then
    return 
  end
  local r2_72 = DataMgr.ShopItem[r1_72.BubbleShowGoods]
  if not r2_72 then
    return 
  end
  local r3_72 = setmetatable({}, {
    __index = r2_72,
  })
  local r4_72 = ShopUtils:CanPurchase(r3_72, r3_72.PriceType, ShopUtils:GetShopItemPrice(r3_72.ItemId))
  if r3_72.PurchaseFailRes == 1 then
    return 
  end
  local r5_72 = Utils.GDate_YMD_Timestamp(TimeUtils.NowTime())
  local r6_72 = r0_0:Get(r5_72, true)
  if r6_72 == nil or r6_72[r0_72.CurrentGachaId] == nil then
    r0_72:OpenMenuAnchor(string.format(GText("UI_SkinGacha_Shop_Bubble"), ItemUtils:GetDropName(r3_72.TypeId, r3_72.ItemType)))
    if r6_72 == nil then
      r6_72 = {}
    end
    r6_72[r0_72.CurrentGachaId] = 1
    r0_0:Set(r5_72, r6_72, true)
  end
end
function r4_0.OpenMenuAnchor(r0_73, r1_73)
  -- line: [1498, 1507] id: 73
  if r0_73.Tips_MenuAnchor:IsOpen() then
    return 
  end
  r0_73.Tips_MenuAnchor:Open(false)
  if r0_73.TipsDetail then
    r0_73.TipsDetail:Init({
      Text = r1_73,
      OnCloseEvent = {
        Obj = r0_73,
        Callback = r0_73.CloseMenuAnchor,
      },
    })
    r0_73.TipsDetail:Open()
  end
end
function r4_0.CloseMenuAnchor(r0_74)
  -- line: [1509, 1512] id: 74
  if not r0_74.Tips_MenuAnchor:IsOpen() then
    return 
  end
  r0_74.Tips_MenuAnchor:Close()
end
function r4_0.AddTabReddotListen(r0_75)
  -- line: [1516, 1533] id: 75
  for r5_75, r6_75 in pairs(DataMgr.SkinGachaTab) do
    local r7_75 = DataMgr.SkinGachaTab[r5_75].ReddotNode
    if r7_75 then
      ReddotManager.AddListenerEx(r7_75, r0_75, function(r0_76, r1_76, r2_76, r3_76)
        -- line: [1520, 1530] id: 76
        if r1_76 > 0 then
          if r2_76 == EReddotType.Normal then
            r0_76:ShowTabRedDotByTabId(r5_75, true)
          elseif r2_76 == EReddotType.New then
            r0_76:ShowTabRedDotByTabId(r5_75, true)
          end
        else
          r0_76:ShowTabRedDotByTabId(r5_75, false)
        end
      end)
    end
    -- close: r5_75
  end
  -- close: r1_75
end
function r4_0.RemoveTabReddotListen(r0_77)
  -- line: [1535, 1542] id: 77
  for r5_77, r6_77 in pairs(DataMgr.SkinGachaTab) do
    local r7_77 = DataMgr.SkinGachaTab[r5_77].ReddotNode
    if r7_77 then
      ReddotManager.RemoveListener(r7_77, r0_77)
    end
  end
  -- close: r1_77
end
function r4_0.ShowTabRedDotByTabId(r0_78, r1_78, r2_78)
  -- line: [1544, 1548] id: 78
  if r0_78.PoolItemMap[r1_78] and r0_78.PoolItemMap[r1_78].SelfWidget then
    r0_78.PoolItemMap[r1_78].SelfWidget:SetReddot(r2_78)
  end
end
function r4_0.OnAnimationFinished(r0_79, r1_79)
  -- line: [1552, 1573] id: 79
  if r1_79 == r0_79.In then
    r0_79:BlockAllUIInput(false)
    r0_79.bAlreadyIn = true
    r0_79:CheckBubbleShow()
  elseif r1_79 == r0_79.Out then
    r0_79:BlockAllUIInput(false)
    r0_79:Close()
  elseif r1_79 == r0_79.Change then
    r0_79:CheckBubbleShow()
    r0_79:BlockAllUIInput(false)
  elseif r1_79 == r0_79.Gacha then
    if r0_79.PendingGachaData == nil or r0_79.PendingRebateData == nil then
      return 
    end
    r0_79:GetGachaAnime():Init(r0_79.PendingGachaData, r0_79.PendingRebateData)
    r0_79.PendingGachaData = nil
    r0_79.PendingRebateData = nil
  end
end
function r4_0.Close(r0_80)
  -- line: [1575, 1590] id: 80
  if r0_80.GachaGetItemPage then
    r0_80.GachaGetItemPage:RemoveFromParent()
  end
  r0_80.Group_TitleAnchor:ClearChildren()
  r0_80.LoadUIAnchor:ClearChildren()
  r0_80.PoolStaticBG:ClearChildren()
  r0_80:RemoveTabReddotListen()
  if r0_80.IsUnLoadNavMesh then
    local r2_80 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    DebugPrint("---冰湖城关闭抽卡恢复导航网格---")
    URuntimeCommonFunctionLibrary.LoadNavMeshLevel(r2_80:GetWorld())
  end
  r0_80.Super.Close(r0_80)
end
function r4_0.CloseSelf(r0_81)
  -- line: [1592, 1607] id: 81
  if not r0_81.bGachaing and not r0_81.CantClick and not r0_81.bGachaRes and not r0_81.bSpecialShow and not r0_81.bWaitingGachaRecord then
    r0_81.VideoPlayer:Stop()
    if r0_81.CurrentBgMusic then
      AudioManager(r0_81):StopSound(r0_81, r0_81.CurrentBgMusic)
    end
    r0_81.VideoPlayer:Close()
    r0_81:BlockAllUIInput(true)
    if r0_81.IsAddInDeque then
      r0_81:PlayAnimationForward(r0_81.Out, UIConst.AnimOutSpeedWithPageJump.LittleFastSpeed)
    else
      r0_81:PlayAnimation(r0_81.Out)
    end
    AudioManager(r0_81):SetEventSoundParam(r0_81, "GachaMainIn", {
      ToEnd = 1,
    })
  end
end
function r4_0.OnKeyDown(r0_82, r1_82, r2_82)
  -- line: [1609, 1628] id: 82
  local r3_82 = UE4.UKismetInputLibrary.GetKey(r2_82)
  local r4_82 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_82)
  local r5_82 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_82) then
    r5_82 = r0_82:OnGamePadDown(r4_82)
  elseif (r4_82 == "Escape" or r4_82 == r0_82.OpenKey) and not r0_82.bGachaing and not r0_82.CantClick and not r0_82.bGachaRes and not r0_82.bSpecialShow and not r0_82.bWaitingGachaRecord then
    r5_82 = true
    r0_82:CloseSelf()
  end
  if r5_82 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r4_0.OnUpdateUIStyleByInputTypeChange(r0_83, r1_83, r2_83)
  -- line: [1632, 1642] id: 83
  r0_83.Super.OnUpdateUIStyleByInputTypeChange(r0_83, r1_83, r2_83)
  if r1_83 == ECommonInputType.Gamepad then
    if r0_83.ExchangeBtnCanClick then
      r0_83.Key_Exchange:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    r0_83:SetFocus_Lua()
  else
    r0_83.Key_Exchange:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r4_0.SetFocus_Lua(r0_84)
  -- line: [1644, 1656] id: 84
  if r0_84.bGachaing then
    r0_84.GachaAnime:SetFocus()
    return 
  end
  if r0_84.bGachaRes then
    r0_84.GetItemPage:SetPageFocus()
    return 
  end
  if r0_84:HasAnyFocus() then
    r0_84.List_Pool:SetFocus()
  end
end
function r4_0.OnGamePadSelect(r0_85, r1_85, r2_85)
  -- line: [1658, 1664] id: 85
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and r2_85 then
    r1_85.SelfWidget:OnItemClick()
  end
end
function r4_0.OnGamePadDown(r0_86, r1_86)
  -- line: [1666, 1705] id: 86
  if r0_86.bGachaing then
    if r1_86 == UIConst.GamePadKey.FaceButtonBottom then
      r0_86.GachaAnime:OnParentKeyDown()
    end
    return true
  end
  if r0_86.bGachaRes then
    if r0_86.GetItemPage then
      r0_86.GetItemPage.Parent = r0_86
      r0_86.GetItemPage:OnGamePadDown(r1_86)
    end
    return true
  end
  if r0_86.bSpecialShow then
    return false
  end
  local r2_86 = false
  if r1_86 == UIConst.GamePadKey.SpecialRight then
    r0_86:OnClickBtnDetails()
  elseif r1_86 == UIConst.GamePadKey.SpecialLeft then
    r0_86:OnClickBtnHistory()
  elseif r1_86 == UIConst.GamePadKey.FaceButtonLeft then
    if r0_86.Group_Once:IsVisible() then
      r0_86:OnClickBtnGachaOnce()
    end
  elseif r1_86 == UIConst.GamePadKey.FaceButtonTop then
    r0_86:OnClickBtnGachaTentimes()
  elseif r1_86 == UIConst.GamePadKey.DPadLeft then
    r0_86:OnClickBtnShop()
  elseif r1_86 == UIConst.GamePadKey.LeftThumb then
    if r0_86.ExchangeBtnCanClick then
      r0_86:OpenCumulativeDrawReward()
    end
  else
    r2_86 = r0_86.Com_Tab:Handle_KeyEventOnGamePad(r1_86)
  end
  return r2_86
end
return r4_0
