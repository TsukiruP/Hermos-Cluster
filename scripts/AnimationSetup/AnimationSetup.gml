#region Sonic

global.anim_sonic_idle_v0 = new animation(sprSonicIdle, [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 12, 6, 6, 6, 12, 8, 6, 6, 6, 6]);

global.anim_sonic_teeter_front_v0 = new animation(sprSonicTeeterFront, 3, 1);
global.anim_sonic_teeter_back_v0 = new animation(sprSonicTeeterBack, [3, 4, 4, 4, 4, 4, 4, 4, 4], 1);
global.anim_sonic_teeter = [global.anim_sonic_teeter_front_v0, global.anim_sonic_teeter_back_v0];

global.anim_sonic_turn_v0 = new animation(sprSonicTurn, 1, -1);
global.anim_sonic_turn_brake_v0 = new animation(sprSonicTurnBrake, 2, -1);
global.anim_sonic_turn = [global.anim_sonic_turn_v0, global.anim_sonic_turn_brake_v0];

global.anim_sonic_run_v0 = new animation(sprSonicRun0, 8);
global.anim_sonic_run_v1 = new animation(sprSonicRun1, 8);
global.anim_sonic_run_v2 = new animation(sprSonicRun2, 8);
global.anim_sonic_run_v3 = new animation(sprSonicRun3, 8);
global.anim_sonic_run_v4 = new animation(sprSonicRun4, 8);
global.anim_sonic_run = [global.anim_sonic_run_v0, global.anim_sonic_run_v1, global.anim_sonic_run_v2, global.anim_sonic_run_v3, global.anim_sonic_run_v4];

global.anim_sonic_brake_v0 = new animation(sprSonicBrake, [2, 4, 4], 1);
global.anim_sonic_brake_fast_v0 = new animation(sprSonicBrakeFast, [1, 1, 3, 3], 2);
global.anim_sonic_brake = [global.anim_sonic_brake_v0, global.anim_sonic_brake_fast_v0];

global.anim_sonic_look_v0 = new animation(sprSonicLook, [4, 4, 12, 12, 12, 12], 2);
global.anim_sonic_look_v1 = new animation(sprSonicLook, 2, -1, [1, 0]);
global.anim_sonic_look = [global.anim_sonic_look_v0, global.anim_sonic_look_v1];

global.anim_sonic_crouch_v0 = new animation(sprSonicCrouch, 1, -1);
global.anim_sonic_crouch_v1 = new animation(sprSonicCrouch, 1, -1, [1, 0]);
global.anim_sonic_crouch = [global.anim_sonic_crouch_v0, global.anim_sonic_crouch_v1];

global.anim_sonic_roll_v0 = new animation(sprSonicRoll, 2);

global.anim_sonic_spin_dash_v0 = new animation(sprSonicSpinDash0, 2);
global.anim_sonic_spin_dash_v1 = new animation(sprSonicSpinDash1, 2, -1);
global.anim_sonic_spin_dash = [global.anim_sonic_spin_dash_v0, global.anim_sonic_spin_dash_v1];

global.anim_sonic_fall_v0 = new animation(sprSonicSpring1, 2, -1, [4, 5]);
global.anim_sonic_fall_v1 = new animation(sprSonicSpring2, 2);
global.anim_sonic_fall = [global.anim_sonic_fall_v0, global.anim_sonic_fall_v1];

global.anim_sonic_jump_v0 = new animation(sprSonicJump0, [3, 2], -1);
global.anim_sonic_jump_v1 = new animation(sprSonicJump1, 2);
global.anim_sonic_jump_v2 = new animation(sprSonicJump2, [1, 2, 2, 2], 1);
global.anim_sonic_jump = [global.anim_sonic_jump_v0, global.anim_sonic_jump_v1, global.anim_sonic_jump_v2];

global.anim_sonic_hurt_v0 = new animation(sprSonicHurt0, [3, 8, 8, 8, 8], -1);
global.anim_sonic_hurt_v1 = new animation(sprSonicHurt1, 5, -1);
global.anim_sonic_hurt = [global.anim_sonic_hurt_v0, global.anim_sonic_hurt_v1];

global.anim_sonic_dead_v0 = new animation(sprSonicDead, [3, 3, 12, 2, 3, 3], 4);

global.anim_sonic_spring_v0 = new animation(sprSonicSpring0, 3, 1);
global.anim_sonic_spring_v1 = new animation(sprSonicSpring1, [2, 2, 2, 3, 3, 3], -1);
global.anim_sonic_spring_v2 = new animation(sprSonicSpring2, 3);
global.anim_sonic_spring = [global.anim_sonic_spring_v0, global.anim_sonic_spring_v1, global.anim_sonic_spring_v2];

global.anim_sonic_spring_twirl_v0 = new animation(sprSonicSpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);

global.anim_sonic_trick_up_v0 = new animation(sprSonicTrickUp0, [3, 6, 2], -1);
global.anim_sonic_trick_up_v1 = new animation(sprSonicTrickUp1, [1, 1, 3, 3, 3], 2);
global.anim_sonic_trick_up_v2 = new animation(sprSonicTrickUp2, [3, 3, 3, 2, 2, 2], 3);
global.anim_sonic_trick_up = [global.anim_sonic_trick_up_v0, global.anim_sonic_trick_up_v1, global.anim_sonic_trick_up_v2];

global.anim_sonic_trick_down_v0 = new animation(sprSonicTrickDown0, [3, 3, 6, 2, 2, 2, 2, 2], -1);
global.anim_sonic_trick_down_v2 = new animation(sprSonicTrickDown2, [2, 2, 2, 2, 3, 3, 3], 4);
global.anim_sonic_trick_down = [global.anim_sonic_trick_down_v0, global.anim_sonic_roll_v0, global.anim_sonic_trick_down_v2];

global.anim_sonic_trick_front_v0 = new animation(sprSonicTrickFront0, [2, 4, 1], -1);
global.anim_sonic_trick_front_v1 = new animation(sprSonicTrickFront1, 1);
global.anim_sonic_trick_front = [global.anim_sonic_trick_front_v0, global.anim_sonic_trick_front_v1];

global.anim_sonic_trick_back_v0 = new animation(sprSonicTrickBack, 1, -1, [0]);
global.anim_sonic_trick_back_v1 = new animation(sprSonicTrickBack, [5, 4, 3, 2, 2, 2, 2, 2, 3, 3, 3], 8);
global.anim_sonic_trick_back = [global.anim_sonic_trick_back_v0, global.anim_sonic_trick_back_v1];

global.anim_sonic_flight_ride_v0 = new animation(sprSonicFlightRide, 5);

global.anim_sonic_air_dash_v0 = new animation(sprSonicAirDash, 2, -1, [0, 1, 2, 3]);
global.anim_sonic_air_dash_v1 = new animation(sprSonicAirDash, 2, 0, [4, 5, 6]);
global.anim_sonic_air_dash = [global.anim_sonic_air_dash_v0, global.anim_sonic_air_dash_v1];

#endregion