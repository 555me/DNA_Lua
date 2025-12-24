-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PlayerRotationRates.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0.1
  },
  RT_2 = {
    1
  },
  RT_3 = {
    0,
    3600,
    0
  },
  RT_4 = {
    0.4
  },
  RT_5 = {
    1200
  },
  RT_6 = {
    20
  },
  RT_7 = {
    500
  },
  RT_8 = {
    0.2
  },
  RT_9 = {
    1000
  },
  RT_10 = {
    0,
    540,
    0
  },
  RT_11 = {
    3000
  },
  RT_12 = {
    0.6
  },
  RT_13 = {
    0.5
  },
  RT_14 = {
    3
  },
  RT_15 = {
    0.15
  },
  RT_16 = {
    0.3
  },
  RT_17 = {
    900
  },
  RT_18 = {
    2048
  },
  RT_19 = {
    0,
    54,
    0
  },
  RT_20 = {
    0,
    1800,
    0
  },
  RT_21 = {
    0
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [74, 74] id: 1
  return r1_1
end
local r3_0 = "PlayerRotationRates"
local r4_0 = {
  AvoidLaunchDelay = {
    ParamentName = "AvoidLaunchDelay",
    ParamentValue = r0_0.RT_1,
  },
  AvoidMaintainTime = {
    ParamentName = "AvoidMaintainTime",
    ParamentValue = r0_0.RT_2,
  },
}
r4_0.AvoidSpeed = {
  ParamentName = "AvoidSpeed",
  ParamentValue = {
    1800
  },
}
r4_0.AvoidStart = {
  ParamentName = "AvoidStart",
  ParamentValue = r0_0.RT_3,
}
r4_0.BlockHeadCheckHeight = {
  ParamentName = "BlockHeadCheckHeight",
  ParamentValue = {
    105
  },
}
r4_0.BoneHitCD = {
  ParamentName = "BoneHitCD",
  ParamentValue = {
    0.9
  },
}
r4_0.BuffAnimFlyDodgeSpeed = {
  ParamentName = "BuffAnimFlyDodgeSpeed",
  ParamentValue = {
    1500
  },
}
r4_0.BulletActionEndTime = {
  ParamentName = "BulletActionEndTime",
  ParamentValue = {
    0.8
  },
}
r4_0.BulletJump = {
  ParamentName = "BulletJump",
  ParamentValue = {
    540,
    20,
    0
  },
}
r4_0.BulletJumpAllowShootTime = {
  ParamentName = "BulletJumpAllowShootTime",
  ParamentValue = r0_0.RT_4,
}
r4_0.BulletJumpAllowSlideTime = {
  ParamentName = "BulletJumpAllowSlideTime",
  ParamentValue = {
    0.7
  },
}
r4_0.BulletJumpDashVelocity = {
  ParamentName = "BulletJumpDashVelocity",
  ParamentValue = r0_0.RT_5,
}
r4_0.BulletJumpPreparedTime = {
  ParamentName = "BulletJumpPreparedTime",
  ParamentValue = r0_0.RT_1,
}
r4_0.BulletJumpProtectAngle = {
  ParamentName = "BulletJumpProtectAngle",
  ParamentValue = r0_0.RT_6,
}
r4_0.BulletJumpRecoverGravityTime = {
  ParamentName = "BulletJumpRecoverGravityTime",
  ParamentValue = {
    0.11
  },
}
r4_0.BulletJumpResetCapTime = {
  ParamentName = "BulletJumpResetCapTime",
  ParamentValue = r0_0.RT_4,
}
r4_0.BulletJumpZVelocity = {
  ParamentName = "BulletJumpZVelocity",
  ParamentValue = r0_0.RT_7,
}
r4_0.BulletPrepareJumpDashVelocity = {
  ParamentName = "BulletPrepareJumpDashVelocity",
  ParamentValue = r0_0.RT_5,
}
r4_0.BulletPrepareJumpZVelocity = {
  ParamentName = "BulletPrepareJumpZVelocity",
  ParamentValue = {
    0.01
  },
}
r4_0.CanRecoveryDelayTime = {
  ParamentName = "CanRecoveryDelayTime",
  ParamentValue = {
    1.8
  },
}
r4_0.CanWallJumpAngle = {
  ParamentName = "CanWallJumpAngle",
  ParamentValue = {
    70
  },
}
r4_0.ContrZIgnoreAngle = {
  ParamentName = "ContrZIgnoreAngle",
  ParamentValue = r0_0.RT_6,
}
r4_0.CrouchWalkSpeed = {
  ParamentName = "CrouchWalkSpeed",
  ParamentValue = {
    160
  },
}
r4_0.DodgeZeroFrictionTime = {
  ParamentName = "DodgeZeroFrictionTime",
  ParamentValue = r0_0.RT_8,
}
r4_0.Drift = {
  ParamentName = "Drift",
  ParamentValue = {
    0,
    0,
    0
  },
}
r4_0.DriftFriction = {
  ParamentName = "DriftFriction",
  ParamentValue = r0_0.RT_4,
}
r4_0.DriftMinVelocity = {
  ParamentName = "DriftMinVelocity",
  ParamentValue = {
    400
  },
}
r4_0.EndSprintTime = {
  ParamentName = "EndSprintTime",
  ParamentValue = r0_0.RT_8,
}
r4_0.FirstJumpZVelocity = {
  ParamentName = "FirstJumpZVelocity",
  ParamentValue = r0_0.RT_9,
}
r4_0.Flying = {
  ParamentName = "Flying",
  ParamentValue = r0_0.RT_10,
}
r4_0.FlyingDodgeSpeed = {
  ParamentName = "FlyingDodgeSpeed",
  ParamentValue = r0_0.RT_11,
}
r4_0.ForbidNextAvoidTime = {
  ParamentName = "ForbidNextAvoidTime",
  ParamentValue = r0_0.RT_12,
}
r4_0.ForbidNextSlideTime = {
  ParamentName = "ForbidNextSlideTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.HeavyHitCD = {
  ParamentName = "HeavyHitCD",
  ParamentValue = r0_0.RT_14,
}
r4_0.HeavyHitTime = {
  ParamentName = "HeavyHitTime",
  ParamentValue = {
    1.5
  },
}
r4_0.HitAddtiveCoolDown = {
  ParamentName = "HitAddtiveCoolDown",
  ParamentValue = r0_0.RT_15,
}
r4_0.HitAddtiveDuration = {
  ParamentName = "HitAddtiveDuration",
  ParamentValue = r0_0.RT_16,
}
r4_0.HitFlyCD = {
  ParamentName = "HitFlyCD",
  ParamentValue = r0_0.RT_1,
}
r4_0.HitFlyXYZ = {
  ParamentName = "HitFlyXYZ",
  ParamentValue = {
    0,
    1000
  },
}
r4_0.HitRepelCD = {
  ParamentName = "HitRepelCD",
  ParamentValue = r0_0.RT_14,
}
r4_0.HitRepelTime = {
  ParamentName = "HitRepelTime",
  ParamentValue = r0_0.RT_14,
}
r4_0.InAir = {
  ParamentName = "InAir",
  ParamentValue = {
    0,
    100,
    0
  },
}
r4_0.InvincibleAvoidTime = {
  ParamentName = "InvincibleAvoidTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.JetRushDodgeSpeed = {
  ParamentName = "JetRushDodgeSpeed",
  ParamentValue = r0_0.RT_11,
}
r4_0.JetRushDodgeSpeedTime = {
  ParamentName = "JetRushDodgeSpeedTime",
  ParamentValue = r0_0.RT_16,
}
r4_0.LandHeavyTime = {
  ParamentName = "LandHeavyTime",
  ParamentValue = {
    2
  },
}
r4_0.LightHitRangedTime = {
  ParamentName = "LightHitRangedTime",
  ParamentValue = r0_0.RT_2,
}
r4_0.LightHitTime = {
  ParamentName = "LightHitTime",
  ParamentValue = r0_0.RT_2,
}
r4_0.MaxDyingTime = {
  ParamentName = "MaxDyingTime",
  ParamentValue = r0_0.RT_6,
}
r4_0.MaxInheritSpeed = {
  ParamentName = "MaxInheritSpeed",
  ParamentValue = r0_0.RT_17,
}
r4_0.MaxRecoveringPlayer = {
  ParamentName = "MaxRecoveringPlayer",
  ParamentValue = r0_0.RT_14,
}
r4_0.MaxWallJumpCount = {
  ParamentName = "MaxWallJumpCount",
  ParamentValue = r0_0.RT_9,
}
r4_0.MinPercentToHit = {
  ParamentName = "MinPercentToHit",
  ParamentValue = r0_0.RT_1,
}
r4_0.NormalWalkSpeed = {
  ParamentName = "NormalWalkSpeed",
  ParamentValue = r0_0.RT_7,
}
r4_0.OnGround = {
  ParamentName = "OnGround",
  ParamentValue = r0_0.RT_10,
}
r4_0.RecoverySpeed = {
  ParamentName = "RecoverySpeed",
  ParamentValue = r0_0.RT_6,
}
r4_0.RegionRecoverySpeed = {
  ParamentName = "RegionRecoverySpeed",
  ParamentValue = {
    -1
  },
}
r4_0.Reload = {
  ParamentName = "Reload",
  ParamentValue = r0_0.RT_10,
}
r4_0.RideFlyHoldTime = {
  ParamentName = "RideFlyHoldTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.RideMoveAcceleration = {
  ParamentName = "RideMoveAcceleration",
  ParamentValue = {
    512
  },
}
r4_0.RideMoveFirstJumpZ = {
  ParamentName = "RideMoveFirstJumpZ",
  ParamentValue = {
    1300
  },
}
r4_0.RideMoveFly = {
  ParamentName = "RideMoveFly",
  ParamentValue = {
    0,
    108,
    0
  },
}
r4_0.RideMoveFlyAcceleration = {
  ParamentName = "RideMoveFlyAcceleration",
  ParamentValue = r0_0.RT_18,
}
r4_0.RideMoveFlySpeed = {
  ParamentName = "RideMoveFlySpeed ",
  ParamentValue = r0_0.RT_9,
}
r4_0.RideMoveMax = {
  ParamentName = "RideMoveMax",
  ParamentValue = r0_0.RT_19,
}
r4_0.RideMoveMin = {
  ParamentName = "RideMoveMin",
  ParamentValue = r0_0.RT_19,
}
r4_0.RideMoveMinVelocity = {
  ParamentName = "RideMoveMinVelocity",
  ParamentValue = r0_0.RT_7,
}
r4_0.RideMoveSecondJumpZ = {
  ParamentName = "RideMoveSecondJumpZ",
  ParamentValue = {
    1560
  },
}
r4_0.RideMoveTurnAngle1 = {
  ParamentName = "RideMoveTurnAngle1",
  ParamentValue = {
    85
  },
}
r4_0.RideMoveTurnAngle2 = {
  ParamentName = "RideMoveTurnAngle2",
  ParamentValue = {
    135
  },
}
r4_0.RideMoveTurnFinTime = {
  ParamentName = "RideMoveTurnFinTime",
  ParamentValue = {
    1.1
  },
}
r4_0.RideMoveTurnVelocity = {
  ParamentName = "RideMoveTurnVelocity",
  ParamentValue = {
    200
  },
}
r4_0.RideSprintTime = {
  ParamentName = "RideSprintTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.SecondJumpAllowShootTime = {
  ParamentName = "SecondJumpAllowShootTime",
  ParamentValue = r0_0.RT_8,
}
r4_0.SecondJumpAllowSlideTime = {
  ParamentName = "SecondJumpAllowSlideTime",
  ParamentValue = {
    0.35
  },
}
r4_0.SecondJumpCold = {
  ParamentName = "SecondJumpCold",
  ParamentValue = {
    0.95
  },
}
r4_0.SecondJumpStart = {
  ParamentName = "SecondJumpStart",
  ParamentValue = r0_0.RT_20,
}
r4_0.SecondJumpZVelocity = {
  ParamentName = "SecondJumpZVelocity",
  ParamentValue = r0_0.RT_5,
}
r4_0.Shooting = {
  ParamentName = "Shooting",
  ParamentValue = {
    0,
    5400,
    0
  },
}
r4_0.Skill = {
  ParamentName = "Skill",
  ParamentValue = r0_0.RT_20,
}
r4_0.SlideGroundFriction = {
  ParamentName = "SlideGroundFriction",
  ParamentValue = r0_0.RT_12,
}
r4_0.SlideInAirFriction = {
  ParamentName = "SlideInAirFriction",
  ParamentValue = r0_0.RT_21,
}
r4_0.SlideLaunchDelay = {
  ParamentName = "SlideLaunchDelay",
  ParamentValue = r0_0.RT_21,
}
r4_0.SlideMaintainTime = {
  ParamentName = "SlideMaintainTime",
  ParamentValue = r0_0.RT_21,
}
r4_0.SlideSpeed = {
  ParamentName = "SlideSpeed",
  ParamentValue = r0_0.RT_17,
}
r4_0.SlideSpeedInAir = {
  ParamentName = "SlideSpeedInAir",
  ParamentValue = r0_0.RT_17,
}
r4_0.SlideStart = {
  ParamentName = "SlideStart",
  ParamentValue = r0_0.RT_3,
}
r4_0.SlideZeroFrictionTime = {
  ParamentName = "SlideZeroFrictionTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.Sprint = {
  ParamentName = "Sprint",
  ParamentValue = {
    0,
    360,
    0
  },
}
r4_0.SprintAcceleration = {
  ParamentName = "SprintAcceleration",
  ParamentValue = r0_0.RT_18,
}
r4_0.SprintTurnColdTime = {
  ParamentName = "SprintTurnColdTime",
  ParamentValue = r0_0.RT_2,
}
r4_0.SprintTurnFinTime = {
  ParamentName = "SprintTurnFinTime",
  ParamentValue = {
    0.67
  },
}
r4_0.SprintTurnTriggerAngle = {
  ParamentName = "SprintTurnTriggerAngle",
  ParamentValue = {
    120
  },
}
r4_0.StartSprintTime = {
  ParamentName = "StartSprintTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.StopAvoidTime = {
  ParamentName = "StopAvoidTime",
  ParamentValue = r0_0.RT_2,
}
r4_0.StopSlideTime = {
  ParamentName = "StopSlideTime",
  ParamentValue = r0_0.RT_2,
}
r4_0.StunToIdleBlendTime = {
  ParamentName = "StunToIdleBlendTime",
  ParamentValue = r0_0.RT_15,
}
r4_0.WallJumpAutoTime = {
  ParamentName = "WallJumpAutoTime",
  ParamentValue = r0_0.RT_13,
}
r4_0.WallJumpCold = {
  ParamentName = "WallJumpCold",
  ParamentValue = r0_0.RT_4,
}
r4_0.WallJumpColdDirection = {
  ParamentName = "WallJumpColdDirection",
  ParamentValue = r0_0.RT_8,
}
r4_0.WallJumpXYSpeed = {
  ParamentName = "WallJumpXYSpeed",
  ParamentValue = {
    10
  },
}
r4_0.WallJumpZSpeed = {
  ParamentName = "WallJumpZSpeed",
  ParamentValue = r0_0.RT_9,
}
return r2_0(r3_0, r4_0)
