-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/sha1.lua
-- version: lua54
-- line: [0, 0] id: 0
local function r0_0()
  -- line: [63, 70] id: 1
  return {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  }
end
local r1_0 = {
  ["0"] = {
    false,
    false,
    false,
    false
  },
  ["1"] = {
    false,
    false,
    false,
    true
  },
  ["2"] = {
    false,
    false,
    true,
    false
  },
  ["3"] = {
    false,
    false,
    true,
    true
  },
  ["4"] = {
    false,
    true,
    false,
    false
  },
  ["5"] = {
    false,
    true,
    false,
    true
  },
  ["6"] = {
    false,
    true,
    true,
    false
  },
  ["7"] = {
    false,
    true,
    true,
    true
  },
  ["8"] = {
    true,
    false,
    false,
    false
  },
  ["9"] = {
    true,
    false,
    false,
    true
  },
  A = {
    true,
    false,
    true,
    false
  },
  B = {
    true,
    false,
    true,
    true
  },
  C = {
    true,
    true,
    false,
    false
  },
  D = {
    true,
    true,
    false,
    true
  },
  E = {
    true,
    true,
    true,
    false
  },
  F = {
    true,
    true,
    true,
    true
  },
  a = {
    true,
    false,
    true,
    false
  },
  b = {
    true,
    false,
    true,
    true
  },
  c = {
    true,
    true,
    false,
    false
  },
  d = {
    true,
    true,
    false,
    true
  },
  e = {
    true,
    true,
    true,
    false
  },
  f = {
    true,
    true,
    true,
    true
  },
}
local function r2_0(r0_2)
  -- line: [104, 122] id: 2
  assert(type(r0_2) == "string")
  assert(r0_2:match("^[0123456789abcdefABCDEF]+$"))
  assert(#r0_2 == 8)
  local r1_2 = {}
  for r6_2 in r0_2:gmatch(".") do
    local r7_2 = r1_0[r6_2]
    assert(r7_2)
    table.insert(r1_2, 1, r7_2[1])
    table.insert(r1_2, 1, r7_2[2])
    table.insert(r1_2, 1, r7_2[3])
    table.insert(r1_2, 1, r7_2[4])
  end
  -- close: r2_2
  return r1_2
end
local function r3_0(r0_3)
  -- line: [124, 131] id: 3
  local r1_3 = {}
  for r6_3, r7_3 in pairs(r0_3) do
    r1_3[r6_3] = r7_3
  end
  -- close: r2_3
  return r1_3
end
local function r4_0(r0_4, ...)
  -- line: [133, 167] id: 4
  local r1_4 = r3_0(r0_4)
  local r2_4 = nil
  local r3_4 = nil
  local r4_4 = nil
  for r8_4 = 1, select("#", ...), 1 do
    r3_4 = select(r8_4, ...)
    r2_4 = 0
    for r12_4 = 1, #r1_4, 1 do
      local r13_4 = r1_4[r12_4]
      if r13_4 then
        r13_4 = 1 and 0
      else
        goto label_28	-- block#4 is visited secondly
      end
      local r14_4 = r3_4[r12_4]
      if r14_4 then
        r14_4 = 1 and 0
      else
        goto label_35	-- block#7 is visited secondly
      end
      r4_4 = r13_4 + r14_4 + r2_4
      if r4_4 == 0 then
        r1_4[r12_4] = false
        r2_4 = 0
      elseif r4_4 == 1 then
        r1_4[r12_4] = true
        r2_4 = 0
      elseif r4_4 == 2 then
        r1_4[r12_4] = false
        r2_4 = 1
      else
        r1_4[r12_4] = true
        r2_4 = 1
      end
    end
  end
  return r1_4
end
local function r5_0(r0_5, ...)
  -- line: [169, 182] id: 5
  local r1_5 = r3_0(r0_5)
  local r2_5 = nil
  for r6_5 = 1, select("#", ...), 1 do
    r2_5 = select(r6_5, ...)
    for r10_5 = 1, #r1_5, 1 do
      r1_5[r10_5] = r1_5[r10_5] ~= r2_5[r10_5]
    end
  end
  return r1_5
end
local function r6_0(r0_6, r1_6)
  -- line: [184, 196] id: 6
  local r2_6 = r0_0()
  for r6_6 = 1, #r0_6, 1 do
    if r0_6[r6_6] and r1_6[r6_6] then
      r2_6[r6_6] = true
    end
  end
  return r2_6
end
local function r7_0(r0_7, r1_7)
  -- line: [198, 210] id: 7
  local r2_7 = r0_0()
  for r6_7 = 1, #r0_7, 1 do
    if r0_7[r6_7] or r1_7[r6_7] then
      r2_7[r6_7] = true
    end
  end
  return r2_7
end
local function r8_0(r0_8, r1_8, r2_8)
  -- line: [212, 224] id: 8
  local r3_8 = r0_0()
  for r7_8 = 1, #r0_8, 1 do
    if r0_8[r7_8] or r1_8[r7_8] or r2_8[r7_8] then
      r3_8[r7_8] = true
    end
  end
  return r3_8
end
local function r9_0(r0_9)
  -- line: [226, 238] id: 9
  local r1_9 = r0_0()
  for r5_9 = 1, #r0_9, 1 do
    if not r0_9[r5_9] then
      r1_9[r5_9] = true
    end
  end
  return r1_9
end
local function r10_0(r0_10, r1_10)
  -- line: [240, 251] id: 10
  local r2_10 = r3_0(r1_10)
  while r0_10 > 0 do
    r0_10 = r0_10 + -1
    table.insert(r2_10, 1, table.remove(r2_10))
  end
  return r2_10
end
local r11_0 = {
  ["0000"] = "0",
  ["0001"] = "1",
  ["0010"] = "2",
  ["0011"] = "3",
  ["0100"] = "4",
  ["0101"] = "5",
  ["0110"] = "6",
  ["0111"] = "7",
  ["1000"] = "8",
  ["1001"] = "9",
  ["1010"] = "a",
  ["1011"] = "b",
  ["1100"] = "c",
  ["1101"] = "d",
  ["1110"] = "e",
  ["1111"] = "f",
}
asHEX = function(r0_11)
  -- line: [273, 293] id: 11
  local r1_11 = ""
  local r2_11 = 1
  while r2_11 < #r0_11 do
    local r3_11 = r0_11[r2_11 + 3]
    if r3_11 then
      r3_11 = "1" and "0"
    else
      goto label_13	-- block#4 is visited secondly
    end
    local r4_11 = r0_11[r2_11 + 2]
    if r4_11 then
      r4_11 = "1" and "0"
    else
      goto label_22	-- block#7 is visited secondly
    end
    local r5_11 = r0_11[r2_11 + 1]
    if r5_11 then
      r5_11 = "1" and "0"
    else
      goto label_31	-- block#10 is visited secondly
    end
    local r6_11 = r0_11[r2_11 + 0]
    if r6_11 then
      r6_11 = "1" and "0"
    else
      goto label_40	-- block#13 is visited secondly
    end
    r3_11 = r3_11 .. r4_11 .. r5_11 .. r6_11
    r1_11 = r11_0[r3_11] .. r1_11
    r2_11 = r2_11 + 4
  end
  return r1_11
end
local r12_0 = r2_0("67452301")
local r13_0 = r2_0("EFCDAB89")
local r14_0 = r2_0("98BADCFE")
local r15_0 = r2_0("10325476")
local r16_0 = r2_0("C3D2E1F0")
local r17_0 = r2_0("5A827999")
local r18_0 = r2_0("6ED9EBA1")
local r19_0 = r2_0("8F1BBCDC")
local r20_0 = r2_0("CA62C1D6")
sha1 = function(r0_12)
  -- line: [307, 421] id: 12
  assert(type(r0_12) == "string")
  assert(#r0_12 < 2147483647)
  local r1_12 = r12_0
  local r2_12 = r13_0
  local r3_12 = r14_0
  local r4_12 = r15_0
  local r5_12 = r16_0
  local r6_12 = #r0_12 * 8
  local r7_12 = string.char(128)
  local r9_12 = (#r0_12 + 1 + 8) % 64
  local r10_12 = ""
  if r9_12 ~= 0 then
    r10_12 = string.rep(string.char(0), 64 - r9_12)
  end
  local r11_12, r12_12 = math.modf(r6_12 / 16777216)
  local r13_12, r14_12 = math.modf(r12_12 * 16777216 / 65536)
  local r15_12, r16_12 = math.modf(r14_12 * 65536 / 256)
  r0_12 = r0_12 .. r7_12 .. r10_12 .. string.char(0) .. string.char(0) .. string.char(0) .. string.char(0) .. string.char(r11_12) .. string.char(r13_12) .. string.char(r15_12) .. string.char(r16_12 * 256)
  assert(#r0_12 % 64 == 0)
  local r19_12 = #r0_12 / 64
  local r20_12 = {}
  local r21_12 = nil
  local r22_12 = nil
  local r23_12 = nil
  local r24_12 = nil
  local r25_12 = nil
  local r26_12 = nil
  local r27_12 = nil
  local r28_12 = nil
  local r29_12 = nil
  local r30_12 = 0
  while r30_12 < r19_12 do
    r21_12 = r30_12 * 64 + 1
    r30_12 = r30_12 + 1
    for r34_12 = 0, 15, 1 do
      r20_12[r34_12] = r2_0(string.format("%02x%02x%02x%02x", r0_12:byte(r21_12, r21_12 + 3)))
      r21_12 = r21_12 + 4
    end
    for r34_12 = 16, 79, 1 do
      r20_12[r34_12] = r10_0(1, r5_0(r20_12[r34_12 + -3], r20_12[r34_12 + -8], r20_12[r34_12 + -14], r20_12[r34_12 + -16]))
    end
    r22_12 = r1_12
    r23_12 = r2_12
    r24_12 = r3_12
    r25_12 = r4_12
    r26_12 = r5_12
    for r34_12 = 0, 79, 1 do
      if r34_12 <= 19 then
        r27_12 = r7_0(r6_0(r23_12, r24_12), r6_0(r9_0(r23_12), r25_12))
        r28_12 = r17_0
      elseif r34_12 <= 39 then
        r27_12 = r5_0(r23_12, r24_12, r25_12)
        r28_12 = r18_0
      elseif r34_12 <= 59 then
        r27_12 = r8_0(r6_0(r23_12, r24_12), r6_0(r23_12, r25_12), r6_0(r24_12, r25_12))
        r28_12 = r19_0
      else
        r27_12 = r5_0(r23_12, r24_12, r25_12)
        r28_12 = r20_0
      end
      r29_12 = r4_0(r10_0(5, r22_12), r27_12, r26_12, r20_12[r34_12], r28_12)
      r26_12 = r25_12
      r25_12 = r24_12
      r24_12 = r10_0(30, r23_12)
      r23_12 = r22_12
      r22_12 = r29_12
    end
    r1_12 = r4_0(r1_12, r22_12)
    r2_12 = r4_0(r2_12, r23_12)
    r3_12 = r4_0(r3_12, r24_12)
    r4_12 = r4_0(r4_12, r25_12)
    r5_12 = r4_0(r5_12, r26_12)
  end
  return asHEX(r1_12) .. asHEX(r2_12) .. asHEX(r3_12) .. asHEX(r4_12) .. asHEX(r5_12)
end
local function r21_0(r0_13)
  -- line: [423, 427] id: 13
  return r0_13:gsub("..", function(r0_14)
    -- line: [424, 426] id: 14
    return string.char(tonumber(r0_14, 16))
  end)
end
sha1_binary = function(r0_15)
  -- line: [429, 431] id: 15
  return r21_0(sha1(r0_15))
end
local r22_0 = {
  [string.char(0)] = string.char(92),
  [string.char(1)] = string.char(93),
  [string.char(2)] = string.char(94),
  [string.char(3)] = string.char(95),
  [string.char(4)] = string.char(88),
  [string.char(5)] = string.char(89),
  [string.char(6)] = string.char(90),
  [string.char(7)] = string.char(91),
  [string.char(8)] = string.char(84),
  [string.char(9)] = string.char(85),
  [string.char(10)] = string.char(86),
  [string.char(11)] = string.char(87),
  [string.char(12)] = string.char(80),
  [string.char(13)] = string.char(81),
  [string.char(14)] = string.char(82),
  [string.char(15)] = string.char(83),
  [string.char(16)] = string.char(76),
  [string.char(17)] = string.char(77),
  [string.char(18)] = string.char(78),
  [string.char(19)] = string.char(79),
  [string.char(20)] = string.char(72),
  [string.char(21)] = string.char(73),
  [string.char(22)] = string.char(74),
  [string.char(23)] = string.char(75),
  [string.char(24)] = string.char(68),
  [string.char(25)] = string.char(69),
  [string.char(26)] = string.char(70),
  [string.char(27)] = string.char(71),
  [string.char(28)] = string.char(64),
  [string.char(29)] = string.char(65),
  [string.char(30)] = string.char(66),
  [string.char(31)] = string.char(67),
  [string.char(32)] = string.char(124),
  [string.char(33)] = string.char(125),
  [string.char(34)] = string.char(126),
  [string.char(35)] = string.char(127),
  [string.char(36)] = string.char(120),
  [string.char(37)] = string.char(121),
  [string.char(38)] = string.char(122),
  [string.char(39)] = string.char(123),
  [string.char(40)] = string.char(116),
  [string.char(41)] = string.char(117),
  [string.char(42)] = string.char(118),
  [string.char(43)] = string.char(119),
  [string.char(44)] = string.char(112),
  [string.char(45)] = string.char(113),
  [string.char(46)] = string.char(114),
  [string.char(47)] = string.char(115),
  [string.char(48)] = string.char(108),
  [string.char(49)] = string.char(109),
  [string.char(50)] = string.char(110),
  [string.char(51)] = string.char(111),
  [string.char(52)] = string.char(104),
  [string.char(53)] = string.char(105),
  [string.char(54)] = string.char(106),
  [string.char(55)] = string.char(107),
  [string.char(56)] = string.char(100),
  [string.char(57)] = string.char(101),
  [string.char(58)] = string.char(102),
  [string.char(59)] = string.char(103),
  [string.char(60)] = string.char(96),
  [string.char(61)] = string.char(97),
  [string.char(62)] = string.char(98),
  [string.char(63)] = string.char(99),
  [string.char(64)] = string.char(28),
  [string.char(65)] = string.char(29),
  [string.char(66)] = string.char(30),
  [string.char(67)] = string.char(31),
  [string.char(68)] = string.char(24),
  [string.char(69)] = string.char(25),
  [string.char(70)] = string.char(26),
  [string.char(71)] = string.char(27),
  [string.char(72)] = string.char(20),
  [string.char(73)] = string.char(21),
  [string.char(74)] = string.char(22),
  [string.char(75)] = string.char(23),
  [string.char(76)] = string.char(16),
  [string.char(77)] = string.char(17),
  [string.char(78)] = string.char(18),
  [string.char(79)] = string.char(19),
  [string.char(80)] = string.char(12),
  [string.char(81)] = string.char(13),
  [string.char(82)] = string.char(14),
  [string.char(83)] = string.char(15),
  [string.char(84)] = string.char(8),
  [string.char(85)] = string.char(9),
  [string.char(86)] = string.char(10),
  [string.char(87)] = string.char(11),
  [string.char(88)] = string.char(4),
  [string.char(89)] = string.char(5),
  [string.char(90)] = string.char(6),
  [string.char(91)] = string.char(7),
  [string.char(92)] = string.char(0),
  [string.char(93)] = string.char(1),
  [string.char(94)] = string.char(2),
  [string.char(95)] = string.char(3),
  [string.char(96)] = string.char(60),
  [string.char(97)] = string.char(61),
  [string.char(98)] = string.char(62),
  [string.char(99)] = string.char(63),
  [string.char(100)] = string.char(56),
  [string.char(101)] = string.char(57),
  [string.char(102)] = string.char(58),
  [string.char(103)] = string.char(59),
  [string.char(104)] = string.char(52),
  [string.char(105)] = string.char(53),
  [string.char(106)] = string.char(54),
  [string.char(107)] = string.char(55),
  [string.char(108)] = string.char(48),
  [string.char(109)] = string.char(49),
  [string.char(110)] = string.char(50),
  [string.char(111)] = string.char(51),
  [string.char(112)] = string.char(44),
  [string.char(113)] = string.char(45),
  [string.char(114)] = string.char(46),
  [string.char(115)] = string.char(47),
  [string.char(116)] = string.char(40),
  [string.char(117)] = string.char(41),
  [string.char(118)] = string.char(42),
  [string.char(119)] = string.char(43),
  [string.char(120)] = string.char(36),
  [string.char(121)] = string.char(37),
  [string.char(122)] = string.char(38),
  [string.char(123)] = string.char(39),
  [string.char(124)] = string.char(32),
  [string.char(125)] = string.char(33),
  [string.char(126)] = string.char(34),
  [string.char(127)] = string.char(35),
  [string.char(128)] = string.char(220),
  [string.char(129)] = string.char(221),
  [string.char(130)] = string.char(222),
  [string.char(131)] = string.char(223),
  [string.char(132)] = string.char(216),
  [string.char(133)] = string.char(217),
  [string.char(134)] = string.char(218),
  [string.char(135)] = string.char(219),
  [string.char(136)] = string.char(212),
  [string.char(137)] = string.char(213),
  [string.char(138)] = string.char(214),
  [string.char(139)] = string.char(215),
  [string.char(140)] = string.char(208),
  [string.char(141)] = string.char(209),
  [string.char(142)] = string.char(210),
  [string.char(143)] = string.char(211),
  [string.char(144)] = string.char(204),
  [string.char(145)] = string.char(205),
  [string.char(146)] = string.char(206),
  [string.char(147)] = string.char(207),
  [string.char(148)] = string.char(200),
  [string.char(149)] = string.char(201),
  [string.char(150)] = string.char(202),
  [string.char(151)] = string.char(203),
  [string.char(152)] = string.char(196),
  [string.char(153)] = string.char(197),
  [string.char(154)] = string.char(198),
  [string.char(155)] = string.char(199),
  [string.char(156)] = string.char(192),
  [string.char(157)] = string.char(193),
  [string.char(158)] = string.char(194),
  [string.char(159)] = string.char(195),
  [string.char(160)] = string.char(252),
  [string.char(161)] = string.char(253),
  [string.char(162)] = string.char(254),
  [string.char(163)] = string.char(255),
  [string.char(164)] = string.char(248),
  [string.char(165)] = string.char(249),
  [string.char(166)] = string.char(250),
  [string.char(167)] = string.char(251),
  [string.char(168)] = string.char(244),
  [string.char(169)] = string.char(245),
  [string.char(170)] = string.char(246),
  [string.char(171)] = string.char(247),
  [string.char(172)] = string.char(240),
  [string.char(173)] = string.char(241),
  [string.char(174)] = string.char(242),
  [string.char(175)] = string.char(243),
  [string.char(176)] = string.char(236),
  [string.char(177)] = string.char(237),
  [string.char(178)] = string.char(238),
  [string.char(179)] = string.char(239),
  [string.char(180)] = string.char(232),
  [string.char(181)] = string.char(233),
  [string.char(182)] = string.char(234),
  [string.char(183)] = string.char(235),
  [string.char(184)] = string.char(228),
  [string.char(185)] = string.char(229),
  [string.char(186)] = string.char(230),
  [string.char(187)] = string.char(231),
  [string.char(188)] = string.char(224),
  [string.char(189)] = string.char(225),
  [string.char(190)] = string.char(226),
  [string.char(191)] = string.char(227),
  [string.char(192)] = string.char(156),
  [string.char(193)] = string.char(157),
  [string.char(194)] = string.char(158),
  [string.char(195)] = string.char(159),
  [string.char(196)] = string.char(152),
  [string.char(197)] = string.char(153),
  [string.char(198)] = string.char(154),
  [string.char(199)] = string.char(155),
  [string.char(200)] = string.char(148),
  [string.char(201)] = string.char(149),
  [string.char(202)] = string.char(150),
  [string.char(203)] = string.char(151),
  [string.char(204)] = string.char(144),
  [string.char(205)] = string.char(145),
  [string.char(206)] = string.char(146),
  [string.char(207)] = string.char(147),
  [string.char(208)] = string.char(140),
  [string.char(209)] = string.char(141),
  [string.char(210)] = string.char(142),
  [string.char(211)] = string.char(143),
  [string.char(212)] = string.char(136),
  [string.char(213)] = string.char(137),
  [string.char(214)] = string.char(138),
  [string.char(215)] = string.char(139),
  [string.char(216)] = string.char(132),
  [string.char(217)] = string.char(133),
  [string.char(218)] = string.char(134),
  [string.char(219)] = string.char(135),
  [string.char(220)] = string.char(128),
  [string.char(221)] = string.char(129),
  [string.char(222)] = string.char(130),
  [string.char(223)] = string.char(131),
  [string.char(224)] = string.char(188),
  [string.char(225)] = string.char(189),
  [string.char(226)] = string.char(190),
  [string.char(227)] = string.char(191),
  [string.char(228)] = string.char(184),
  [string.char(229)] = string.char(185),
  [string.char(230)] = string.char(186),
  [string.char(231)] = string.char(187),
  [string.char(232)] = string.char(180),
  [string.char(233)] = string.char(181),
  [string.char(234)] = string.char(182),
  [string.char(235)] = string.char(183),
  [string.char(236)] = string.char(176),
  [string.char(237)] = string.char(177),
  [string.char(238)] = string.char(178),
  [string.char(239)] = string.char(179),
  [string.char(240)] = string.char(172),
  [string.char(241)] = string.char(173),
  [string.char(242)] = string.char(174),
  [string.char(243)] = string.char(175),
  [string.char(244)] = string.char(168),
  [string.char(245)] = string.char(169),
  [string.char(246)] = string.char(170),
  [string.char(247)] = string.char(171),
  [string.char(248)] = string.char(164),
  [string.char(249)] = string.char(165),
  [string.char(250)] = string.char(166),
  [string.char(251)] = string.char(167),
  [string.char(252)] = string.char(160),
  [string.char(253)] = string.char(161),
  [string.char(254)] = string.char(162),
  [string.char(255)] = string.char(163),
}
local r23_0 = {
  [string.char(0)] = string.char(54),
  [string.char(1)] = string.char(55),
  [string.char(2)] = string.char(52),
  [string.char(3)] = string.char(53),
  [string.char(4)] = string.char(50),
  [string.char(5)] = string.char(51),
  [string.char(6)] = string.char(48),
  [string.char(7)] = string.char(49),
  [string.char(8)] = string.char(62),
  [string.char(9)] = string.char(63),
  [string.char(10)] = string.char(60),
  [string.char(11)] = string.char(61),
  [string.char(12)] = string.char(58),
  [string.char(13)] = string.char(59),
  [string.char(14)] = string.char(56),
  [string.char(15)] = string.char(57),
  [string.char(16)] = string.char(38),
  [string.char(17)] = string.char(39),
  [string.char(18)] = string.char(36),
  [string.char(19)] = string.char(37),
  [string.char(20)] = string.char(34),
  [string.char(21)] = string.char(35),
  [string.char(22)] = string.char(32),
  [string.char(23)] = string.char(33),
  [string.char(24)] = string.char(46),
  [string.char(25)] = string.char(47),
  [string.char(26)] = string.char(44),
  [string.char(27)] = string.char(45),
  [string.char(28)] = string.char(42),
  [string.char(29)] = string.char(43),
  [string.char(30)] = string.char(40),
  [string.char(31)] = string.char(41),
  [string.char(32)] = string.char(22),
  [string.char(33)] = string.char(23),
  [string.char(34)] = string.char(20),
  [string.char(35)] = string.char(21),
  [string.char(36)] = string.char(18),
  [string.char(37)] = string.char(19),
  [string.char(38)] = string.char(16),
  [string.char(39)] = string.char(17),
  [string.char(40)] = string.char(30),
  [string.char(41)] = string.char(31),
  [string.char(42)] = string.char(28),
  [string.char(43)] = string.char(29),
  [string.char(44)] = string.char(26),
  [string.char(45)] = string.char(27),
  [string.char(46)] = string.char(24),
  [string.char(47)] = string.char(25),
  [string.char(48)] = string.char(6),
  [string.char(49)] = string.char(7),
  [string.char(50)] = string.char(4),
  [string.char(51)] = string.char(5),
  [string.char(52)] = string.char(2),
  [string.char(53)] = string.char(3),
  [string.char(54)] = string.char(0),
  [string.char(55)] = string.char(1),
  [string.char(56)] = string.char(14),
  [string.char(57)] = string.char(15),
  [string.char(58)] = string.char(12),
  [string.char(59)] = string.char(13),
  [string.char(60)] = string.char(10),
  [string.char(61)] = string.char(11),
  [string.char(62)] = string.char(8),
  [string.char(63)] = string.char(9),
  [string.char(64)] = string.char(118),
  [string.char(65)] = string.char(119),
  [string.char(66)] = string.char(116),
  [string.char(67)] = string.char(117),
  [string.char(68)] = string.char(114),
  [string.char(69)] = string.char(115),
  [string.char(70)] = string.char(112),
  [string.char(71)] = string.char(113),
  [string.char(72)] = string.char(126),
  [string.char(73)] = string.char(127),
  [string.char(74)] = string.char(124),
  [string.char(75)] = string.char(125),
  [string.char(76)] = string.char(122),
  [string.char(77)] = string.char(123),
  [string.char(78)] = string.char(120),
  [string.char(79)] = string.char(121),
  [string.char(80)] = string.char(102),
  [string.char(81)] = string.char(103),
  [string.char(82)] = string.char(100),
  [string.char(83)] = string.char(101),
  [string.char(84)] = string.char(98),
  [string.char(85)] = string.char(99),
  [string.char(86)] = string.char(96),
  [string.char(87)] = string.char(97),
  [string.char(88)] = string.char(110),
  [string.char(89)] = string.char(111),
  [string.char(90)] = string.char(108),
  [string.char(91)] = string.char(109),
  [string.char(92)] = string.char(106),
  [string.char(93)] = string.char(107),
  [string.char(94)] = string.char(104),
  [string.char(95)] = string.char(105),
  [string.char(96)] = string.char(86),
  [string.char(97)] = string.char(87),
  [string.char(98)] = string.char(84),
  [string.char(99)] = string.char(85),
  [string.char(100)] = string.char(82),
  [string.char(101)] = string.char(83),
  [string.char(102)] = string.char(80),
  [string.char(103)] = string.char(81),
  [string.char(104)] = string.char(94),
  [string.char(105)] = string.char(95),
  [string.char(106)] = string.char(92),
  [string.char(107)] = string.char(93),
  [string.char(108)] = string.char(90),
  [string.char(109)] = string.char(91),
  [string.char(110)] = string.char(88),
  [string.char(111)] = string.char(89),
  [string.char(112)] = string.char(70),
  [string.char(113)] = string.char(71),
  [string.char(114)] = string.char(68),
  [string.char(115)] = string.char(69),
  [string.char(116)] = string.char(66),
  [string.char(117)] = string.char(67),
  [string.char(118)] = string.char(64),
  [string.char(119)] = string.char(65),
  [string.char(120)] = string.char(78),
  [string.char(121)] = string.char(79),
  [string.char(122)] = string.char(76),
  [string.char(123)] = string.char(77),
  [string.char(124)] = string.char(74),
  [string.char(125)] = string.char(75),
  [string.char(126)] = string.char(72),
  [string.char(127)] = string.char(73),
  [string.char(128)] = string.char(182),
  [string.char(129)] = string.char(183),
  [string.char(130)] = string.char(180),
  [string.char(131)] = string.char(181),
  [string.char(132)] = string.char(178),
  [string.char(133)] = string.char(179),
  [string.char(134)] = string.char(176),
  [string.char(135)] = string.char(177),
  [string.char(136)] = string.char(190),
  [string.char(137)] = string.char(191),
  [string.char(138)] = string.char(188),
  [string.char(139)] = string.char(189),
  [string.char(140)] = string.char(186),
  [string.char(141)] = string.char(187),
  [string.char(142)] = string.char(184),
  [string.char(143)] = string.char(185),
  [string.char(144)] = string.char(166),
  [string.char(145)] = string.char(167),
  [string.char(146)] = string.char(164),
  [string.char(147)] = string.char(165),
  [string.char(148)] = string.char(162),
  [string.char(149)] = string.char(163),
  [string.char(150)] = string.char(160),
  [string.char(151)] = string.char(161),
  [string.char(152)] = string.char(174),
  [string.char(153)] = string.char(175),
  [string.char(154)] = string.char(172),
  [string.char(155)] = string.char(173),
  [string.char(156)] = string.char(170),
  [string.char(157)] = string.char(171),
  [string.char(158)] = string.char(168),
  [string.char(159)] = string.char(169),
  [string.char(160)] = string.char(150),
  [string.char(161)] = string.char(151),
  [string.char(162)] = string.char(148),
  [string.char(163)] = string.char(149),
  [string.char(164)] = string.char(146),
  [string.char(165)] = string.char(147),
  [string.char(166)] = string.char(144),
  [string.char(167)] = string.char(145),
  [string.char(168)] = string.char(158),
  [string.char(169)] = string.char(159),
  [string.char(170)] = string.char(156),
  [string.char(171)] = string.char(157),
  [string.char(172)] = string.char(154),
  [string.char(173)] = string.char(155),
  [string.char(174)] = string.char(152),
  [string.char(175)] = string.char(153),
  [string.char(176)] = string.char(134),
  [string.char(177)] = string.char(135),
  [string.char(178)] = string.char(132),
  [string.char(179)] = string.char(133),
  [string.char(180)] = string.char(130),
  [string.char(181)] = string.char(131),
  [string.char(182)] = string.char(128),
  [string.char(183)] = string.char(129),
  [string.char(184)] = string.char(142),
  [string.char(185)] = string.char(143),
  [string.char(186)] = string.char(140),
  [string.char(187)] = string.char(141),
  [string.char(188)] = string.char(138),
  [string.char(189)] = string.char(139),
  [string.char(190)] = string.char(136),
  [string.char(191)] = string.char(137),
  [string.char(192)] = string.char(246),
  [string.char(193)] = string.char(247),
  [string.char(194)] = string.char(244),
  [string.char(195)] = string.char(245),
  [string.char(196)] = string.char(242),
  [string.char(197)] = string.char(243),
  [string.char(198)] = string.char(240),
  [string.char(199)] = string.char(241),
  [string.char(200)] = string.char(254),
  [string.char(201)] = string.char(255),
  [string.char(202)] = string.char(252),
  [string.char(203)] = string.char(253),
  [string.char(204)] = string.char(250),
  [string.char(205)] = string.char(251),
  [string.char(206)] = string.char(248),
  [string.char(207)] = string.char(249),
  [string.char(208)] = string.char(230),
  [string.char(209)] = string.char(231),
  [string.char(210)] = string.char(228),
  [string.char(211)] = string.char(229),
  [string.char(212)] = string.char(226),
  [string.char(213)] = string.char(227),
  [string.char(214)] = string.char(224),
  [string.char(215)] = string.char(225),
  [string.char(216)] = string.char(238),
  [string.char(217)] = string.char(239),
  [string.char(218)] = string.char(236),
  [string.char(219)] = string.char(237),
  [string.char(220)] = string.char(234),
  [string.char(221)] = string.char(235),
  [string.char(222)] = string.char(232),
  [string.char(223)] = string.char(233),
  [string.char(224)] = string.char(214),
  [string.char(225)] = string.char(215),
  [string.char(226)] = string.char(212),
  [string.char(227)] = string.char(213),
  [string.char(228)] = string.char(210),
  [string.char(229)] = string.char(211),
  [string.char(230)] = string.char(208),
  [string.char(231)] = string.char(209),
  [string.char(232)] = string.char(222),
  [string.char(233)] = string.char(223),
  [string.char(234)] = string.char(220),
  [string.char(235)] = string.char(221),
  [string.char(236)] = string.char(218),
  [string.char(237)] = string.char(219),
  [string.char(238)] = string.char(216),
  [string.char(239)] = string.char(217),
  [string.char(240)] = string.char(198),
  [string.char(241)] = string.char(199),
  [string.char(242)] = string.char(196),
  [string.char(243)] = string.char(197),
  [string.char(244)] = string.char(194),
  [string.char(245)] = string.char(195),
  [string.char(246)] = string.char(192),
  [string.char(247)] = string.char(193),
  [string.char(248)] = string.char(206),
  [string.char(249)] = string.char(207),
  [string.char(250)] = string.char(204),
  [string.char(251)] = string.char(205),
  [string.char(252)] = string.char(202),
  [string.char(253)] = string.char(203),
  [string.char(254)] = string.char(200),
  [string.char(255)] = string.char(201),
}
local r24_0 = 64
hmac_sha1 = function(r0_16, r1_16)
  -- line: [698, 710] id: 16
  assert(type(r0_16) == "string", "key passed to hmac_sha1 should be a string")
  assert(type(r1_16) == "string", "text passed to hmac_sha1 should be a string")
  if r24_0 < #r0_16 then
    r0_16 = sha1_binary(r0_16)
  end
  return sha1(r0_16:gsub(".", r22_0) .. string.rep(string.char(92), r24_0 - #r0_16) .. sha1_binary(r0_16:gsub(".", r23_0) .. string.rep(string.char(54), r24_0 - #r0_16) .. r1_16))
end
hmac_sha1_binary = function(r0_17, r1_17)
  -- line: [712, 714] id: 17
  return r21_0(hmac_sha1(r0_17, r1_17))
end
return {
  sha1 = sha1,
  sha1_binary = sha1_binary,
  hmac_sha1 = hmac_sha1,
  hmac_sha1_binary = hmac_sha1_binary,
}
