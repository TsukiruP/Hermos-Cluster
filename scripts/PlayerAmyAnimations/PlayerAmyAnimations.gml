global.anim_amy_idle_v0 = new animation(sprAmyIdle, 7);
global.anim_amy_idle = [global.anim_amy_idle_v0];

global.anim_amy_idle_alt_v0 = new animation(sprAmyIdleAlt, 6);
global.anim_amy_idle_alt = [global.anim_amy_idle_alt_v0];

global.anim_amy_teeter_front_v0 = new animation(sprAmyTeeterFront, [5, 4, 3, 20, 6, 8, 6], 3);
global.anim_amy_teeter_back_v0 = new animation(sprAmyTeeterBack, [3, 4, 5, 15, 5, 5, 5], 3);
global.anim_amy_teeter = [global.anim_amy_teeter_front_v0, global.anim_amy_teeter_back_v0];

global.anim_amy_turn_v0 = new animation(sprAmyTurn, 1, -1);
global.anim_amy_turn_brake_v0 = new animation(sprAmyTurnBrake, 2, -1);
global.anim_amy_turn = [global.anim_amy_turn_v0, global.anim_amy_turn_brake_v0];

global.anim_amy_run_v0 = new animation(sprAmyRun0, 8);
global.anim_amy_run_v1 = new animation(sprAmyRun1, 8);
global.anim_amy_run_v2 = new animation(sprAmyRun2, 8);
global.anim_amy_run_v3 = new animation(sprAmyRun3, 8);
global.anim_amy_run_v4 = new animation(sprAmyRun4, 8);
global.anim_amy_run = [global.anim_amy_run_v0, global.anim_amy_run_v1, global.anim_amy_run_v2, global.anim_amy_run_v3, global.anim_amy_run_v4];

global.anim_amy_run_alt_v0 = new animation(sprAmyRunAlt0, 8);
global.anim_amy_run_alt_v1 = new animation(sprAmyRunAlt1, 8);
global.anim_amy_run_alt_v2 = new animation(sprAmyRunAlt2, 8);
global.anim_amy_run_alt_v3 = new animation(sprAmyRunAlt3, 8);
global.anim_amy_run_alt = [global.anim_amy_run_alt_v0, global.anim_amy_run_alt_v1, global.anim_amy_run_alt_v2, global.anim_amy_run_alt_v3];

global.anim_amy_brake_v0 = new animation(sprAmyBrake, 2, 1);
global.anim_amy_brake_fast_v0 = new animation(sprAmyBrakeFast, [1, 1, 3, 3, 3], 2);
global.anim_amy_brake = [global.anim_amy_brake_v0, global.anim_amy_brake_fast_v0];

global.anim_amy_look_v0 = new animation(sprAmyLook0, [3, 3, 3, 60, 6, 8, 6], 3);
global.anim_amy_look_v1 = new animation(sprAmyLook1, 2, -1);
global.anim_amy_look = [global.anim_amy_look_v0, global.anim_amy_look_v1];

global.anim_amy_crouch_v0 = new animation(sprAmyCrouch0, [1, 1, 10, 6, 8, 6, 60, 6, 8, 6], 6);
global.anim_amy_crouch_v1 = new animation(sprAmyCrouch1, 1, -1);
global.anim_amy_crouch = [global.anim_amy_crouch_v0, global.anim_amy_crouch_v1];

global.anim_amy_roll_v0 = new animation(sprAmyRoll, 2);
global.anim_amy_roll = [global.anim_amy_roll_v0];

global.anim_amy_spin_dash_v0 = new animation(sprAmySpinDash, 3);
global.anim_amy_spin_dash = [global.anim_amy_spin_dash_v0];

global.anim_amy_fall_v0 = new animation(sprAmySpring1, 2, -1, [4, 5]);
global.anim_amy_fall_v1 = new animation(sprAmySpring2, 2);
global.anim_amy_fall = [global.anim_amy_fall_v0, global.anim_amy_fall_v1];

global.anim_amy_jump_v0 = new animation(sprAmyJump0, [3, 2], -1);
global.anim_amy_jump_v1 = new animation(sprAmyJump1, 2);
global.anim_amy_jump_v2 = new animation(sprAmyJump2, [1, 2, 2, 2, 2], 2);
global.anim_amy_jump = [global.anim_amy_jump_v0, global.anim_amy_jump_v1, global.anim_amy_jump_v2];

global.anim_amy_hurt_v0 = new animation(sprAmyHurt0, [3, 8, 8, 8], -1);
global.anim_amy_hurt_v1 = new animation(sprAmyHurt1, 5, -1);
global.anim_amy_hurt = [global.anim_amy_hurt_v0, global.anim_amy_hurt_v1];

global.anim_amy_dead_v0 = new animation(sprAmyDead, [6, 12, 2, 3, 3], 3);
global.anim_amy_dead = [global.anim_amy_dead_v0];

global.anim_amy_spring_v0 = new animation(sprAmySpring0, 3);
global.anim_amy_spring_v1 = new animation(sprAmySpring1, [3, 3, 3, 4, 4, 4], -1);
global.anim_amy_spring_v2 = new animation(sprAmySpring2, 3, 1);
global.anim_amy_spring = [global.anim_amy_spring_v0, global.anim_amy_spring_v1, global.anim_amy_spring_v2];

global.anim_amy_spring_twirl_v0 = new animation(sprAmySpringTwirl, [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3], 11);
global.anim_amy_spring_twirl = [global.anim_amy_spring_twirl_v0];

global.anim_amy_trick_up_v0 = new animation(sprAmyTrickUp0, [3, 6], -1);
global.anim_amy_trick_up_v1 = new animation(sprAmyTrickUp1, [2, 1, 1, 3, 3, 3], 3);
global.anim_amy_trick_up_v2 = new animation(sprAmyTrickUp2, [2, 1, 1, 3, 3, 3], 3);
global.anim_amy_trick_up = [global.anim_amy_trick_up_v0, global.anim_amy_trick_up_v1, global.anim_amy_trick_up_v2];

global.anim_amy_trick_down_v0 = new animation(sprAmyTrickDown0, [2, 2, 4, 2], -1);
global.anim_amy_trick_down_v1 = new animation(sprAmyTrickDown1, 2);
global.anim_amy_trick_down_v2 = new animation(sprAmyTrickDown2, [2, 2, 2, 2, 3, 3, 3], 4);
global.anim_amy_trick_down = [global.anim_amy_trick_down_v0, global.anim_amy_trick_down_v1, global.anim_amy_trick_down_v2];

global.anim_amy_trick_front_v0 = new animation(sprAmyTrickFront0, [1, 2, 3, 1], -1);
global.anim_amy_trick_front_v1 = new animation(sprAmyTrickFront1, 2);
global.anim_amy_trick_front = [global.anim_amy_trick_front_v0, global.anim_amy_trick_front_v1];

global.anim_amy_trick_back_v0 = new animation(sprAmyTrickBack0, [1, 2, 2, 3], -1);
global.anim_amy_trick_back_v1 = new animation(sprAmyTrickBack1, [2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3], 14);
global.anim_amy_trick_back = [global.anim_amy_trick_back_v0, global.anim_amy_trick_back_v1];

global.anim_amy_flight_ride_v0 = new animation(sprAmyFlightRide, 5);
global.anim_amy_flight_ride = [global.anim_amy_flight_ride_v0];

global.anim_amy_hammer_attack_v0 = new animation(sprAmyHammerAttack0, [1, 1, 1, 1, 2, 3, 1, 1, 1, 1, 1, 1, 3, 3, 3], -1);
global.anim_amy_hammer_attack_v1 = new animation(sprAmyHammerAttack1, [1, 1, 1, 1, 3, 4, 2, 1, 1, 1, 1, 2, 2, 2, 8, 3, 3, 3], -1);
global.anim_amy_hammer_attack = [global.anim_amy_hammer_attack_v0, global.anim_amy_hammer_attack_v1];

global.anim_amy_big_hammer_attack_v0 = new animation(sprAmyBigHammerAttack, [2, 2, 2, 2, 3, 3, 3, 6, 3, 2, 2, 2, 2, 2, 2, 4, 2, 2], -1);
global.anim_amy_big_hammer_attack = [global.anim_amy_big_hammer_attack_v0];

global.anim_amy_air_hammer_attack_v0 = new animation(sprAmyAirHammerAttack, [2, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3], 14);
global.anim_amy_air_hammer_attack = [global.anim_amy_air_hammer_attack_v0];

global.anim_amy_hammer_whirl_v0 = new animation(sprAmyHammerWhirl, [3, 4, 3, 2, 2, 2, 2, 2, 2], 3);
global.anim_amy_hammer_whirl = [global.anim_amy_hammer_whirl_v0];

global.anim_amy_hammer_jump_v0 = new animation(sprAmyHammerJump, [1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3], 22);
global.anim_amy_hammer_jump = [global.anim_amy_hammer_jump_v0];

global.anim_amy_heart_v0 = new animation(sprAmyHeart, 3, -1);
global.anim_amy_heart = [global.anim_amy_heart_v0];

global.anim_amy_leap_v0 = new animation(sprAmyLeap, [1, 1, 2, 2, 2, 2], 3);
global.anim_amy_leap = [global.anim_amy_leap_v0];

global.anim_amy_head_slide_v0 = new animation(sprAmyHeadSlide0, [2, 6, 6, 2], -1);
global.anim_amy_head_slide_v1 = new animation(sprAmyHeadSlide1, 2);
global.anim_amy_head_slide_v2 = new animation(sprAmyHeadSlide2, [2, 3, 2, 2, 2], -1);
global.anim_amy_head_slide = [global.anim_amy_head_slide_v0, global.anim_amy_head_slide_v1, global.anim_amy_head_slide_v2];