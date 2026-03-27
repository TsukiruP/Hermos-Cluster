global.anim_shield_basic_v0 = new animation(sprShieldBasic, 3);
global.anim_shield_basic = [global.anim_shield_basic_v0];

global.anim_shield_magnetic_v0 = new animation(sprShieldMagnetic, 3);
global.anim_shield_magnetic = [global.anim_shield_magnetic_v0];

global.anim_shield_aqua_wave_v0 = new animation(sprShieldAquaWave, 12);
global.anim_shield_aqua_bound_v0 = new animation(sprShieldAquaShell, 6, -1, [0]);
global.anim_shield_aqua_bound_v1 = new animation(sprShieldAquaBound, 0);
global.anim_shield_aqua_rebound_v0 = new animation(sprShieldAquaBound, [12, 6], -1, [1, 0]);
global.anim_shield_aqua = [global.anim_shield_aqua_wave_v0, global.anim_shield_aqua_bound_v0, global.anim_shield_aqua_bound_v1, global.anim_shield_aqua_rebound_v0];

global.anim_shield_flame_v0 = new animation(sprShieldFlame, 2);
global.anim_shield_flame_dash_v0 = new animation(sprShieldFlameDash, 2, -1, [0, 1, 2, 3, 2, 4, 0, 1, 2, 3, 2, 4]);
global.anim_shield_flame = [global.anim_shield_flame_v0, global.anim_shield_flame_dash_v0];

global.anim_shield_thunder_v0 = new animation(sprShieldThunder, [2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2], -1, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1, 2]);
global.anim_shield_thunder_v1 = new animation(sprShieldThunder, 4, -1, [11, 10, 9, 8, 7, 6, 5, 4, 3]);
global.anim_shield_thunder = [global.anim_shield_thunder_v0, global.anim_shield_thunder_v1];

global.anim_shield_thunder_spark_v0 = new animation(sprShieldThunderSpark, 1);
global.anim_shield_thunder_spark = [global.anim_shield_thunder_spark_v0];

global.anim_shield_invincibility_v0 = new animation(sprShieldInvincibility, 2);
global.anim_shield_invincibility = [global.anim_shield_invincibility_v0];

global.anim_shield_invincibility_sparkle_v0 = new animation(sprShieldInvincibilitySparkle, 2, -1);
global.anim_shield_invincibility_sparkle = [global.anim_shield_invincibility_sparkle_v0];