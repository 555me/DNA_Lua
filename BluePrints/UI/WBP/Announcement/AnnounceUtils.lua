-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Announcement\AnnounceUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("BluePrints.UI.WBP.Announcement.AnnounceCommon")
local r2_0 = require("Utils")
local r3_0 = require("BluePrints/UI/GameLogin/CdnTool")
local r4_0 = require("Utils.MiscUtils")
local r5_0 = Class()
local r6_0 = {
  "SystemAnnouncement",
  "ActivityAnnouncement",
  "NewsAnnouncement"
}
function r5_0.Init(r0_1, r1_1)
  -- line: [12, 33] id: 1
  if not r1_1 then
    r1_1 = GWorld.GameInstance
  end
  if r1_0.bUseWeb then
    r5_0.GetAnnouncementDataAsync = r5_0.GetAnnouncementDataAsync_UseWeb
  end
  if not r2_0 then
    r2_0 = require("Utils")
  end
  r5_0.AHSS = UAnnounceHttpServerSubsystem.GetInstance(r1_1)
  r5_0.bInit = false
  r5_0.LastConfs = {}
  r5_0.Confs = {}
  r5_0.FutureConfs = {}
  r5_0.AddedConfIds = {}
  r5_0.PendingCo = nil
  r5_0.HasNewAdd = false
  r5_0.bFontLoading = false
  r5_0._AnnouncementDirty = true
  r5_0:LoadResource(true)
end
function r5_0._GetFontPath(r0_2)
  -- line: [36, 42] id: 2
  local r1_2 = r1_0.FontTypeMap[CommonConst.SystemLanguage]
  local r2_2 = string.format("%s.%s", CommonConst.SystemLanguage, r1_2)
  return r1_0.AnnounceWeb .. "Fonts/" .. r2_2, string.format("font/%s", r1_2), r3_0:CdnUrl() .. "/OperationGameNotice/Resource/Fonts/" .. r2_2, r2_2
end
function r5_0.LoadHtmlContent(r0_3, r1_3, r2_3, r3_3)
  -- line: [44, 86] id: 3
  r5_0.AHSS:StartAnnouncementServer()
  local r4_3 = URuntimeCommonFunctionLibrary.ConvertRelativePathToFull(r1_0.AnnounceWeb .. string.format("%s.html", r1_3.NoticeID))
  local function r5_3()
    -- line: [48, 80] id: 4
    local r0_4 = ""
    local r1_4 = "http://localhost:" .. r5_0.AHSS:GetPortId()
    if r1_0.PlatformName == CommonConst.CHANNEL_OS.IOS then
      r1_4 = URuntimeCommonFunctionLibrary.ConvertRelativePathToFull(UEMPathFunctionLibrary.GetProjectSavedDirectory())
    end
    r1_3.NoticeContent = r5_0:ParseTimeOfContent(r1_3.NoticeContent)
    r1_3.NoticeContent = r5_0:ParseHTMLContent(r1_3.NoticeContent)
    r0_4 = string.format(r1_0.HtmlBody1, 100 / r3_3 / 100 * r1_0.FontScale, r1_4, r1_3.NoticeContent)
    if not r1_3.HtmlUrl or not UBlueprintPathsLibrary.FileExists(r4_3) then
      URuntimeCommonFunctionLibrary.SaveFile(r4_3, r0_4)
    end
    if r1_0.PlatformName ~= CommonConst.CHANNEL_OS.IOS then
      local r3_4, r4_4, r5_4, r6_4 = r5_0:_GetFontPath()
      r1_3.HtmlUrl = string.format("http://localhost:%s/AnnounceWeb/%s.html", r5_0.AHSS:GetPortId(), r1_3.NoticeID) .. string.format("?fontUrl=%s", string.format("http://localhost:%s/AnnounceWeb/Fonts/%s", r5_0.AHSS:GetPortId(), r6_4)) .. string.format("&disableScroll=%s", (r1_3.NoticeStyle == r1_0.ContentUIStyle.ImageOnly))
    else
      r4_3 = r4_0.CorrectUrl(r4_3)
      r1_3.HtmlUrl = "file://" .. r4_3 .. string.format("?fontUrl=file://%s", URuntimeCommonFunctionLibrary.ConvertRelativePathToFull(r4_0.CorrectUrl(r5_0:_GetFontPath()))) .. string.format("&disableScroll=%s", (r1_3.NoticeStyle == r1_0.ContentUIStyle.ImageOnly))
    end
    DebugPrint(LXYTag, "看公告页面的URL", r1_3.HtmlUrl)
    r2_3(r1_3.HtmlUrl, r0_4)
  end
  if not r1_3.HtmlUrl then
    r5_0:LoadResource(false, r5_3)
    return 
  end
  r5_3()
end
function r5_0.LoadResource(r0_5, r1_5, r2_5)
  -- line: [89, 149] id: 5
  if r0_0:Get("AnnounceVersion") ~= r1_0.Version then
    UBlueprintFileUtilsBPLibrary.DeleteDirectory(r1_0.AnnounceWeb, true, true)
    r0_0:Set("AnnounceVersion", r1_0.Version)
  end
  if r5_0.bFontLoading then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_NetDelay"))
    return 
  end
  local function r4_5(r0_6, r1_6, r2_6)
    -- line: [99, 110] id: 6
    try({
      exec = function()
        -- line: [100, 106] id: 7
        if not r2_6 or r2_6 == "" then
          DebugPrint(WarningTag, LXYTag, "公告没有拉到脚本", r0_6)
          return 
        end
        URuntimeCommonFunctionLibrary.SaveFile(r1_6, r2_6)
      end,
      catch = function(r0_8)
        -- line: [107, 109] id: 8
        print(ErrorTag, r0_8 .. "\n" .. debug.traceback())
      end,
    })
  end
  local r5_5 = r1_0.AnnounceWeb .. "Script/Announce.js"
  if not UBlueprintPathsLibrary.FileExists(r5_5) or r1_5 then
    r4_5(r5_5, r5_5, r1_0.JsContent)
  end
  local r6_5 = r1_0.AnnounceWeb .. "Script/Announce.css"
  if not UBlueprintPathsLibrary.FileExists(r5_5) or r1_5 then
    r4_5(r6_5, r6_5, r1_0.CssContent)
  end
  URuntimeCommonFunctionLibrary.HttpGetAndSave(r3_0:CdnUrl() .. "/OperationGameNotice/Resource/Image/TitleBg.png", r1_0.AnnounceWeb .. "Image/TitleBg.png", "image/png", {
    GWorld.GameInstance,
    function(r0_9, r1_9)
      -- line: [129, 130] id: 9
    end
  }, r1_5)
  local r9_5, r10_5, r11_5 = r5_0:_GetFontPath()
  if not UBlueprintPathsLibrary.FileExists(r9_5) then
    DebugPrint(LXYTag, "检测到字体不存在，通过httpget获取字体")
    r5_0.bFontLoading = true
    UE.URuntimeCommonFunctionLibrary.HttpGetAndSave(r11_5, r9_5, r10_5, {
      GWorld.GameInstance,
      function(r0_10, r1_10)
        -- line: [136, 143] id: 10
        r5_0.bFontLoading = false
        if not r1_10 then
          DebugPrint(WarningTag, LXYTag, "网络太差，公告没有拉到字体", r11_5)
          return 
        end
        if r2_5 then
          r2_5()
        end
      end
    }, r1_5)
  else
    r5_0.bFontLoading = false
    if r2_5 then
      r2_5()
    end
  end
end
function r5_0._GetTimeZone(r0_11)
  -- line: [153, 160] id: 11
  if not r5_0.LocalTimeZone then
    r5_0.LocalTimeZone = CommonUtils.GetTimeZone()
  end
  return r5_0.LocalTimeZone
end
function r5_0._AddFormatArg(r0_12, r1_12, r2_12, r3_12)
  -- line: [162, 168] id: 12
  local r4_12 = FFormatArgumentData()
  r4_12.ArgumentValueType = EFormatArgumentType.Text
  if r3_12 < 10 then
    r3_12 = "0" .. r3_12 and tostring(r3_12)
  else
    goto label_12	-- block#2 is visited secondly
  end
  r4_12.ArgumentValue = r3_12
  r4_12.ArgumentName = r2_12
  r1_12:Add(r4_12)
end
function r5_0._TranslateTime(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13, r6_13, r7_13)
  -- line: [170, 178] id: 13
  if not r7_13 then
    r7_13 = 8
  end
  local r8_13 = tonumber(r1_13)
  local r9_13 = tonumber(r2_13)
  local r10_13 = tonumber(r3_13)
  local r11_13 = tonumber(r4_13)
  r5_13 = tonumber(r5_13)
  r4_13 = r11_13
  r3_13 = r10_13
  r2_13 = r9_13
  r1_13 = r8_13
  r9_13 = os.date("*t", os.time({
    year = r1_13,
    month = r2_13,
    day = r3_13,
    hour = r4_13,
    min = r5_13,
    sec = 0,
  }) + (r6_13 - r7_13) * 3600)
  r5_13 = r9_13.min
  r4_13 = r9_13.hour
  r3_13 = r9_13.day
  r2_13 = r9_13.month
  r1_13 = r9_13.year
  return r1_13, r2_13, r3_13, r4_13, r5_13
end
function r5_0._MakeTimeStrReal(r0_14, r1_14, r2_14, r3_14, r4_14, r5_14, r6_14, r7_14, r8_14, r9_14, r10_14, r11_14, r12_14)
  -- line: [180, 206] id: 14
  if not r12_14 then
    r12_14 = ""
  end
  local r13_14, r14_14, r15_14, r16_14, r17_14 = r0_14:_TranslateTime(r1_14, r2_14, r3_14, r4_14, r5_14, r11_14)
  local r18_14 = TArray(FFormatArgumentData)
  r0_14:_AddFormatArg(r18_14, "YY", r13_14)
  r0_14:_AddFormatArg(r18_14, "MM", r14_14)
  r0_14:_AddFormatArg(r18_14, "DD", r15_14)
  r0_14:_AddFormatArg(r18_14, "H", r16_14)
  r0_14:_AddFormatArg(r18_14, "M", r17_14)
  if r6_14 and r7_14 and r8_14 and r10_14 and r9_14 then
    local r19_14, r20_14, r21_14, r22_14, r23_14 = r0_14:_TranslateTime(r6_14, r7_14, r8_14, r9_14, r10_14, r11_14)
    if r15_14 ~= r21_14 or r14_14 ~= r20_14 or r13_14 ~= r19_14 then
      r0_14:_AddFormatArg(r18_14, "YY1", r19_14)
      r0_14:_AddFormatArg(r18_14, "MM1", r20_14)
      r0_14:_AddFormatArg(r18_14, "DD1", r21_14)
    end
    r0_14:_AddFormatArg(r18_14, "H1", r22_14)
    r0_14:_AddFormatArg(r18_14, "M1", r23_14)
  end
  if r18_14:Length() == 7 then
    return UKismetTextLibrary.Format(GText("AnnouncementTimeFormatShort"), r18_14) .. r12_14
  elseif r18_14:Length() == 10 then
    return UKismetTextLibrary.Format(GText("AnnouncementTimeFormatLong"), r18_14) .. r12_14
  elseif r18_14:Length() == 5 then
    return UKismetTextLibrary.Format(GText("AnnouncementTimeFormatOne"), r18_14) .. r12_14
  end
end
function r5_0._MakeTimeStrCN(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15, r8_15, r9_15, r10_15, r11_15)
  -- line: [208, 210] id: 15
  return r0_15:_MakeTimeStrReal(r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15, r8_15, r9_15, r10_15, r11_15)
end
function r5_0._MakeTimeStrJP(r0_16, r1_16, r2_16, r3_16, r4_16, r5_16, r6_16, r7_16, r8_16, r9_16, r10_16, r11_16)
  -- line: [212, 218] id: 16
  return r0_16:_MakeTimeStrReal(r1_16, r2_16, r3_16, r4_16, r5_16, r6_16, r7_16, r8_16, r9_16, r10_16, r11_16, GText("AnnouncementAutoTimeZone"))
end
function r5_0._MakeTimeStrEN(r0_17, r1_17, r2_17, r3_17, r4_17, r5_17, r6_17, r7_17, r8_17, r9_17, r10_17, r11_17)
  -- line: [220, 223] id: 17
  local r12_17 = string.format
  local r13_17 = GText("AnnouncementAutoTimeZone")
  local r14_17 = nil	-- notice: implicit variable refs by block#[3]
  if r11_17 >= 0 then
    r14_17 = "+" .. r11_17
    if not r14_17 then
      ::label_12::
      r14_17 = r11_17
    end
  else
    goto label_12	-- block#2 is visited secondly
  end
  return r0_17:_MakeTimeStrReal(r1_17, r2_17, r3_17, r4_17, r5_17, r6_17, r7_17, r8_17, r9_17, r10_17, r11_17, r12_17(r13_17, r14_17))
end
function r5_0._MakeTimeStrKR(r0_18, r1_18, r2_18, r3_18, r4_18, r5_18, r6_18, r7_18, r8_18, r9_18, r10_18, r11_18)
  -- line: [225, 227] id: 18
  return r0_18:_MakeTimeStrJP(r1_18, r2_18, r3_18, r4_18, r5_18, r6_18, r7_18, r8_18, r9_18, r10_18, r11_18)
end
function r5_0._MakeTimeStrTC(r0_19, r1_19, r2_19, r3_19, r4_19, r5_19, r6_19, r7_19, r8_19, r9_19, r10_19, r11_19)
  -- line: [229, 231] id: 19
  return r0_19:_MakeTimeStrEN(r1_19, r2_19, r3_19, r4_19, r5_19, r6_19, r7_19, r8_19, r9_19, r10_19, r11_19)
end
function r5_0._MakeNewTimeStr(r0_20, r1_20, r2_20, r3_20, r4_20, r5_20, r6_20, r7_20, r8_20, r9_20, r10_20)
  -- line: [233, 249] id: 20
  local r11_20 = CommonConst.SystemLanguage
  local r12_20 = ""
  if r11_20 == CommonConst.SystemLanguages.CN then
    r12_20 = "CN"
  elseif r11_20 == CommonConst.SystemLanguages.TC then
    r12_20 = "TC"
  elseif r11_20 == CommonConst.SystemLanguages.EN then
    r12_20 = "EN"
  elseif r11_20 == CommonConst.SystemLanguages.JP then
    r12_20 = "JP"
  elseif r11_20 == CommonConst.SystemLanguages.KR then
    r12_20 = "KR"
  end
  return r0_20["_MakeTimeStr" .. r12_20](r0_20, r1_20, r2_20, r3_20, r4_20, r5_20, r6_20, r7_20, r8_20, r9_20, r10_20, r0_20:_GetTimeZone())
end
function r5_0.ParseTimeOfContent(r0_21, r1_21)
  -- line: [251, 279] id: 21
  local r2_21 = {}
  for r7_21 in string.gmatch(r1_21, r1_0.LongTimeFormat) do
    if not r2_21[r7_21] then
      local r8_21, r9_21, r10_21, r11_21, r12_21, r13_21, r14_21, r15_21, r16_21, r17_21 = string.gmatch(r7_21, r1_0.LongYMDHMFormat)()
      r2_21[r7_21] = r0_21:_MakeNewTimeStr(r8_21, r9_21, r10_21, r11_21, r12_21, r13_21, r14_21, r15_21, r16_21, r17_21)
    end
  end
  -- close: r3_21
  for r7_21 in string.gmatch(r1_21, r1_0.ShortTimeFormat) do
    if not r2_21[r7_21] then
      local r8_21, r9_21, r10_21, r11_21, r12_21, r13_21, r14_21 = string.gmatch(r7_21, r1_0.ShortYMDHMFormat)()
      r2_21[r7_21] = r0_21:_MakeNewTimeStr(r8_21, r9_21, r10_21, r11_21, r12_21, r8_21, r9_21, r10_21, r13_21, r14_21)
    end
  end
  -- close: r3_21
  for r7_21 in string.gmatch(r1_21, r1_0.OneTimeFormat) do
    if not r2_21[r7_21] then
      local r8_21, r9_21, r10_21, r11_21, r12_21 = string.gmatch(r7_21, r1_0.OneYMDHMFormat)()
      r2_21[r7_21] = r0_21:_MakeNewTimeStr(r8_21, r9_21, r10_21, r11_21, r12_21)
    end
  end
  -- close: r3_21
  for r7_21, r8_21 in pairs(r2_21) do
    r1_21 = UKismetStringLibrary.ReplaceInline(r1_21, r7_21, r8_21)
  end
  -- close: r3_21
  return r1_21
end
function r5_0._MakeNewFontSizeStr(r0_22, r1_22)
  -- line: [281, 285] id: 22
  return string.format("font-size:%srem", tonumber(r1_22) * 1.3333333333333333 / 100)
end
function r5_0.ParseHTMLContent(r0_23, r1_23)
  -- line: [287, 307] id: 23
  local r2_23 = {}
  local r9_23 = nil	-- notice: implicit variable refs by block#[9]
  for r7_23 in string.gmatch(r1_23, r1_0.FontSizeFormat) do
    if not r2_23[r7_23] then
      r9_23 = r5_0:_MakeNewFontSizeStr(string.gmatch(r7_23, "(%d+)")())
      r2_23[r7_23] = r9_23
    end
  end
  -- close: r3_23
  for r7_23 in string.gmatch(r1_23, r1_0.TableTagFormat) do
    if not r2_23[r7_23] then
      if string.gmatch(r7_23, "(/)")() then
        r9_23 = "</p>"
        if not r9_23 then
          ::label_45::
          r9_23 = "<p>"
        end
      else
        goto label_45	-- block#8 is visited secondly
      end
      r2_23[r7_23] = r9_23
    end
  end
  -- close: r3_23
  for r7_23, r8_23 in pairs(r2_23) do
    r9_23 = UKismetStringLibrary.ReplaceInline(r1_23, r7_23, r8_23)
    r1_23 = r9_23
  end
  -- close: r3_23
  return r1_23
end
function r5_0._ResetReddot(r0_24)
  -- line: [323, 342] id: 24
  if not ReddotManager.GetTreeNode(DataMgr.ReddotNode.AnnouncementItems.Name) then
    ReddotManager.AddNode(DataMgr.ReddotNode.AnnouncementItems.Name)
  end
  for r6_24, r7_24 in ipairs({
    "ActivityAnnouncement",
    "SystemAnnouncement",
    "NewsAnnouncement"
  }) do
    ReddotManager.ClearLeafNodeCount(r7_24)
    local r8_24 = ReddotManager.GetLeafNodeCacheDetail(r7_24)
    local r9_24 = {}
    for r14_24, r15_24 in pairs(r8_24) do
      if r15_24 then
        table.insert(r9_24, r14_24)
      end
    end
    -- close: r10_24
    for r14_24, r15_24 in ipairs(r9_24) do
      r8_24[r15_24] = nil
    end
    -- close: r10_24
  end
  -- close: r2_24
  ReddotManager.ClearLeafNodeCount("AnnouncementDirty")
end
function r5_0._TryAddReddotCacheDetail(r0_25, r1_25)
  -- line: [344, 355] id: 25
  local r2_25 = tostring(r1_25.NoticeID)
  local r3_25 = r5_0:GetReddotNameByConf(r1_25)
  local r4_25 = ReddotManager.GetLeafNodeCacheDetail(r3_25)
  if r4_25 and r4_25[r2_25] == nil then
    r4_25[r2_25] = true
    r5_0.HasNewAdd = true
  end
  if r4_25[r2_25] then
    ReddotManager.IncreaseLeafNodeCount(r3_25)
  end
end
function r5_0.GetReddotNameByConf(r0_26, r1_26)
  -- line: [357, 365] id: 26
  if r1_26.TabTag == r1_0.TabTag.Activity then
    return "ActivityAnnouncement"
  elseif r1_26.TabTag == r1_0.TabTag.System then
    return "SystemAnnouncement"
  elseif r1_26.TabTag == r1_0.TabTag.News then
    return "NewsAnnouncement"
  end
end
function r5_0.TrySubReddotCacheDetail(r0_27, r1_27)
  -- line: [367, 377] id: 27
  local r2_27 = tostring(r1_27.NoticeID)
  local r3_27 = r5_0:GetReddotNameByConf(r1_27)
  local r4_27 = ReddotManager.GetLeafNodeCacheDetail(r3_27)
  if r4_27 and r4_27[r2_27] then
    r4_27[r2_27] = false
    ReddotManager.DecreaseLeafNodeCount(r3_27)
  end
  r5_0:_UpdateAnnouncementReddotState()
end
function r5_0._SyncReddotCache(r0_28)
  -- line: [379, 392] id: 28
  local r1_28 = ReddotManager.GetLeafNodeCacheDetail("SystemAnnouncement")
  local r2_28 = ReddotManager.GetLeafNodeCacheDetail("ActivityAnnouncement")
  local r3_28 = ReddotManager.GetLeafNodeCacheDetail("NewsAnnouncement")
  local r4_28 = {}
  for r9_28, r10_28 in ipairs(r5_0.Confs) do
    r4_28[tostring(r10_28.NoticeID)] = r10_28
  end
  -- close: r5_28
  r5_0:_RealSyncReddotCache(r1_28, r4_28, "SystemAnnouncement")
  r5_0:_RealSyncReddotCache(r2_28, r4_28, "ActivityAnnouncement")
  r5_0:_RealSyncReddotCache(r3_28, r4_28, "NewsAnnouncement")
end
function r5_0._RealSyncReddotCache(r0_29, r1_29, r2_29, r3_29)
  -- line: [394, 400] id: 29
  for r8_29, r9_29 in pairs(r1_29 and {}) do
    if not r2_29[r8_29] or r5_0:GetReddotNameByConf(r2_29[r8_29]) ~= r3_29 then
      r1_29[r8_29] = nil
    end
  end
  -- close: r4_29
end
function r5_0._UpdateAnnouncementReddotState(r0_30)
  -- line: [402, 420] id: 30
  local r1_30 = false
  for r6_30, r7_30 in ipairs(r6_0) do
    for r13_30, r14_30 in pairs(ReddotManager.GetLeafNodeCacheDetail(r7_30) and {}) do
      if r14_30 == true then
        r1_30 = true
        break
      end
    end
    -- close: r9_30
    if r1_30 then
      break
    end
  end
  -- close: r2_30
  if r1_30 then
    ReddotManager.IncreaseLeafNodeCount("AnnouncementDirty")
  else
    ReddotManager.ClearLeafNodeCount("AnnouncementDirty")
  end
  return r1_30
end
function r5_0._GetLocalAnnouncement(r0_31)
  -- line: [424, 449] id: 31
  if not DataMgr.SystemNotice then
    return 
  end
  for r5_31, r6_31 in pairs(DataMgr.SystemNotice) do
    local r7_31 = r6_31.NoticeDate and Split(r6_31.NoticeDate, "-")
    local r8_31 = nil	-- notice: implicit variable refs by block#[16]
    if r7_31 then
      r8_31 = os.time({
        year = r7_31[1],
        month = r7_31[2],
        day = r7_31[3],
      })
      if not r8_31 then
        ::label_32::
        r8_31 = os.time()
      end
    else
      goto label_32	-- block#7 is visited secondly
    end
    local r9_31 = r6_31.EndDate and Split(r6_31.EndDate, "-")
    local r10_31 = r9_31 and os.time({
      year = r9_31[1],
      month = r9_31[2],
      day = r9_31[3],
    })
    local r11_31 = {
      NoticeID = r6_31.NoticeID,
      NoticeTitle = GText(r6_31.NoticeTitle),
      NoticeContent = GText(r6_31.NoticeContent),
      NoticeStyle = r6_31.NoticeStyle,
      NoticeTag = r6_31.NoticeTag,
      NoticeBanner = r6_31.NoticeBanner,
      NoticeDate = r6_31.NoticeDate and r6_31.NoticeDate .. " (UTC+8)",
      EndDate = r6_31.EndDate and r6_31.EndDate .. " (UTC+8)",
      StartTimestamp = r8_31,
      EndTimestamp = r10_31,
      Sort = r6_31.NoticeID,
      Local = 1,
    }
    r6_31 = r11_31
    r5_0:_TryAddReddotCacheDetail(r6_31)
    table.insert(r5_0.Confs, r6_31)
  end
  -- close: r1_31
end
function r5_0.GetAnnouncementDataAsync(r0_32, r1_32, r2_32, r3_32)
  -- line: [451, 568] id: 32
  if GWorld:GetAvatar() then
    if not r5_0._AnnouncementDirty then
      return 
    end
    r5_0:MarkDirty(false)
  end
  if r3_32 == nil then
    local r4_32 = GWorld:GetAvatar()
    if r4_32 and r4_32.Hostnum then
      r3_32 = tonumber(r4_32.Hostnum)
    else
      r2_0.Traceback(ErrorTag, LXYTag .. "HostId不存在，不知道你选了什么服...")
      return 
    end
  end
  ForceStopAsyncTask(r5_0, "PendingCo")
  r5_0.PendingCo = r2_32
  r5_0:_CacheLastConf()
  r5_0.Confs = {}
  r5_0.bInit = true
  if DataMgr.GlobalConstant.UseLocalSystemNotice.ConstantValue ~= 0 then
    r5_0:_GetLocalAnnouncement()
  end
  r5_0:_ResetReddot()
  DebugPrint("[Laixiaoyang] M:GetAnnoucementDataAsync 拉取后台游戏公告数据...")
  r3_0:GetGameNotice(r3_32, function(r0_33)
    -- line: [478, 564] id: 33
    try({
      exec = function()
        -- line: [480, 551] id: 34
        if IsEmptyTable(r0_33) then
          DebugPrint(WarningTag, LXYTag, "公告Json解析不出内容")
          return 
        end
        for r4_34, r5_34 in pairs(r0_33) do
          DebugPrint(LogTag, LXYTag, "解析公告", r5_34.UniqueId)
          local r6_34 = {
            NoticeID = r5_34.UniqueId,
            StartTimestamp = r5_34.StartTimestamp and os.time(),
            EndTimestamp = r5_34.EndTimestamp and nil,
            NoticeBanner = r5_34.ClientOnly.BannerPath and "",
            NoticeStyle = tonumber(r5_34.ClientOnly.UIStyle) and 1,
            NoticeTag = tonumber(r5_34.ClientOnly.TypeTag) and 1,
            Sort = tonumber(r5_34.ClientOnly.notice_sort and "0"),
            TabTag = tonumber(r5_34.ClientOnly.TypeTag) and r1_0.TabTag.System,
            ShowTags = {},
            Local = 0,
          }
          r5_0:_ParseShowTag(r6_34, r5_34)
          if not r6_34.ShowTags[r1_32] then
            DebugPrint(LXYTag, r5_34.UniqueId .. "公告不在这个场合显示")
          elseif not r5_0:CheckChannel(r5_34) then
            DebugPrint(LXYTag, r5_34.UniqueId .. " 公告渠道检测不通过")
          else
            if not r5_0:CheckSubChannel(r5_34) then
              DebugPrint(LXYTag, r5_34.UniqueId .. " 公告子渠道检测不通过")
              return 
            end
            if r5_0:IsExpired(r6_34) then
              DebugPrint(LXYTag, r5_34.UniqueId .. " 公告已过期")
            else
              local r8_34 = " (UTC+" .. CommonUtils.GetTimeZone() .. ")"
              r6_34.NoticeDate = GDate_YMD_Timestamp(math.floor(r6_34.StartTimestamp + 0.5)) .. r8_34
              r6_34.EndDate = r6_34.EndTimestamp and GDate_YMD_Timestamp(math.floor(r6_34.EndTimestamp + 0.5)) .. r8_34
              r6_34.NoticeContent = ""
              r6_34.NoticeTitle = ""
              for r13_34, r14_34 in pairs(r5_34.Content and {}) do
                if CommonConst.SystemLanguage ~= CommonConst.SystemLanguages[r14_34.language] then
                  DebugPrint(LXYTag, r5_34.UniqueId .. " 公告语言对不上 跳过" .. r14_34.title)
                else
                  r6_34.NoticeTitle = r14_34.title and ""
                  r6_34.NoticeContent = r14_34.body and ""
                  r6_34.NoticeContent = string.gsub(r6_34.NoticeContent, "<n>", "\n")
                  r6_34.NoticeBanner = r14_34.BannerPath
                  break
                end
              end
              -- close: r9_34
              if r6_34.NoticeTitle == "" or r6_34.NoticeContent == "" then
                print(_G.LogTag, r5_34.UniqueId .. " 公告当前语言的文本为空！！当前语言：" .. CommonConst.SystemLanguage)
              else
                r5_0:_TryAddReddotCacheDetail(r6_34)
                table.insert(r5_0.Confs, r6_34)
              end
            end
          end
        end
        -- close: r0_34
      end,
      catch = function(r0_35)
        -- line: [552, 554] id: 35
        print(ErrorTag, r0_35 .. "\n" .. debug.traceback())
      end,
      final = function()
        -- line: [555, 562] id: 36
        r0_32:_SortConfs()
        r0_32:_SyncReddotCache()
        if r5_0.PendingCo then
          coroutine.resume(r5_0.PendingCo)
          r5_0.PendingCo = nil
        end
      end,
    })
  end)
  if r5_0.PendingCo then
    coroutine.yield()
  end
end
function r5_0.MarkDirty(r0_37, r1_37)
  -- line: [573, 578] id: 37
  r5_0._AnnouncementDirty = r1_37
  if r1_37 then
    DebugPrint("[zhangyuhang] M:MakeDirty 准备重新请求公告")
  end
end
function r5_0.UpdateAnnouncementDataInGame(r0_38)
  -- line: [580, 587] id: 38
  local r1_38 = GWorld:GetAvatar()
  if r1_38 then
    r5_0:GetAnnouncementDataAsync_UseWeb(r1_0.ShowTag.InGame, nil, r1_38.Hostnum)
  end
  r5_0:_ActivateScheduledNotices()
  return r5_0:_UpdateAnnouncementReddotState()
end
function r5_0._CacheLastConf(r0_39)
  -- line: [589, 594] id: 39
  r5_0.LastConfs = {}
  for r5_39, r6_39 in ipairs(r5_0.Confs) do
    r5_0.LastConfs[r6_39.NoticeID] = r6_39
  end
  -- close: r1_39
end
function r5_0._SortConfs(r0_40)
  -- line: [596, 603] id: 40
  table.sort(r5_0.Confs, function(r0_41, r1_41)
    -- line: [597, 601] id: 41
    if r0_41.Local ~= r1_41.Local then
      return r0_41.Local < r1_41.Local
    end
    if r0_41.Sort ~= r1_41.Sort then
      return r1_41.Sort < r0_41.Sort
    end
    if r0_41.StartTimestamp ~= r1_41.StartTimestamp then
      return r1_41.StartTimestamp < r0_41.StartTimestamp
    end
  end)
end
function r5_0.GetAnnouncementDataAsync_UseWeb(r0_42, r1_42, r2_42, r3_42)
  -- line: [605, 657] id: 42
  if GWorld:GetAvatar() then
    if not r5_0._AnnouncementDirty then
      return 
    end
    r5_0:MarkDirty(false)
  end
  if r3_42 == nil then
    local r4_42 = GWorld:GetAvatar()
    if r4_42 and r4_42.Hostnum then
      r3_42 = tonumber(r4_42.Hostnum)
    else
      r2_0.Traceback(ErrorTag, LXYTag .. "HostId不存在，不知道你选了什么服...")
      return 
    end
  end
  ForceStopAsyncTask(r5_0, "PendingCo")
  r5_0.PendingCo = r2_42
  r5_0:_CacheLastConf()
  r5_0.AddedConfIds = {}
  r5_0.Confs = {}
  r5_0.bInit = true
  r5_0:_ResetReddot()
  DebugPrint("[Laixiaoyang] M:GetAnnoucementDataAsync 拉取后台游戏公告数据...")
  r3_0:GetGameNotice(r3_42, function(r0_43)
    -- line: [630, 653] id: 43
    try({
      exec = function()
        -- line: [632, 640] id: 44
        if IsEmptyTable(r0_43) then
          DebugPrint(WarningTag, LXYTag, "公告Json解析不出内容")
          return 
        end
        for r4_44, r5_44 in pairs(r0_43) do
          r5_0:_AddNewConf(r5_44, r1_42)
        end
        -- close: r0_44
      end,
      catch = function(r0_45)
        -- line: [641, 643] id: 45
        print(ErrorTag, r0_45 .. "\n" .. debug.traceback())
      end,
      final = function()
        -- line: [644, 651] id: 46
        r0_42:_SortConfs()
        r0_42:_SyncReddotCache()
        if r5_0.PendingCo then
          coroutine.resume(r5_0.PendingCo)
          r5_0.PendingCo = nil
        end
      end,
    })
  end)
  if r5_0.PendingCo then
    coroutine.yield()
  end
end
function r5_0._AddNewConf(r0_47, r1_47, r2_47)
  -- line: [660, 722] id: 47
  if r5_0.AddedConfIds[r1_47.UniqueId] then
    return 
  end
  r5_0.AddedConfIds[r1_47.UniqueId] = true
  DebugPrint(LogTag, LXYTag, "解析公告", r1_47.UniqueId)
  local r3_47 = {
    NoticeID = r1_47.UniqueId,
    StartTimestamp = r1_47.StartTimestamp and os.time(),
    EndTimestamp = r1_47.EndTimestamp and nil,
    NoticeBanner = r1_47.ClientOnly.BannerPath and "",
    NoticeStyle = tonumber(r1_47.ClientOnly.UIStyle) and 1,
    NoticeTag = tonumber(r1_47.ClientOnly.TypeTag) and 1,
    Sort = tonumber(r1_47.ClientOnly.notice_sort and "0"),
    TabTag = tonumber(r1_47.ClientOnly.TypeTag) and r1_0.TabTag.System,
    UIStyle = tonumber(r1_47.ClientOnly.UIStyle) and 1,
    ShowTags = {},
    Local = 0,
    HtmlUrl = nil,
  }
  r5_0:_ParseShowTag(r3_47, r1_47)
  if not r3_47.ShowTags[r2_47] then
    DebugPrint(LXYTag, r1_47.UniqueId .. "公告不在这个场合显示, 当前游戏场合：" .. r2_47)
    return 
  end
  if not r5_0:CheckChannel(r1_47) then
    DebugPrint(LXYTag, r1_47.UniqueId .. " 公告渠道检测不通过")
    return 
  end
  if not r5_0:CheckSubChannel(r1_47) then
    DebugPrint(LXYTag, r1_47.UniqueId .. " 公告子渠道检测不通过")
    return 
  end
  if r5_0:IsExpired(r3_47) then
    DebugPrint(LXYTag, r1_47.UniqueId .. " 公告已过期")
    return 
  end
  if r5_0:IsFutureNotice(r3_47) then
    r0_47.FutureConfs[r1_47.UniqueId] = {
      Info = r1_47,
      ShowTag = r2_47,
    }
    DebugPrint(LXYTag, r1_47.UniqueId .. " 将来的公告已缓存")
    return 
  end
  local r5_47 = " (UTC+" .. CommonUtils.GetTimeZone() .. ")"
  r3_47.NoticeDate = GDate_YMD_Timestamp(math.floor(r3_47.StartTimestamp + 0.5)) .. r5_47
  r3_47.EndDate = r3_47.EndTimestamp and GDate_YMD_Timestamp(math.floor(r3_47.EndTimestamp + 0.5)) .. r5_47
  r5_0:_ParseContent(r3_47, r1_47)
  if r3_47.NoticeTitle == "" or r3_47.NoticeContent == "" then
    DebugPrint(LXYTag, ErrorTag, r1_47.UniqueId .. " 公告当前语言的内容为空！！当前游戏语言：" .. CommonConst.SystemLanguage)
    return 
  end
  r5_0:_TryAddReddotCacheDetail(r3_47)
  table.insert(r5_0.Confs, r3_47)
end
function r5_0.IsExpired(r0_48, r1_48)
  -- line: [728, 740] id: 48
  if not r1_48.EndTimestamp then
    return false
  end
  local r2_48 = os.time()
  local r3_48 = false
  if r1_48.EndTimestamp < r2_48 then
    r3_48 = true
  end
  if r3_48 then
    r5_0:TrySubReddotCacheDetail(r1_48)
  end
  return r3_48
end
function r5_0.IsFutureNotice(r0_49, r1_49)
  -- line: [742, 746] id: 49
  if not r1_49.StartTimestamp then
    return false
  end
  return os.time() < r1_49.StartTimestamp
end
function r5_0._ParseContent(r0_50, r1_50, r2_50)
  -- line: [748, 769] id: 50
  r1_50.NoticeContent = ""
  r1_50.NoticeTitle = ""
  for r7_50, r8_50 in pairs(r2_50.Content and {}) do
    if CommonConst.SystemLanguage == CommonConst.SystemLanguages[r8_50.language] then
      r1_50.NoticeTitle = r8_50.title
      if r1_50.NoticeStyle == r1_0.ContentUIStyle.Default then
        if not r8_50.title1 or r8_50.title1 == "" then
          r8_50.title1 = r8_50.title
        end
        r1_50.NoticeContent = string.format(r1_0.DefaultContent, r8_50.title1, r8_50.body)
      elseif r1_50.NoticeStyle == r1_0.ContentUIStyle.ImageOnly then
        r1_50.NoticeContent = string.format(r1_0.ImageOnlyContent, r8_50.noticeImageURL, r8_50.noticeImage)
      else
        DebugPrint(LXYTag, ErrorTag, "未定义的公告内容样式：" .. r1_50.NoticeStyle)
      end
      return 
    else
      DebugPrint(LXYTag, r2_50.UniqueId .. " 公告语言对不上 跳过" .. r8_50.title)
    end
  end
  -- close: r3_50
end
function r5_0._ParseShowTag(r0_51, r1_51, r2_51)
  -- line: [771, 785] id: 51
  if r4_0.IsNilOrEmpty(r2_51.ClientOnly.noticeType) then
    r1_51.ShowTags = {
      1,
      1
    }
    return 
  end
  for r8_51, r9_51 in ipairs(string.split(r2_51.ClientOnly.noticeType, ",")) do
    if not tonumber(r9_51) then
      r1_51.ShowTags = {
        1,
        1
      }
      break
    else
      DebugPrint(LXYTag, "公告允许显示的场合：" .. r9_51)
      r1_51.ShowTags[tonumber(r9_51)] = 1
    end
  end
  -- close: r4_51
end
r5_0.bIndepChannel = false
function r5_0.CheckChannel(r0_52, r1_52)
  -- line: [788, 819] id: 52
  -- notice: unreachable block#7
  local r2_52 = r2_0.HeroUSDKSubsystem():GetChannelId()
  if not r2_52 then
    DebugPrint(ErrorTag, "本包没有ChannelId，跳过公告渠道检测")
    return true
  end
  local r3_52 = DataMgr.ChannelInfo[r2_52]
  if not r3_52 then
    DebugPrint(ErrorTag, string.format("ChannelInfo表里没有定义这种ChannelId:%s, 跳过公告渠道检测", r2_52))
    r3_52 = true
    return r3_52
  end
  if r2_52 ~= -1 then
    r3_52 = DataMgr.ChannelInfo[r2_52].Provider
  else
    r3_52 = false
  end
  if r1_52.Channels and type(r1_52.Channels) ~= "table" then
    DebugPrint(ErrorTag, "AnnounceUtils:CheckChannel  Info.Channels 后台传来的类型非法！！！不是Table !!!!!", r1_52.Channels)
    return true
  end
  if table.isempty(r1_52.Channels) then
    DebugPrint(ErrorTag, "#Info.Channels 是空的 !!!!")
    return true
  end
  DebugPrint(TXTTag, "看看这个包的SdkChannelId：" .. r2_52 .. " 和平台：" .. r1_0.PlatformName)
  if r2_52 == -1 then
    DebugPrint(WarningTag, "开发环境的ChannelId是-1，跳过渠道检测")
    return true
  end
  PrintTable(r1_52.Channels, 2, "看看公告自身的ChannelId ")
  for r8_52, r9_52 in pairs(r1_52.Channels) do
    if r9_52.code == r3_52 or r9_52.code == r2_52 then
      if r1_0.SpecialChannelName[r3_52] then
        r5_0.bIndepChannel = true
      end
      return true
    end
  end
  -- close: r4_52
  return false
end
function r5_0.ResetConf(r0_53)
  -- line: [821, 825] id: 53
  r5_0.bInit = false
  r5_0.Confs = {}
  r5_0.AddedConfIds = {}
end
function r5_0.CheckSubChannel(r0_54, r1_54)
  -- line: [827, 852] id: 54
  -- notice: unreachable block#5
  if r5_0.bIndepChannel then
    DebugPrint("独立渠道忽略子渠道检测...")
    r5_0.bIndepChannel = false
    return true
  end
  local r2_54 = r2_0.HeroUSDKSubsystem():GetMirrorChannelId()
  local r3_54 = nil	-- notice: implicit variable refs by block#[15]
  if r2_54 ~= -1 then
    r3_54 = DataMgr.ImgChannelInfo[r2_54].Provider
  else
    r3_54 = false
  end
  if r1_54.img_channel_id and type(r1_54.img_channel_id) ~= "table" then
    DebugPrint(ErrorTag, "AnnounceUtils:CheckSubChannel Info.img_channel_id 后台传来的类型非法！！！不是Table !!!!!", r1_54.img_channel_id)
    return true
  end
  if table.isempty(r1_54.img_channel_id) then
    DebugPrint(ErrorTag, "Info.img_channel_id 是空的 !!!!!")
    return true
  end
  DebugPrint(TXTTag, "看看这个包的(Sub)MirrorChannelId：" .. r2_54)
  if r2_54 == -1 then
    DebugPrint(WarningTag, "开发环境的(Sub)MirrorChannelId是-1，跳过渠道检测")
    return true
  end
  PrintTable(r1_54.img_channel_id, 2, "看看公告自身的(Sub)MirrorChannelId")
  for r8_54, r9_54 in pairs(r1_54.img_channel_id) do
    if tonumber(r9_54.code) == r2_54 or r9_54.code == r3_54 then
      return true
    end
  end
  -- close: r4_54
  return false
end
function r5_0.CheckPlatform(r0_55, r1_55)
  -- line: [869, 875] id: 55
  r1_55 = tonumber(r1_55)
  if r1_0.PlatformName == DataMgr.ChannelInfo[r1_55].OS then
    return true
  end
  return false
end
function r5_0.ResetNew(r0_56)
  -- line: [879, 881] id: 56
  r5_0.HasNewAdd = false
end
function r5_0.TrySetServerAreaNew(r0_57, r1_57)
  -- line: [884, 895] id: 57
  local r2_57 = r0_0:Get("VisitedHostTableForAnnouncement") and {}
  if r2_57["Server" .. r1_57] ~= nil then
    return 
  end
  r2_57["Server" .. r1_57] = 1
  r0_0:Set("VisitedHostTableForAnnouncement", r2_57)
  r5_0.HasNewAdd = true
end
function r5_0._ActivateScheduledNotices(r0_58)
  -- line: [898, 913] id: 58
  local r1_58 = {}
  for r6_58, r7_58 in pairs(r5_0.FutureConfs and {}) do
    if not r5_0:IsFutureNotice(r7_58.Info) then
      r5_0:_AddNewConf(r7_58.Info, r7_58.ShowTag)
      table.insert(r1_58, r6_58)
    end
  end
  -- close: r2_58
  if not table.isempty(r1_58) then
    for r6_58, r7_58 in ipairs(r1_58) do
      r5_0.FutureConfs[r7_58] = nil
    end
    -- close: r2_58
    r0_58:_SortConfs()
    r0_58:_SyncReddotCache()
  end
end
function r5_0._RemoveExpiredNotices(r0_59)
  -- line: [916, 925] id: 59
  for r4_59 = #r5_0.Confs, 1, -1 do
    local r5_59 = r5_0.Confs[r4_59]
    if r5_0:IsExpired(r5_59) then
      r5_0.AddedConfIds[r5_59.NoticeID] = nil
      table.remove(r5_0.Confs, r4_59)
    end
  end
end
function r5_0.FilterConfForUI(r0_60, r1_60, r2_60)
  -- line: [927, 938] id: 60
  r5_0:_ActivateScheduledNotices()
  r5_0:_RemoveExpiredNotices()
  local r3_60 = {}
  for r8_60, r9_60 in pairs(r5_0.Confs) do
    if r1_60 == r9_60.TabTag and r9_60.ShowTags[r2_60] then
      table.insert(r3_60, r9_60)
    end
  end
  -- close: r4_60
  return r3_60
end
r5_0.AnnounceMainUI = nil
function r5_0.OpenAnnouncementMain(r0_61, r1_61, r2_61, r3_61, r4_61, r5_61)
  -- line: [941, 979] id: 61
  if r5_0.bFontLoading then
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_NetDelay"))
    return 
  end
  local r6_61 = UIUtils.UtilsGetCurrentInputType()
  local r7_61 = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  if r6_61 == ECommonInputType.Gamepad then
    r7_61 = "GamePad"
  end
  local r8_61 = {
    bNeedRequest = r2_61,
    HostId = r3_61,
    ShowTag = r1_61,
    CurrTabIdx = 1,
  }
  r8_61.TabConfigData = {
    PlatformName = r7_61,
    Tabs = {
      {
        Text = GText(DataMgr.NoticeTab[1].Text),
        TabId = 1,
        Icon = DataMgr.NoticeTab[1].IconPath,
      },
      {
        Text = GText(DataMgr.NoticeTab[2].Text),
        TabId = 2,
        Icon = DataMgr.NoticeTab[2].IconPath,
      },
      {
        Text = GText(DataMgr.NoticeTab[3].Text),
        TabId = 3,
        Icon = DataMgr.NoticeTab[3].IconPath,
      }
    },
    ChildWidgetBPPath = "WidgetBlueprint\'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_TabItem.WBP_Announcement_TabItem\'",
  }
  r5_0.AnnounceMainUI = UIManager(GWorld.GameInstance):ShowCommonPopupUI(100134, r8_61, r4_61, r5_61)
end
function r5_0.TryCloseAnnounceMainUI(r0_62)
  -- line: [981, 986] id: 62
  if IsValid(r5_0.AnnounceMainUI) then
    r5_0.AnnounceMainUI:Close()
    r0_62:ClearAnnounceMainUI()
  end
end
function r5_0.ClearAnnounceMainUI(r0_63)
  -- line: [988, 990] id: 63
  r5_0.AnnounceMainUI = nil
end
function r5_0.UrlDecode(r0_64, r1_64)
  -- line: [992, 997] id: 64
  r1_64 = string.gsub(r1_64, "%%(%x%x)", function(r0_65)
    -- line: [993, 995] id: 65
    return string.char(tonumber(r0_65, 16))
  end)
  return r1_64
end
return r5_0
