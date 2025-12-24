-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CommonPopupUIStyle.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "Item_Tip1",
  },
  RT_2 = {
    [1] = "Text01",
  },
  RT_3 = {
    [1] = "Item_Tip3",
  },
  RT_4 = {
    [1] = "Short_Text",
    [2] = "ItemSubsize",
  },
  RT_5 = {
    [1] = "Item_Currency",
  },
  RT_6 = {
    [1] = "Item_Tip3",
    [2] = "Item_Tip2",
  },
  RT_7 = {
    [1] = "DailyDetail",
  },
  RT_8 = {
    [1] = "Dialog_Ticket",
  },
  RT_9 = {
    [1] = "Dialog_Input_new",
  },
  RT_10 = {
    [1] = "Item_Tip2",
  },
  RT_11 = {
    [1] = "Text02",
  },
  RT_12 = {
    [1] = "ChangeKey",
  },
  RT_13 = {
    [1] = "Shop_BuyPackagePart",
  },
  RT_14 = {
    [1] = "Shop_BuySinglePart",
  },
  RT_15 = {
    [1] = "Item_Tip1",
    [2] = "Item_Currency",
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [51, 51] id: 1
  return r1_1
end
local r4_0 = {}
r4_0.AP_Dialog = {
  ShowContent = {
    [1] = "ActionPoint_Dialog",
  },
  StyleId = "AP_Dialog",
}
r4_0.Abyss_Last_season_review_Dialog = {
  BigSize = true,
  ShowContent = {
    [1] = "Abyss_DialogReview",
  },
  ShowTip = {
    [1] = "DialogReview_Tip",
  },
  StyleId = "Abyss_Last_season_review_Dialog",
}
r4_0.Activity_BuffDialog = {
  ShowContent = {
    [1] = "WBP_Activity_BuffDialog",
  },
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "Activity_BuffDialog",
}
r4_0.Activity_RewardPreview = {
  ShowContent = {
    [1] = "Activity_RewardPreview_1",
  },
  StyleId = "Activity_RewardPreview",
}
r4_0.AlertDefault = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "AlertDefault",
}
r4_0.Angling_Dayandnight_Dialog = {
  ShowContent = {
    [1] = "Angling_Dayandnight",
  },
  ShowRightButton = 1,
  StyleId = "Angling_Dayandnight_Dialog",
}
r4_0.Angling_RodSelect = {
  BigSize = true,
  ShowContent = {
    [1] = "Angling_Rod",
  },
  StyleId = "Angling_RodSelect",
  UseTabTitle = true,
}
r4_0.Announcement = {
  ShowContent = {
    [1] = "Announcement_1",
  },
  StyleId = "Announcement",
}
r4_0.Announcement_new = {
  BigSize = true,
  ShowContent = {
    [1] = "Announcement",
  },
  StyleId = "Announcement_new",
  UseTabTitle = true,
}
r4_0.Armory_Mod_Import_Dialog = {
  ShowContent = {
    [1] = "Text04_ListView",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "Armory_Mod_Import_Dialog",
}
r4_0.Armory_PosInfo = {
  ShowContent = {
    [1] = "WBP_Armory_PosInfoDialog",
  },
  StyleId = "Armory_PosInfo",
}
r4_0.AttrRestraint_Dialog = {
  ShowContent = {
    [1] = "WBP_Armory_AttrRestraintDialog",
  },
  StyleId = "AttrRestraint_Dialog",
}
r4_0.BagSellConfirm = {
  ShowContent = r0_0.RT_4,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = {
    [1] = "Item_Tip2",
    [2] = "Item_Tip1",
  },
  StyleId = "BagSellConfirm",
}
r4_0.BattlePassDialog = {
  BigSize = true,
  ShowContent = {
    [1] = "BattlePassLevelPurchase",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_5,
  StyleId = "BattlePassDialog",
}
r4_0.ChangeBirth_1 = {
  ShowContent = {
    [1] = "Dialog_Birth",
  },
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = r0_0.RT_1,
  StyleId = "ChangeBirth_1",
}
r4_0.Chat_DontDisturbContent_Dialog = {
  ShowContent = {
    [1] = "Chat_DontDisturbContent",
  },
  ShowLeftButton = 1,
  ShowRightButton = 2,
  StyleId = "Chat_DontDisturbContent_Dialog",
}
r4_0.Chat_QuickAnswerEdit = {
  ShowContent = {
    [1] = "Chat_QuickAnswerEdit_1",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_6,
  StyleId = "Chat_QuickAnswerEdit",
}
r4_0.Chat_Report = {
  ShowContent = {
    [1] = "Chat_Report_1",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_6,
  StyleId = "Chat_Report",
}
r4_0.CheckDefault = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = {
    [1] = "Item_SelectHint",
  },
  StyleId = "CheckDefault",
}
r4_0.CombatData = {
  ShowContent = {
    [1] = "CombatData_List",
  },
  StyleId = "CombatData",
}
r4_0.CommonDefinitionDialog = {
  ShowContent = {
    [1] = "WBP_Armory_DefinitionDialog",
  },
  StyleId = "CommonDefinitionDialog",
}
r4_0.CommonDialogAttr2 = {
  ShowContent = {
    [1] = "Common_Dialog_Attr_2",
  },
  StyleId = "CommonDialogAttr2",
}
r4_0.Common_Reward_Dialog = {
  BigSize = true,
  ShowBG = "CommonDialogBgEffect",
  ShowContent = {
    [1] = "Common_Reward",
  },
  StyleId = "Common_Reward_Dialog",
}
r4_0.Common_Reward_Dialog2 = {
  BigSize = true,
  ShowBG = "CommonDialogBgEffect",
  ShowContent = {
    [1] = "Common_Reward2",
  },
  StyleId = "Common_Reward_Dialog2",
}
r4_0.DailyDetailDialog = {
  ShowContent = r0_0.RT_7,
  StyleId = "DailyDetailDialog",
}
r4_0.DeputeDetailDialog = {
  ShowContent = {
    [1] = "DeputeDetail",
  },
  StyleId = "DeputeDetailDialog",
}
r4_0.Depute_Dungeon_Ticket = {
  BigSize = true,
  ShowContent = r0_0.RT_8,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "Depute_Dungeon_Ticket",
}
r4_0.Depute_Ticket = {
  BigSize = true,
  ShowContent = r0_0.RT_8,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "Depute_Ticket",
}
r4_0.Dispatch_CharDispatchAbility = {
  ShowContent = {
    [1] = "DispatchAbility",
  },
  StyleId = "Dispatch_CharDispatchAbility",
}
r4_0.Dispatch_RewardPreview = {
  ShowContent = {
    [1] = "RewardPreview_icon",
  },
  StyleId = "Dispatch_RewardPreview",
}
r4_0.Dye_dialog_input = {
  ShowContent = r0_0.RT_9,
  StyleId = "Dye_dialog_input",
}
r4_0.EliteDropDialog = {
  ShowContent = {
    [1] = "EliteDrop",
  },
  StyleId = "EliteDropDialog",
}
r4_0.Experience_BuffDialog = {
  BigSize = true,
  ShowContent = {
    [1] = "WBP_Experience_BuffDialog",
  },
  StyleId = "Experience_BuffDialog",
}
r4_0.Experience_EXDialog = {
  ShowContent = {
    [1] = "WBP_Experience_EXDialog",
  },
  StyleId = "Experience_EXDialog",
}
r4_0.Filter = {
  BigSize = true,
  ShowContent = {
    [1] = "Multiple_selection_Button",
  },
  ShowLeftButton = 2,
  ShowRightButton = 1,
  StyleId = "Filter",
}
r4_0.ForgeCancelProduce = {
  ShowContent = {
    [1] = "ItemSubsize",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "ForgeCancelProduce",
}
r4_0.ForgeConfirm = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_10,
  StyleId = "ForgeConfirm",
}
r4_0.Forging_BatchDialog = {
  ShowContent = {
    [1] = "Forging_Batch",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = {
    [1] = "Item_ForgingCostTip",
  },
  StyleId = "Forging_BatchDialog",
}
r4_0.Forging_TerminateDialog = {
  ShowContent = {
    [1] = "Forging_Terminate",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "Forging_TerminateDialog",
}
r4_0.Friend_Information = {
  BigSize = true,
  ShowContent = {
    [1] = "List_Friend",
  },
  StyleId = "Friend_Information",
}
r4_0.Gacha_Detail = {
  BigSize = true,
  ShowContent = {
    [1] = "Gacha_DetailContent",
  },
  StyleId = "Gacha_Detail",
  UseTabTitle = true,
}
r4_0.Gacha_DetailContent_Skin = {
  BigSize = true,
  ShowContent = {
    [1] = "WBP_Gacha_DetailContent_Skin",
  },
  StyleId = "Gacha_DetailContent_Skin",
  UseTabTitle = true,
}
r4_0.Gacha_DetailHistoryContent_Skin = {
  BigSize = true,
  ShowContent = {
    [1] = "WBP_Gacha_DetailHistoryContent_Skin",
  },
  StyleId = "Gacha_DetailHistoryContent_Skin",
  UseTabTitle = true,
}
r4_0.Gacha_Histories = {
  ShowContent = {
    [1] = "Gacha_History",
  },
  StyleId = "Gacha_Histories",
  UseTabTitle = true,
}
r4_0.Gacha_details = {
  ShowContent = {
    [1] = "Group_Tab",
    [2] = "Gacha_Details_PC",
  },
  StyleId = "Gacha_details",
}
r4_0.Gacha_history = {
  ShowContent = {
    [1] = "Gacha_Dialog_Record",
  },
  ShowFlipPage = 1,
  StyleId = "Gacha_history",
}
r4_0.Gacha_history_Empty = {
  ShowContent = {
    [1] = "Text_Dummy_Status",
  },
  StyleId = "Gacha_history_Empty",
}
r4_0.Impression_Shop_Confirm = {
  ShowContent = r0_0.RT_4,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "Impression_Shop_Confirm",
}
r4_0.Impression_Shop_Confirm_1 = {
  ShowContent = r0_0.RT_4,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_5,
  StyleId = "Impression_Shop_Confirm_1",
}
r4_0.Invitation_Exchange = {
  ShowContent = {
    [1] = "Text01",
    [2] = "ItemExchange",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "Invitation_Exchange",
}
r4_0.Levelup_1 = {
  ShowContent = {
    [1] = "Levelup_num",
    [2] = "Levelup_Attr",
    [3] = "ItemSubsize_Levelup",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "Levelup_1",
}
r4_0.Levelup_2 = {
  ShowContent = {
    [1] = "Levelup_Star",
    [2] = "Levelup_Attr",
    [3] = "ItemSubsize_Levelup",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "Levelup_2",
}
r4_0.Levelup_3 = {
  ShowContent = {
    [1] = "Levelup_Mod",
    [2] = "ItemSubsize_Levelup",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "Levelup_3",
}
r4_0.LongTextDefault = {
  ShowContent = r0_0.RT_11,
  ShowLeftButton = 1,
  StyleId = "LongTextDefault",
}
r4_0.LongTextDefault_1 = {
  ShowContent = r0_0.RT_11,
  StyleId = "LongTextDefault_1",
}
r4_0.LongTextDefault_2 = {
  ShowContent = r0_0.RT_11,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "LongTextDefault_2",
}
r4_0.LongTextDefault_Line = {
  ShowContent = {
    [1] = "Text03_ListView",
  },
  StyleId = "LongTextDefault_Line",
}
r4_0.Menu_Head_Dialog = {
  BigSize = true,
  ShowContent = {
    [1] = "Menu_Head",
  },
  StyleId = "Menu_Head_Dialog",
  UseTabTitle = true,
}
r4_0.OverSea_Shop_Brithday = {
  ShowContent = {
    [1] = "WBP_Shop_Brithday ",
  },
  StyleId = "OverSea_Shop_Brithday ",
}
r4_0.OverSea_Shop_RechargePart = {
  ShowContent = {
    [1] = "WBP_Shop_RechargePart",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "OverSea_Shop_RechargePart",
}
r4_0.Play_Task_RewardPreview = {
  ShowContent = {
    [1] = "WBP_Play_Task_RewardPreview",
  },
  StyleId = "Play_Task_RewardPreview",
}
r4_0.ResourceUseConfirm = {
  ShowContent = r0_0.RT_4,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "ResourceUseConfirm",
}
r4_0.RewardWithTabDialog = {
  ShowContent = r0_0.RT_7,
  StyleId = "RewardWithTabDialog",
  UseTabTitle = true,
}
r4_0.SettingChangeKey = {
  ShowContent = r0_0.RT_12,
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = {
    [1] = "Item_Tip1",
    [2] = "Item_Tip2",
    [3] = "Item_Tip3",
  },
  StyleId = "SettingChangeKey",
}
r4_0.SettingChangeKey_1 = {
  ShowContent = r0_0.RT_12,
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = r0_0.RT_1,
  StyleId = "SettingChangeKey_1",
}
r4_0.SettingChangeKey_2 = {
  ShowContent = r0_0.RT_12,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "SettingChangeKey_2",
}
r4_0.SettingChangeKey_3 = {
  ShowContent = r0_0.RT_12,
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = r0_0.RT_3,
  StyleId = "SettingChangeKey_3",
}
r4_0.SettingChangeKey_4 = {
  ShowContent = r0_0.RT_12,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_10,
  StyleId = "SettingChangeKey_4",
}
r4_0.Shop_BuyPackagePart_1 = {
  ShowContent = r0_0.RT_13,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_5,
  StyleId = "Shop_BuyPackagePart_1",
}
r4_0.Shop_BuyPackagePart_2 = {
  ShowContent = r0_0.RT_13,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "Shop_BuyPackagePart_2",
}
r4_0.Shop_BuySinglePart_1 = {
  ShowContent = r0_0.RT_14,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_5,
  StyleId = "Shop_BuySinglePart_1",
}
r4_0.Shop_BuySinglePart_2 = {
  ShowContent = r0_0.RT_14,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "Shop_BuySinglePart_2",
}
r4_0.Shop_ExchangePart_Dialog = {
  ShowContent = {
    [1] = "Shop_ExchangePart",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = {
    [1] = "Item_Currency",
    [2] = "Item_Tip3",
  },
  StyleId = "Shop_ExchangePart_Dialog",
}
r4_0.ShortTextComfirm = {
  ShowContent = r0_0.RT_2,
  ShowRightButton = 1,
  StyleId = "ShortTextComfirm",
}
r4_0.ShortTextDefault = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "ShortTextDefault",
}
r4_0.ShortTextDefault_1 = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "ShortTextDefault_1",
}
r4_0.ShortTextDefault_2 = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "ShortTextDefault_2",
}
r4_0.ShortTextDefault_3 = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_1,
  StyleId = "ShortTextDefault_3",
}
r4_0.ShortTextDefault_4 = {
  ShowContent = r0_0.RT_2,
  StyleId = "ShortTextDefault_4",
}
r4_0.SkinPreview_Suit = {
  ShowContent = {
    [1] = "WBP_SkinPreview_Suit",
  },
  StyleId = "SkinPreview_Suit",
}
r4_0.TestStyle = {
  ShowContent = r0_0.RT_2,
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "TestStyle",
  UseTabTitle = true,
}
r4_0.Unlock_node_level_Dialog = {
  ShowContent = {
    [1] = "Unlock_node_level",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "Unlock_node_level_Dialog",
}
r4_0.WBP_Bag_OptionalAvatar = {
  BigSize = true,
  ShowContent = {
    [1] = "WBP_Bag_OptionalAvatar_Content",
  },
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = r0_0.RT_15,
  StyleId = "WBP_Bag_OptionalAvatar",
}
r4_0.WBP_Bag_OptionalGift = {
  ShowContent = {
    [1] = "WBP_Bag_OptionalGift_Content",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "WBP_Bag_OptionalGift",
}
r4_0.WBP_Bag_OptionalProp = {
  ShowContent = {
    [1] = "WBP_Bag_OptionalProp_Content",
  },
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = r0_0.RT_15,
  StyleId = "WBP_Bag_OptionalProp",
}
r4_0.WBP_Login_OverSeaSever = {
  ShowContent = {
    [1] = "WBP_Login_OverSeaSeverContent",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  StyleId = "WBP_Login_OverSeaSever",
}
r4_0.WBP_PersonalInfo_Title = {
  BigSize = true,
  ShowContent = {
    [1] = "WBP_PersonalInfo_Title_Content",
  },
  StyleId = "WBP_PersonalInfo_Title",
  UseTabTitle = true,
}
r4_0.WBP_Set_MultipleLangContent_Dialog = {
  ShowContent = {
    [1] = "WBP_Set_MultipleLangContent",
  },
  ShowLeftButton = 1,
  ShowRightButton = 2,
  StyleId = "WBP_Set_MultipleLangContent_Dialog",
}
r4_0.WeaponResolveDialog = {
  ShowContent = {
    [1] = "WeaponResolve",
  },
  ShowLeftButton = 1,
  ShowRightButton = 1,
  ShowTip = r0_0.RT_3,
  StyleId = "WeaponResolveDialog",
}
r4_0.catching_pets = {
  ShowContent = {
    [1] = "catching_pets_Probability_statement",
  },
  StyleId = "catching_pets",
}
r4_0.common_dialog_input = {
  ShowContent = r0_0.RT_9,
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = {
    [1] = "Item_Tip3",
    [2] = "Item_Tip2",
    [3] = "Item_Tip1",
  },
  StyleId = "common_dialog_input",
}
r4_0.common_dialog_input_red = {
  ShowContent = r0_0.RT_9,
  ShowLeftButton = 1,
  ShowRightButton = 2,
  ShowTip = r0_0.RT_3,
  StyleId = "common_dialog_input_red",
}
r4_0.lineup_changes_Dialog = {
  ShowContent = {
    [1] = "lineup_changes",
  },
  ShowRightButton = 1,
  StyleId = "lineup_changes_Dialog",
}
return r1_0("CommonPopupUIStyle", r4_0)
